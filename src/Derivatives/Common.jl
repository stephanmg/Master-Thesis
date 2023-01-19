# Allocate derivates needed when computing ∂G∂u and ∂G∂p
function allocateObservableFunctionDerivatives(sol::ODESolution, peTabModel::PeTabModel)

    nModelStates = length(peTabModel.stateNames)
    ∂h∂u = zeros(Float64, nModelStates)
    ∂σ∂u = zeros(Float64, nModelStates)
    ∂h∂p = zeros(Float64, length(sol.prob.p))
    ∂σ∂p = zeros(Float64, length(sol.prob.p))
    return ∂h∂u, ∂σ∂u, ∂h∂p, ∂σ∂p
end


function adjustGradientTransformedParameters!(gradient::Union{AbstractVector, SubArray}, 
                                              _gradient::AbstractVector, 
                                              ∂G∂p::AbstractVector, 
                                              θ_dynamic::Vector{Float64},
                                              θ_indices::ParameterIndices,
                                              parameterInfo::ParameterInfo, 
                                              postEqulibriumId::String; 
                                              autoDiffSensitivites::Bool=false, 
                                              adjoint::Bool=false)

    # In case we compute the sensitivtes via automatic differentation the parameters in _gradient=S'*∂G∂u will appear in the 
    # same order as they appear in θ_est. In case we do not compute sensitivtes via autodiff, or do adjoint sensitity analysis, 
    # the parameters in _gradient=S'∂G∂u appear in the same order as in odeProblem.p.
    if autoDiffSensitivites == true && adjoint == false
        _gradient1 = _gradient[θ_indices.mapDynParEst.iDynParamInVecEst] .+ ∂G∂p[θ_indices.mapDynParEst.iDynParamInSys]
        _gradient2 = _gradient[expMap.iDynEstVec] .+ ∂G∂p[expMap.iOdeProbDynParam]
    elseif adjoint == false
        _gradient1 = _gradient[θ_indices.mapDynParEst.iDynParamInSys] .+ ∂G∂p[θ_indices.mapDynParEst.iDynParamInSys]
        _gradient2 = _gradient[expMap.iOdeProbDynParam] .+ ∂G∂p[expMap.iOdeProbDynParam]
    end

    # For adjoint sensitivity analysis ∂G∂p is already incorperated into the gradient, and the parameters appear in the 
    # same order as in ODEProblem 
    if adjoint == true
        _gradient1 = _gradient[θ_indices.mapDynParEst.iDynParamInSys] 
        _gradient2 = _gradient[expMap.iOdeProbDynParam]
    end
    
    # Transform gradient parameter that for each experimental condition appear in the ODE system                                                             
    gradient[θ_indices.mapDynParEst.iDynParamInVecEst] .+= transformGradient(_gradient1,
                                                                             θ_dynamic[θ_indices.mapDynParEst.iDynParamInVecEst], 
                                                                             θ_indices.θ_dynamicNames[θ_indices.mapDynParEst.iDynParamInVecEst], 
                                                                             parameterInfo)
    
    # Transform gradient for parameters which are specific to certain experimental conditions. 
    whichExpMap = findfirst(x -> x == postEqulibriumId, [θ_indices.mapExpCond[i].condID for i in eachindex(paramIndices.mapExpCond)])
    expMap = θ_indices.mapExpCond[whichExpMap]                                          
    gradient[expMap.iDynEstVec] .+= transformParamVecGrad(_gradient2,
                                                          θ_dynamic[expMap.iDynEstVec], 
                                                          θ_indices.θ_dynamicNames[expMap.iDynEstVec], 
                                                          parameterInfo)                                   
end


function getIndicesParametersNotInODESystem(θ_indices::ParameterIndices)::Tuple

    θ_observableNames = θ_indices.θ_observableNames
    θ_sdNames = θ_indices.θ_sdNames
    θ_nonDynamicNames = θ_indices.θ_nonDynamicNames
    iθ_notOdeSystemNames = θ_indices.iθ_notOdeSystemNames

    iθ_sd = [findfirst(x -> x == θ_sdNames[i], iθ_notOdeSystemNames) for i in eachindex(θ_sdNames)]
    iθ_observable = [findfirst(x -> x == θ_observableNames[i],  iθ_notOdeSystemNames) for i in eachindex(θ_observableNames)]
    iθ_nonDynamic = [findfirst(x -> x == θ_nonDynamicNames[i],  iθ_notOdeSystemNames) for i in eachindex(θ_nonDynamicNames)]
    iθ_notOdeSystem = θ_indices.iθ_notOdeSystem

    return iθ_sd, iθ_observable, iθ_nonDynamic, iθ_notOdeSystem
end


# Function to compute ∂G∂u and ∂G∂p for an observation assuming a fixed ODE-solution
function compute∂G∂_(∂G∂_,
                     u::AbstractVector, 
                     p::Vector{Float64}, # odeProblem.p
                     t::Float64, 
                     i::Integer, 
                     iPerTimePoint::Vector{Vector{Int64}}, 
                     measurementData::MeasurementData, 
                     parameterInfo::ParameterInfo,
                     θ_indices::ParameterIndices,
                     peTabModel::PeTabModel, 
                     θ_dynamic::Vector{Float64},
                     θ_sd::Vector{Float64}, 
                     θ_observable::Vector{Float64}, 
                     θ_nonDynamic::Vector{Float64}, 
                     ∂h∂_::Vector{Float64}, 
                     ∂σ∂_::Vector{Float64}; 
                     compute∂G∂U::Bool=true, 
                     computeResiduals::Bool=false)

    ∂G∂_ .= 0.0
    for iMeasurementData in iPerTimePoint[i]
        ∂h∂_ .= 0.0
        ∂σ∂_ .= 0.0

        hTransformed = computehTransformed(u, t, θ_dynamic, θ_observable, θ_nonDynamic, peTabModel, iMeasurementData, θ_indices, parameterInfo)
        σ = computeσ(u, t, θ_dynamic, θ_sd, θ_nonDynamic, peTabModel, iMeasurementData, θ_indices)

        if compute∂G∂U == true
            peTabModel.evalDYmodDu(u, t, p, θ_observable, θ_nonDynamic, measurementData.observebleID[iMeasurementData], mapObsParam, ∂h∂_)
            peTabModel.evalDSdDu!(u, t, θ_sd, p, θ_nonDynamic, parameterInfo, measurementData.observebleID[iMeasurementData], mapSdParam, ∂σ∂_)
        else
            peTabModel.evalDYmodDp(u, t, p, θ_observable, θ_nonDynamic, measurementData.observebleID[iMeasurementData], mapObsParam, ∂h∂_)
            peTabModel.evalDSdDp!(u, t, θ_sd, p, θ_nonDynamic, parameterInfo, measurementData.observebleID[iMeasurementData], mapSdParam, ∂σ∂_)
        end

        if measurementData.transformData[iMeasurementData] == :log10
            yObs = measurementData.yObsTransformed[iMeasurementData]
            ∂h∂_ .*= 1 / (log(10) * exp10(hTransformed))
        elseif measurementData.transformData[iMeasurementData] == :lin
            yObs = measurementData.yObsNotTransformed[iMeasurementData]
        end

        # In case of Guass Newton approximation we target the residuals (y_mod - y_obs)/σ
        if computeResiduals == false
            ∂G∂h = ( hTransformed - yObs ) / σ^2 
            ∂G∂σ = 1/σ - (( hTransformed - yObs )^2 / σ^3) 
        else
            ∂G∂h = 1.0 / σ 
            ∂G∂σ = -(hTransformed - yObs) / σ^2 
        end

        ∂G∂_ .= (∂G∂h*∂h∂_ .+ ∂G∂σ*∂σ∂_)[:]
        end
    end
    return
end
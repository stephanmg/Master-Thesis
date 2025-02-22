# Model name: model_Perelson_Science1996
# Number of parameters: 5
# Number of species: 4
function getODEModel_model_Perelson_Science1996()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t Vni(t) V(t) Vin(t) Tstar(t)

    ### Store dependent variables in array for ODESystem command
    stateArray = [Vni, V, Vin, Tstar]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters c T0 default K0 NN delta

    ### Store parameters in array for ODESystem command
    parameterArray = [c, T0, default, K0, NN, delta]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(Vni) ~ -1.0 * ( 1 /default ) * (c * Vni)+1.0 * ( 1 /default ) * (delta * NN * Tstar),
    D(V) ~ -1.0 * ( 1 /default ) * (c * Vin)-1.0 * ( 1 /default ) * (c * Vni)+1.0 * ( 1 /default ) * (delta * NN * Tstar),
    D(Vin) ~ -1.0 * ( 1 /default ) * (c * Vin),
    D(Tstar) ~ +1.0 * ( 1 /default ) * (K0 * T0 * Vin)-1.0 * ( 1 /default ) * (delta * Tstar)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    Vni => 0.0,
    V => 1.86e6,
    Vin => 1.86e6,
    Tstar => 15061.32075
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    c => 2.06,
    T0 => 11000.0,
    default => 1.0,
    K0 => 3.9e-7,
    NN => 480.0,
    delta => 0.53
    ]

    return sys, initialSpeciesValues, trueParameterValues

end

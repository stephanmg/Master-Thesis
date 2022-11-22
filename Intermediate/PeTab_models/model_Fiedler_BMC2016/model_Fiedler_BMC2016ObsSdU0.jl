function evalYmod(u, t, dynPar, obsPar, nonDynParam, paramData, observableId, mapObsParam) 

	RAF, MEK, pMEK, pERK, pRAF, ERK= u 
	K_1, K_2, K_3, k10, k11, k2, k3, k4, k5, k6, tau1, tau2 = dynPar 
	ERK_total_C = paramData.paramVal[1] 
	MEK_total_C = paramData.paramVal[5] 
	RAF_total_C = paramData.paramVal[6] 

	if observableId == "pErk" 
		observableParameter1_pErk = getObsOrSdParam(obsPar, mapObsParam)
		return pERK * observableParameter1_pErk 
	end

	if observableId == "pMek" 
		observableParameter1_pMek = getObsOrSdParam(obsPar, mapObsParam)
		return pMEK * observableParameter1_pMek 
	end

end

function evalU0!(u0Vec, paramVec) 

	ERK_total, UO126, k10, RAF_total, K_3, cyt, k4, Sorafenib, K_2, k6, k11, tau1, MEK_total, K_1, k3, tau2, k5, k2 = paramVec 

	RAF = RAF_total + ( K_1 * k10 * k4 * k6 + K_1 * k2 * k4 * k6 - ( K_1 ^ 0.5 ) * ( ( K_1 * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + K_1 * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + K_1 * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + K_1 * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * K_1 * k10 * k2 * ( k4 ^ 2 ) * ( k6 ^ 2 ) + 2 * K_1 * RAF_total * k3 * k4 * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * K_1 * RAF_total * k10 * k2 * k3 * k4 * ( k6 ^ 2 ) + 2 * K_1 * MEK_total * k5 * k6 * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * K_1 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( k10 ^ 2 ) + 2 * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 + 4 * ERK_total * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) - K_1 * RAF_total * k10 * k3 * k6 - K_1 * MEK_total * RAF_total * k10 * k3 * k5 ) / ( 2 * K_1 * k10 * k3 * k6 + 2 * K_1 * k2 * k3 * k6 + 2 * K_1 * MEK_total * k10 * k3 * k5 + 2 * ERK_total * MEK_total * k2 * k3 * k5 + 2 * K_1 * MEK_total * k2 * k3 * k5 ) 
	MEK = MEK_total + ( K_1 * MEK_total * k10 * k4 * k6 + K_1 * MEK_total * k2 * k4 * k6 - MEK_total * ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) - K_1 * MEK_total * RAF_total * k10 * k3 * k6 - K_1 * RAF_total * k10 * k3 * k5 * ( MEK_total ^ 2 ) ) / ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 + MEK_total * k5 * ( k2 * k4 * ( 2 * ERK_total + 2 * K_1 ) + 2 * K_1 * k10 * k4 + K_1 * RAF_total * k10 * k3 ) + K_1 * k10 * k4 * k6 + K_1 * k2 * k4 * k6 + K_1 * RAF_total * k10 * k3 * k6 ) 
	pMEK = ( MEK_total * ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) + K_1 * MEK_total * RAF_total * k10 * k3 * k6 + K_1 * RAF_total * k10 * k3 * k5 * ( MEK_total ^ 2 ) - K_1 * MEK_total * k10 * k4 * k6 - K_1 * MEK_total * k2 * k4 * k6 ) / ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 + MEK_total * k5 * ( k2 * k4 * ( 2 * ERK_total + 2 * K_1 ) + 2 * K_1 * k10 * k4 + K_1 * RAF_total * k10 * k3 ) + K_1 * k10 * k4 * k6 + K_1 * k2 * k4 * k6 + K_1 * RAF_total * k10 * k3 * k6 ) 
	pERK = ( ERK_total * MEK_total * k5 * ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) + ERK_total * K_1 * RAF_total * k10 * k3 * ( MEK_total ^ 2 ) * ( k5 ^ 2 ) + ERK_total * K_1 * MEK_total * RAF_total * k10 * k3 * k5 * k6 - ERK_total * K_1 * MEK_total * k10 * k4 * k5 * k6 - ERK_total * K_1 * MEK_total * k2 * k4 * k5 * k6 ) / ( ( k6 + MEK_total * k5 ) * ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) + k2 * k4 * ( K_1 * ( k6 ^ 2 + MEK_total * k5 * k6 ) + 2 * ERK_total * MEK_total * k5 * k6 ) + K_1 * k10 * k4 * ( k6 ^ 2 + MEK_total * k5 * k6 ) + K_1 * RAF_total * k10 * k3 * ( k6 ^ 2 + ( MEK_total ^ 2 ) * ( k5 ^ 2 ) + 2 * MEK_total * k5 * k6 ) ) 
	pRAF = ( ( K_1 ^ 0.5 ) * ( ( K_1 * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + K_1 * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + K_1 * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + K_1 * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * K_1 * k10 * k2 * ( k4 ^ 2 ) * ( k6 ^ 2 ) + 2 * K_1 * RAF_total * k3 * k4 * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * K_1 * RAF_total * k10 * k2 * k3 * k4 * ( k6 ^ 2 ) + 2 * K_1 * MEK_total * k5 * k6 * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * K_1 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( k10 ^ 2 ) + 2 * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 + 4 * ERK_total * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) + K_1 * RAF_total * k10 * k3 * k6 + K_1 * MEK_total * RAF_total * k10 * k3 * k5 - K_1 * k10 * k4 * k6 - K_1 * k2 * k4 * k6 ) / ( 2 * K_1 * k10 * k3 * k6 + 2 * K_1 * k2 * k3 * k6 + 2 * K_1 * MEK_total * k10 * k3 * k5 + 2 * ERK_total * MEK_total * k2 * k3 * k5 + 2 * K_1 * MEK_total * k2 * k3 * k5 ) 
	ERK = ERK_total + ( ERK_total * K_1 * MEK_total * k10 * k4 * k5 * k6 + ERK_total * K_1 * MEK_total * k2 * k4 * k5 * k6 - ERK_total * MEK_total * k5 * ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) - ERK_total * K_1 * RAF_total * k10 * k3 * ( MEK_total ^ 2 ) * ( k5 ^ 2 ) - ERK_total * K_1 * MEK_total * RAF_total * k10 * k3 * k5 * k6 ) / ( ( k6 + MEK_total * k5 ) * ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) + k2 * k4 * ( K_1 * ( k6 ^ 2 + MEK_total * k5 * k6 ) + 2 * ERK_total * MEK_total * k5 * k6 ) + K_1 * k10 * k4 * ( k6 ^ 2 + MEK_total * k5 * k6 ) + K_1 * RAF_total * k10 * k3 * ( k6 ^ 2 + ( MEK_total ^ 2 ) * ( k5 ^ 2 ) + 2 * MEK_total * k5 * k6 ) ) 

	u0Vec .= RAF, MEK, pMEK, pERK, pRAF, ERK
end

function evalU0(paramVec) 

	ERK_total, UO126, k10, RAF_total, K_3, cyt, k4, Sorafenib, K_2, k6, k11, tau1, MEK_total, K_1, k3, tau2, k5, k2 = paramVec 

	RAF = RAF_total + ( K_1 * k10 * k4 * k6 + K_1 * k2 * k4 * k6 - ( K_1 ^ 0.5 ) * ( ( K_1 * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + K_1 * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + K_1 * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + K_1 * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * K_1 * k10 * k2 * ( k4 ^ 2 ) * ( k6 ^ 2 ) + 2 * K_1 * RAF_total * k3 * k4 * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * K_1 * RAF_total * k10 * k2 * k3 * k4 * ( k6 ^ 2 ) + 2 * K_1 * MEK_total * k5 * k6 * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * K_1 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( k10 ^ 2 ) + 2 * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 + 4 * ERK_total * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) - K_1 * RAF_total * k10 * k3 * k6 - K_1 * MEK_total * RAF_total * k10 * k3 * k5 ) / ( 2 * K_1 * k10 * k3 * k6 + 2 * K_1 * k2 * k3 * k6 + 2 * K_1 * MEK_total * k10 * k3 * k5 + 2 * ERK_total * MEK_total * k2 * k3 * k5 + 2 * K_1 * MEK_total * k2 * k3 * k5 ) 
	MEK = MEK_total + ( K_1 * MEK_total * k10 * k4 * k6 + K_1 * MEK_total * k2 * k4 * k6 - MEK_total * ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) - K_1 * MEK_total * RAF_total * k10 * k3 * k6 - K_1 * RAF_total * k10 * k3 * k5 * ( MEK_total ^ 2 ) ) / ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 + MEK_total * k5 * ( k2 * k4 * ( 2 * ERK_total + 2 * K_1 ) + 2 * K_1 * k10 * k4 + K_1 * RAF_total * k10 * k3 ) + K_1 * k10 * k4 * k6 + K_1 * k2 * k4 * k6 + K_1 * RAF_total * k10 * k3 * k6 ) 
	pMEK = ( MEK_total * ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) + K_1 * MEK_total * RAF_total * k10 * k3 * k6 + K_1 * RAF_total * k10 * k3 * k5 * ( MEK_total ^ 2 ) - K_1 * MEK_total * k10 * k4 * k6 - K_1 * MEK_total * k2 * k4 * k6 ) / ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 + MEK_total * k5 * ( k2 * k4 * ( 2 * ERK_total + 2 * K_1 ) + 2 * K_1 * k10 * k4 + K_1 * RAF_total * k10 * k3 ) + K_1 * k10 * k4 * k6 + K_1 * k2 * k4 * k6 + K_1 * RAF_total * k10 * k3 * k6 ) 
	pERK = ( ERK_total * MEK_total * k5 * ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) + ERK_total * K_1 * RAF_total * k10 * k3 * ( MEK_total ^ 2 ) * ( k5 ^ 2 ) + ERK_total * K_1 * MEK_total * RAF_total * k10 * k3 * k5 * k6 - ERK_total * K_1 * MEK_total * k10 * k4 * k5 * k6 - ERK_total * K_1 * MEK_total * k2 * k4 * k5 * k6 ) / ( ( k6 + MEK_total * k5 ) * ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) + k2 * k4 * ( K_1 * ( k6 ^ 2 + MEK_total * k5 * k6 ) + 2 * ERK_total * MEK_total * k5 * k6 ) + K_1 * k10 * k4 * ( k6 ^ 2 + MEK_total * k5 * k6 ) + K_1 * RAF_total * k10 * k3 * ( k6 ^ 2 + ( MEK_total ^ 2 ) * ( k5 ^ 2 ) + 2 * MEK_total * k5 * k6 ) ) 
	pRAF = ( ( K_1 ^ 0.5 ) * ( ( K_1 * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + K_1 * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + K_1 * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + K_1 * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * K_1 * k10 * k2 * ( k4 ^ 2 ) * ( k6 ^ 2 ) + 2 * K_1 * RAF_total * k3 * k4 * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * K_1 * RAF_total * k10 * k2 * k3 * k4 * ( k6 ^ 2 ) + 2 * K_1 * MEK_total * k5 * k6 * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * K_1 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( k10 ^ 2 ) + 2 * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 + 4 * ERK_total * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) + K_1 * RAF_total * k10 * k3 * k6 + K_1 * MEK_total * RAF_total * k10 * k3 * k5 - K_1 * k10 * k4 * k6 - K_1 * k2 * k4 * k6 ) / ( 2 * K_1 * k10 * k3 * k6 + 2 * K_1 * k2 * k3 * k6 + 2 * K_1 * MEK_total * k10 * k3 * k5 + 2 * ERK_total * MEK_total * k2 * k3 * k5 + 2 * K_1 * MEK_total * k2 * k3 * k5 ) 
	ERK = ERK_total + ( ERK_total * K_1 * MEK_total * k10 * k4 * k5 * k6 + ERK_total * K_1 * MEK_total * k2 * k4 * k5 * k6 - ERK_total * MEK_total * k5 * ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) - ERK_total * K_1 * RAF_total * k10 * k3 * ( MEK_total ^ 2 ) * ( k5 ^ 2 ) - ERK_total * K_1 * MEK_total * RAF_total * k10 * k3 * k5 * k6 ) / ( ( k6 + MEK_total * k5 ) * ( ( ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( k2 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k6 ^ 2 ) + 2 * k10 * k2 * ( K_1 ^ 2 ) * ( k4 ^ 2 ) * ( k6 ^ 2 ) + ( K_1 ^ 2 ) * ( MEK_total ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) * ( k5 ^ 2 ) + 2 * RAF_total * k3 * k4 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * k5 * k6 * ( K_1 ^ 2 ) * ( RAF_total ^ 2 ) * ( k10 ^ 2 ) * ( k3 ^ 2 ) + 2 * RAF_total * k10 * k2 * k3 * k4 * ( K_1 ^ 2 ) * ( k6 ^ 2 ) + 2 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) * ( k10 ^ 2 ) + 2 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 * ( K_1 ^ 2 ) + 4 * ERK_total * K_1 * MEK_total * RAF_total * k10 * k2 * k3 * k4 * k5 * k6 ) ^ 0.5 ) + k2 * k4 * ( K_1 * ( k6 ^ 2 + MEK_total * k5 * k6 ) + 2 * ERK_total * MEK_total * k5 * k6 ) + K_1 * k10 * k4 * ( k6 ^ 2 + MEK_total * k5 * k6 ) + K_1 * RAF_total * k10 * k3 * ( k6 ^ 2 + ( MEK_total ^ 2 ) * ( k5 ^ 2 ) + 2 * MEK_total * k5 * k6 ) ) 

	 return [RAF, MEK, pMEK, pERK, pRAF, ERK]
end

function evalSd!(u, t, sdPar, dynPar, nonDynParam, paramData, observableId, mapSdParam) 

	RAF, MEK, pMEK, pERK, pRAF, ERK= u 
	K_1, K_2, K_3, k10, k11, k2, k3, k4, k5, k6, tau1, tau2 = dynPar 
	ERK_total_C = paramData.paramVal[1] 
	MEK_total_C = paramData.paramVal[5] 
	RAF_total_C = paramData.paramVal[6] 

	if observableId == "pErk" 
		noiseParameter1_pErk, noiseParameter2_pErk = getObsOrSdParam(sdPar, mapSdParam)
		return noiseParameter1_pErk * noiseParameter2_pErk 
	end

	if observableId == "pMek" 
		noiseParameter1_pMek, noiseParameter2_pMek = getObsOrSdParam(sdPar, mapSdParam)
		return noiseParameter1_pMek * noiseParameter2_pMek 
	end

end
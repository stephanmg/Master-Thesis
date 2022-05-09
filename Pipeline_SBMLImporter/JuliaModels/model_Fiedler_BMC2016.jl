# Model name: model_Fiedler_BMC2016
# Number of parameters: 18
# Number of species: 6
function getODEModel_model_Fiedler_BMC2016()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t RAF(t) MEK(t) pMEK(t) pERK(t) pRAF(t) ERK(t)

    ### Define variable parameters

    ### Define dummy variable
    ModelingToolkit.@variables dummyVariable(t)

    ### Define parameters
    ModelingToolkit.@parameters ERK_total UO126 k10 RAF_total K_3 cyt k4 Sorafenib K_2 k6 k11 tau1 MEK_total K_1 k3 tau2 k5 k2

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Events ###

    ### Derivatives ###
    eqs = [
    D(RAF) ~ -1.0 * (cyt * (K_1 * RAF * (k10 - k11 * exp(-t / tau2) * (exp(-t / tau1) - 1)) / (K_1 + pERK)))+1.0 * (cyt * k2 * pRAF),
    D(MEK) ~ -1.0 * (cyt * (K_2 * MEK * k3 * pRAF / (K_2 + Sorafenib)))+1.0 * (cyt * k4 * pMEK),
    D(pMEK) ~ +1.0 * (cyt * (K_2 * MEK * k3 * pRAF / (K_2 + Sorafenib)))-1.0 * (cyt * k4 * pMEK),
    D(pERK) ~ +1.0 * (cyt * (ERK * K_3 * k5 * pMEK / (K_3 + UO126)))-1.0 * (cyt * k6 * pERK),
    D(pRAF) ~ +1.0 * (cyt * (K_1 * RAF * (k10 - k11 * exp(-t / tau2) * (exp(-t / tau1) - 1)) / (K_1 + pERK)))-1.0 * (cyt * k2 * pRAF),
    D(ERK) ~ -1.0 * (cyt * (ERK * K_3 * k5 * pMEK / (K_3 + UO126)))+1.0 * (cyt * k6 * pERK),
    D(dummyVariable) ~ +MEK_total+ERK_total+K_1+k4+k10+k3+k6+k5+k2+RAF_total
    ]

    @named sys = ODESystem(eqs)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    RAF => RAF_total - ((K_1 * (K_1 * (k2)^(2) * (k4)^(2) * (k6)^(2) + K_1 * (k4)^(2) * (k6)^(2) * (k10)^(2) + 2 * K_1 * k2 * (k4)^(2) * (k6)^(2) * k10 + K_1 * (RAF_total)^(2) * (k3)^(2) * (k6)^(2) * (k10)^(2) + 2 * K_1 * RAF_total * k3 * k4 * (k6)^(2) * (k10)^(2) + K_1 * (MEK_total)^(2) * (RAF_total)^(2) * (k3)^(2) * (k5)^(2) * (k10)^(2) + 2 * K_1 * MEK_total * (RAF_total)^(2) * (k3)^(2) * k5 * k6 * (k10)^(2) + 2 * K_1 * RAF_total * k2 * k3 * k4 * (k6)^(2) * k10 + 2 * K_1 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * (k10)^(2) + 4 * ERK_total * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10 + 2 * K_1 * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10))^((1/2)) - K_1 * k2 * k4 * k6 - K_1 * k4 * k6 * k10 + K_1 * RAF_total * k3 * k6 * k10 + K_1 * MEK_total * RAF_total * k3 * k5 * k10) / (2 * K_1 * k2 * k3 * k6 + 2 * K_1 * k3 * k6 * k10 + 2 * ERK_total * MEK_total * k2 * k3 * k5 + 2 * K_1 * MEK_total * k2 * k3 * k5 + 2 * K_1 * MEK_total * k3 * k5 * k10),
    MEK => MEK_total - (MEK_total * ((K_1)^(2) * (k2)^(2) * (k4)^(2) * (k6)^(2) + (K_1)^(2) * (k4)^(2) * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (RAF_total)^(2) * (k3)^(2) * (k6)^(2) * (k10)^(2) + 2 * (K_1)^(2) * k2 * (k4)^(2) * (k6)^(2) * k10 + 2 * (K_1)^(2) * RAF_total * k3 * k4 * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (MEK_total)^(2) * (RAF_total)^(2) * (k3)^(2) * (k5)^(2) * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * (RAF_total)^(2) * (k3)^(2) * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * RAF_total * k2 * k3 * k4 * (k6)^(2) * k10 + 2 * (K_1)^(2) * MEK_total * RAF_total * k3 * k4 * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10 + 4 * ERK_total * K_1 * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10)^((1/2)) - K_1 * MEK_total * k2 * k4 * k6 - K_1 * MEK_total * k4 * k6 * k10 + K_1 * MEK_total * RAF_total * k3 * k6 * k10 + K_1 * (MEK_total)^(2) * RAF_total * k3 * k5 * k10) / (((K_1)^(2) * (k2)^(2) * (k4)^(2) * (k6)^(2) + (K_1)^(2) * (k4)^(2) * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (RAF_total)^(2) * (k3)^(2) * (k6)^(2) * (k10)^(2) + 2 * (K_1)^(2) * k2 * (k4)^(2) * (k6)^(2) * k10 + 2 * (K_1)^(2) * RAF_total * k3 * k4 * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (MEK_total)^(2) * (RAF_total)^(2) * (k3)^(2) * (k5)^(2) * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * (RAF_total)^(2) * (k3)^(2) * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * RAF_total * k2 * k3 * k4 * (k6)^(2) * k10 + 2 * (K_1)^(2) * MEK_total * RAF_total * k3 * k4 * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10 + 4 * ERK_total * K_1 * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10)^((1/2)) + MEK_total * k5 * (2 * K_1 * k4 * k10 + k2 * k4 * (2 * ERK_total + 2 * K_1) + K_1 * RAF_total * k3 * k10) + K_1 * k2 * k4 * k6 + K_1 * k4 * k6 * k10 + K_1 * RAF_total * k3 * k6 * k10),
    pMEK => (MEK_total * ((K_1)^(2) * (k2)^(2) * (k4)^(2) * (k6)^(2) + (K_1)^(2) * (k4)^(2) * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (RAF_total)^(2) * (k3)^(2) * (k6)^(2) * (k10)^(2) + 2 * (K_1)^(2) * k2 * (k4)^(2) * (k6)^(2) * k10 + 2 * (K_1)^(2) * RAF_total * k3 * k4 * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (MEK_total)^(2) * (RAF_total)^(2) * (k3)^(2) * (k5)^(2) * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * (RAF_total)^(2) * (k3)^(2) * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * RAF_total * k2 * k3 * k4 * (k6)^(2) * k10 + 2 * (K_1)^(2) * MEK_total * RAF_total * k3 * k4 * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10 + 4 * ERK_total * K_1 * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10)^((1/2)) - K_1 * MEK_total * k2 * k4 * k6 - K_1 * MEK_total * k4 * k6 * k10 + K_1 * MEK_total * RAF_total * k3 * k6 * k10 + K_1 * (MEK_total)^(2) * RAF_total * k3 * k5 * k10) / (((K_1)^(2) * (k2)^(2) * (k4)^(2) * (k6)^(2) + (K_1)^(2) * (k4)^(2) * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (RAF_total)^(2) * (k3)^(2) * (k6)^(2) * (k10)^(2) + 2 * (K_1)^(2) * k2 * (k4)^(2) * (k6)^(2) * k10 + 2 * (K_1)^(2) * RAF_total * k3 * k4 * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (MEK_total)^(2) * (RAF_total)^(2) * (k3)^(2) * (k5)^(2) * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * (RAF_total)^(2) * (k3)^(2) * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * RAF_total * k2 * k3 * k4 * (k6)^(2) * k10 + 2 * (K_1)^(2) * MEK_total * RAF_total * k3 * k4 * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10 + 4 * ERK_total * K_1 * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10)^((1/2)) + MEK_total * k5 * (2 * K_1 * k4 * k10 + k2 * k4 * (2 * ERK_total + 2 * K_1) + K_1 * RAF_total * k3 * k10) + K_1 * k2 * k4 * k6 + K_1 * k4 * k6 * k10 + K_1 * RAF_total * k3 * k6 * k10),
    pERK => (ERK_total * MEK_total * k5 * ((K_1)^(2) * (k2)^(2) * (k4)^(2) * (k6)^(2) + (K_1)^(2) * (k4)^(2) * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (RAF_total)^(2) * (k3)^(2) * (k6)^(2) * (k10)^(2) + 2 * (K_1)^(2) * k2 * (k4)^(2) * (k6)^(2) * k10 + 2 * (K_1)^(2) * RAF_total * k3 * k4 * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (MEK_total)^(2) * (RAF_total)^(2) * (k3)^(2) * (k5)^(2) * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * (RAF_total)^(2) * (k3)^(2) * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * RAF_total * k2 * k3 * k4 * (k6)^(2) * k10 + 2 * (K_1)^(2) * MEK_total * RAF_total * k3 * k4 * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10 + 4 * ERK_total * K_1 * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10)^((1/2)) + ERK_total * K_1 * (MEK_total)^(2) * RAF_total * k3 * (k5)^(2) * k10 - ERK_total * K_1 * MEK_total * k2 * k4 * k5 * k6 - ERK_total * K_1 * MEK_total * k4 * k5 * k6 * k10 + ERK_total * K_1 * MEK_total * RAF_total * k3 * k5 * k6 * k10) / ((k6 + MEK_total * k5) * ((K_1)^(2) * (k2)^(2) * (k4)^(2) * (k6)^(2) + (K_1)^(2) * (k4)^(2) * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (RAF_total)^(2) * (k3)^(2) * (k6)^(2) * (k10)^(2) + 2 * (K_1)^(2) * k2 * (k4)^(2) * (k6)^(2) * k10 + 2 * (K_1)^(2) * RAF_total * k3 * k4 * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (MEK_total)^(2) * (RAF_total)^(2) * (k3)^(2) * (k5)^(2) * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * (RAF_total)^(2) * (k3)^(2) * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * RAF_total * k2 * k3 * k4 * (k6)^(2) * k10 + 2 * (K_1)^(2) * MEK_total * RAF_total * k3 * k4 * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10 + 4 * ERK_total * K_1 * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10)^((1/2)) + k2 * k4 * (K_1 * ((k6)^(2) + MEK_total * k5 * k6) + 2 * ERK_total * MEK_total * k5 * k6) + K_1 * k4 * k10 * ((k6)^(2) + MEK_total * k5 * k6) + K_1 * RAF_total * k3 * k10 * ((k6)^(2) + (MEK_total)^(2) * (k5)^(2) + 2 * MEK_total * k5 * k6)),
    pRAF => ((K_1 * (K_1 * (k2)^(2) * (k4)^(2) * (k6)^(2) + K_1 * (k4)^(2) * (k6)^(2) * (k10)^(2) + 2 * K_1 * k2 * (k4)^(2) * (k6)^(2) * k10 + K_1 * (RAF_total)^(2) * (k3)^(2) * (k6)^(2) * (k10)^(2) + 2 * K_1 * RAF_total * k3 * k4 * (k6)^(2) * (k10)^(2) + K_1 * (MEK_total)^(2) * (RAF_total)^(2) * (k3)^(2) * (k5)^(2) * (k10)^(2) + 2 * K_1 * MEK_total * (RAF_total)^(2) * (k3)^(2) * k5 * k6 * (k10)^(2) + 2 * K_1 * RAF_total * k2 * k3 * k4 * (k6)^(2) * k10 + 2 * K_1 * MEK_total * RAF_total * k3 * k4 * k5 * k6 * (k10)^(2) + 4 * ERK_total * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10 + 2 * K_1 * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10))^((1/2)) - K_1 * k2 * k4 * k6 - K_1 * k4 * k6 * k10 + K_1 * RAF_total * k3 * k6 * k10 + K_1 * MEK_total * RAF_total * k3 * k5 * k10) / (2 * K_1 * k2 * k3 * k6 + 2 * K_1 * k3 * k6 * k10 + 2 * ERK_total * MEK_total * k2 * k3 * k5 + 2 * K_1 * MEK_total * k2 * k3 * k5 + 2 * K_1 * MEK_total * k3 * k5 * k10),
    ERK => ERK_total - (ERK_total * MEK_total * k5 * ((K_1)^(2) * (k2)^(2) * (k4)^(2) * (k6)^(2) + (K_1)^(2) * (k4)^(2) * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (RAF_total)^(2) * (k3)^(2) * (k6)^(2) * (k10)^(2) + 2 * (K_1)^(2) * k2 * (k4)^(2) * (k6)^(2) * k10 + 2 * (K_1)^(2) * RAF_total * k3 * k4 * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (MEK_total)^(2) * (RAF_total)^(2) * (k3)^(2) * (k5)^(2) * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * (RAF_total)^(2) * (k3)^(2) * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * RAF_total * k2 * k3 * k4 * (k6)^(2) * k10 + 2 * (K_1)^(2) * MEK_total * RAF_total * k3 * k4 * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10 + 4 * ERK_total * K_1 * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10)^((1/2)) + ERK_total * K_1 * (MEK_total)^(2) * RAF_total * k3 * (k5)^(2) * k10 - ERK_total * K_1 * MEK_total * k2 * k4 * k5 * k6 - ERK_total * K_1 * MEK_total * k4 * k5 * k6 * k10 + ERK_total * K_1 * MEK_total * RAF_total * k3 * k5 * k6 * k10) / ((k6 + MEK_total * k5) * ((K_1)^(2) * (k2)^(2) * (k4)^(2) * (k6)^(2) + (K_1)^(2) * (k4)^(2) * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (RAF_total)^(2) * (k3)^(2) * (k6)^(2) * (k10)^(2) + 2 * (K_1)^(2) * k2 * (k4)^(2) * (k6)^(2) * k10 + 2 * (K_1)^(2) * RAF_total * k3 * k4 * (k6)^(2) * (k10)^(2) + (K_1)^(2) * (MEK_total)^(2) * (RAF_total)^(2) * (k3)^(2) * (k5)^(2) * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * (RAF_total)^(2) * (k3)^(2) * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * RAF_total * k2 * k3 * k4 * (k6)^(2) * k10 + 2 * (K_1)^(2) * MEK_total * RAF_total * k3 * k4 * k5 * k6 * (k10)^(2) + 2 * (K_1)^(2) * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10 + 4 * ERK_total * K_1 * MEK_total * RAF_total * k2 * k3 * k4 * k5 * k6 * k10)^((1/2)) + k2 * k4 * (K_1 * ((k6)^(2) + MEK_total * k5 * k6) + 2 * ERK_total * MEK_total * k5 * k6) + K_1 * k4 * k10 * ((k6)^(2) + MEK_total * k5 * k6) + K_1 * RAF_total * k3 * k10 * ((k6)^(2) + (MEK_total)^(2) * (k5)^(2) + 2 * MEK_total * k5 * k6)),
    dummyVariable => 0.0]

    ### True parameter values ###
    trueParameterValues = [
    ERK_total => 1.0,
    UO126 => 0.0,
    k10 => 0.0233013569106142,
    RAF_total => 1.0,
    K_3 => 0.961738099369118,
    cyt => 1.0,
    k4 => 2.90831656859387,
    Sorafenib => 0.0,
    K_2 => 1.51138632474898,
    k6 => 3.61401250365661,
    k11 => 149.597826906266,
    tau1 => 0.251674841461275,
    MEK_total => 1.0,
    K_1 => 1.00341445073941e-5,
    k3 => 869.31180702032,
    tau2 => 0.0210740597705876,
    k5 => 578.350366636763,
    k2 => 1.22516651895562]

    return sys, initialSpeciesValues, trueParameterValues

end

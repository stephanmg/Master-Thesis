# Model name: model_Raimundez_PCB2020
# Number of parameters: 101
# Number of species: 22

### Define independent and dependent variables
ModelingToolkit.@variables t EGFR(t) pPI3K(t) MMET_METinh_2(t) pMAPK(t) MMET_2(t) pEGFR_EGF_2(t) pEGFR_EGF_2_i(t) pMPI3K(t) EGFR_EGF_2(t) MMET(t) pMMET_2(t) RAS_GTP(t) pMMET_2_i(t) pMMET_pEGFR_i(t) MMET_MMET_METinh(t) pAKT(t) EGFR_EGF(t) MMET_METinh(t) MMET_EGFR(t) EGFR_CET(t) pMMET_pEGFR(t) EGFR_MMET_METinh(t)

### Define variable parameters

### Define dummy variable

### Define parameters
ModelingToolkit.@parameters d_ksyn_EGFR__fm_2_hm xi_kexp_pMMET_2_i d_ka_RAS__pEGFR_EGF_2__MKN1_2_HS746T d_ka_MAPK__MKN1_2_HS746T ki_RAS__MKN1 d_ka_AKT__MKN1_2_HS746T KD_EGFR_CET xi_ka_PI3K_pMMET_2 d_MAPKtotal__fm_2_hm d_ksyn_MMET__fm_2_hm ka_PI3K__basal d_kimp_pEGFR_EGF_2__MKN1_2_HS746T d_AKTtotal__fm_2_hm KD_METinh xi_ki_MPI3K d_kexp_pEGFR_EGF_2_i__MKN1_2_HS746T d_ksyn_EGFR__MKN1_2_HS746T d_MPI3Ktotal__fm_2_hm d_kdeg_membran__MKN1_2_HS746T MPI3Ktotal__MKN1_fm KD_EGFR_EGF kexp_pEGFR_EGF_2_i__MKN1 CET_level kbin_EGFR_EGF ksyn_EGFR__MKN1_fm xi_kdeg_pMMET_pEGFR_i d_ki_PI3K__MKN1_2_HS746T xi_kpho_MMET_EGFR MAPKtotal__MKN1_fm xi_kexp_pMMET_pEGFR_i d_RAStotal__MKN1_2_HS746T kpho_EGFR_EGF ka_MAPK__MKN1 kpho_MMET_EGFR full_medium xi_ka_RAS_pMMET_2 xi_kimp_pMMET_pEGFR xi_kdeg_pMMET_2_i ka_RAS__basal__MKN1 d_RAStotal__fm_2_hm kdim_MMET MKN1 ksyn_MMET__HS746T_fm kdim_MMET_EGFR ka_PI3K__pEGFR_EGF_2 kdeg_membran__MKN1 HS746T d_ki_RAS__MKN1_2_HS746T EGF_level kdim_EGFR_EGF kbin_EGFR_CET ka_AKT__MKN1 d_ki_AKT__MKN1_2_HS746T PI3Ktotal__HS746T_fm ki_PI3K__MKN1 kpho_MMET AKTtotal__MKN1_fm xi_kimp_pMMET_2 relative_ksyn_EGFR ka_RAS__pEGFR_EGF_2__MKN1 ki_MAPK kimp_pEGFR_EGF_2__MKN1 d_AKTtotal__MKN1_2_HS746T ki_AKT__MKN1 RAStotal__MKN1_fm d_PI3Ktotal__fm_2_hm xi_ka_PI3K_pMMET_pEGFR xi_kdim_MMET_EGFR xi_kpho_MMET METinh_level kdim_MMETinh d_MAPKtotal__MKN1_2_HS746T xi_ka_RAS_pMMET_pEGFR kdeg_pEGFR_EGF_2_i__MKN1 xi_kdim_MMET d_kdeg_pEGFR_EGF_2_i__MKN1_2_HS746T d_ka_RAS__basal__MKN1_2_HS746T hunger_medium

### Define constants
ModelingToolkit.@parameters cyt

### Define an operator for the differentiation w.r.t. time
D = Differential(t)

### Events ###

### Derivatives ###
eqs = [
D(EGFR) ~ +1.0 * (cyt * (ksyn_EGFR__MKN1_fm * relative_ksyn_EGFR * exp(HS746T * d_ksyn_EGFR__MKN1_2_HS746T + d_ksyn_EGFR__fm_2_hm * hunger_medium)))-1.0 * (cyt * EGFR * (kdeg_membran__MKN1 * exp(HS746T * d_kdeg_membran__MKN1_2_HS746T)))-1.0 * (cyt * (6.86 * CET_level * (1 + (t < 0) * ((0) - (1)))) * EGFR * kbin_EGFR_CET)+1.0 * (cyt * EGFR_CET * KD_EGFR_CET * kbin_EGFR_CET)-1.0 * (cyt * (0.161 * EGF_level * (1 + (t < 0) * ((0) - (1)))) * EGFR * kbin_EGFR_EGF)+1.0 * (cyt * EGFR_EGF * KD_EGFR_EGF * kbin_EGFR_EGF)+2.0 * (cyt * (kexp_pEGFR_EGF_2_i__MKN1 * exp(HS746T * d_kexp_pEGFR_EGF_2_i__MKN1_2_HS746T)) * pEGFR_EGF_2_i)-1.0 * (cyt * EGFR * MMET * kdim_MMET_EGFR * xi_kdim_MMET_EGFR)+1.0 * (cyt * (kexp_pEGFR_EGF_2_i__MKN1 * exp(HS746T * d_kexp_pEGFR_EGF_2_i__MKN1_2_HS746T)) * pMMET_pEGFR_i * xi_kexp_pMMET_pEGFR_i)-1.0 * (cyt * EGFR * MMET_METinh * kdim_MMET_EGFR * xi_kdim_MMET_EGFR),
D(pPI3K) ~ +1.0 * (cyt * ka_PI3K__basal * ((HS746T * PI3Ktotal__HS746T_fm * exp(d_PI3Ktotal__fm_2_hm * hunger_medium)) - pPI3K))+1.0 * (cyt * ka_PI3K__pEGFR_EGF_2 * pEGFR_EGF_2 * ((HS746T * PI3Ktotal__HS746T_fm * exp(d_PI3Ktotal__fm_2_hm * hunger_medium)) - pPI3K))+1.0 * (cyt * ka_PI3K__pEGFR_EGF_2 * pEGFR_EGF_2_i * ((HS746T * PI3Ktotal__HS746T_fm * exp(d_PI3Ktotal__fm_2_hm * hunger_medium)) - pPI3K))+1.0 * (cyt * ka_PI3K__pEGFR_EGF_2 * pMMET_pEGFR * xi_ka_PI3K_pMMET_pEGFR * ((HS746T * PI3Ktotal__HS746T_fm * exp(d_PI3Ktotal__fm_2_hm * hunger_medium)) - pPI3K))+1.0 * (cyt * ka_PI3K__pEGFR_EGF_2 * pMMET_pEGFR_i * xi_ka_PI3K_pMMET_pEGFR * ((HS746T * PI3Ktotal__HS746T_fm * exp(d_PI3Ktotal__fm_2_hm * hunger_medium)) - pPI3K))+1.0 * (cyt * ka_PI3K__pEGFR_EGF_2 * pMMET_2 * xi_ka_PI3K_pMMET_2 * ((HS746T * PI3Ktotal__HS746T_fm * exp(d_PI3Ktotal__fm_2_hm * hunger_medium)) - pPI3K))+1.0 * (cyt * ka_PI3K__pEGFR_EGF_2 * pMMET_2_i * xi_ka_PI3K_pMMET_2 * ((HS746T * PI3Ktotal__HS746T_fm * exp(d_PI3Ktotal__fm_2_hm * hunger_medium)) - pPI3K))-1.0 * (cyt * (ki_PI3K__MKN1 * exp(HS746T * d_ki_PI3K__MKN1_2_HS746T)) * pPI3K),
D(MMET_METinh_2) ~ +1.0 * (cyt * (MMET_METinh)^(2) * kdim_MMET * xi_kdim_MMET)+1.0 * (cyt * (METinh_level * (1 + (t < 0) * ((0) - (1)))) * MMET_MMET_METinh * kdim_MMETinh)-1.0 * (cyt * MMET_METinh_2 * (kdeg_membran__MKN1 * exp(HS746T * d_kdeg_membran__MKN1_2_HS746T))),
D(pMAPK) ~ +1.0 * (cyt * RAS_GTP * (ka_MAPK__MKN1 * exp(HS746T * d_ka_MAPK__MKN1_2_HS746T)) * ((MAPKtotal__MKN1_fm * exp(HS746T * d_MAPKtotal__MKN1_2_HS746T + d_MAPKtotal__fm_2_hm * hunger_medium)) - pMAPK))-1.0 * (cyt * ki_MAPK * pMAPK),
D(MMET_2) ~ +1.0 * (cyt * (MMET)^(2) * kdim_MMET * xi_kdim_MMET)-1.0 * (cyt * MMET_2 * kpho_MMET * xi_kpho_MMET)-1.0 * (cyt * MMET_2 * (kdeg_membran__MKN1 * exp(HS746T * d_kdeg_membran__MKN1_2_HS746T)))-1.0 * (cyt * (METinh_level * (1 + (t < 0) * ((0) - (1)))) * MMET_2 * kdim_MMETinh),
D(pEGFR_EGF_2) ~ +1.0 * (cyt * EGFR_EGF_2 * kpho_EGFR_EGF)-1.0 * (cyt * (kimp_pEGFR_EGF_2__MKN1 * exp(HS746T * d_kimp_pEGFR_EGF_2__MKN1_2_HS746T)) * pEGFR_EGF_2),
D(pEGFR_EGF_2_i) ~ +1.0 * (cyt * (kimp_pEGFR_EGF_2__MKN1 * exp(HS746T * d_kimp_pEGFR_EGF_2__MKN1_2_HS746T)) * pEGFR_EGF_2)-1.0 * (cyt * (kexp_pEGFR_EGF_2_i__MKN1 * exp(HS746T * d_kexp_pEGFR_EGF_2_i__MKN1_2_HS746T)) * pEGFR_EGF_2_i)-1.0 * (cyt * (kdeg_pEGFR_EGF_2_i__MKN1 * exp(HS746T * d_kdeg_pEGFR_EGF_2_i__MKN1_2_HS746T)) * pEGFR_EGF_2_i),
D(pMPI3K) ~ +1.0 * (cyt * ka_PI3K__basal * ((MKN1 * MPI3Ktotal__MKN1_fm * exp(d_MPI3Ktotal__fm_2_hm * hunger_medium)) - pMPI3K))+1.0 * (cyt * ka_PI3K__pEGFR_EGF_2 * pEGFR_EGF_2 * ((MKN1 * MPI3Ktotal__MKN1_fm * exp(d_MPI3Ktotal__fm_2_hm * hunger_medium)) - pMPI3K))+1.0 * (cyt * ka_PI3K__pEGFR_EGF_2 * pEGFR_EGF_2_i * ((MKN1 * MPI3Ktotal__MKN1_fm * exp(d_MPI3Ktotal__fm_2_hm * hunger_medium)) - pMPI3K))+1.0 * (cyt * ka_PI3K__pEGFR_EGF_2 * pMMET_pEGFR * xi_ka_PI3K_pMMET_pEGFR * ((MKN1 * MPI3Ktotal__MKN1_fm * exp(d_MPI3Ktotal__fm_2_hm * hunger_medium)) - pMPI3K))+1.0 * (cyt * ka_PI3K__pEGFR_EGF_2 * pMMET_pEGFR_i * xi_ka_PI3K_pMMET_pEGFR * ((MKN1 * MPI3Ktotal__MKN1_fm * exp(d_MPI3Ktotal__fm_2_hm * hunger_medium)) - pMPI3K))+1.0 * (cyt * ka_PI3K__pEGFR_EGF_2 * pMMET_2 * xi_ka_PI3K_pMMET_2 * ((MKN1 * MPI3Ktotal__MKN1_fm * exp(d_MPI3Ktotal__fm_2_hm * hunger_medium)) - pMPI3K))+1.0 * (cyt * ka_PI3K__pEGFR_EGF_2 * pMMET_2_i * xi_ka_PI3K_pMMET_2 * ((MKN1 * MPI3Ktotal__MKN1_fm * exp(d_MPI3Ktotal__fm_2_hm * hunger_medium)) - pMPI3K))-1.0 * (cyt * (ki_PI3K__MKN1 * exp(HS746T * d_ki_PI3K__MKN1_2_HS746T)) * pMPI3K * xi_ki_MPI3K),
D(EGFR_EGF_2) ~ +1.0 * (cyt * (EGFR_EGF)^(2) * kdim_EGFR_EGF)-1.0 * (cyt * EGFR_EGF_2 * kpho_EGFR_EGF)-1.0 * (cyt * EGFR_EGF_2 * (kdeg_membran__MKN1 * exp(HS746T * d_kdeg_membran__MKN1_2_HS746T))),
D(MMET) ~ +1.0 * (cyt * (HS746T * ksyn_MMET__HS746T_fm * exp(d_ksyn_MMET__fm_2_hm * hunger_medium)))-1.0 * (cyt * MMET * (kdeg_membran__MKN1 * exp(HS746T * d_kdeg_membran__MKN1_2_HS746T)))-1.0 * (cyt * (METinh_level * (1 + (t < 0) * ((0) - (1)))) * MMET * kdim_MMETinh)+1.0 * (cyt * KD_METinh * MMET_METinh * kdim_MMETinh)-2.0 * (cyt * (MMET)^(2) * kdim_MMET * xi_kdim_MMET)+2.0 * (cyt * (kexp_pEGFR_EGF_2_i__MKN1 * exp(HS746T * d_kexp_pEGFR_EGF_2_i__MKN1_2_HS746T)) * pMMET_2_i * xi_kexp_pMMET_2_i)-1.0 * (cyt * MMET * MMET_METinh * kdim_MMET * xi_kdim_MMET)-1.0 * (cyt * EGFR * MMET * kdim_MMET_EGFR * xi_kdim_MMET_EGFR)+1.0 * (cyt * (kexp_pEGFR_EGF_2_i__MKN1 * exp(HS746T * d_kexp_pEGFR_EGF_2_i__MKN1_2_HS746T)) * pMMET_pEGFR_i * xi_kexp_pMMET_pEGFR_i),
D(pMMET_2) ~ +1.0 * (cyt * MMET_2 * kpho_MMET * xi_kpho_MMET)-1.0 * (cyt * (kimp_pEGFR_EGF_2__MKN1 * exp(HS746T * d_kimp_pEGFR_EGF_2__MKN1_2_HS746T)) * pMMET_2 * xi_kimp_pMMET_2),
D(RAS_GTP) ~ +1.0 * (cyt * -(ka_RAS__basal__MKN1 * exp(HS746T * d_ka_RAS__basal__MKN1_2_HS746T)) * (RAS_GTP - (RAStotal__MKN1_fm * exp(HS746T * d_RAStotal__MKN1_2_HS746T + d_RAStotal__fm_2_hm * hunger_medium))))+1.0 * (cyt * -(ka_RAS__pEGFR_EGF_2__MKN1 * exp(HS746T * d_ka_RAS__pEGFR_EGF_2__MKN1_2_HS746T)) * pEGFR_EGF_2 * (RAS_GTP - (RAStotal__MKN1_fm * exp(HS746T * d_RAStotal__MKN1_2_HS746T + d_RAStotal__fm_2_hm * hunger_medium))))+1.0 * (cyt * -(ka_RAS__pEGFR_EGF_2__MKN1 * exp(HS746T * d_ka_RAS__pEGFR_EGF_2__MKN1_2_HS746T)) * pEGFR_EGF_2_i * (RAS_GTP - (RAStotal__MKN1_fm * exp(HS746T * d_RAStotal__MKN1_2_HS746T + d_RAStotal__fm_2_hm * hunger_medium))))+1.0 * (cyt * -(ka_RAS__pEGFR_EGF_2__MKN1 * exp(HS746T * d_ka_RAS__pEGFR_EGF_2__MKN1_2_HS746T)) * pMMET_pEGFR * xi_ka_RAS_pMMET_pEGFR * (RAS_GTP - (RAStotal__MKN1_fm * exp(HS746T * d_RAStotal__MKN1_2_HS746T + d_RAStotal__fm_2_hm * hunger_medium))))+1.0 * (cyt * -(ka_RAS__pEGFR_EGF_2__MKN1 * exp(HS746T * d_ka_RAS__pEGFR_EGF_2__MKN1_2_HS746T)) * pMMET_pEGFR_i * xi_ka_RAS_pMMET_pEGFR * (RAS_GTP - (RAStotal__MKN1_fm * exp(HS746T * d_RAStotal__MKN1_2_HS746T + d_RAStotal__fm_2_hm * hunger_medium))))+1.0 * (cyt * -(ka_RAS__pEGFR_EGF_2__MKN1 * exp(HS746T * d_ka_RAS__pEGFR_EGF_2__MKN1_2_HS746T)) * pMMET_2 * xi_ka_RAS_pMMET_2 * (RAS_GTP - (RAStotal__MKN1_fm * exp(HS746T * d_RAStotal__MKN1_2_HS746T + d_RAStotal__fm_2_hm * hunger_medium))))+1.0 * (cyt * -(ka_RAS__pEGFR_EGF_2__MKN1 * exp(HS746T * d_ka_RAS__pEGFR_EGF_2__MKN1_2_HS746T)) * pMMET_2_i * xi_ka_RAS_pMMET_2 * (RAS_GTP - (RAStotal__MKN1_fm * exp(HS746T * d_RAStotal__MKN1_2_HS746T + d_RAStotal__fm_2_hm * hunger_medium))))-1.0 * (cyt * RAS_GTP * (ki_RAS__MKN1 * exp(HS746T * d_ki_RAS__MKN1_2_HS746T))),
D(pMMET_2_i) ~ +1.0 * (cyt * (kimp_pEGFR_EGF_2__MKN1 * exp(HS746T * d_kimp_pEGFR_EGF_2__MKN1_2_HS746T)) * pMMET_2 * xi_kimp_pMMET_2)-1.0 * (cyt * (kexp_pEGFR_EGF_2_i__MKN1 * exp(HS746T * d_kexp_pEGFR_EGF_2_i__MKN1_2_HS746T)) * pMMET_2_i * xi_kexp_pMMET_2_i)-1.0 * (cyt * (kdeg_pEGFR_EGF_2_i__MKN1 * exp(HS746T * d_kdeg_pEGFR_EGF_2_i__MKN1_2_HS746T)) * pMMET_2_i * xi_kdeg_pMMET_2_i),
D(pMMET_pEGFR_i) ~ +1.0 * (cyt * (kimp_pEGFR_EGF_2__MKN1 * exp(HS746T * d_kimp_pEGFR_EGF_2__MKN1_2_HS746T)) * pMMET_pEGFR * xi_kimp_pMMET_pEGFR)-1.0 * (cyt * (kexp_pEGFR_EGF_2_i__MKN1 * exp(HS746T * d_kexp_pEGFR_EGF_2_i__MKN1_2_HS746T)) * pMMET_pEGFR_i * xi_kexp_pMMET_pEGFR_i)-1.0 * (cyt * (kdeg_pEGFR_EGF_2_i__MKN1 * exp(HS746T * d_kdeg_pEGFR_EGF_2_i__MKN1_2_HS746T)) * pMMET_pEGFR_i * xi_kdeg_pMMET_pEGFR_i),
D(MMET_MMET_METinh) ~ +1.0 * (cyt * MMET * MMET_METinh * kdim_MMET * xi_kdim_MMET)+1.0 * (cyt * (METinh_level * (1 + (t < 0) * ((0) - (1)))) * MMET_2 * kdim_MMETinh)-1.0 * (cyt * (METinh_level * (1 + (t < 0) * ((0) - (1)))) * MMET_MMET_METinh * kdim_MMETinh)-1.0 * (cyt * MMET_MMET_METinh * (kdeg_membran__MKN1 * exp(HS746T * d_kdeg_membran__MKN1_2_HS746T))),
D(pAKT) ~ +1.0 * (cyt * (ka_AKT__MKN1 * exp(HS746T * d_ka_AKT__MKN1_2_HS746T)) * pPI3K * ((AKTtotal__MKN1_fm * exp(HS746T * d_AKTtotal__MKN1_2_HS746T + d_AKTtotal__fm_2_hm * hunger_medium)) - pAKT))+1.0 * (cyt * (ka_AKT__MKN1 * exp(HS746T * d_ka_AKT__MKN1_2_HS746T)) * pMPI3K * ((AKTtotal__MKN1_fm * exp(HS746T * d_AKTtotal__MKN1_2_HS746T + d_AKTtotal__fm_2_hm * hunger_medium)) - pAKT))-1.0 * (cyt * (ki_AKT__MKN1 * exp(HS746T * d_ki_AKT__MKN1_2_HS746T)) * pAKT),
D(EGFR_EGF) ~ +1.0 * (cyt * (0.161 * EGF_level * (1 + (t < 0) * ((0) - (1)))) * EGFR * kbin_EGFR_EGF)-1.0 * (cyt * EGFR_EGF * KD_EGFR_EGF * kbin_EGFR_EGF)-2.0 * (cyt * (EGFR_EGF)^(2) * kdim_EGFR_EGF)-1.0 * (cyt * EGFR_EGF * (kdeg_membran__MKN1 * exp(HS746T * d_kdeg_membran__MKN1_2_HS746T))),
D(MMET_METinh) ~ +1.0 * (cyt * (METinh_level * (1 + (t < 0) * ((0) - (1)))) * MMET * kdim_MMETinh)-1.0 * (cyt * KD_METinh * MMET_METinh * kdim_MMETinh)-1.0 * (cyt * MMET_METinh * (kdeg_membran__MKN1 * exp(HS746T * d_kdeg_membran__MKN1_2_HS746T)))-1.0 * (cyt * MMET * MMET_METinh * kdim_MMET * xi_kdim_MMET)-2.0 * (cyt * (MMET_METinh)^(2) * kdim_MMET * xi_kdim_MMET)-1.0 * (cyt * EGFR * MMET_METinh * kdim_MMET_EGFR * xi_kdim_MMET_EGFR),
D(MMET_EGFR) ~ +1.0 * (cyt * EGFR * MMET * kdim_MMET_EGFR * xi_kdim_MMET_EGFR)-1.0 * (cyt * MMET_EGFR * kpho_MMET_EGFR * xi_kpho_MMET_EGFR)-1.0 * (cyt * MMET_EGFR * (kdeg_membran__MKN1 * exp(HS746T * d_kdeg_membran__MKN1_2_HS746T))),
D(EGFR_CET) ~ +1.0 * (cyt * (6.86 * CET_level * (1 + (t < 0) * ((0) - (1)))) * EGFR * kbin_EGFR_CET)-1.0 * (cyt * EGFR_CET * KD_EGFR_CET * kbin_EGFR_CET)-1.0 * (cyt * EGFR_CET * (kdeg_membran__MKN1 * exp(HS746T * d_kdeg_membran__MKN1_2_HS746T))),
D(pMMET_pEGFR) ~ +1.0 * (cyt * MMET_EGFR * kpho_MMET_EGFR * xi_kpho_MMET_EGFR)-1.0 * (cyt * (kimp_pEGFR_EGF_2__MKN1 * exp(HS746T * d_kimp_pEGFR_EGF_2__MKN1_2_HS746T)) * pMMET_pEGFR * xi_kimp_pMMET_pEGFR),
D(EGFR_MMET_METinh) ~ +1.0 * (cyt * EGFR * MMET_METinh * kdim_MMET_EGFR * xi_kdim_MMET_EGFR)]

@named sys = ODESystem(eqs)

### Initial species concentrations ###
initialSpeciesValues = [
EGFR => 0,
pPI3K => 0,
MMET_METinh_2 => 0,
pMAPK => 0,
MMET_2 => 0,
pEGFR_EGF_2 => 0,
pEGFR_EGF_2_i => 0,
pMPI3K => 0,
EGFR_EGF_2 => 0,
MMET => 0,
pMMET_2 => 0,
RAS_GTP => 0,
pMMET_2_i => 0,
pMMET_pEGFR_i => 0,
MMET_MMET_METinh => 0,
pAKT => 0,
EGFR_EGF => 0,
MMET_METinh => 0,
MMET_EGFR => 0,
EGFR_CET => 0,
pMMET_pEGFR => 0,
EGFR_MMET_METinh => 0]

### True parameter values ###
trueParameterValues = [
d_ksyn_EGFR__fm_2_hm => -0.087595179128819,
xi_kexp_pMMET_2_i => 1.24320885340702,
d_ka_RAS__pEGFR_EGF_2__MKN1_2_HS746T => 0.0,
d_ka_MAPK__MKN1_2_HS746T => 0.0,
ki_RAS__MKN1 => 0.326956568863966,
d_ka_AKT__MKN1_2_HS746T => 0.0,
KD_EGFR_CET => 0.218012149340634,
xi_ka_PI3K_pMMET_2 => 301.340865539045,
d_MAPKtotal__fm_2_hm => 0.427450996540987,
d_ksyn_MMET__fm_2_hm => -0.518888973548685,
ka_PI3K__basal => 0.000364915071486299,
d_kimp_pEGFR_EGF_2__MKN1_2_HS746T => -1.74579260575349,
d_AKTtotal__fm_2_hm => 0.822922669170335,
KD_METinh => 0.0419369011942491,
xi_ki_MPI3K => 0.0032202841840531,
d_kexp_pEGFR_EGF_2_i__MKN1_2_HS746T => -0.23823693668421,
d_ksyn_EGFR__MKN1_2_HS746T => -2.99999999999997,
d_MPI3Ktotal__fm_2_hm => -1.54468079589527,
d_kdeg_membran__MKN1_2_HS746T => -0.599975506316473,
MPI3Ktotal__MKN1_fm => 1.0,
KD_EGFR_EGF => 0.320759905034371,
kexp_pEGFR_EGF_2_i__MKN1 => 0.75168312329534,
CET_level => 1.0,
kbin_EGFR_EGF => 8.88174858370342,
ksyn_EGFR__MKN1_fm => 1.0,
xi_kdeg_pMMET_pEGFR_i => 3.53345024355609,
d_ki_PI3K__MKN1_2_HS746T => 0.0,
xi_kpho_MMET_EGFR => 0.0696731441268168,
MAPKtotal__MKN1_fm => 1.0,
xi_kexp_pMMET_pEGFR_i => 0.286399421450953,
d_RAStotal__MKN1_2_HS746T => -1.05879118406788e-22,
kpho_EGFR_EGF => 1.34412787040515,
ka_MAPK__MKN1 => 999.999999999942,
kpho_MMET_EGFR => 4.56300939074226,
full_medium => 1.0,
xi_ka_RAS_pMMET_2 => 0.449351471804434,
xi_kimp_pMMET_pEGFR => 0.00796005343654933,
xi_kdeg_pMMET_2_i => 0.783710318142686,
ka_RAS__basal__MKN1 => 0.000214463346879122,
d_RAStotal__fm_2_hm => -0.538190130449678,
kdim_MMET => 2.61246774136855e-5,
MKN1 => 1.0,
ksyn_MMET__HS746T_fm => 0.0263508050701968,
kdim_MMET_EGFR => 0.0018821970256015,
ka_PI3K__pEGFR_EGF_2 => 0.00170094333323992,
kdeg_membran__MKN1 => 0.00225906406531955,
HS746T => 1.0,
d_ki_RAS__MKN1_2_HS746T => 0.0,
EGF_level => 1.0,
kdim_EGFR_EGF => 0.0323948687677602,
kbin_EGFR_CET => 0.585302658299007,
ka_AKT__MKN1 => 443.101158324899,
d_ki_AKT__MKN1_2_HS746T => 0.0,
PI3Ktotal__HS746T_fm => 1.0,
ki_PI3K__MKN1 => 1.31587984277014,
kpho_MMET => 2.54267401784407,
AKTtotal__MKN1_fm => 1.0,
xi_kimp_pMMET_2 => 0.0771538780627502,
relative_ksyn_EGFR => 1.0,
ka_RAS__pEGFR_EGF_2__MKN1 => 1.46548915399828e-5,
ki_MAPK => 2.17715931380425,
kimp_pEGFR_EGF_2__MKN1 => 0.746870204508838,
d_AKTtotal__MKN1_2_HS746T => 0.0,
ki_AKT__MKN1 => 18.4692967396058,
RAStotal__MKN1_fm => 1.0,
d_PI3Ktotal__fm_2_hm => -0.53183572852766,
xi_ka_PI3K_pMMET_pEGFR => 0.765472157713775,
xi_kdim_MMET_EGFR => 1.00042475919183,
xi_kpho_MMET => 0.00832776881377235,
METinh_level => 1.0,
kdim_MMETinh => 0.0312714078548831,
d_MAPKtotal__MKN1_2_HS746T => 0.0,
xi_ka_RAS_pMMET_pEGFR => 0.253561151358926,
kdeg_pEGFR_EGF_2_i__MKN1 => 0.0667956122089203,
xi_kdim_MMET => 0.974771379091693,
d_kdeg_pEGFR_EGF_2_i__MKN1_2_HS746T => 2.99999999999997,
d_ka_RAS__basal__MKN1_2_HS746T => 0.0,
hunger_medium => 1.0]

trueConstantsValues = [
cyt => 1.0]

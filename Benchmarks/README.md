# About

This file describes how to run the parameter estimation benchmark for the supported models (list of supported models below). 

## Setting up correct Julia environment

Assuming that you have cloned this directory the correct Julia environment for Linux can be set up by can be set up via a local installation;

1. Download the folder with [Julia 1.8.3](https://julialang.org/downloads/). 
2. Extract the [tar-archive](https://xkcd.com/1168/).
3. In the terminal go to the root directory of the Julia PeTab importer (where the Manifest.toml and Project.toml are) and launch Julia via in the terminal by: `path_julia_folder/bin/julia`
4. In the Julia prompt press **]** which will activate the [package manager](https://pkgdocs.julialang.org/v1/environments/). In the pacakge manager : 
    1. Write `activate .` (activate current environment)
    2. Write `instantiate` (will download and precompile all the required packages)

Now all the correct Julia packages are installed. To use the correct environment when running a script from the root-directory of the repository simply use the project flag;

~~~
path_julia_folder/bin/julia --project=. file.jl
~~~

In VScode you can also select the environment.

## Setting up correct Python environment (for Fides)

I have created a `.yml` which installs Fides and its dependencies. Given a [Conda installation](https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html) the Python packages can from the following terminal command;

~~~
conda env create -f PeTab.yml -n your_env_name
~~~

## Running ODE solver benchmark

### Small models

To run the benchmark Borghans, Crauste, Fiedler, Sneyd, Bruno, Elowitz, Boehm, Schwen and Lucarelli models in the project root-directory run:

~~~
path_julia_folder/bin/julia --project=. Benchmarks/ODE_solvers/Benchmark_solvers.jl compare_fabian
~~~

The ODE solvers tested are KenCarp4, FBDF, QNDF, Rosenbrock23, TRBDF2, RadauIIA5, Rodas4, CVODE_BDF, "Rodas5" using two tolerance options; (abstol=1e-16, reltol=1e-8). For each solver and tolerance option we measure the run-time (wall-time) three times (three repetitions).

The parameter values used for the ODE benchmark are the same as the nominal values in the PEtab files from [here](https://github.com/Benchmarking-Initiative/Benchmark-Models-PEtab), and the ODE:s are solved for all experimental conditions for which there are measurement data. For each model the benchmark pipeline computes a high accuracy solution of the ODE using BigFloatm abstol=1e-16, and reltol=1e-16 which can take some time.

The result from the benchmark estimation is automatically stored in *Intermediate/Benchmarks/ODE_solvers/file_name.csv* in a [Tidy-format](https://www.jstatsoft.org/article/view/v059i10).

### Chen model 

To run the benchmark for the Chen model in the project root-directory run:

~~~
path_julia_folder/bin/julia --project=. Benchmarks/ODE_solvers/Benchmark_solvers.jl large_models
~~~

The result from the benchmark estimation is automatically stored in *Intermediate/Benchmarks/ODE_solvers/Large_models.csv* in a [Tidy-format](https://www.jstatsoft.org/article/view/v059i10). Visuals can be produced by running the R-script *Analysis/Large_models.R*. Note, this script must be run from the */Analysis* directory. As long as you have R (version > 4.0) and the packages *tidyverse*, *gt* and *ggthemes* you should be able to run the code.

## Running cost, gradient and hessian benchmark

To run the benchmark for the gradient, cost and hessian in the project root-directory run:

~~~
path_julia_folder/bin/julia --project=. Benchmarks/Cost_grad_hess/Cost_grad_hess.jl No_pre_eq_models
~~~

This will run the benchmark for the *Boehm*, *Bachmann*, *Beer*, *Bruno*, *Crauste*, *Elowitz*, *Fiedler_BMC2016*, *Fujita*, *Lucarelli* and *Sneyd* models at the nominal parameter vector. Currently we use abstol=reltol=1e-8 for the ODE solvers. The actual function call to run the benchmark is;

~~~
benchmarkCostGrad(peTabModel, modelName, solversCheck, pathSave, tol, checkHess=false)
~~~

If you set `checkHess=true` the hessian is also computed (this takes some time however, so use with care).

The result from the benchmark is automatically stored in *Intermediate/Benchmarks/Cost_grad_hess/Process_cost_grad_hess.csv* in a [Tidy-format](https://www.jstatsoft.org/article/view/v059i10). Visuals and a html-table with run-times can be produced by running the R-script *Analysis/Cost_grad_hess.R*. Note, this script must be run from the */Analysis* directory. As long as you have R (version > 4.0) and the packages *tidyverse*, *gt* and *ggthemes* you should be able to run the code. Also if you in the *Intermediate/Benchmarks/Cost_grad_hess/* put the file *computation_times.csv* from running the benchmark on the [AMICI](https://github.com/AMICI-dev/AMICI) develop branch using this [workflow](https://github.com/AMICI-dev/AMICI/actions/runs/3687257251/workflow) a comparison visual against AMICI is produced.

## Running parameter estimation benchmark

Currently, the benchmark can run for the **Boehm**, **Bachmann**, **Brännmark** and **Fujita** models. To run the benchmark in terminal from the root project directory run:

~~~
path_julia_folder/bin/julia --project=. Benchmarks/Parameter_estimation/Run_benchmark.jl model_name
~~~

So to run the benchmark for the Boehm model simply run;

~~~
path_julia_folder/bin/julia --project=. Benchmarks/Parameter_estimation/Run_benchmark.jl Boehm
~~~

If you want to use Fides optimizers you must also make a small change in the *Benchmarks/Parameter_estimation/Run_benchmark.jl* file. Specificailly, you must add the following line before the call to the benchmark function:

~~~
loadFidesFromPython("path_to_python_for_conda_env")
~~~

Where `path_to_python_for_conda_env` is the path to python executable for the Conda environment with the Fides installation. I know this is a bit suboptimal, but using Python within Julia can be tricky easy :).

The result from the parameter estimation is automatically stored in *Intermediate/Benchmarks/Parameter_estimation/Model_name/Benchmark_result.csv* in a [Tidy-format](https://www.jstatsoft.org/article/view/v059i10).

### Termination criteria

Currently the termination criteria are set such that Optim (Interior Point Newton) and Fides terminate on the same criteria. Optim has three termination criteria;

1. $|f - f_{prev}| \leq f_{tol}*|f|$
2. $||x - x_{prev}|| ≤ x_{tol}$
3. $|| \nabla f || \leq g_{tol}$

And to match Optim and Fides I have for Fides set; 

~~~
options=py"{'maxiter' : 1000, 'fatol' : 0.0, 'frtol' : 1e-8, 
            'xtol' : 0.0, 'gatol' : 1e-6, 'grtol' : 1e-6}"o)
~~~

and for Optim set;

~~~
options=Optim.Options(iterations = 1000, show_trace = false, allow_f_increases=true, 
                      successive_f_tol = 3, f_tol=1e-8, g_tol=1e-6, x_tol=0.0)
~~~

As Ipopt terminates based on [different criteria](https://coin-or.github.io/Ipopt/OPTIONS.html) I set the tolerance and acceptable tolerance to 1e-8. 

### Changing parameter estimation options

When running the parameter estimation you can choose ODE-solver, from a list of algorithms, and ODE-solver tolerances.

Consider the call to the **Boehm** model;

```
algsTest = [:IpoptAutoHess, :IpoptBlockAutoDiff, :IpoptLBFGS, :OptimIPNewtonAutoHess, :OptimIPNewtonBlockAutoDiff, :OptimLBFGS, :FidesAutoHess, :FidesBlockAutoHess]
    
# This is just for setting up the model
dirModel = pwd() * "/Intermediate/PeTab_models/model_Boehm_JProteomeRes2014/"
peTabModel = setUpPeTabModel("model_Boehm_JProteomeRes2014", dirModel)

tol = 1e-9 # Rel- and Abs-tol for ODE solver
benchmarkParameterEstimation(peTabModel, QNDF(), "QNDF", tol, 1000, algList=algsTest)

```

Here `QNDF()` is the ODE solver. Basically any Julia ODE solver can be used. So instead writing `Rodas5()` uses Rodas5 (if you change ODE-solver also change the string argument in the call to get everything correct in the result file). 

algsTest is a list with optimization algorithms. Supported algorithms are;

| Julia Syntax      | Description |
| ----------- | ----------- |
| :IpoptAutoHess      | Ipopt using full hessian (via autodiff)|
| :IpoptBlockAutoDiff   | Ipopt using block approximated hessian (via autodiff)        |
| :IpoptLBFGS   | Ipopt using L-BFGS hessian approximation        |
| :OptimIPNewtonAutoHess   | Optim.jl interior point Newton full hessian (via autodiff)   |
| :OptimIPNewtonBlockAutoDiff   | Optim.jl interior point Newton via bloack approximated hessian (via autodiff)        |
| :OptimLBFGS   | Optim.jl L-BFGS method|
| :FidesAutoHess      | Fides using full hessian (via autodiff)|
| :FidesBlockAutoHess   | Fides using block approximated hessian (via autodiff)        |
# Load required libraries for Bayesian modeling and analysis
library(R2WinBUGS)   # Interface to WinBUGS, run BUGS models from R
library(coda)        # MCMC output processing and diagnostics
library(loo)         # Approximate leave-one-out cross-validation

# Set working directory to the folder containing data and model files
setwd('C:/Users')

# File paths for data, initial values, and model specification
dataFile <- "CF_intersection_2020_group.txt"
initFile <- "Grouped_RPP_Lindley_Spatial_Effects_Inits.txt"
modelFile <- "Grouped_RPP_Lindley_Spatial_Effects.txt"

######### Input Data ##########

# Read the data file line by line and parse into a named list for WinBUGS
dataList <- list()
lines <- readLines(dataFile)
for(line in lines){
  # Remove all spaces for consistent parsing
  line <- gsub(" ", "", line)
  # Split into variable name and value by '='
  parts <- strsplit(line, "=")[[1]]
  if(length(parts) == 2){
    var <- parts[1]
    val <- parts[2]
    # Remove trailing semicolons and commas
    val <- gsub(";", "", val)
    val <- gsub(",+$", "", val)
    # If the value is a vector (c(...)), convert to numeric vector
    if(grepl("^c\\(", val)){
      nums <- gsub("^c\\(|\\)$", "", val)
      num_vec <- as.numeric(unlist(strsplit(nums, ",")))
      dataList[[var]] <- num_vec
    } else {
      # Otherwise, treat as a single numeric value
      dataList[[var]] <- as.numeric(val)
    }
  }
}
# Add the number of observations (length of the Crashes vector)
dataList$N <- as.numeric(length(dataList$Crashes))
# Display the structure of the data list
str(dataList)

######### Input Initial Values ##########

# Read the initial values file as text and evaluate into a list
initText <- paste(readLines(initFile), collapse = "\n")
# The init file should define a list structure compatible with WinBUGS
initsList <- list(eval(parse(text = initText)))
# Display the structure of the Initial Values
str(initsList)

########## Run the WinBUGS Model ##########

# Specify the parameters to monitor in the MCMC sampling
params <- c("b", "mu", "log_lik", "MAE", "MSE")

fit <- bugs(
  data = dataList,
  inits = initsList,
  parameters.to.save = params,
  model.file = modelFile,
  n.chains = 1,
  n.iter = 3000,
  n.burnin = 1000,
  n.thin = 2,
  DIC = TRUE,
  bugs.directory = "C:/Users/Lei Han/Desktop/WinBUGS14", # Adjust this path to your WinBUGS installation directory
  codaPkg = TRUE,
  debug = FALSE
)

########## Post-Processing ##########

# Read MCMC samples from CODA output files
coda_samples <- mcmc.list(lapply(fit, read.coda, 
                                 index.file = gsub("coda[0-9]+\\.txt", "codaIndex.txt", fit[1])))

# Convert the mcmc.list to a matrix and select log_lik columns for model comparison
log_lik_samples <- as.matrix(coda_samples[, grep("^log_lik", colnames(coda_samples[[1]]))])

########## Compute Model Comparison Metrics ##########

# Compute the Watanabe–Akaike Information Criterion (WAIC)
waic_result <- waic(log_lik_samples)
cat("WAIC:", waic_result$estimates["waic", "Estimate"], "\n")

# Compute the approximate Leave-One-Out Information Criterion (LOOIC)
loo_result <- loo(log_lik_samples)
cat("LOOIC:", loo_result$estimates["looic", "Estimate"], "\n")
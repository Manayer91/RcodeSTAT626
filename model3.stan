
data {
  int<lower=0> N;
  vector[N] y;
  vector[N] x;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real alpha;
  real beta;
  real<lower=0.5, upper=1> gamma;
  real<lower=0> sigma;
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  alpha ~ normal(0,1e6);
  beta ~ normal(0,1e6);
  gamma ~ uniform(0.5,1);
  for(i in 1:N)
    y[i] ~ normal(alpha-beta*pow(gamma,x[i]), sigma);
}


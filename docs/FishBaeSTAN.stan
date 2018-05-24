//STAN Model for Salmon-Lobster
// still needs to be updated with Salmon-Lobster Data
//see https://datascienceplus.com/bayesian-regression-with-stan-part-1-normal-regression/

/*
*Simple normal regression example
*/

data {
  int N; //the number of observations
  int N2; //the size of the new_X matrix, rather than in a Poisson we'd see count (C) here
  int K; //the number of columns in the model matrix
  real y[N]; //the response, catches
  matrix[N,K] X; //the model matrix
}
parameters {
  vector[K] beta; //the regression parameters
  real<lower = 0> sigma; //the standard deviation, setting bounds on sigma with 0>
}
transformed parameters {
  vector[N] linpred; #linpred is predicted y value, should be predicted catch
  linpred = X*beta;
}
model {  
  beta[1] ~ normal(0,10); //prior for the intercept following Gelman 2008 - maybe change to normal prior?? - normal is a prior, starting at 0 with a SD of 10. Priors shouldn't be coming into play here. We likely don't need this. But is nice practice.

  for(i in 2:K)
   beta[i] ~ normal(0,2.5);//prior for the slopes following Gelman 2008 - maybe change to normal prior?
  
  y ~ normal(linpred,sigma);
  
  sigma ~ cauchy(0, 2.5);
}
generated quantities {
  vector[N] y_post_pred;
  
  for (i in 1:N){
  y_post_pred[i] = normal_rng(linpred[i],sigma); //the y values predicted by the model
  }
}


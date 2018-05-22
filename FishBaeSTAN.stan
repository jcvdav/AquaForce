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
  real y[N]; //the response
  matrix[N,K] X; //the model matrix
  matrix[N2,K] new_X; //the matrix for the predicted values
}
parameters {
  vector[K] beta; //the regression parameters
  real sigma; //the standard deviation
}
transformed parameters {
  vector[N] linpred;
  linpred = X*beta;
}
model {  
  beta[1] ~ cauchy(0,10); //prior for the intercept following Gelman 2008 - maybe change to normal prior??

  for(i in 2:K)
   beta[i] ~ cauchy(0,2.5);//prior for the slopes following Gelman 2008 - maybe change to normal prior?
  
  y ~ normal(linpred,sigma);
}
generated quantities {
  vector[N2] y_pred;
  y_pred = new_X*beta; //the y values predicted by the model
}


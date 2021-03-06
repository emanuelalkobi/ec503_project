# ec503_project

### Abstract 
 The study focuses on different instances of the Expected Maximization (EM) algorithm for incomplete or missing data or data with latent variables model. We analyze the EM algorithm under the paradigm of clustering. Here, we've implemented the EM algorithm for the Gaussian Mixture Models (GMM) and the Bernoulli Mixture Models (BMM). We also report the effects of various initialization techniques using: completely random parameters; random data points; and estimates from k-means clustering algorithm, which was itself initialized via k-means++, on the iterations of convergence and the output accuracy of the EM algorithm. We also provide a motivation for using EM for clustering over k-means by comparing the algorithms' performance on a GMM with three overlapping Gaussian in a complicated fashion (\textbf{Figure 1}). Lastly, we explore how EM helps mitigate the affects of missing data and analyze the output accuracy as a function of the ratio missing points and the observed points.



### How to run the code?

## EM

All the code regard the EM algorithm with different initializations.

You don't have to download any dataset. zoo dataset we are using is already contained in the folder.

Three main .m files can be run and get exactly the same result in the report.

EM_oldfalthful.m : Apply EM on synthetic dataset which is 2 2d gaussian.

EM_3_GMM.m : Apply EM on synthetic dataset which is 3 overlapping 2d  gaussian.

EM_zoo.m : Apply EM on synthetic dataset which has 16 features and 7 classes.

You can change parameter 'ML' to 'MAP' in EM_zoo.m and EM_3_GMM.m to get ML estimation or MAP estimation.

axuliary files: e-step.m: implement E step

m-step.m: implement E step

EM.m: implement EM algorithm.

plot_figure.m: plot soft assignemnt and ellipse

initialization.m : different initalization methods.


## EM_BMM

EM algorithm for BMM model with mnist data set with different initializations.
Before run the code download the MNIST dataset  which contains all the MNIST training and the test labels to the same directory.
To run this code just run EM_BMM_MNIST_demo.m and it will execute all the relevant results.
It automatically loads, initializes and  plots the EM_BMM on the MNIST dataset for k = 10 and plots the number of iterations to convergence and the time to run the code.

## EM_missing

All the code regard the EM algoritm that can handled missing data.
Run EM_gmm.m to generate the CCR values for different initialization types with 0.3  missinng data ratio. 
Run em_graph.m to generate the plot of CCR as function of missing data ratio  


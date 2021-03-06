%% EC 503: Learning from Data                                            %% 
%% Boston University                                                     %%  
%% Fall 2018, ProjectAXE                                                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function  : EM algorithms                                               %
% Inputs    : x_data- n*d matrix .n-number of samples , d-dimension       %
%             of samples                                                  %
%             K          - Number of different classes.                   %
%             method     - The way to initialize the parameters:          %
%             random     -Choose completly random values for the mean of  %
%             clasess.                                                    %
%             data_random-Choose K random points from X_data to be the    %
%             initial mean of clasess.                                    %
%             k_means-Use k means algorith for initial all the output     %
%             parameters.                                                 %
%             iter-number of iterations to run the EM algorith            % 
%             diff-the difference between 2 consecutive iterations than   %
%             is  less than diff value  will stop the EM algorithm   
%             estimate    - MLEstimate or MAP estimate of parameters
%             visual      -at which iteration, we visualize how data were
%                          clustered 
% Outputs   :                                                             %
%             y_predicted-n*1 vector.It is the predicted  labels for      %
% Variable Naming Convention: (var)_(property); pt--point, C--cluster     %
%                                                                         %
%                                                                         %  

function [out,y_predicted] = EM(x_data,K,method,iters,diff,estimate,visual)

    if nargin == 6
      	visual=0;
        out=0;
    end


    %initialization
    %number of dimension for each data point 
    [n,d]=size(x_data);
    
    [pi,mu,sigma]=initialization(x_data,K,method);

    %%
    obj_fun=0;

    for iter=1:iters
        if ismember(iter,visual)
            if iter==1
             out=plot_figure(x_data,iter,visual,mu,sigma,zeros(n,K));
            else
             out=plot_figure(x_data,iter,visual,mu,sigma,r);
            end
        end
        
        % E-step
        r=e_step(x_data,K,pi,mu,sigma);
        % M-step
        [pi,mu,sigma]=m_step(x_data,K,r,estimate);
        [~,predicted]=max(r,[],2);
        obj_fun(iter+1)=sum(log(mvnpdf(x_data,mu(predicted,:),sigma(:,:,predicted)))); 


        if abs((obj_fun(iter+1)-obj_fun(iter))/obj_fun(iter+1))<diff || iter==iters
            fprintf('Optimization converged after %d iterations .\n',iter);
            break
        end        
    end
    [~,y_predicted]=max(r,[],2);
end


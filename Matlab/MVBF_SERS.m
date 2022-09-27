%% SERS MVBF result

clc
clear all
close all

load('C:\Users\sypark\Desktop\Projects\w_MinSeok\1SERSNet\cdcl2\sers_785.mat')

C0 = cast(struct2array(C0), 'double');
C1 = cast(struct2array(C1), 'double');
C2 = cast(struct2array(C2), 'double');
C3 = cast(struct2array(C3), 'double');
C4 = cast(struct2array(C4), 'double');
C5 = cast(struct2array(C5), 'double');
C6 = cast(struct2array(C6), 'double');
C7 = cast(struct2array(C7), 'double');
C8 = cast(struct2array(C8), 'double');
C9 = cast(struct2array(C9), 'double');
X1 = cast(struct2array(X1), 'double');
X2 = cast(struct2array(X2), 'double');
X3 = cast(struct2array(X3), 'double');
X4 = cast(struct2array(X4), 'double');
X5 = cast(struct2array(X5), 'double');

data_all = {C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, X1, X2, X3, X4, X5};
MV_all = {};
sub_arr_L = 1; % sub-aperture averaging window size (spatial averaging)


for c = 1:15
    data = data_all{c};
    max_data = max(abs(data(:)));
    data = data./max_data;
    MV_all{c} = max_data*gather(min_var_BF_single(data,sub_arr_L));
    data = data*max_data;
    mean_all{c} = mean(data);
end

save('C:\Users\sypark\Desktop\Projects\w_MinSeok\1SERSNet\cdcl2\sers_785_MVBF.mat', 'MV_all')
save('C:\Users\sypark\Desktop\Projects\w_MinSeok\1SERSNet\cdcl2\sers_785_mean.mat', 'mean_all')

% data = C3;
% 
% 
% 
% data = data*max_data;
% mean_data = mean(data);
% 
% mean_var = sum(var((data-repmat(mean_data,size(data,1),1))'));
% mv_var = sum(var((data-repmat(MV_data,size(data,1),1))'));
% [mean_var, mv_var]
% 
% mean_var = sum(var((data-repmat(mean_data,size(data,1),1))));
% mv_var = sum(var((data-repmat(MV_data,size(data,1),1))));
% [mean_var, mv_var]

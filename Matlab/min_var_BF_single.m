function bf_data = min_var_BF_single(focus_data,sub_arr_L)

N_ch     = size(focus_data,1);
depth       = size(focus_data,2);
% depth =1
% focus_data = focus_data - repmat(mean(focus_data),[N_ch,1]);

% sub_arr_L = 12;
N_weight = sub_arr_L; 
num_sub_arr = N_ch-sub_arr_L+1;

a           = ones(N_weight,1);
bf_data     = zeros(1,depth);
delta       = 1/N_weight;

for i = 1: depth
    ch      = focus_data(:,i);
    
    R = zeros(N_weight,N_weight);
    for apo_m = 1:num_sub_arr
      R = R + ch(apo_m:apo_m+N_weight-1)*ch(apo_m:apo_m+N_weight-1)';        
    end
    R       = R/num_sub_arr;
    R = R + (delta*trace(R)*eye(N_weight));
    
    R_inv   = inv(R);
    w       = (R_inv * a) ./ (a' * R_inv * a);

    bf_data(1,i) = CalculateV(ch,w,N_weight,num_sub_arr);
    
end
bf_data(isnan(bf_data))=0;
end
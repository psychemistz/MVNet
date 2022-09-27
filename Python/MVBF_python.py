import numpy as np
from scipy.io import loadmat

## testing on small-data
# filepath = 'MVBF_python\\sample_mvbf_data.mat'
# mvbf_in = loadmat(filepath)['mvbf_in']
# mvbf_out = loadmat(filepath)['mvbf_out']


## testing on full-data
filepath = 'data\\MVBF_dataset.mat'
mvbf_in = loadmat(filepath)['input_data']
mvbf_out = loadmat(filepath)['target_data']

sub_arr_L = 10

# focus_data = np.transpose(mvbf_in)

def CalculateV(ch,w,N_weight,num_sub_arr):
    v = 0
    for apo_m in range(0,num_sub_arr):
        v = v +  np.matmul(w.transpose(),ch[apo_m:apo_m+N_weight].reshape(sub_arr_L,1))
    return v/num_sub_arr

def MVsum(focus_data,sub_arr_L):
    N_ch = focus_data.shape[0] # number of models
    depth = focus_data.shape[1] # number of weights

    N_weight = sub_arr_L # size of sub-apperture (sub-set where MV will be calculated)
    num_sub_arr = N_ch - sub_arr_L + 1 # number of sub-apperture (sub-set where MV will be calculated)

    a = np.ones(N_weight).reshape(N_weight,1) # identity matrix for diagonal loading
    bf_data = [] # MV-sum output
    delta = 1 / N_weight  # scaling for to take the mean for traced sum of R

    for i in range(0,depth):
        ch = focus_data[:, i] # vector containing N-number of model's data for i-th weight
        R = np.zeros((N_weight, N_weight)) # covariance matrix place holder

        # Performing sub-array (temporal averaging) for noise-free estimate of R
        for apo_m in range(0,num_sub_arr):
            R = R + np.matmul(ch[apo_m:apo_m + N_weight].reshape(sub_arr_L,1),ch[apo_m: apo_m + N_weight].reshape(1,sub_arr_L))
        R = R / num_sub_arr

        # To avoid NAN during inversion of R, we use diagonal loading
        R = R + delta * np.trace(R) * np.eye(N_weight)

        R_inv = np.linalg.inv(R) # Taking multiplicative inverse

        # Esimating MV contributation factor (w) wieghts for each model' parameter [for weighted sum]
        w = np.matmul(R_inv,a)/ np.matmul(np.matmul(a.transpose(),R_inv),a)

        # calculating weighted sum of model's parameter
        bf_data.append(CalculateV(ch, w, N_weight, num_sub_arr))

    bf_data = np.asarray(bf_data).reshape(1, depth)
    return np.nan_to_num(bf_data)

my_mvbf_out = MVsum(np.transpose(mvbf_in),sub_arr_L)
imp_error = 10*np.log10(np.mean(np.square(my_mvbf_out-mvbf_out.transpose())))
print('Error in MATLAB and python implementation of MVBF:',imp_error,'(dB)')


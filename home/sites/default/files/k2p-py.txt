#!/usr/bin/env python
from __future__ import print_function
from scipy import optimize
from math import log, exp
import logging
import random
import sys
import os

_LOG = logging.getLogger(__file__)
def configure_logger():
    if 'DEBUG' in os.environ:
        lvl = logging.DEBUG
    else:
        lvl = logging.INFO
    _LOG.setLevel(lvl)
    _LOG.addHandler(logging.StreamHandler())
configure_logger()

# DATA will be constant, global tuple of data values:
#   number of sites with same base in both seqs
#   number of sites that differ by a transition
#   number of sites that differ by a tranversion
# it is created before we call any of the functions.
DATA = None

# if USE_KAPPA_NU is True then the parameters are [kappa, nu]
#   otherwise they are [delta, psi]
# here we set it based on whether or not 'KAPPA' is a variable
#   in our environment when we run the script.
USE_KAPPA_NU = 'KAPPA' in os.environ

WORST_LN_L = float('-inf')
def ln_likelihood(parameters, data):
    '''Here we need to calculate the log likelihood for
    any valid point in parameters space.
    '''
    n_same, n_ti, n_tv = data
    #_LOG.debug('ln_likelihood({p})'.format(p=parameters))
    if USE_KAPPA_NU:
        kappa, nu = parameters
        if kappa < 0.0 or nu < 0.0:
            return WORST_LN_L # avoid out of range parameters
        two_p_k = 2.0 + kappa
        a = exp(-4.0 * nu / two_p_k)
        b = exp(-(2.0 + 2 * kappa) * nu / two_p_k)
        p_same = 0.25 * (1 + a + 2*b)
        p_ti = 0.25 * (1 + a - 2*b)
        p_tv = 0.25 * (1 - a)
    else:
        delta, psi = parameters
        if delta < 0.0 or psi < 0.0 or delta > 0.75 or psi > 1.0:
            return WORST_LN_L # avoid out of range parameters
        p_same = (1.0 - delta)
        p_ti = delta * psi 
        p_tv = delta * (1.0 - psi) / 2.0
    #_LOG.debug('  datum probs ({}, {}, {})'.format(p_same, p_ti, p_tv))
    ln_l = n_same * log(p_same)
    ln_l += n_ti * log(p_ti)
    ln_l += n_tv * log(p_tv)
    return ln_l

def estimate_global_MLE():
    global DATA
    # our optimizer needs some starting parameter values, so lets
    #       generate some reasonable guesses.
    n_same, n_ti, n_tv = DATA
    n = sum(DATA)
    if USE_KAPPA_NU:
        init_kappa = float(1 + n_ti) / (2 + n_tv)
        init_nu = float(n - n_same) / n
        params0 = [init_kappa, init_nu]
    else:
        init_delta = min(0.75, float(n - n_same)/n)
        init_psi = float(1 + n_ti) / float(2 + n_ti + n_tv)
        params0 = [init_delta, init_psi]
    # Now we call the optimizer. It will minimize the function passed in
    #   so we pass in a simple "adaptor" function that negates the lnL
    #   so that we maximize the lnL by minimizing -lnL
    param_opt = optimize.fmin(scipy_ln_likelihood, params0, xtol=1e-8, disp=False)
    return param_opt, -scipy_ln_likelihood(param_opt)

def scipy_ln_likelihood(parameters):
    '''This is our simple adaptor to make a minimizer maximize.'''
    global DATA
    negLnL = -ln_likelihood(parameters, DATA)
    _LOG.debug('ln_likelihood({p}) = {l}'.format(p=parameters, l=-negLnL))
    return negLnL

def main(data_set):
    global DATA
    DATA = tuple(data_set)
    mles, lnL = estimate_global_MLE()
    print('The max lnL =    {l:12.6f}'.format(l=lnL))
    if USE_KAPPA_NU:
        kappa_hat, nu_hat = mles
        print('  MLE of kappa = {:12.6f}'.format(kappa_hat))
        print('  MLE of nu =    {:12.6f}'.format(nu_hat))        
    else:
        delta_hat, psi_hat = mles
        print('  MLE of delta = {:12.6f}'.format(delta_hat))
        print('  MLE of psi =   {:12.6f}'.format(psi_hat))        


if __name__ == '__main__':
    # user-interface and sanity checking...
    try:
        num_same = int(sys.argv[1])
        assert num_same >= 0
        num_ti = int(sys.argv[2])
        assert num_ti >= 0
        num_tv = int(sys.argv[3])
        assert num_tv >= 0
        
    except:
        sys.exit('Expecting 3 arguments: num_same, num_ti, and num_tv\n')
    # Here is where we fill in the global DATA tuple:
    data_set = (num_same, num_ti, num_tv)
    main(data_set)
classdef CuttingPlane < handle & featpipem.classification.svm.LinearSvm
    %CUTTINGPLANE Train an SVM classifier using MATLAB cutting plane method
    
    properties
        % svm parameters
        c            % SVM C parameter
        bias_mul     % SVM bias multiplier
    end
    
    methods
        function obj = CuttingPlane(varargin)
            opts.c = 10;
            opts.bias_mul = 1;
            [opts, varargin] =  vl_argparse(opts, varargin);
            obj.c = opts.c;
            obj.bias_mul = opts.bias_mul;
            
            % load in the model if provided
            modelstore.model = [];
            vl_argparse(modelstore, varargin);
            obj.model = modelstore.model;
        end
        train(obj, input, labels)
        [est_label, scoremat] = test(obj, input)
        WMat = getWMat(obj)
        
    end
    
end


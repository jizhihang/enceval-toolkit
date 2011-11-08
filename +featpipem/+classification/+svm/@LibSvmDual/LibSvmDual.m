classdef LibSvmDual < handle & featpipem.classification.svm.GenericSvm
    %LIBSVMDUAL Train an SVM classifier using the LIBSVM library
    %   in the dual formulation (pre-computing the kernel matrix)
    
    properties
        % svm parameters
        c            % SVM C parameter
        bias_mul     % SVM bias multiplier
    end
    
    properties(SetAccess=protected)
        modelIsWVect
    end
    
    methods
        function obj = LibSvmDual(varargin)            
            obj.c = 10;
            obj.bias_mul = 1;
            featpipem.utility.set_class_properties(obj, varargin);
            
            obj.model = [];
            obj.modelIsWVect = false;
        end
        function set_model(obj, model)
            obj.model = model;
            obj.modelIsWVect = ~iscell(obj.model);
        end
        function model = get_model(obj)
            model = obj.model;
        end
        train(obj, input, labels, chunk_files, index_offset)
        [est_label, scoremat] = test(obj, input)
        
    end
    
end


clc;
clear all;
close all;
warning off;

g = alexnet;
layers = g.Layers;

allImages = imageDatastore('Database', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

augmentor = imageDataAugmenter('RandRotation', [-10, 10], 'RandXTranslation', [-5, 5], 'RandYTranslation', [-5, 5]);
augmentedImages = augmentedImageDatastore([227 227], allImages, 'DataAugmentation', augmentor);

numClasses = numel(unique(allImages.Labels));

layers(23) = fullyConnectedLayer(numClasses); 
layers(24) = softmaxLayer;                    
layers(25) = classificationLayer;              

opts = trainingOptions('sgdm', ...
    'InitialLearnRate', 0.001, ...
    'MaxEpochs', 20, ...
    'MiniBatchSize', 64, ...
    'ValidationFrequency', 30, ...
    'ValidationPatience', 5, ...
    'Plots', 'training-progress', ...
    'Shuffle', 'every-epoch', ...
    'ExecutionEnvironment', 'auto'); 

[myNet1, info] = trainNetwork(augmentedImages, layers, opts);

save('myNet1.mat', 'myNet1');
disp('Model training completed and saved.');

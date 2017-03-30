%clear screen
clc

%Input
prompt = 'Number of training rows:';
trainingRows = input(prompt);

prompt = 'Number of Vocabulary features:';
vocabSize = input(prompt);

%Create Vocabulary
vocabularyDir = './vocab/';
[vocab] = Vocabulary(vocabularyDir, trainingRows, vocabSize);
disp('Successfully created Vocabulary');

%Vector quantization
trainDir = './train/';
disp('Quantizing training set');
[quantizedData,labels] = Quantize(trainDir, vocab);

%Train SVM
disp('Training SVM Model');
SVMModel = fitcecoc(quantizedData,labels);

%Save SVM Model
disp('Saving Model as TrainedSVMModel.mat');
save('TrainedSVMModel.mat','SVMModel'); %saves a trained model for future use

%Test SVM
disp('Testing SVM Model');
testDir = './test';
[quantizedTestData,testLabels] = Quantize(testDir, vocab);

[label, score] = predict(SVMModel, quantizedTestData);

%results, 1 == correct prediction, 0 == incorrect predictions
results= [];
disp('Results:');
disp('1 == correct prediction, 0 == incorrect prediction');
for i= 1: length(testLabels)
   results = [results;isequal(label(i), testLabels(i))];         
end
[results]









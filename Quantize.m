function [quantizedData, labels] = Quantize(Dir, centroids)

trainDir = dir(Dir);
subDir = [trainDir(:).isdir];
wordDir ={trainDir(subDir).name}';
wordDir(ismember(wordDir,{'.','..'})) = [];
numberOfWords = length(wordDir);
quantizedData = [];
labels = [];


for i=1: numberOfWords
    
    word = wordDir(i);
    dataFiles = fullfile(Dir, word, '*.txt');
    files = dir(dataFiles{1});
    
    numberOfFiles = length(files);
    
    for j=1 : numberOfFiles
        
        path = fullfile(Dir, word);
        eachFilePath = fullfile(path, files(j).name);
        
        trajectories = dlmread(eachFilePath{1});
        fileData = trajectories(1:end, 1:30);
        disp(strcat('Trajectory Quantization of ', files(j).name));
        
        quantizedVector = zeros(1, size(centroids, 1));
        for k = 1:size(fileData,1)
            trajectory = fileData(k,:);
            [~, index] = min(pdist2(centroids, trajectory)); %get index of best matched centroid to specified trajectory, uses euclidean distance for comparison
            quantizedVector(index) = quantizedVector(index)+1; %increment the centroid match histogram by 1
        end
        
        labels = [labels;word];
        quantizedData = [quantizedData;quantizedVector];
        
    end
    
end

end
%descriptuion

function [vocab] = Vocabulary(Dir, rows, size)
disp('Creating Vocabulary');
files = dir(strcat(Dir,'*.txt')); %change to / if on unix OS
numberofFiles = length(files);
entireData= []; %all the data files combined
disp('Reading files...');

for i=1:numberofFiles
    path = fullfile(Dir, files(i).name);
    trajectories = dlmread(path);
    fileData =  trajectories(1:end, 1:30); %uses all rows, and first 30 columns for each data file
    entireData = [entireData; fileData];%concatenates each data file into one data file    
end

%Randomly selecting trajectories for clustering
selectedTrajectories = datasample(entireData, rows);



%cluster trajectories using kmeans algorithm
disp('clustering');
[~,vocab] = kmeans(selectedTrajectories, size);

end
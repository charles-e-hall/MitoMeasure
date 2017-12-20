function analyzeMitoData
path = uigetdir;
fileList = dir(path);
fileList = {fileList.name};
cd(path);

mitoLengths = [];

for i=1:numel(fileList)
    if strfind(fileList{i}, 'mat')
        name = load(fileList{i});
        fileBase = strsplit(fileList{i}, '.mat');
        if name.(fileBase{1}).data.reviewed
            for j=1:numel(name.(fileBase{1}).review.manual)
                lengths = calcMitoLengths(cell2mat(name.(fileBase{1}).review.manual(1,j)));
                mitoLengths = [mitoLengths lengths];
            end
            
        else
            disp([fileList{i} ' has not been reviewed'])
        end
    end
end

figure;hist(mitoLengths);

function length = calcMitoLengths(data)
length = sqrt((data(2,1) - data(1,1))^2 + (data(2,2) - data(1,2))^2);
for t=3:size(data,1)
    length = length + sqrt((data(t,1) - data(t-1,1))^2 + (data(t,2) - data(t-1,2))^2);
end
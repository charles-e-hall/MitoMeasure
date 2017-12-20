function [names,psd,beta] = psd_batch_analysis

path = uigetdir;

directory = dir(path);

fileList = {directory.name};

ft = fittype('exp1');

names = [];
psd = [];
beta = [];

for i=1:numel(fileList)
    if ~isempty(strfind(fileList{i}, '.tif')) && isempty(strfind(fileList{i}, 'Experiment'))
        filename = [path '/' char(fileList{i})];
        I = imread(filename);
        
        names = [names char(fileList{i})];
        power = 10*log10(abs(fftshift(fft2(I(:,:,1)))).^2);
%         power = abs(fftshift(fft2(I(:,:,1)))).^2;
        temp = diag(power);
        psd(:,i) = temp(513:end);
        x = transpose([0:49]./22.6);
        cf = fit(x, temp(513:562), ft);
        beta = [beta cf.b];
    end
end

        
function calcMitochondria

global state

%Read tif image
state.image.raw = imread(state.filename);

%Isolate mitochondria from rest of image
if state.channel.red
    state.image.mito = state.image.raw(:,:,1);
elseif state.channel.green
    state.image.mito = state.image.raw(:,:,2);
elseif state.channel.blue
    state.image.mito = state.image.raw(:,:,3);
else
    warning('Error in selecting mitochondria channel');
    return
end

%Threshold the image to remove background intensity
if state.thresh.auto
    thresholdMitochondria;
else
    manualMitochondria;
    
end

if ~state.decon.none
    blindDeconvolution;
end

state.image.edge = edge(state.image.mitoThresh,'Sobel');
state.image.filled = imfill(state.image.edge,'holes');
state.image.mitochondria = state.image.filled - state.image.edge;

state.image.mitochondria = im2bw(state.image.mitochondria);

state.data.regionprops = regionprops('table',state.image.mitochondria,'Centroid','MajorAxisLength','MinorAxisLength');

figure;
ax1 = subplot(2,2,1);imshow(state.image.raw);
title('Raw Image');
ax2 = subplot(2,2,2);imshow(state.image.mito);
title('Mitochondria');
ax3 = subplot(2,2,3);imshow(state.image.mitoThresh, [0 255]);
title('Thresholded Mitochondria');
ax4 = subplot(2,2,4);imshow(state.image.mitochondria);
hold on;
contour(state.image.mitochondria,[0.5,0.5],'r');
title('Automatically Identified Mitochondria');
linkaxes([ax1 ax2 ax3 ax4], 'xy');

if ~state.data.suppress
    singleImageDataAnalysis;
end
state.saveDirectory = state.path;
if state.data.save
    %savename = [state.path state.baseName '_' num2str(state.counter)];
    savename = char([char(state.baseName), '_Analyzed']);
    evalc([savename, '= state']);
    cd(state.saveDirectory);
    save(savename, savename);
end
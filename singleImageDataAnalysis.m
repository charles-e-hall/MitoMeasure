function singleImageDataAnalysis

global state

state.data.ratio = state.data.regionprops.MajorAxisLength ./ state.data.regionprops.MinorAxisLength;

figure;subplot(1,2,1);scatter(state.data.regionprops.MinorAxisLength,state.data.regionprops.MajorAxisLength);
title('Scatter Plot of Mitochondrial Dimensions');
xlabel('Minor Axis Length');
ylabel('Major Axis Length');
subplot(1,2,2);hist(state.data.ratio,20);
title('Histogram of Ratio of Mitochondrial Length to Width');
xlabel('Ratio of Mitochondrial Length to Width');
ylabel('Number of Mitochondria');

function thresholdMitochondria

global state

state.image.thresholdLevel = round(255*graythresh(state.image.mito));

state.image.mitoThresh = zeros(size(state.image.mito));

for i=1:size(state.image.mito,1)
    for j = 1:size(state.image.mito,2)
        if state.image.mito(i,j) > state.image.thresholdLevel
            state.image.mitoThresh(i,j) = state.image.mito(i,j);
        end
    end
end


function sig = renderSigmoid(image_data,hill,center,image_flag)



switch image_flag
    case 0
        for i=1:size(image_data,1)
            for j=1:size(image_data,2)
                sig(i,j) = 1/(1+exp(-(image_data(i,j)-center)*hill));
            end
        end
        
    case 1
        image_data = 255*im2double(image_data);
        for i=1:size(image_data,1)
            for j = 1:size(image_data,2)
                sig(i,j) = 255*(1/(1+exp(-(image_data(i,j)-center)*hill)));
            end
        end
end

clc; close all; clear;
c = webcam;
load myNet1; 
faceDetector = vision.CascadeObjectDetector; 
figure; 

while true
    try
        e = c.snapshot;

        bboxes = step(faceDetector, e);

        if ~isempty(bboxes)
            for i = 1:size(bboxes, 1)
                es = imcrop(e, bboxes(i, :));
                es = imresize(es, [227 227]);

                label = classify(myNet1, es);

                e = insertObjectAnnotation(e, 'rectangle', bboxes(i, :), char(label), ...
                                           'Color', 'red', 'FontSize', 14);
            end
        else
            e = insertText(e, [10 10], 'No Face Detected', ...
                           'FontSize', 20, 'BoxColor', 'yellow', 'BoxOpacity', 0.6);
        end

        imshow(e);
        title('Real-Time Face Detection and Classification');
        drawnow;

    catch ME
        disp('Error occurred:');
        disp(ME.message);
        break; 
    end
end
clear c; 
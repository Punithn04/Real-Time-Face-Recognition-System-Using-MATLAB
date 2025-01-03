clc;
clear all;
close all;
warning off;

try
    cao = webcam;  
catch
    error('Webcam not detected. Please connect a webcam and try again.');
end

faceDetector = vision.CascadeObjectDetector;
c = 150; 
temp = 0;  

outputFolder = 'Ramana';  
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

baseFilename = 'face_image_';  

while true
    e = cao.snapshot;

    bboxes = step(faceDetector, e);

    if ~isempty(bboxes)
        if temp >= c
            break;  
        else
            for i = 1:size(bboxes, 1)
             
                es = imcrop(e, bboxes(i, :));
                if size(es, 1) > 50 && size(es, 2) > 50 
                    es = imresize(es, [227 227]);

                    filename = fullfile(outputFolder, strcat(baseFilename, num2str(temp), '.bmp'));
                    imwrite(es, filename);
                    temp = temp + 1;

                    imshow(es);
                    title(['Captured Image: ' num2str(temp) ' / ' num2str(c)]);
                    drawnow;
                end
            end
        end
    else
     
        imshow(e);
        title('No face detected. Please position your face in front of the camera.');
        drawnow;
    end
    
    pause(0.1);
end

disp(['Captured ' num2str(temp) ' face images.']);

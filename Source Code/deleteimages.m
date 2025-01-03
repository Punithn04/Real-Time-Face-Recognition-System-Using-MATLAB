folderPath = 'C:\Users\kowsh\Documents\MATLAB\Project1\Sugesh\';  % Change this to your folder path
imageFiles = dir(fullfile(folderPath, '*.bmp'));  % Get all BMP files in the folder

faceDetector = vision.CascadeObjectDetector();

for k = 1:length(imageFiles)
    imagePath = fullfile(folderPath, imageFiles(k).name);
    
    img = imread(imagePath);
    
    bbox = step(faceDetector, img); 
    
    if isempty(bbox)
        delete(imagePath);
        fprintf('Deleted image: %s (no faces detected)\n', imageFiles(k).name);
    else
        fprintf('Found faces in image: %s\n', imageFiles(k).name);
    end
end

# Real-Time-Face-Recognition-System-using-MATLAB
Objective:  
The primary objective of this project is to develop a real-time face recognition 
system using deep learning techniques, specifically utilizing the AlexNet 
convolutional neural network (CNN). By fine-tuning the pre-trained AlexNet 
model on a custom dataset of face images, the system aims to classify and identify 
faces in real-time webcam video streams. The project seeks to integrate face 
detection and face classification into a seamless pipeline, where the system 
detects faces in the video frames, crops and resizes them, and classifies the faces 
with high accuracy using the trained model. The system should be capable of 
performing these tasks in real-time, ensuring quick and efficient face recognition. 
Another key objective is to create an interactive, user-friendly interface that can 
display real-time results, including bounding boxes around detected faces and their 
corresponding classification labels. The system will also handle cases where no 
faces are detected by displaying an appropriate message to the user. The project 
aims to demonstrate the practical application of deep learning in face recognition, 
targeting use cases such as security surveillance, access control, and attendance 
monitoring. Additionally, the system should be scalable and robust, capable of 
handling multiple faces simultaneously and performing classification with 
minimal latency. 


Description of work: 


This project involves the development of a real-time face recognition system that 
integrates computer vision and deep learning techniques to detect and classify 
faces using a webcam. The work is divided into several stages, each essential to 
building the functionality and efficiency of the system. 
1. Data Collection: 
o The first stage of the project involves capturing face images using a 
webcam. The images are stored in a specified directory, and the system 
processes them to detect faces using a Haar Cascade classifier. Each 
captured image is stored in its respective folder based on the identity 
(class) of the individual. 
 
2. Cleaning Dataset - Deleting Non-Face Images: 
o During the preprocessing phase, the system automatically detects faces 
in the stored images using the same Haar Cascade face detector. Any 
image in which no faces are detected is deleted to ensure that only valid, 
face-containing images are used for model training. This step is crucial 
to maintaining a clean and relevant dataset for the subsequent training 
of the classification model, as images without faces can introduce noise 
and negatively affect model performance.

3. Model Training: 
o After the dataset is cleaned, the project proceeds to model training. The 
pre-trained AlexNet model is fine-tuned to recognize faces from the 
custom dataset. The model's final layers are modified to match the 
number of classes (identities) in the dataset. The training is carried out 
using stochastic gradient descent with momentum (SGDM), and the 
model is trained to classify the faces accurately. Once trained, the 
model is saved for future use in the real-time recognition phase. 
 
4. Face Detection and Classification: 
o The real-time face recognition system operates by continuously 
capturing frames from the webcam. The system uses the Haar Cascade 
face detector to identify faces in each frame. When faces are detected, 
they are cropped and resized to 227x227 pixels, which is the input size 
expected by AlexNet. These resized images are then classified using 
the fine-tuned AlexNet model. The predicted labels for each detected 
face are displayed on the screen along with bounding boxes drawn 
around the faces. 
 
5. Real-Time User Interface and Display: 
o The system is designed with a real-time user interface that provides 
instant feedback to the user. For each frame, the detected faces are 
annotated with their predicted labels, and the bounding boxes are 
updated to highlight the faces in the webcam feed. If no faces are 
detected, the system displays the message "No Face Detected" on thescreen.
This user-friendly interface ensures that the face detection and 
classification results are visible in real-time.

6. System Evaluation and Optimization: 
o The final step involves evaluating the system's performance. The 
accuracy of the face detection and classification is tested under 
different conditions, including variations in lighting and facial angles. 
If required, optimization techniques like adjusting the learning rate, 
increasing training epochs, or applying data augmentation are 
employed to improve the model's accuracy and robustness. The system 
is evaluated for speed as well, ensuring real-time processing without 
significant lag.




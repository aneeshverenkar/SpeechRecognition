### Speech Recognition from Video (Lip Reading)

The most important means of communication between people is speech. Noisy environments or large distances between people make it hard to listen. However, lip motion can be captured via video from afar. This software can accurately identify words from a set of videos of the human mouth region recorded while the person is speaking an individual word. Some uses are intelligence gathering from video captured by aerial drones or dictation to siri in super noisy environments.

---

Steps to use:
1. Take a video of lip region (inclusion of surrounding face region not a problem) while speaking a word. (iphone 5,6 camera tested)
2. To obtain the trajectories of motion, use Dense Trajectories found at https://lear.inrialpes.fr/people/wang/dense_trajectories
3. Create three folders named ‘vocab’ , ‘train’, and ‘test’. These are your vocabulary, training and testing folders respectively.
4. In the train and test folders, create subfolders named such that they are the words that are spoken. Within these subfolders place the data (text) files corresponding to the words. Example: the folder named ‘water’ will contain the text files that correspond to that word.
5. In the ‘vocab’ folder, place at least one text file per word. No subfolders are needed here.
6. Inputs to the program via the console are the number of training rows and number of vocabulary features. Integers between 20,000 to 40,000 are recommended for training rows, and integers between 20 and 70 are recommended for vocabulary features.

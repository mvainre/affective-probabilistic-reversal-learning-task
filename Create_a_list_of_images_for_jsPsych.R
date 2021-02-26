##################################################################################################
                      
## Creating an array of IAPS images to be copied into the Affective Probabilistic Learning Task ##
                          ##   Written by Maris Vainre, 2020   ##

##################################################################################################

# This script creates a list of file paths that can be copied and pasted into JavaScript
# to avoid manually copying and pasting each file name separately

setwd("Your directory here") #set workdirectory ie the folder where your IAPS images are. 
#In may case it's a folder with 2 subfolders: one for negative, one for neutral images

#I had two sets of images: neutral and negative; I needed to keep them separate. I had the images in separate folders.
#First, go to the right subfolder and create a list of all the files that end with .jpg

ImgNeu <- list.files(path = "./Neutral", pattern = "jpg", all.files = TRUE,
                     full.names = FALSE, recursive = FALSE,
                     ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)

ImgNeg <- list.files(path = "./Negative", pattern = "jpg", all.files = TRUE,
                     full.names = FALSE, recursive = FALSE,
                     ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
#this should just read in the images and their extensions.


Neg <- paste("'img/IAPS/Negative/",ImgNeg, sep = "") #For jsPsych to find the images, they need to include the path, so I add the path to each of the image file name in the list I've just created.
Neg <- paste(Neg,"',", sep = "") #jsPsych also wants single quotes to be on each side and needs them to be separated by a comma, so I add that to the end of each file name
write.table(Neg, file = "Neg.txt", sep = ",", quote = FALSE,
            row.names = FALSE, col.names = FALSE) #create a file which contents can just be copied and pasted to JavaScript

#Repeat the same thing with neutral images
Neu <- paste("'img/IAPS/Neutral/",ImgNeu, sep = "")
Neu <- paste(Neu,"',", sep = "")
write.table(Neu, file = "Neu.txt", sep = ",", quote = FALSE,
            row.names = FALSE, col.names = FALSE)

# ------------------------------------------------------------------------------------
# Move (and later delete) duplicate photo or movie files
# ------------------------------------------------------------------------------------


# Load necessary packages
library(fs)
library(stringr)

# Designate the folder which contains the duplicate files
dupFolder <- "C:/Users/Lacey/Pictures/2018"


# I have multiple folders within the dupFolder that I want to examine for duplicates
# Here I get a vector of all the folders within dupFolder to examine
foldersDup <- list.files(path = dupFolder, pattern = NULL) 


# Filter: I only want to look at folders with dates greater than 10/13/2018
# This only works because of the unique way that my folders are named
foldersDup <- foldersDup[foldersDup >= "2018-10-13"]


# Designate exact pattern files will include that indicates being a duplicate
# this pattern could be found at the begining, the middle, the end, anywhere inside the 
# character string that is your file name. Choose wisely!
dupPattern <- "-2.jpg"
# dupPattern <- "-2.mov"


# Look through all folders and pull those with the pattern suspected to represent a duplicate
duplicateFiles <- NULL
for(folderX in foldersDup){
  possDups <- list.files(path = paste0(dupFolder, "/", folderX))
  possDups <- possDups[str_detect(possDups, dupPattern)]
  if(length(possDups) > 0){
    dupPath <- paste0(dupFolder, "/", folderX, "/", possDups)
    duplicateFiles <- c(duplicateFiles, dupPath)
  }
}


# Quickly review the file names to make sure they are as expected
duplicateFiles


# Pull the duplicate files from their original location and move to a new folder of your choosing
file_move(duplicateFiles, paste0("C:/YourLocation/"))


# I suggest you check and check again inside your newly created file full of 'duplicates'. Make sure
# that these are indeed duplicates before you delete the folder from your computer. 



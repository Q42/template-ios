"""
This script renames the template project to the desired name.
"""

import os
from pathlib import Path

folder = Path(os.path.abspath(os.path.dirname(__file__))).parent.as_posix()

dryRun = False
oldProjectName = "TemplateApp"
print("Enter new project name:")
newProjectName = input()

# ========= Rename folders and files:

print(
    "\nRenaming '%s' to '%s' in folder names.\n" % (oldProjectName, newProjectName)
)

def rename(root, fileName):
    oldFileName = os.path.join(root, fileName)
    newFileName = os.path.join(root, fileName.replace(oldProjectName, newProjectName))
    if dryRun:
        print("Would rename folder: %s to %s" % (oldFileName, newFileName))
    else:
        print("Renaming folder: %s to %s" % (oldFileName, newFileName))
        os.rename(oldFileName, newFileName)

for root, dirs, files in os.walk(folder, topdown=False):
    for subDir in dirs:
        if oldProjectName in subDir:
            rename(root, subDir)
    for subFile in files:
        if oldProjectName in subFile:
            rename(root, subFile)

# ========= Rename usages in source files: =========

print(
    "\nReplacing all occurrences of %s in source files with: '%s'.\n" % (oldProjectName, newProjectName)
)

def replace_project_name_occurences_in_file(filename):
    with open(filename, "r") as file:
        filedata = file.read()

        if oldProjectName in filedata:
            filedata = filedata.replace(oldProjectName, newProjectName)

            if dryRun:
                print("Would update file: " + filename)
            else:
                print("Updating file: " + filename)
                with open(filename, "w") as file:
                    file.write(filedata)
                    file.close()

for root, dirs, files in os.walk(folder, topdown=False):
    allowed_extensions = ["swift", "plist", "yml", "pbxproj", "storyboard", "xctestplan", "xcscheme"]
    for name in files:
        extension = name.split(".")[-1]
        if extension in allowed_extensions:
            file_name = os.path.join(root, name)
            replace_project_name_occurences_in_file(file_name)

print(
    "\nDone renaming project to: '%s'.\n" % (newProjectName)
)

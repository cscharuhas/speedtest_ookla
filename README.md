# speedtest_ookla
Automation script for testing internet speed using speedtest by ookla.

# Why was this code written ?
Sometimes there are a lot of fluctuation in the internet speed in my locality, it was irritating to keep checking the speed every time a buffer occurred. This is just for my own convinience and at the same time to learn some new things. This is my first attempt to create a batch script.

# How the automation script works ?
1. It creates a folder on users desktop called speedtest if not already present.
2. It then downloads the ookla-speedtest-1.0.0-win64.zip and stores it in the speedtest folder created above.
3. The ookla-speedtest-1.0.0-win64.zip file is then extracted to a folder in the same location by the name ookla.
4. The extracted zip in the folder ookla contains two files as of now namely speedtest.exe and speedtest.md of which speedtest.exe is used to test the internet speed.
5. It then goes on to create a scheduled task in the windows task scheduler by the name "prahar_ookla" in the "MyTasks" folder. This task is configured to run the C:\Users\\%username%\Desktop\speed.exe(You can also use the batch file instead of the exe file here in the code ) for every 2 minutes.
6. It then goes on to perform the speedtest by running the speedtest.exe and storing the outupt in the C:\Users\\%username%\Desktop\speedtest\speedtest.log file.

# NOTE
It is important to note that the scheduled task searches for the file in the location "C:\Users\\%username%\Desktop\". So, it is abslutely necessary that the speed.exe or speed.bat file, whichever you use in the code be present at the location for the automated task to work.

Also the code is pretty self-explanatory but still I tried my best to explain the basic operaion of what it does for some of my non coder friends(Including myself LOL).

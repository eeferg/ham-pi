# ham-pi
A package of scripts and and how-to guides for installing common ham radio applications on a stock Rasbian build

## Introduction

While there are a number of downloadable Raspberry Pi images that come pre-loaded with many of the commonly used Amature Radio applications, there is little to nothing to help guide someone through the steps in creating their own custom build.  This projects hopes to take out some of the mystery and frustration in compiling open-source applications yourself and creating a custom Raspberry Pi build to meet your specific needs.

The automated scripts are intended to install any pre-requisite libraries, software, and configurations you will need on a new Raspian build.  Instructions will be given on how to compile each major applications, like FLDigi or wsjt-x, individually.  By using this method, you will be able to choose the applications you wish to include while saving resources by not including those you will not use.  In addition, being able to compile and install each application individually means you will be able to install new versions as soon as they are released and not have to wait for an update of a particular Raspberry Pi image.

For each application I will include a basic guide on initial setup and use.  These will by no means be an exhaustive nor authoritavive treatment on the subjects but just enough to get you working.  I highly recommend reading the official documentation for each application to best understand them.

## Background


## Application Inventory

### Initial Build
- Core Libraries
- Basic Utilities
- Initial Configurations

### Ham Utilities
- Chrony
- GPSD

### Applications
- FLDigi
- wsjt-x
- xastir
- cqrlog

## Installation

## Bootstrap
The following procedures are required to install the scripts you will be running.  Once installed, you can follow this README.md from your local device, if you like. This assumes you are starting with a clean Rasbian build.

Open Terminal and change preferences

From Terminal ( >_ ): 
- Edit->Preferences
    - Terminal Font -> Select a font size
    - Palette -> Select "Tango" for best clarity

- Install any new Rasbian updates and reboot.
```
sudo apt update && sudo apt upgrade -y
sudo reboot
```

- Install Git, used to download this repository
```
sudo apt install git
```

- Change to your home directory and download this repository
```
cd ~
git clone https://github.com/W4EDF/ham-pi.git
```

## Initial Build

Run the initialization script to start the build and supply the root password (your pi account password)
```
cd ~/ham-pi
bash init_script.sh
sudo reboot
```


## Applications

### FLDigi 
#### Install

- Download the source tarball
```
cd ~/Downloads
wget --no-check-certificate https://sourceforge.net/projects/fldigi/files/fldigi/fldigi-4.1.03.tar.gz
```
- Extract the source tarball
```
tar zxvf fldigi-4.1.03.tar.gz
```
- Compile and install
```
cd ~/Downloads/fldigi-4.1.03
./configure
make
sudo make install
```
#### Configuration Notes
Your user settings will be stored in the ~/.fldigi directory


### Wsjt-x
#### Install

- Download the source tarball
```
cd ~/Downloads
wget --no-check-certificate https://physics.princeton.edu/pulsar/k1jt/wsjtx-2.0.1.tgz
```
- Extract the source tarball
```
tar zxvf wsjtx-2.0.1.tgz
```
- Compile and install
```
cd ~/Downloads/wsjtx-2.0.1
mkdir build; cd build
cmake ../.
cmake --build .
sudo cmake --build . --target install
```

### Xastir
#### Install
- Clone Git repository
```
cd ~
git clone https://github.com/Xastir/Xastir.git
```
- Compile and install
```
cd Xastir
./bootstrap.sh
mkdir build && cd build
../configure CPPFLAGS="-I/usr/include/geotiff"
make
sudo make install
sudo chmod 4555 /usr/local/bin/xastir
```

### GPredict
#### Install
- Clone Git repository
```
cd ~
git clone https://github.com/csete/gpredict.git
```
- Compile and install
```
cd gpredict
./autogen.sh
make
sudo make install
```


### CQRLog
I do not currently have a reliable set of instructions to compile but the developers have a Raspbian image that works well.
#### Install
Download the binary image
```
wget https://www.cqrlog.com/files/cqrlog_2.3.0/cqrlog_2.3.0-1_armhf.deb
```

Install
```
sudo dpkg -i cqrlog_2.3.0/cqrlog_2.3.0-1_armhf.deb
```

## Updating Applications


## Future Additions

## Raspberry Tips and Tricks

#### Disable WiFi/Bluetooth
Add the following to /boot/config.txt
```
dtoverlay=pi3-disable-wifi
dtoverlay=pi3-disable-bt
```

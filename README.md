# Lidfinger

For people who use a laptop with a fingerprint sensor *and* a dock, the fingerprint sensor is inaccessible when the laptop lid is closed and plugged into the dock. When logging in via programs like [GDM](https://wiki.gnome.org/Projects/GDM) or authenticating via `sudo`, they still prompt for a fingerprint. People need to wait for the fingerprint prompt to timeout first before entering their password, which takes at least ten extra seconds.

This project is a simple utility and configuration to automatically enable and disable your laptop fingerprint sensor when your laptop lid is opened or closed. It is based on [this blog article](https://jim-think.blogspot.com/2020/10/disable-fingerprint-scanner-when-laptop.html).

## Installation
First, edit toggle-fprint-auth.sh to replace USB device "1-9" to the device matching your fingerprint sensor, using the instructions [here](https://jim-think.blogspot.com/2020/10/disable-fingerprint-scanner-when-laptop.html?showComment=1614503469177#c6617204854143499164).

```
sudo make install
```

## Uninstallation

```
sudo make uninstall
```

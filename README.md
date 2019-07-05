![logo](https://user-images.githubusercontent.com/15576531/60744727-3c9d1c80-9f45-11e9-84a6-dd54941d293d.jpg)
# Run Custom Scripts After Establishing VPN Connection
**Note:** Currently this only works with  NordVPN, and you must have an active subscription

Allows for execution of arbitrary scripts after the OpenVPN connection has been established with the server.

# Quick Start
Update your NordVPN username and password in the `openvpn.sh` file.

Next, replace `helper.sh` with your own script, but keep the name as `helper.sh`. 

Scripts are pasted to `/etc/scripts/` directory within the Docker container. 

If you have multiple scripts to run in succession, then you can control the order of execution via the helper script.
make sure to `chmod +x` your scripts in either `openvpn.sh` or `helper.sh` to avoid issues with execution.

Next, build the docker image and tag it a name you'd like. I'm going to use exec_after_vpn
> docker build -t exec_after_vpn .

Now you are ready to run the image you just built. Note in order for OpenVPN to create the tun device you would have to run the container as `--previlliged`
> docker run --rm --previlliged exec_after_vpn

# Author
* **Victor Xu**

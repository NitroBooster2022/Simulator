# Simulator

Starter code from https://github.com/ECC-BFMC/Simulator

There are multiple packages/repos in our organisation for the car's functions that can be added in the repo for testing/development.
(ex:Advanced-Lane-Detection, Control...)

Build process:

1- Clone the repo and the other packages you need to use.

2- Add symbolic link to the packages in src with:

```sh
ln -s {path to package}/{package name}
```

ex:

```sh
ln -s /home/antoinedeng/Desktop/BFMC_Simulator_packages/nav_pkg
```

3-Build the repo with 

```sh
catkin_make --pkg utils
catkin_make
```

---
title: Using Anaconda
date: 2025-12-10
type: converted-post
---

> Originally published: 2025-12-10


# Introduction

<!-- TOC -->

- [Introduction](#introduction)
    - [Managing Packages](#managing-packages)
        - [Install packages using conda](#install-packages-using-conda)
            - [List installed packages](#list-installed-packages)
            - [Update a package](#update-a-package)
            - [Update all packages in an environment](#update-all-packages-in-an-environment)
            - [Uninstall a package](#uninstall-a-package)
    - [Managing environments](#managing-environments)
        - [Creating conda environment](#creating-conda-environment)
        - [Saving and loading environments](#saving-and-loading-environments)
        - [Listing environments](#listing-environments)
        - [Removing environments](#removing-environments)
    - [Entering an environment](#entering-an-environment)
    - [References](#references)

<!-- /TOC -->

Anaconda is very easy to manage packages and environments for use with Python.
Also simplifies dealing with packages and multiple Python versions.
Creating virtual environments that make working on multiple projects much easier.

Conda is also a virtual environment manager. It's similar to virtualenv and pyenv etc,.

[Installation instructions for Anaconda](https://www.continuum.io/downloads)


## Managing Packages

Once you have Anaconda installed, managing packages is fairly straightforward. To install a package, type in your terminal.

### Install packages using conda

Most of the commands are pretty intuitive.

```bash
conda install <package-name>
```

You can install multiple packages at the same time.

```bash
conda install numpy scipy pandas
```

will install all those packages simultaneously.

It is also possible to specify which version of a package you want by adding the version number such as

```bash
conda install numpy=1.10
```

Conda also ___automatically installs___ dependencies for you. For example scipy depends on numpy, it uses and requires numpy. If you install just scipy Conda will also install numpy if it isn't already installed.

```bash
conda install scipy
```

#### List installed packages

```bash
conda list
```

#### Update a package

```bash
conda update <package-name>
```

#### Update all packages in an environment

```bash
conda update --all.
```


#### Uninstall a package

```bash
conda remove <package-name>
```


If you don't know the exact name of the package you're looking for, you can try searching with ___conda search search-term___

For example, you know that you want to install Beautiful Soup, but not sure of the exact package name.

```bash
conda search beautifulsoup.
```

It returns a list of the Beautiful Soup packages available with the appropriate package name, beautifulsoup4.

## Managing environments

### Creating conda environment

```bash
conda create -n <env_name> <list of packages>
```

Example

```bash
conda create -n my_env numpy
```

To create an environment with a specific Python version.

```bash
create -n py3 python=3
or
conda create -n py2 python=2
```


### Saving and loading environments

A really useful feature is sharing environments so others can install all the packages used in your code, with the correct versions. You can save the packages to a YAML file with

```bash
conda env export > environment.yaml
```

The first part ***conda env export*** writes out all the packages in the environment, including the Python version.
The second part of the export command, *** environment.yml*** writes the exported text to a YAML file *** environment.yml ***

Create virtual environment from file

```bash
conda env create -f environment.yml
```

### Listing environments

```bash
conda env list
```

### Removing environments

```bash
conda env remove -n env_name
```

## Entering an environment

Activating conda environment

```bash
source activate my_env
```

Checking installed package list in conda env

```bash
conda list
```

Deactivating conda environment

```bash
source deactivate
```

***

## References

- [Conda docs](https://conda.io/docs/using/envs.html)
pl-objectdetection
================================

.. image:: https://badge.fury.io/py/objectdetection.svg
    :target: https://badge.fury.io/py/objectdetection

.. image:: https://travis-ci.org/FNNDSC/objectdetection.svg?branch=master
    :target: https://travis-ci.org/FNNDSC/objectdetection

.. image:: https://img.shields.io/badge/python-3.5%2B-blue.svg
    :target: https://badge.fury.io/py/pl-objectdetection

.. contents:: Table of Contents


Abstract
--------

This is the original runnable object dection python3 scripts and its running environment container on ppc64le. To get the **ppc64le chrisapp** version, click here:

https://github.com/FNNDSC/pl-objectdetection_moc_ppc64

check the **parent scripts** & amd64 container powered by nvidia:

https://github.com/NVIDIA/object-detection-tensorrt-example

**Docker container** published on dockerhub:

https://hub.docker.com/repository/docker/fnndsc/pl-objectdetection_moc_ppc64

For **amd64 version scripts** check here:

https://github.com/FNNDSC/object-detection-tensorrt-example

**amd64 version Chris app**:

https://github.com/FNNDSC/pl-object-detection

Contributer
--------
@PupilTong modified the original object detection for benchmarking usage & built runnable ppc64le running environment.
@h4x0rMadness made it chris app & benchmarking outputs

An app to ...

Synopsis
--------

.. code::

    python objectdetection.py                                           \
        [-v <level>] [--verbosity <level>]                          \
        [--version]                                                 \
        [--man]                                                     \
        [--meta]                                                    \
        <inputDir>
        <outputDir> 

Description
-----------

``objectdetection.py`` is a ChRIS-based application that...

Agruments
---------

.. code::

    [-v <level>] [--verbosity <level>]
    Verbosity level for app. Not used currently.

    [--version]
    If specified, print version number. 
    
    [--man]
    If specified, print (this) man page.

    [--meta]
    If specified, print plugin meta data.


Run
----



Using ``docker run``
~~~~~~~~~~~~~~~~~~~~

To run using ``docker``, be sure to assign an "input" directory to ``/incoming`` and an output directory to ``/outgoing``. *Make sure that the* ``$(pwd)/out`` *directory is world writable!*

Now, prefix all calls with 

.. code:: bash

    docker run --security-opt label=type:nvidia_container_t
                -v $(pwd)/in:/incoming:z -v $(pwd)/out:/outgoing:z
                docker.io/fnndsc/pl-objectdetection_moc_ppc64
                objectdetection.py
                /incoming /outgoing

Thus, getting inline help is:

.. code:: bash

    mkdir in out && chmod 777 out
    docker run --security-opt label=type:nvidia_container_t
                -v $(pwd)/in:/incoming:z -v $(pwd)/out:/outgoing:z
                docker.io/fnndsc/pl-objectdetection_moc_ppc64
                objectdetection.py
                /incoming /outgoing






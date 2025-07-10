# Copyright (C) 2020, Inria
# GRAPHDECO research group, https://team.inria.fr/graphdeco
# All rights reserved.
# 
# This software is free for non-commercial, research and evaluation use 
# under the terms of the LICENSE.md file.
# 
# For inquiries contact sibr@inria.fr and/or George.Drettakis@inria.fr


## Included once for all sub project.
## It contain the whole cmake instructions to find necessary common dependencies.
## 3rdParty (provided by sibr_addlibrary win3rdParty or from external packages) are then available in cmake sub projects.
##
## Do not include this file more than once but you can modify it to fit to your own project.
## So please, read it carefully because you can use on of these dependencies for your project or appen new one.
##
## As it is included after camke options, you can use conditional if(<CMAKE_PROJ_OPT>)/endif() to encapsulate your 3rdParty.
##

## win3rdParty function allowing to auto check/download/update binaries dependencies for current windows compiler
## Please open this file in order to get more documentation and usage examples.
include(Win3rdParty)

include(sibr_library)

Win3rdPartyGlobalCacheAction()

find_package(OpenGL REQUIRED)
include_directories(${OPENGL_INCLUDE_DIR})
############
## Find GLEW
############
set(GLEW_VERBOSE ON)
FIND_PACKAGE(GLEW REQUIRED)

##############
## Find ASSIMP
##############
find_package(assimp CONFIG REQUIRED)

################
## Find FFMPEG
################
find_package(FFMPEG QUIET)
include_directories(${FFMPEG_INCLUDE_DIR})

###################
## Find embree3
find_package(embree3 REQUIRED)

###################
## Find eigen3
###################


#############
## Find Boost
#############

find_package(Boost REQUIRED)

if(WIN32)
	add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:/EHsc>")
    #add_definitions(/EHsc)
endif()

if(Boost_LIB_DIAGNOSTIC_DEFINITIONS)
    add_definitions(${Boost_LIB_DIAGNOSTIC_DEFINITIONS})
endif()

#if(WIN32)
    add_definitions(-DBOOST_ALL_DYN_LINK -DBOOST_ALL_NO_LIB)
#endif()

include_directories(${BOOST_INCLUDEDIR} ${Boost_INCLUDE_DIRS})
link_directories(${BOOST_LIBRARYDIR} ${Boost_LIBRARY_DIRS})

##############
## Find OpenCV
##############

find_package(OpenCV REQUIRED) ## Use directly the OpenCVConfig.cmake provided

###################
## Find GLFW
###################
find_package(glfw3 CONFIG REQUIRED)

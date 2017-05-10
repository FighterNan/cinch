#------------------------------------------------------------------------------#
# Copyright (c) 2017 Los Alamos National Security, LLC
# All rights reserved.
#------------------------------------------------------------------------------#

################################################################################
# Please Do Not Edit This File Unless You Know What You Are Doing!!!
#
# Project-specific configuration rules should be added in the 'config'
# subdirectory of the top-level of this project in the appropriate file,
# e.g., package configuration options should go in 'config/packages.cmake'.
#
# For more documentation on the design philosophy of this build system
# and the recognized configuration files that can be added to the 'config'
# subdirectory, please look in 'cinch/README.md' and 'cinch/INSTALL.md'
# from the top-level of this project.
#
# Any changes to the basic build template should be discussed with the
# project maintainers.
################################################################################

#------------------------------------------------------------------------------#
# Add path for cinch modules
#------------------------------------------------------------------------------#

list(APPEND CMAKE_MODULE_PATH ${CINCH_SOURCE_DIR}/cmake)

#------------------------------------------------------------------------------#
# Cinch includes
#------------------------------------------------------------------------------#

include(globals)
include(test-execution-policy)
include(options)

#------------------------------------------------------------------------------#
# Formatting options for emacs and vim.
# vim: set tabstop=4 shiftwidth=4 filetype=cmake expandtab :
#------------------------------------------------------------------------------#
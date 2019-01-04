#--------------------------------------------------------------------------#
# Add cinch include directory
#--------------------------------------------------------------------------#

include_directories(${CINCH_SOURCE_DIR})

#--------------------------------------------------------------------------#
# Configure header
#--------------------------------------------------------------------------#

set(CINCH_ENABLE_BOOST ${ENABLE_BOOST})
set(CINCH_ENABLE_CLOG ${ENABLE_CLOG})

configure_file(${CINCH_SOURCE_DIR}/config/cinch-config.h.in
  ${CMAKE_BINARY_DIR}/cinch-config.h @ONLY)

#--------------------------------------------------------------------------#
# Install cinch source files
#--------------------------------------------------------------------------#

install(FILES ${CMAKE_BINARY_DIR}/cinch-config.h
  DESTINATION include)
install(FILES ${CMAKE_SOURCE_DIR}/cinch/utils/clog.h
    DESTINATION include/cinch/utils)
install(FILES ${CMAKE_SOURCE_DIR}/cinch/runtime/runtime.h
    DESTINATION include/cinch/runtime)
install(FILES ${CMAKE_SOURCE_DIR}/cinch/runtime/runtime.cc
    DESTINATION include/cinch/runtime)

option(ENABLE_CLOG "Enable Cinch logging" OFF)

if(ENABLE_CLOG)
    add_definitions(-DENABLE_CLOG)

    # Add an option to set the strip level
    set(CLOG_STRIP_LEVEL "0" CACHE STRING "Set the clog strip level")
    add_definitions(-DCLOG_STRIP_LEVEL=${CLOG_STRIP_LEVEL})

    # Allow color output
    option(CLOG_COLOR_OUTPUT "Enable colorized clog logging" ON)

    if(CLOG_COLOR_OUTPUT)
        add_definitions(-DCLOG_COLOR_OUTPUT)
    endif()

    # Enable tag groups
    option(CLOG_ENABLE_TAGS "Enable tag groups" ${ENABLE_BOOST})

    if(CLOG_ENABLE_TAGS)
        set(CLOG_TAG_BITS "64" CACHE STRING
            "Select the number of bits to use for tag groups")
        add_definitions(-DCLOG_ENABLE_TAGS)
        add_definitions(-DCLOG_TAG_BITS=${CLOG_TAG_BITS})
    endif()

    # Externally scoped messages
    option(CLOG_ENABLE_EXTERNAL
        "Enable messages that are defined at external scope" OFF)

    if(CLOG_ENABLE_EXTERNAL)
        add_definitions(-DCLOG_ENABLE_EXTERNAL)
    endif()

    # MPI
    if(MPI_${MPI_LANGUAGE}_FOUND)
        option(CLOG_ENABLE_MPI "Enable clog MPI functions" ${ENABLE_MPI})

        if(CLOG_ENABLE_MPI)
            find_package(Threads)
            add_definitions(-DCLOG_ENABLE_MPI)
        endif()
    endif()

    # Enable debugging
    option(CLOG_DEBUG "Enable clog debugging" OFF)

    if(CLOG_DEBUG)
        add_definitions(-DCLOG_DEBUG)
    endif()

    list(APPEND CINCH_RUNTIME_LIBRARIES ${CMAKE_THREAD_LIBS_INIT})
endif()

#------------------------------------------------------------------------------#
# Formatting options for emacs and vim.
# vim: set tabstop=4 shiftwidth=4 expandtab :
#------------------------------------------------------------------------------#
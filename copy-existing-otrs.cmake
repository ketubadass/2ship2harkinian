message(STATUS "Copying otr files...")

# Copy and rename mm.zip to mm.o2r
if(NOT ONLY2SHIPOTR AND EXISTS ${SOURCE_DIR}/OTRExporter/mm.zip)
    execute_process(COMMAND ${CMAKE_COMMAND} -E copy mm.zip ${SOURCE_DIR}/mm.o2r)
    execute_process(COMMAND ${CMAKE_COMMAND} -E copy mm.zip ${BINARY_DIR}/mm/mm.o2r)
    message(STATUS "Copied mm.zip")
endif()
if(EXISTS ${SOURCE_DIR}/OTRExporter/2ship.o2r)
    execute_process(COMMAND ${CMAKE_COMMAND} -E copy 2ship.o2r ${SOURCE_DIR})
    execute_process(COMMAND ${CMAKE_COMMAND} -E copy 2ship.o2r ${BINARY_DIR}/mm/)
    message(STATUS "Copied 2ship.o2r")
endif()

# Additionally for Windows, copy the otrs to the target dir, side by side with 2ship.exe
if(SYSTEM_NAME MATCHES "Windows")
    if(NOT ONLY2SHIPOTR AND EXISTS ${SOURCE_DIR}/OTRExporter/mm.zip)
        execute_process(COMMAND ${CMAKE_COMMAND} -E copy mm.zip ${TARGET_DIR}/mm.o2r)
    endif()
    if(EXISTS ${SOURCE_DIR}/OTRExporter/o2r)
        execute_process(COMMAND ${CMAKE_COMMAND} -E copy 2ship.o2r ${TARGET_DIR})
    endif()
endif()

if(NOT ONLY2SHIPOTR AND (NOT EXISTS ${SOURCE_DIR}/mm.o2r))
    message(FATAL_ERROR "Failed to copy. No O2R files found.")
endif()
if(NOT EXISTS ${SOURCE_DIR}/2ship.o2r)
    message(FATAL_ERROR "Failed to copy. No 2ship O2R found.")
endif()

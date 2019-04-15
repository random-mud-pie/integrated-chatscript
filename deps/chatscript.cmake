# copyright Talmai Oliveira <to@talm.ai>

include(ExternalProject)
if (NOT TARGET chatscript_target) # if we haven't included before
    message(STATUS "${BoldRed}will build ChatScript from source${ColorReset}")

    # all we really do is download ChatScript...
    set(chatscript_VERSION 9.2)
    set(chatscript_URL https://github.com/random-mud-pie/ChatScript/releases/download/${chatscript_VERSION}.tiny/${chatscript_VERSION}.tiny.tar.gz)
    set(chatscript_BUILD ${CMAKE_CURRENT_BINARY_DIR}/grpc/src/grpc_target)
    set(chatscript_INCLUDES ${chatscript_BUILD}/SRC)

    ExternalProject_Add(
            chatscript_target
            PREFIX chatscript
            URL ${chatscript_URL}
            DOWNLOAD_DIR "${DOWNLOAD_LOCATION}"
            URL_HASH SHA256=71553330dee0b0fe8d4079e468b7b8e6fdc972bf6aa3f56e14a8afa511eb84b7
            CONFIGURE_COMMAND ""
            BUILD_COMMAND ""
            INSTALL_COMMAND ""
            )

    # propagate includes
    include_directories(
            BEFORE
            ${chatscript_INCLUDES}
    )

endif()

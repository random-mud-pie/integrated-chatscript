# copyright Talmai Oliveira <to@talm.ai>

include(ExternalProject)
if (NOT TARGET chatscript_target) # if we haven't included before
    message(STATUS "${BoldRed}will build ChatScript from source${ColorReset}")

    # all we really do is download ChatScript...
    set(chatscript_VERSION 9.3)
    set(chatscript_FILENAME ChatScript.${chatscript_VERSION}.tiny.tar.gz)
    set(chatscript_URL https://github.com/random-mud-pie/ChatScript/releases/download/${chatscript_VERSION}.tiny/${chatscript_FILENAME})
    set(chatscript_BUILD ${CMAKE_CURRENT_BINARY_DIR}/chatscript/src/chatscript_target)
    set(chatscript_INCLUDES ${chatscript_BUILD}/CHATSCRIPTIDE/)

    ExternalProject_Add(
            chatscript_target
            PREFIX chatscript
            URL ${chatscript_URL}
            DOWNLOAD_DIR "${DOWNLOAD_LOCATION}"
            URL_HASH SHA256=b1aa5df21f01d63d93379d92f11e7c90aaac103be91b342883ff18fddea572cb
            CONFIGURE_COMMAND ""
            BUILD_COMMAND ""
            INSTALL_COMMAND ""
            )

        # TODO: need to patch (find . -type f -exec bash -c 'iconv -f iso-8859-1 -t utf-8 "{}" > ${chatscript_BUILD}/"{}"' \;)

    # propagate includes
    include_directories(
            BEFORE
            ${chatscript_INCLUDES}
    )

endif()

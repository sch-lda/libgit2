# Optional external dependency: zlib
include(SanitizeBool)

SanitizeBool(USE_BUNDLED_ZLIB)
if(USE_BUNDLED_ZLIB STREQUAL ON)
	set(USE_BUNDLED_ZLIB "Bundled")
endif()


	find_package(ZLIB)
	if(ZLIB_FOUND)
		list(APPEND LIBGIT2_SYSTEM_INCLUDES ${ZLIB_INCLUDE_DIRS})
		list(APPEND LIBGIT2_SYSTEM_LIBS ${ZLIB_LIBRARIES})
		if(APPLE OR CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
			list(APPEND LIBGIT2_PC_LIBS "-lz")
		else()
			list(APPEND LIBGIT2_PC_REQUIRES "zlib")
		endif()
		add_feature_info(zlib ON "using system zlib")
	endif()


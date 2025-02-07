set(_AMENT_PACKAGE_NAME "lttngpy")
set(lttngpy_VERSION "7.1.0")
set(lttngpy_MAINTAINER "Christophe Bedard <christophe.bedard@apex.ai>")
set(lttngpy_BUILD_DEPENDS "pybind11_vendor" "liblttng-ctl-dev")
set(lttngpy_BUILDTOOL_DEPENDS "ament_cmake" "python_cmake_module")
set(lttngpy_BUILD_EXPORT_DEPENDS "liblttng-ctl-dev")
set(lttngpy_BUILDTOOL_EXPORT_DEPENDS )
set(lttngpy_EXEC_DEPENDS "rpyutils" "liblttng-ctl-dev")
set(lttngpy_TEST_DEPENDS "ament_cmake_gtest" "ament_cmake_pytest" "ament_lint_auto" "ament_lint_common")
set(lttngpy_GROUP_DEPENDS )
set(lttngpy_MEMBER_OF_GROUPS )
set(lttngpy_DEPRECATED "")
set(lttngpy_EXPORT_TAGS)
list(APPEND lttngpy_EXPORT_TAGS "<build_type>ament_cmake</build_type>")

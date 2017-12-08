# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "drone_project: 1 messages, 0 services")

set(MSG_I_FLAGS "-Idrone_project:/home/jack/ME580/catkin_ws/src/drone_project/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Idrone_project:/home/jack/ME580/catkin_ws/src/drone_project/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(drone_project_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jack/ME580/catkin_ws/src/drone_project/msg/drone_state.msg" NAME_WE)
add_custom_target(_drone_project_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "drone_project" "/home/jack/ME580/catkin_ws/src/drone_project/msg/drone_state.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(drone_project
  "/home/jack/ME580/catkin_ws/src/drone_project/msg/drone_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/drone_project
)

### Generating Services

### Generating Module File
_generate_module_cpp(drone_project
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/drone_project
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(drone_project_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(drone_project_generate_messages drone_project_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jack/ME580/catkin_ws/src/drone_project/msg/drone_state.msg" NAME_WE)
add_dependencies(drone_project_generate_messages_cpp _drone_project_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(drone_project_gencpp)
add_dependencies(drone_project_gencpp drone_project_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS drone_project_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(drone_project
  "/home/jack/ME580/catkin_ws/src/drone_project/msg/drone_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/drone_project
)

### Generating Services

### Generating Module File
_generate_module_eus(drone_project
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/drone_project
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(drone_project_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(drone_project_generate_messages drone_project_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jack/ME580/catkin_ws/src/drone_project/msg/drone_state.msg" NAME_WE)
add_dependencies(drone_project_generate_messages_eus _drone_project_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(drone_project_geneus)
add_dependencies(drone_project_geneus drone_project_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS drone_project_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(drone_project
  "/home/jack/ME580/catkin_ws/src/drone_project/msg/drone_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/drone_project
)

### Generating Services

### Generating Module File
_generate_module_lisp(drone_project
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/drone_project
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(drone_project_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(drone_project_generate_messages drone_project_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jack/ME580/catkin_ws/src/drone_project/msg/drone_state.msg" NAME_WE)
add_dependencies(drone_project_generate_messages_lisp _drone_project_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(drone_project_genlisp)
add_dependencies(drone_project_genlisp drone_project_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS drone_project_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(drone_project
  "/home/jack/ME580/catkin_ws/src/drone_project/msg/drone_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/drone_project
)

### Generating Services

### Generating Module File
_generate_module_nodejs(drone_project
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/drone_project
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(drone_project_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(drone_project_generate_messages drone_project_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jack/ME580/catkin_ws/src/drone_project/msg/drone_state.msg" NAME_WE)
add_dependencies(drone_project_generate_messages_nodejs _drone_project_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(drone_project_gennodejs)
add_dependencies(drone_project_gennodejs drone_project_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS drone_project_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(drone_project
  "/home/jack/ME580/catkin_ws/src/drone_project/msg/drone_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/drone_project
)

### Generating Services

### Generating Module File
_generate_module_py(drone_project
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/drone_project
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(drone_project_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(drone_project_generate_messages drone_project_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jack/ME580/catkin_ws/src/drone_project/msg/drone_state.msg" NAME_WE)
add_dependencies(drone_project_generate_messages_py _drone_project_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(drone_project_genpy)
add_dependencies(drone_project_genpy drone_project_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS drone_project_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/drone_project)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/drone_project
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(drone_project_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET drone_project_generate_messages_cpp)
  add_dependencies(drone_project_generate_messages_cpp drone_project_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/drone_project)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/drone_project
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(drone_project_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET drone_project_generate_messages_eus)
  add_dependencies(drone_project_generate_messages_eus drone_project_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/drone_project)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/drone_project
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(drone_project_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET drone_project_generate_messages_lisp)
  add_dependencies(drone_project_generate_messages_lisp drone_project_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/drone_project)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/drone_project
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(drone_project_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET drone_project_generate_messages_nodejs)
  add_dependencies(drone_project_generate_messages_nodejs drone_project_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/drone_project)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/drone_project\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/drone_project
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(drone_project_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET drone_project_generate_messages_py)
  add_dependencies(drone_project_generate_messages_py drone_project_generate_messages_py)
endif()

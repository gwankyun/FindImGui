﻿cmake_minimum_required(VERSION 3.27)

project(imgui_example)

set(source_dir ${CMAKE_CURRENT_SOURCE_DIR})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${source_dir}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${source_dir}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${source_dir}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${source_dir}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${source_dir}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${source_dir}/lib)

set(CMAKE_MODULE_PATH
  ${CMAKE_MODULE_PATH}
  ${CMAKE_CURRENT_SOURCE_DIR}
)

find_package(ImGui REQUIRED)

include(CMakePrintHelpers)

cmake_print_variables(ImGui_VERSION)
cmake_print_variables(ImGui_INCLUDE_DIRS)
cmake_print_variables(ImGui_LIBRARIES)

set(example_null example_null)
add_executable(${example_null})
target_sources(${example_null} PRIVATE
  ${IMGUI_ROOT}/examples/${example_null}/main.cpp
  FindImGui.cmake
)
target_link_libraries(${example_null} PRIVATE
  ImGui::ImGui ImGui::null
)

set(example_win32_directx9 example_win32_directx9)
add_executable(${example_win32_directx9})
target_sources(${example_win32_directx9} PRIVATE
  ${IMGUI_ROOT}/examples/${example_win32_directx9}/main.cpp
  FindImGui.cmake
)
target_link_libraries(${example_win32_directx9} PRIVATE
  ImGui::ImGui ImGui::win32 ImGui::dx9
)

set(example_win32_directx10 example_win32_directx10)
add_executable(${example_win32_directx10})
target_sources(${example_win32_directx10} PRIVATE
  ${IMGUI_ROOT}/examples/${example_win32_directx10}/main.cpp
  FindImGui.cmake
)
target_link_libraries(${example_win32_directx10} PRIVATE
  ImGui::ImGui ImGui::win32 ImGui::dx10
)

set(example_win32_directx11 example_win32_directx11)
add_executable(${example_win32_directx11})
target_sources(${example_win32_directx11} PRIVATE
  ${IMGUI_ROOT}/examples/${example_win32_directx11}/main.cpp
  FindImGui.cmake
)
target_link_libraries(${example_win32_directx11} PRIVATE
  ImGui::ImGui ImGui::win32 ImGui::dx11
)

set(example_win32_directx12 example_win32_directx12)
add_executable(${example_win32_directx12})
target_sources(${example_win32_directx12} PRIVATE
  ${IMGUI_ROOT}/examples/${example_win32_directx12}/main.cpp
  FindImGui.cmake
)
target_link_libraries(${example_win32_directx12} PRIVATE
  ImGui::ImGui ImGui::win32 ImGui::dx12
)

set(example_sdl2_directx11 example_sdl2_directx11)
if(TARGET ImGui::sdl2)
  add_executable(${example_sdl2_directx11})
  target_sources(${example_sdl2_directx11} PRIVATE
    ${IMGUI_ROOT}/examples/${example_sdl2_directx11}/main.cpp
    FindImGui.cmake
  )
  target_link_libraries(${example_sdl2_directx11} PRIVATE
    ImGui::ImGui ImGui::sdl2 ImGui::dx11
  )
endif()


if(NOT IMGUI_ROOT)
  message(FATAL_ERROR "Need IMGUI_ROOT")
endif()

file(GLOB IMGUI_SOURCES
  ${IMGUI_ROOT}/*.cpp
  ${IMGUI_ROOT}/*.h
)

set(imgui_stdlib imgui_stdlib)
add_library(${imgui_stdlib} INTERFACE)
target_sources(${imgui_stdlib} INTERFACE
  ${IMGUI_ROOT}/misc/cpp/imgui_stdlib.cpp
  ${IMGUI_ROOT}/misc/cpp/imgui_stdlib.h
)

# win32
set(imgui_win32 imgui_win32)
add_library(${imgui_win32} INTERFACE)
target_sources(${imgui_win32} INTERFACE
  ${IMGUI_ROOT}/backends/imgui_impl_win32.cpp
)

# sdl2
set(imgui_sdl2 imgui_sdl2)
add_library(${imgui_sdl2} INTERFACE)
target_sources(${imgui_sdl2} INTERFACE
  ${IMGUI_ROOT}/backends/imgui_impl_sdl2.cpp
)
target_link_libraries(${imgui_sdl2} INTERFACE
  SDL2 SDL2main shell32
)

# sdl3
set(imgui_sdl3 imgui_sdl3)
add_library(${imgui_sdl3} INTERFACE)
target_sources(${imgui_sdl3} INTERFACE
  ${IMGUI_ROOT}/backends/imgui_impl_sdl3.cpp
)
target_link_libraries(${imgui_sdl3} INTERFACE
  SDL3 shell32
)

set(imgui_dx9 imgui_dx9)
add_library(${imgui_dx9} INTERFACE)
target_sources(${imgui_dx9} INTERFACE
  ${IMGUI_ROOT}/backends/imgui_impl_dx9.cpp
)
target_link_libraries(${imgui_dx9} INTERFACE
  d3d9
)

set(imgui_dx10 imgui_dx10)
add_library(${imgui_dx10} INTERFACE)
target_sources(${imgui_dx10} INTERFACE
  ${IMGUI_ROOT}/backends/imgui_impl_dx10.cpp
)
target_link_libraries(${imgui_dx10} INTERFACE
  d3d10 d3dcompiler
)

set(imgui_dx11 imgui_dx11)
add_library(${imgui_dx11} INTERFACE)
target_sources(${imgui_dx11} INTERFACE
  ${IMGUI_ROOT}/backends/imgui_impl_dx11.cpp
)
target_link_libraries(${imgui_dx11} INTERFACE
  d3d11 d3dcompiler
)

set(imgui_dx12 imgui_dx12)
add_library(${imgui_dx12} INTERFACE)
target_sources(${imgui_dx12} INTERFACE
  ${IMGUI_ROOT}/backends/imgui_impl_dx12.cpp
)
target_link_libraries(${imgui_dx12} INTERFACE
  d3d12 d3dcompiler dxgi
)

set(imgui_opengl3 imgui_opengl3)
add_library(${imgui_opengl3} INTERFACE)
target_sources(${imgui_opengl3} INTERFACE
  ${imgui_opengl3}/backends/imgui_impl_opengl3.cpp
)
target_link_libraries(${imgui_opengl3} INTERFACE
  opengl32
)

set(imgui_interface imgui_interface)
set(ImGUI_INCLUDE_DIR imgui_interface
  ${IMGUI_ROOT}
  ${IMGUI_ROOT}/backends
)

add_library(${imgui_interface} INTERFACE)
target_sources(${imgui_interface} INTERFACE
  ${IMGUI_SOURCES}
)
target_include_directories(${imgui_interface} INTERFACE
  ${ImGUI_INCLUDE_DIR}
)

string(REGEX MATCH ".*imgui-([0-9]+.[0-9]+.[0-9]+)" result ${IMGUI_ROOT})

set(ImGui_VERSION "${CMAKE_MATCH_1}")

set(ImGUI_LIBRARY imgui_interface)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ImGui
  FOUND_VAR ImGui_FOUND
  REQUIRED_VARS
    IMGUI_ROOT
    ImGUI_LIBRARY
    ImGUI_INCLUDE_DIR
  VERSION_VAR ImGui_VERSION
)

if(ImGui_FOUND)
  add_library(ImGui::ImGui ALIAS ${imgui_interface})
  add_library(ImGui::win32 ALIAS ${imgui_win32})
  add_library(ImGui::opengl3 ALIAS ${imgui_opengl3})
  add_library(ImGui::dx9 ALIAS ${imgui_dx9})
  add_library(ImGui::dx10 ALIAS ${imgui_dx10})
  add_library(ImGui::dx11 ALIAS ${imgui_dx11})
  add_library(ImGui::dx12 ALIAS ${imgui_dx12})
  add_library(ImGui::stdlib ALIAS ${imgui_stdlib})
endif()

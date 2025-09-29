set_xmakever("3.0.3")
add_rules("mode.release", "mode.debug", "mode.releasedbg")

add_requires("luisa-compute", {configs = {
    metal = true,
}})

set_languages("c++20")

includes("lcgs") -- lcgs.dll 
includes("test") -- lcgs-test.exe 
includes("app") -- lcgs-app.exe 

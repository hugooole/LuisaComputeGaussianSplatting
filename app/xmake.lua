add_requires("stb")

target("lcgs-app")
    set_kind("binary")
    add_packages("stb", "luisa-compute")
    on_config(function (target)
            target:add("runargs", path.join(target:pkg("luisa-compute"):installdir(), "bin"))
        end)
    add_deps("lcgs", "imgui")
    add_files("*.cpp")
    -- enable RTTI
    if is_plat("windows") and is_mode("msvc") then
        add_cxxflags("/GR")
    else
        add_cxxflags("-frtti")
    end
    
    -- Add ImGui docking definitions
    add_defines("IMGUI_ENABLE_DOCKING")
    
    -- Add include directories
    add_includedirs(".")
    add_includedirs("../lcgs/include")
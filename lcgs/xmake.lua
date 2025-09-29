target("lcgs")
    set_kind("shared")
    add_packages("luisa-compute")
    on_config(function (target)
        target:add("runargs", path.join(target:pkg("luisa-compute"):installdir(), "bin"))
        end)
    add_defines("LCGS_DLL_EXPORTS")

    add_includedirs("include", { public = true })
    add_headerfiles("include/**.h", "include/**.hpp")
    set_pcxxheader("src/__pch.h")
    add_files("src/**.cpp")

    if is_host("windows") then
        add_syslinks("Advapi32", "User32", "d3d12", "Shell32")
    end
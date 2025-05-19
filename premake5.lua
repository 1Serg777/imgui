project("imgui")
    kind      ("StaticLib")
    language  ("C++")
    cppdialect("C++17")
    location  (build_path .. "/imgui")
    targetdir (build_path .. "/bin/" .. target_dir)
    objdir    (build_path .. "/bin-int/" .. obj_dir)

    includedirs({
        "%{include_dirs.imgui}",
    })

    files({
        "%{include_dirs.imgui}/*.h",
        "%{src_dirs.imgui}/*.cpp",
    })

    filter({"system:windows", "action:vs*"})
        vpaths({
            ["Include/*"] = {
                "%{include_dirs.imgui}/*.h",
            },
            ["Sources/*"] = {
                "%{src_dirs.imgui}/*.cpp",
            },
        })

    filter("configurations:Debug")
        defines({"DEBUG", "_DEBUG"})
        runtime("Debug")
        symbols("On")

    filter("configurations:Release")
        defines({"NDEBUG", "_NDEBUG"})
        runtime("Release")
        optimize("On")
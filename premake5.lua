 project "GLFW"
    kind "StaticLib"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
    files
    {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "stc/glfw_config.h",
        "stc/context.c",
        "stc/init.c",
        "stc/input.h",
        "stc/monitor.h",
        "stc/vulkan.h",
        "stc/vwindows.h"
    }
    
    filter "system:windows"
        buildoptions { "-std=c11", "-lgdi32" }
        systemversion "latest"
        staticruntime "On"
         
        files 
        {
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }
        
        defines 
        {
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }
        
    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"

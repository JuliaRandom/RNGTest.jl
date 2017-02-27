cd(dirname(@__FILE__)) do
    if is_windows()
        try
            run(`mingw32-make`)
        catch
            if Sys.WORD_SIZE == 32
                url = "https://github.com/GregPlowman/RNGTest.jl/releases/download/TestU01/libtestu01wrapper-32.dll"
            else
                url = "https://github.com/sunoru/RandomNumbers.jl/releases/download/deplib-0.1/librandom123.dll"
            end
            info("MinGW32 not installed, now downloading the library binary from github.")
            download(url, "libtestu01wrapper.dll")
        end
    else
        run(`make`)
    end
end

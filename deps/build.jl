cd(dirname(@__FILE__)) do
    if is_windows()
        try
            run(`mingw32-make`)
        catch
            if Sys.WORD_SIZE == 32
                url = "https://github.com/GregPlowman/RNGTest.jl/tree/master/deps/TestU01/bin/libtestu01wrapper-32.dll"
            else
                url = "https://github.com/GregPlowman/RNGTest.jl/tree/master/deps/TestU01/bin/libtestu01wrapper-64.dll"
            end
            info("MinGW32 not installed, now downloading the library binary from github.")
            download(url, "libtestu01wrapper.dll")
        end
    else
        run(`make`)
    end
end

cd(dirname(@__FILE__)) do
    if is_windows()
        try
            run(`make`)
        catch
            info("cannot run make, installing binary instead.")
            if Sys.WORD_SIZE == 32
                srcfile = "TestU01/bin/libtestu01wrapper-32.dll"
            else
                srcfile = "TestU01/bin/libtestu01wrapper-64.dll"
            end
            cp(srcfile, "libtestu01wrapper.dll")
        end
    else
        run(`make`)
    end
end

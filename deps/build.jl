using Compat

cd(dirname(@__FILE__)) do
    if is_windows()
        try
            run(`make`)
        catch
            info("Cannot run make, installing binary instead")
            if Sys.WORD_SIZE == 32
                binfile = "TestU01/bin/libtestu01wrapper-32.dll"
            else
                binfile = "TestU01/bin/libtestu01wrapper-64.dll"
            end
            cp(binfile, "libtestu01wrapper.dll")
        end
    else
        run(`make`)
    end
end

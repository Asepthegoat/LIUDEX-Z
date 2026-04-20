--trollclossure it wont do anything
function trollclosure(func, src) --stupid ðŸ¤¡
    local old; 
    old = hookfunction(debug.info, newcclosure(function(target, what, ...)
        if target == func then
            local info = {}
            local args = string.split(what, "")
            for _,v in pairs(args) do
                if v == "s" then
                    table.insert(info, src)
                elseif v == "l" then
                    table.insert(info, -1)
                else
                    table.insert(info, old(func, v))
                end
            end
            return table.unpack(info)
        end
        return old(target, what, ...)
    end))
end

getgenv().newpyclosure = function(func) -- phaiiithooneee
trollclosure(func,"[Py]")
end

getgenv().newjavaclossure = function(func) -- phaiiithooneee
trollclosure(func,"[Java]")
end

getgenv().newassemblyclossure = function(func)
   trollclosure(func,"[Assembly]") 
end

getgenv().newphpclosure = function(func)--bimbim bambam
trollclosure(func,"[PHP]")
end

getgenv().newjsclosure = function(func)--hava script nonono
trollclosure(func,"[JS]")
end

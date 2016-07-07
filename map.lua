Map = {}

function Map:read(file)
	local f = io.open(file, "r")
	local content = f:read("*all")
	f.close()

	print(content)
end

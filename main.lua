local MEM = {}
local PC = 0

local fetch = function()
	PC = PC + 1
	return MEM[PC]
end

local operands = {
	["0x00"] = "A",
	["0x01"] = "B",
	["0x02"] = "C",
	["0x03"] = "D"
}

local registers = {
	A = 0,
	B = 0,
	C = 0,
	D = 0,
}

local opcodes = {
	["0x00"] = function()
		-- NOP
	end,
	["0x01"] = function()
		-- MOV R, c
		local R = operands[fetch()]
		local c = fetch()
		registers[R] = c
	end
}
local FDX = function()
	while PC < #MEM do
		local IR = fetch()
		opcodes[IR]()
		print(PC, IR, registers.A)
	end
end

MEM = { "0x00", "0x01", "0x00", "0x01","0x00" }

FDX()



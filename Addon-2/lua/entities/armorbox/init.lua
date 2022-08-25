AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("restoreboxconfig.lua")

ENT.SeizeReward = 360

local PrintMore
function ENT:Initialize()
	local scolor = Color(0, 0, 255, 255)

	self:SetUseType(SIMPLE_USE)
	self:SetModel("models/props_wasteland/controlroom_filecabinet001a.mdl")
	--self:SetMaterial("models/rendertarget")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetColor( scolor )
	local phys = self:GetPhysicsObject()
	phys:Wake()
end

function ENT:Use( ply )

	if ply:Armor() > armorboxamount - 1 then
		DarkRP.notify(ply, 1, 5, "Armor is full")
	elseif ply:Armor() < armorboxamount then
		ply:SetArmor(armorboxamount)
		DarkRP.notify(ply, 2, 5, "Armor Set to "..armorboxamount.."%")
		ply:addMoney(-armorboxprice)
		DarkRP.notify(ply, 2, 5, "Removed $"..armorboxprice.." from your wallet")
	end

end

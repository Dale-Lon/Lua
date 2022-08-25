AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("restoreboxconfig.lua")
AddCSLuaFile("restoreboxconfig.lua")


ENT.SeizeReward = 360

local PrintMore
function ENT:Initialize()
	local scolor = Color(255, 0, 0, 255)

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

	if ply:Health() > healthboxamount -1 then
		DarkRP.notify(ply, 1, 5, "Health is full")
	elseif ply:Health() < healthboxamount then
		ply:SetHealth(healthboxamount)
		DarkRP.notify(ply, 2, 5, "Health Set to "..healthboxamount.."%")
		ply:addMoney(-healthboxprice)
		DarkRP.notify(ply, 2, 5, "Removed $"..healthboxprice.." from your wallet")
	end

end

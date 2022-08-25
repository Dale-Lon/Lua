include("restoreboxconfig.lua")
AddCSLuaFile("restoreboxconfig.lua")

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Health Station"
ENT.Author = "Hyps"
ENT.AdminSpawnable = true
ENT.Spawnable = true
ENT.Category = "Stations"

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "price")
	self:NetworkVar("Entity", 0, "owning_ent")
	self:NetworkVar("Int", 1, "Money")
end

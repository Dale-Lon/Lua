include("shared.lua")
include("restoreboxconfig.lua")
AddCSLuaFile("restoreboxconfig.lua")


surface.CreateFont( "fontforui", {
	font = "CenterPrintText", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 30,
	weight = 100,
	blursize = 0,
	scanlines = 5,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = true,
	outline = false,
} )

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()
	
	local Pos = self:GetPos()
	local Ang = self:GetAngles()

	local owner = self:Getowning_ent()
	owner = (IsValid(owner) and owner:Nick()) or DarkRP.getPhrase("unknown")
	
	local money = "Money: $" .. self:GetMoney()
	
	surface.SetFont("HUDNumber5")
	local text = DarkRP.getPhrase("money_printer")
	local TextWidth = surface.GetTextSize("Brown Money Printer")
	local TextWidth2 = surface.GetTextSize(owner)
	local TextWidth3 = surface.GetTextSize(money)

--Shorteners

	local DrawHealth = LocalPlayer():Health() or 0
	local EchoHealth = LocalPlayer():Health() or 0
	local DrawArmor = LocalPlayer():Armor() or 0
	local EchoArmor = LocalPlayer():Armor() or 0

	Ang:RotateAroundAxis(Ang:Up(), -90)
	Ang:RotateAroundAxis(Ang:Forward(), 90)
	
	cam.Start3D2D(Pos + Ang:Up() * 12.1, Ang, 0.11)
		draw.RoundedBox(0, -85, -123, 170, 245, Color(85, 0, 0, 255))
		draw.RoundedBox(0, -85, -91, 170, 32, Color(0, 85, 0, 255))
		draw.DrawText( "$"..healthboxprice, "Trebuchet24", 0, -88, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
		draw.RoundedBox(0, -85, -123, 170, 32, Color(1, 1, 1, 255))
		draw.DrawText( "Health Box", "Trebuchet24", 0, -120, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
		draw.RoundedBox(0, -85, -59, 170, 32, Color(200, 0, 0, 255))
		draw.DrawText( "Restore to "..healthboxamount.."%", "Trebuchet24", 0, -56, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
	cam.End3D2D()

end

function ENT:Think()
end

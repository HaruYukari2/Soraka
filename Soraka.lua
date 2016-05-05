if GetObjectName(GetMyHero()) ~= "Soraka" then return end	--Checks if our hero is named "Annie" and stops the scripts if that's not the case

require("OpenPredict")										--Loads OpenPredict (opotional)

local SorakaMenu = Menu("Soraka", "Soraka")						--Create a New Menu and call it AnnieMenu (the user only sees "Soraka")
SorakaMenu:SubMenu("Combo", "Combo")							--Create a New SubMenu and call it Combo
SorakaMenu.Combo:Boolean("Q", "Use Q", true)						--Add a button to toggle the usage of Q
SorakaMenu.Combo:Boolean("W", "Use W", true)
SorakaMenu.Combo:Boolean("E", "Use E", true)       --Add a button to toggle the usage of W
SorakaMenu.Combo:Boolean("R", "Use R", true)						--Add a button to toggle the usage of R
SorakaMenu.Combo:Boolean("KSQ", "Killsteal with Q", true)		--Add a button to killsteal with Q
SorakaMenu.Combo:Boolean("UOP", "Use OpenPredict for Q", true)	--Adds a button so we can check if the user wants to use openPredict	[OPTIONAL]

local SorakaQ = {delay = 0, range = 800, radius = 235, speed = math.huge}		--TABLE for Annie R ONLY if you are using OpenPredict

OnTick(function ()									--The code inside the Function runs every tick
	
	local target = GetCurrentTarget()					--Saves the "best" enemy champ to the target variable
		
	if IOW:Mode() == "Combo" then						--Check if we are in Combo mode (holding space)
			
		
		if SorakaMenu.Combo.Q:Value() and Ready(_Q) and ValidTarget(target, 800) then	
			--[[
				AnnieMenu.Combo.Q:Value() returns true if the menu has been ticked
				Ready(_Q) returns true if we are able to cast Q now
				ValidTarget(target, 625) returns true if the target can be attacked and is in a range of 625 (Annie Q range; see wiki)
			]]		
		    local targetPos = GetOrigin(target)		--saves the XYZ coordinates of the target to the variable
			CastSkillShot(_W , targetPos)
		end		--Ends the Q logic
	
		if SorakaMenu.Combo.W:Value() and Ready(_W) and ValidTarget(target, 550) then
			--[[
				AnnieMenu.Combo.W:Value() returns true if the menu has been ticked
				Ready(_W) returns true if we are able to cast W now
				ValidTarget(target, 625) returns true if the target can be attacked and is in a range of 625 (Annie W range; see wiki)
				We don't care that it's conic atm because it's pretty much instant
			]]
			local targetPos = GetOrigin(target)		--saves the XYZ coordinates of the target to the variable
			CastSkillShot(_W , targetPos)			--Since the W is a skillshot (select area), we have to cast it at a point on the ground (targetPos)
		end		--Ends the W logic
		
		if SorakaMenu.Combo.E:Value() and Ready(_E) and ValidTarget(target, 925) then
			--[[
				AnnieMenu.Combo.W:Value() returns true if the menu has been ticked
				Ready(_W) returns true if we are able to cast W now
				ValidTarget(target, 625) returns true if the target can be attacked and is in a range of 625 (Annie W range; see wiki)
				We don't care that it's conic atm because it's pretty much instant
			]]
			local targetPos = GetOrigin(target)		--saves the XYZ coordinates of the target to the variable
			CastSkillShot(_E , targetPos)			--Since the W is a skillshot (select area), we have to cast it at a point on the ground (targetPos)
		end		--Ends the W logic
	end		--Ends the Combo Mode
	
end)		--End script

print("Soraka loaded") -- message to show that the script has injected without breaking

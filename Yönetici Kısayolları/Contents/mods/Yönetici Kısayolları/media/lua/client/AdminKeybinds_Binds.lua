local AdminKeybindsUtils = require("AdminKeybinds_Utils")
AdminKeybindsUtils.Everything = false

local bind = {};
bind.value = "[Admin Keybinds]";
table.insert(keyBinding, bind);

bind = {};
bind.value = "ToggleEverything";
bind.key = Keyboard.KEY_NUMPAD0;
table.insert(keyBinding, bind);

bind = {};
bind.value = "ToggleInvisibility";
bind.key = Keyboard.KEY_NUMPAD1;
table.insert(keyBinding, bind);

bind = {};
bind.value = "ToggleInvincibility";
bind.key = Keyboard.KEY_NUMPAD2;
table.insert(keyBinding, bind);

bind = {};
bind.value = "ToggleGhostMode";
bind.key = Keyboard.KEY_NUMPAD3;
table.insert(keyBinding, bind);

bind = {};
bind.value = "ToggleNoClip";
bind.key = Keyboard.KEY_NUMPAD4;
table.insert(keyBinding, bind);

bind = {};
bind.value = "ToggleFastMove";
bind.key = Keyboard.KEY_NUMPAD5;
table.insert(keyBinding, bind);

bind = {};
bind.value = "ToggleCanSeeEveryone";
bind.key = Keyboard.KEY_NUMPAD6;
table.insert(keyBinding, bind);

bind = {};
bind.value = "ToggleNameVisibility";
bind.key = Keyboard.KEY_NUMPAD7;
table.insert(keyBinding, bind);

bind = {};
bind.value = "ToggleBrushTool";
bind.key = Keyboard.KEY_NUMPAD8;
table.insert(keyBinding, bind);

bind = {};
bind.value = "ToggleAccessLevel";
bind.key = Keyboard.KEY_DECIMAL
table.insert(keyBinding, bind);

local function KeyUp(keynum)
    -- Get the current player character
    local player = getPlayer()

    -- Ensure the player is an admin before proceeding
    if not AdminKeybindsUtils.isPlayerAdmin(player) then return end

    -- Define variables for the message and color values
    local message
    local color = { r = 1, g = 0, b = 0 }

    if keynum == getCore():getKey("ToggleInvisibility") then
        -- Toggle invisibility for the player
        local isInvisiblityEnabled = player:isInvisible()
        player:setInvisible(not isInvisiblityEnabled)

        if isInvisiblityEnabled then
            message = "You have toggled off invisibility."
            color.r, color.g = 1, 0
        else
            message = "You have toggled on invisibility."
            color.r, color.g = 0, 1
        end

        AdminKeybindsUtils.addLineInChat(message, { color = color })
    elseif keynum == getCore():getKey("ToggleInvincibility") then
        -- Toggle invincibility for the player
        local isInvincibilityEnabled = player:isGodMod()
        player:setGodMod(not isInvincibilityEnabled)

        if isInvincibilityEnabled then
            message = "You have toggled off invincibility."
            color.r, color.g = 1, 0
        else
            message = "You have toggled on invincibility."
            color.r, color.g = 0, 1
        end

        AdminKeybindsUtils.addLineInChat(message, { color = color })
    elseif keynum == getCore():getKey("ToggleGhostMode") then
        -- Toggle invincibility for the player
        local isGhostModeEnabled = player:isGhostMode()
        player:setGhostMode(not isGhostModeEnabled)

        if isGhostModeEnabled then
            message = "You have toggled off ghost mode."
            color.r, color.g = 1, 0
        else
            message = "You have toggled on ghost mode."
            color.r, color.g = 0, 1
        end

        AdminKeybindsUtils.addLineInChat(message, { color = color })
    elseif keynum == getCore():getKey("ToggleNoClip") then
        -- Toggle no clip for the player
        local isNoClipEnabled = player:isNoClip()
        player:setNoClip(not isNoClipEnabled)

        if isNoClipEnabled then
            message = "You have toggled off no clip."
            color.r, color.g = 1, 0
        else
            message = "You have toggled on no clip."
            color.r, color.g = 0, 1
        end

        AdminKeybindsUtils.addLineInChat(message, { color = color })
    elseif keynum == getCore():getKey("ToggleFastMove") then
        -- Toggle fast move for the palyer
        local isFastMoveEnabled = ISFastTeleportMove.cheat
        ISFastTeleportMove.cheat = not isFastMoveEnabled

        if isFastMoveEnabled then
            message = "You have toggled off fast move."
            color.r, color.g = 1, 0
        else
            message = "You have toggled on fast move."
            color.r, color.g = 0, 1
        end

        AdminKeybindsUtils.addLineInChat(message, { color = color })
    elseif keynum == getCore():getKey("ToggleCanSeeEveryone") then
        -- Toggle can see everyone for the palyer
        local isCanSeeAllEnabled = player:isCanSeeAll()
        player:setCanSeeAll(not isCanSeeAllEnabled)

        if isCanSeeAllEnabled then
            message = "You have toggled off Can See Everyone."
            color.r, color.g = 1, 0
        else
            message = "You have toggled on Can See Everyone."
            color.r, color.g = 0, 1
        end

        AdminKeybindsUtils.addLineInChat(message, { color = color })
    elseif keynum == getCore():getKey("ToggleBrushTool") then
        local isBrushToolEnabled = BrushToolManager.cheat
        BrushToolManager.cheat = not isBrushToolEnabled

        if isBrushToolEnabled then
            message = "You have toggled off Brush Tool."
            color.r, color.g = 1, 0
        else
            message = "You have toggled on Brush Tool."
            color.r, color.g = 0, 1
        end

        AdminKeybindsUtils.addLineInChat(message, { color = color })
    elseif keynum == getCore():getKey("ToggleEverything") then
        -- Toggle invisibility for the player
        player:setInvisible(not AdminKeybindsUtils.Everything)

        -- Toggle invincibility for the player
        player:setGodMod(not AdminKeybindsUtils.Everything)

        -- Toggle no clip for the player
        player:setNoClip(not AdminKeybindsUtils.Everything)

        -- Toggle Timed Action Instant for the player
        player:setTimedActionInstantCheat(not AdminKeybindsUtils.Everything);

        -- Toggle Unlimited carry for the player
        player:setUnlimitedCarry(not AdminKeybindsUtils.Everything);

        -- Toggle Unlimited Endurance for the player
        player:setUnlimitedEndurance(not AdminKeybindsUtils.Everything);

        -- Toggle Fast Move for the player
        ISFastTeleportMove.cheat = not AdminKeybindsUtils.Everything

        -- Toggle Build Cheat for the player
        ISBuildMenu.cheat = not AdminKeybindsUtils.Everything;
        player:setBuildCheat(not AdminKeybindsUtils.Everything);

        -- Toggle Farming Cheat for the player
        ISFarmingMenu.cheat = not AdminKeybindsUtils.Everything
        player:setFarmingCheat(not AdminKeybindsUtils.Everything);

        -- Toggle Health Cheat for the player
        ISHealthPanel.cheat = not AdminKeybindsUtils.Everything
        player:setHealthCheat(not AdminKeybindsUtils.Everything);

        -- Toggle Mechanics Cheat for the player
        ISVehicleMechanics.cheat = not AdminKeybindsUtils.Everything
        player:setMechanicsCheat(not AdminKeybindsUtils.Everything);

        -- Toggle Moveables cheat for the player
        ISMoveableDefinitions.cheat = not AdminKeybindsUtils.Everything
        player:setMovablesCheat(not AdminKeybindsUtils.Everything);

        -- Toggle can see all for the player
        player:setCanSeeAll(not AdminKeybindsUtils.Everything)

        -- Change the "Everything cheat" status to inverse
        AdminKeybindsUtils.Everything = not AdminKeybindsUtils.Everything

        if not AdminKeybindsUtils.Everything then
            message = "You have toggled off all admin powers."
            color.r, color.g = 1, 0
        else
            message = "You have toggled on all admin powers."
            color.r, color.g = 0, 1
        end

        AdminKeybindsUtils.addLineInChat(message, { color = color })
    end

    sendPlayerExtraInfo(player)
end


Events.OnKeyPressed.Add(KeyUp)

--[[
local player = getPlayer()
local isInvisiblityEnabled = player:isInvisible()
player:setInvisible(not isInvisiblityEnabled)

]]

--[[
local player = getPlayer()
local isGhostModeEnabled = player:isGhostMode()
player:setGhostMode(not isGhostModeEnabled)
]]

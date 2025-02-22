-- Table to store the original usernames of admins
local originalAdminUsernames = {}

-- Table to track if each player is in a temporary observer state
local temporaryObserverState = {}

-- Visibility toggle state
local isInvisible = false

-- Function to check if the player has admin access
local function isAdmin(player)
    return player:isAccessLevel("admin")
end

-- Function to check if the player has observer access
local function isObserver(player)
    return player:isAccessLevel("Observer")
end

-- Function to toggle visibility for all admin or observer players
local function toggleAdminVisibility()
    local players = getOnlinePlayers()
    if not players then return end

    local adminCount = 0

    for i = 0, players:size() - 1 do
        local player = players:get(i)
        if isAdmin(player) or isObserver(player) then
            adminCount = adminCount + 1
            if isInvisible then
                -- Restore the original username if previously hidden
                if originalAdminUsernames[player] then
                    player:setUsername(originalAdminUsernames[player])
                end
                player:setAlpha(1)                   -- Make visible
                player:setShowAdminTag(true)         -- Show admin tag
                player:getSafety():setEnabled(false) -- Enable PvP
            else
                -- Store the username before hiding it
                if not originalAdminUsernames[player] then
                    originalAdminUsernames[player] = player:getUsername()
                end
                player:setAlpha(0)                  -- Make invisible
                player:setShowAdminTag(false)       -- Hide admin tag
                player:setUsername("")              -- Hide username
                player:getSafety():setEnabled(true) -- Disable PvP
            end
        end
    end

    -- Print visibility status to console for admins/observers
    local localPlayer = getPlayer()
    if isAdmin(localPlayer) or temporaryObserverState[localPlayer:getUsername()] then
        local statusMessage = isInvisible and "Showing" or "Hiding"
        print(string.format("%s the %d admins/observers", statusMessage, adminCount))
    end

    isInvisible = not isInvisible
end

-- Function to toggle between admin and observer access levels for the player
local function togglePlayerAccessLevel()
    local player = getPlayer()
    local playerName = player:getUsername()

    if isAdmin(player) then
        player:setAccessLevel("Observer")
        temporaryObserverState[playerName] = true
        print(string.format("Set %s to Observer.", playerName))
    elseif isObserver(player) and temporaryObserverState[playerName] then
        player:setAccessLevel("admin")
        temporaryObserverState[playerName] = false
        print(string.format("Set %s to Admin.", playerName))
    end
end

-- Key press detection function
local function handleKeyPress(key)
    local player = getPlayer()

    -- Allow actions only for admins or observers
    if not isAdmin(player) and not isObserver(player) and not temporaryObserverState[player:getUsername()] then
        return
    end

    -- NUMPAD "0" key to toggle visibility for all admins/observers
    if key == getCore():getKey("ToggleNameVisibility") then
        toggleAdminVisibility()
    end

    -- NUMPAD "." key to toggle access level for the current player
    if key == getCore():getKey("ToggleAccessLevel") then
        togglePlayerAccessLevel()
    end
end

-- Function to maintain invisibility for admin and observer players
local function maintainAdminInvisibility()
    if isInvisible then
        local players = getOnlinePlayers()
        if not players then return end

        for i = 0, players:size() - 1 do
            local player = players:get(i)
            if isAdmin(player) or isObserver(player) then
                player:setAlpha(0)
                player:setShowAdminTag(false)
                player:setUsername("")
            end
        end
    end
end

-- Add events to listen for key presses and ticks
Events.OnKeyPressed.Add(handleKeyPress)
Events.OnTick.Add(maintainAdminInvisibility)

-- Initialize the script
print("Admin/Observer visibility and access level toggle script initialized.")

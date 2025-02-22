local AdminKeybindsUtils = {}

---Function to check if a player is an admin
---@param character IsoPlayer
function AdminKeybindsUtils.isPlayerAdmin(character)
    if not character then return false end
    if character:getAccessLevel() ~= "None" then return true else return false end
end

---Function to add a message in a player's chat
---@param message string
---@param args table {args.color = {r = 0, g = 0, b = 1}, args.serverAlert = false, args.serverAuthor = false, args.isLocal = true}
function AdminKeybindsUtils.addLineInChat(message, args)
    local _Chat = ISChat.instance;
    local _TabID = 0;
    local _Tab;

    for i, tab in ipairs(_Chat.tabs) do
        if tab and tab.tabID == _TabID then
            _Tab = tab;
            break;
        end
    end

    local _FoundMessage = nil;
    for i, msg in ipairs(_Tab.chatMessages) do
        if (msg and not _FoundMessage) then
            _FoundMessage = msg;
        end;
    end

    local color = args.color or { r = 0, g = 0, b = 1 }
    local colorStr = "<RGB:" .. color.r .. "," .. color.g .. "," .. color.b .. ">"
    local message = colorStr .. message

    local _NewMsg = _FoundMessage:clone();
    _NewMsg:setText(message);
    _NewMsg:setServerAlert(args.serverAlert or false);
    _NewMsg:setServerAuthor(args.serverAuthor or false);
    _NewMsg:setLocal(args.isLocal or true);

    ISChat.instance.addLineInChat(_NewMsg, 0);
end;

return AdminKeybindsUtils

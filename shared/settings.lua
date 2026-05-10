return {
    -- The name of your server
    ServerName = 'LumaNode Studios',

    -- The locale/language format used for dates and times displayed in the UI
    Timezone = 'en-US',

    -- Controls the colour scheme of the pause menu UI
    Theme = {
        primary = '#6ed3f3',
        primaryDark = '#4fbfdf',
        primaryText = '#000000'
    },

    -- The key players press to open the pause menu (e.g. 'ESCAPE', 'F1', 'F2')
    Keybind = 'ESCAPE',

    -- URL to the background or banner image displayed inside the pause menu
    ImageMap = 'https://r2.fivemanage.com/ikenZGXRwE4faTVyko8MZ/pausemap.png',

    -- Navigation Buttons
    -- Buttons shown in the main pause menu navigation bar
    -- Each button requires:
    --   label  : Text displayed on the button
    --   action : What happens when clicked ('hide-ui', 'settings', 'keybinds', 'logout')
    --   icon   : FontAwesome icon class (https://fontawesome.com/icons)
    NavButtons = {
        { label = 'RESUME',     action = 'hide-ui',   icon = 'fas fa-play' },
        { label = 'SETTINGS',   action = 'settings',  icon = 'fas fa-cog' },
        { label = 'KEYBINDS',   action = 'keybinds',  icon = 'fas fa-keyboard' },
        { label = 'DISCONNECT', action = 'logout',     icon = 'fas fa-sign-out-alt' }
    },

    -- Information Center
    -- Cards displayed in the info/home panel of the pause menu
    -- Each card requires:
    --   label   : Card title shown in the UI
    --   desc    : Short subtitle/description shown under the label
    --   icon    : FontAwesome icon class
    --   type    : How the card opens its content (currently only 'modal' is supported)
    --   title   : Heading shown at the top of the modal popup
    --   content : Either a string (plain paragraph) or a table of { title, text } sections
    -- Optional fields:
    --   isDiscord  : Set to true to render the card as a Discord invite widget
    --   inviteCode : The Discord invite code (without discord.gg/) — required if isDiscord is true
    InfoCards = {
        { 
            label = 'Server Rules', 
            desc = 'Read our guidelines', 
            icon = 'fas fa-gavel', 
            type = 'modal',
            title = 'SERVER RULES',
            -- Each entry is a rule displayed as its own section with a title and body text
            content = {
                { title = '1. Respect',       text = 'Treat all players with respect. Harassment, racism, and toxicity will not be tolerated.' },
                { title = '2. Roleplay',      text = 'Stay in character at all times. Value your life and engage in realistic interactions.' },
                { title = '3. Exploiting',    text = 'Cheating, macroing, or exploiting game mechanics is strictly prohibited.' },
                { title = '4. Communication', text = 'A working microphone is required. Keep OOC talk to a minimum.' }
            }
        },
        { 
            label = 'About Us', 
            desc = 'Our Story & Vision', 
            icon = 'fas fa-info-circle', 
            type = 'modal',
            title = 'LUMANODE STUDIOS',
            -- Plain string content renders as a single paragraph inside the modal
            content = "LumaNode Studios was founded on the principle of high-quality, immersive roleplay. Our mission is to provide a stable, feature-rich environment where your stories can come to life. We are community-driven and constantly evolving based on player feedback."
        },
        { 
            label = 'Our Discord', 
            desc = 'Join the community', 
            icon = 'fab fa-discord', 
            type = 'modal',
            title = 'COMMUNITY DISCORD',
            -- Enables the Discord invite widget inside the modal instead of plain text
            isDiscord = true,
            -- The invite code only — do NOT include 'discord.gg/' here, just the code itself
            inviteCode = 'h9qMAJfrjF',
            content = "Join our Discord to stay up to date with updates, events, and community announcements. You can also open support tickets and apply for whitelisted jobs."
        },
        { 
            label = 'Support', 
            desc = 'Need some help?', 
            icon = 'fas fa-headset', 
            type = 'modal',
            title = 'GETTING HELP',
            content = {
                { title = 'In-Game Help',      text = 'Use the /report command to contact an online staff member for immediate issues.' },
                { title = 'Support Tickets',   text = 'For complex issues, bans, or player reports, please open a ticket in our Discord.' },
                { title = 'Wiki & Guides',     text = 'Check our community guides for tutorials on server mechanics and jobs.' }
            }
        }
    },

    -- Announcements
    -- List of announcements shown on the news/announcement panel
    -- Each announcement requires:
    --   author  : Name of who posted the announcement (e.g. 'Admin', 'System')
    --   date    : Display date in DD-MM-YYYY format
    --   time    : Display time in HH:MM AM/PM format
    --   title   : Bold heading for the announcement
    --   content : Body text of the announcement
    Announcements = {
        {
            author  = 'Admin',
            date    = '05-02-2026',
            time    = '12:58 PM',
            title   = 'NEW UPDATE',
            content = 'We have just pushed a new update to the server! Check out the changelog in our discord for more information about the new vehicles and houses.'
        },
        {
            author  = 'System',
            date    = '04-02-2026',
            time    = '03:13 AM',
            title   = 'SERVER RULES',
            content = 'Please respect all members of this community. No racism, sexism or disrespectful behaviour. If you need help, open a support ticket.'
        }
    }
}
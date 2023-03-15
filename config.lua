config = {
    QBCore = true,
    chatTypes = {
        --[[ 
             command = "ooc", The trigger for the command (the / is not needed)
             prefix = "OOC |", the chat prefix for this command
             messageFormat = "^7:", The suffix of the message, this will be added after the users name     
             color = {r = 128, g = 128, b = 128}, The initial color of the message (Any further formatting codes will over-ride this color)
             sendToAll = true, Send to everyone? (Set to false if you want to only send to people with the below permission)
             permissions = {
                    acePermissions = {"staff"}, The ace permission the user needs to be allowed to use this command (Set to false if you want everyone to be able to use it)
                    jobs = {"police", "ems"}, The job the user needs to be allowed to use this command (Set to false if you want everyone to be able to use it)
                    jobTypes = {"leo"}, The job type the user needs to be allowed to use this command (Set to false if you want everyone to be able to use it)
                    identifiers = {"steam:123456789"}, The identifiers the user needs to be allowed to use this command (Set to false if you want everyone to be able to use it)
             } OR false if you want everyone to be able to use it
             proximity = false, If the command is based on proximity or not, false = global, set a float otherwise
             nameFormatting = {
                 {
                     priority = 1, The lower the number the higher the priority, this will ensure the user gets the highest level formatting
                     permission = "Mod", the ace permission the user needs to be allowed to have this formatting (Set to false if you want a default format)
                     format = "^6", the formatting itself, this will change only the username of the user
                 },
             },
        ]]--
        {
            command = "ooc",
            prefix = "OOC ^7|",
            color = {r = 128, g = 128, b = 128},
            sendToAll = true,
            permissions = false,
            proximity = false,
            nameFormatting = {
                {
                    priority = 1,
                    permission = "owner",
                    format = "^5",
                },
                {
                    priority = 5,
                    permission = "staff",
                    format = "^3",
                },
                {
                    priority = 99,
                    permission = false,
                    format = ""
                }
            },
        },
        {
            command = "sc",
            prefix = "^3STAFF ^7|",
            color = {r = 128, g = 128, b = 128},
            sendToAll = false,
            permissions = {
                acePermissions = {"staff"},
            },
            proximity = false,
            nameFormatting = {
                {
                    priority = 1,
                    permission = "owner",
                    format = "^5",
                },
                {
                    priority = 5,
                    permission = "staff",
                    format = "^3",
                },
                {
                    priority = 99,
                    permission = false,
                    format = ""
                }
            },
        },
        {
            command = "leo",
            prefix = "^4LEO ^7|",
            color = {r = 128, g = 128, b = 128},
            sendToAll = false,
            permissions = {
                jobs = {"police"},
                jobTypes = {"leo"}
            },
            proximity = false,
            nameFormatting = {
                {
                    priority = 1,
                    permission = "owner",
                    format = "^5",
                },
                {
                    priority = 5,
                    permission = "staff",
                    format = "^3",
                },
                {
                    priority = 99,
                    permission = false,
                    format = ""
                }
            },
        },
        {
            command = "me",
            prefix = "^6ME ^7|",
            color = {r = 128, g = 128, b = 128},
            sendToAll = true,
            permissions = false,
            proximity = 19.99,
            nameFormatting = {
                {
                    priority = 1,
                    permission = "owner",
                    format = "^5",
                },
                {
                    priority = 5,
                    permission = "staff",
                    format = "^3",
                },
                {
                    priority = 99,
                    permission = false,
                    format = "^6"
                }
            },
        },
    },
}

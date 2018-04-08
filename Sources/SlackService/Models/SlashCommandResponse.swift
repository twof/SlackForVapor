import Vapor

//example

//{
//    "response_type": "in_channel",
//    "text": "It's 80 degrees right now.",
//    "attachments": [
//    {
//    "text":"Partly cloudy today and tomorrow"
//    }
//    ]
//}

public enum SlashCommandResponseType: String, Content {
    case inChannel = "in_channel"
    case ephemeral
}

public struct SlashCommandResponse: Content {
    let responseType: SlashCommandResponseType
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case responseType = "response_type"
        case text
    }
}

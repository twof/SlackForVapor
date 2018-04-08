import Foundation
import Vapor

//{
//    "ok": true,
//    "channel": "DA30NL4GM",
//    "ts": "1523183331.000083",
//    "message": {
//        "type": "message",
//        "user": "UA20RHA4C",
//        "text": "The restroom is ready for you",
//        "bot_id": "BA20RHA3E",
//        "ts": "1523183331.000083"
//    },
//    "warning": "superfluous_charset",
//    "response_metadata": {
//        "warnings": [
//        "superfluous_charset"
//        ]
//    }
//}

public struct Attachment: Content {
    public let text: String
    public let id: Int
    public let fallback: String
}

public struct Message: Content {
    public let type: String
    public let username: String
    public let text: String
    public let attachments: [Attachment]?
    public let subtype: String?
    
    enum CodingKeys: String, CodingKey {
        case text
        case username = "user"
        case attachments
        case type
        case subtype
    }
}

public struct SendMessageResponse: Content {
    public let channel: String
    public let message: Message
}

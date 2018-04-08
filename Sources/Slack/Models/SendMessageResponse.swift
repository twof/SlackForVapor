import Foundation
import Vapor

//{
//    "ok": true,
//    "channel": "C1H9RESGL",
//    "ts": "1503435956.000247",
//    "message": {
//        "text": "Here's a message for you",
//        "username": "ecto1",
//        "bot_id": "B19LU7CSY",
//        "attachments": [
//        {
//        "text": "This is an attachment",
//        "id": 1,
//        "fallback": "This is an attachment's fallback"
//        }
//        ],
//        "type": "message",
//        "subtype": "bot_message",
//        "ts": "1503435956.000247"
//    }
//}

public struct Attachment: Content {
    let text: String
    let id: Int
    let fallback: String
}

public struct Message: Content {
    let text: String
    let username: String
    let attachments: [Attachment]
    let type: String
    let subtype: String
}

public struct SendMessageResponse: Content {
    let channel: String
    let message: Message
}

import Vapor
import Foundation
// Example
//{
//    "ok": true,
//    "channel": {
//        "id": "D947RLWRX"
//    }
//}

fileprivate struct Channel: Codable {
    let id: String
}

public struct OpenIMResponse: Content {
    fileprivate let channel: Channel
    public var channelId: String {
        return self.channel.id
    }
}

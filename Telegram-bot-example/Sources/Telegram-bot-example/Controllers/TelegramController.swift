//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 10.03.2023.
//

import Foundation
import Vapor
import TelegramVaporBot

final class TelegramController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.get("telegramWebHook", use: telegramWebHook)
    }
}

extension TelegramController {
    
    func telegramWebHook(_ req: Request) async throws -> Bool {
        let update: TGUpdate = try req.content.decode(TGUpdate.self)
        try await TGBotConnection.dispatcher.process([update])
        return true
    }
}

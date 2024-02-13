//
//  DIManager.swift
//  Cards
//
//  Created by Tesla on 14/02/24.
//

import Foundation
import Swinject

class DIManager {
    static var shared = DIManager()
    
    private var assembler: Assembler

    private init() {
        assembler = Assembler([
            CardListViewModelAssembly(),
            CardListRepoAssembly(),
            APIServiceAssembly(),
            APIAssembly(),
            ClientAssembly()
        ])
    }

    func resolve<T>(_ type: T.Type) -> T? {
        return assembler.resolver.resolve(type)
    }
}

class CardListViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CardListViewModel.self) { r in
            let repo = r.resolve(CardListRepoProtocol.self)!
            return CardListViewModel(repo: repo)
        }.inObjectScope(.transient)
    }
}

class CardListRepoAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CardListRepoProtocol.self) { r in
            let apiService = r.resolve(APIServiceProtocol.self)!
            return CardListRepoProvider(apiService: apiService)
        }.inObjectScope(.transient)
    }
}

class APIServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(APIServiceProtocol.self) { r in
            let api = r.resolve(API.self)!
            let client = r.resolve(HTTPClientProtocol.self)!
            return APIService(api: api, client: client)
        }.inObjectScope(.transient)
    }
}

class ClientAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HTTPClientProtocol.self) { _ in
            RestClient()
        }.inObjectScope(.transient)
    }
}

class APIAssembly: Assembly {
    func assemble(container: Container) {
        container.register(API.self) { _ in
            API.default
        }.inObjectScope(.transient)
    }
}

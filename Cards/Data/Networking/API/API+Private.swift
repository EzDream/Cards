//
//  API.swift
//  Cards
//
//  Created by Tesla on 13/02/24.
//

import Foundation

struct API {
    private var server: APIProtocol

    init(server: APIProtocol) {
        self.server = server
    }

    internal func api(_ subpath: String) -> URL? {
        let path = "\(server.baseURL)/\(subpath)"
        return URL(string: path)
    }
}

extension API {
    static var dev:API {
        API(server: DevServer())
    }
    
    static var prod:API {
        API(server: ProdServer())
    }
}

// Dev Server
private struct DevServer: APIProtocol {
    var baseURL: String = "https://random-data-api.com"
}

// Production Server
private struct ProdServer: APIProtocol {
    var baseURL: String = "https://random-data-api.com"
}

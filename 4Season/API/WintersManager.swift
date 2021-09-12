//
//  WintersManager.swift
//  4Season
//
//  Created by Nika on 23.07.21.
//

import Foundation

protocol WintersManagerProtocol: AnyObject {
    func getWintersList(completion: @escaping (([Winter]) -> Void))
}

class WintersManager: WintersManagerProtocol {
    
    func getWintersList(completion: @escaping (([Winter]) -> Void)) {
        let url = "https://run.mocky.io/v3/b09f3248-6d12-4eb3-ac5f-e89564ac4067"
        NetworkManager.shared.get(url: url) { (result: Result<[Winter], Error>) in
            switch result {
            case .success(let winters):
                completion(winters)
            case .failure(let error):
                print(error)
            }
        }
    }
}

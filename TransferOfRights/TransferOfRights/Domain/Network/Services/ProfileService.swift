//
//  ProfileService.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 19.04.2023.
//

import Foundation
import Combine

protocol ProfileServiceProtocol: AnyObject {
    func getProfile() -> Future<ProfileModel, Never>
}

class ProfileService: ProfileServiceProtocol {
    
    func getProfile() -> Future<ProfileModel, Never>{
        return Future { data in
            data(.success(ProfileModel.mock))
        }
    }
}

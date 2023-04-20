//
//  Profile.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 19.04.2023.
//

import Foundation

struct ProfileModel: Identifiable, Hashable {
    let id = UUID()
    let addresses: [Addresses]
    
    static let mock = ProfileModel(addresses: [mockAddresses, mockAddresses])

    static let mockAddresses = Addresses(id: UUID(), city: "г. Ульяновск", address: "ул. Аблукова 228, кв.1403", people:[
        People(phoneNamber: "", lastName: "", firstName: "", serName: "", possibilities:
        Possibilities(payment: false, presentTestimony: false))])
}

struct Addresses: Identifiable, Hashable {
    var id: UUID
    var city: String
    var address: String
    var people: [People]?
}

struct People: Hashable {
    let phoneNamber: String
    let lastName: String
    let firstName: String
    let serName: String
    let possibilities: Possibilities?
}

struct Possibilities: Hashable {
    let payment: Bool
    let presentTestimony: Bool
}

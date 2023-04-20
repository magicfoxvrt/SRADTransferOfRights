//
//  AddPersonViewModel.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 19.04.2023.
//

import Foundation
import Combine

class AddPersonViewModel: ObservableObject {
    
    @Published var number = ""
    @Published var lastName = ""
    @Published var firstName = ""
    @Published var surName = ""
    
    @Published var isValidateNumber = false
    @Published var isValidateLastName = false
    @Published var isValidateFirstName = false
    @Published var isValidateSurName = false
    
    @Published var isShowCapability = false
    @Published var addressesModel: Addresses
    
    init(addressesModel: Addresses) {
        self.addressesModel = addressesModel
    }
    
    func fieldValidation(completion: @escaping () -> Void) {
        if !number.isEmpty && !lastName.isEmpty && !firstName.isEmpty && !surName.isEmpty {
            let people = People(phoneNamber: number, lastName: lastName, firstName: firstName, serName: surName, possibilities:
                         Possibilities(payment: true, presentTestimony: false))
            addressesModel.people?.append(people)
            completion()
        } else {
            number.isEmpty ? (isValidateNumber = true) : (isValidateNumber = false)
            lastName.isEmpty ? (isValidateLastName = true) : (isValidateLastName = false)
            firstName.isEmpty ? (isValidateFirstName = true) : (isValidateFirstName = false)
            surName.isEmpty ? (isValidateSurName = true) : (isValidateSurName = false)
        }
    }
}


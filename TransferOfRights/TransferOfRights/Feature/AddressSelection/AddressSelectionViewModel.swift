//
//  AddressSelectionViewModel.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 19.04.2023.
//

import Foundation
import Combine

class AddressSelectionViewModel: ObservableObject {
    
    @Published var profileModel: [Addresses] = []
    
    let services: ProfileServiceProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    init(services: ProfileServiceProtocol) {
        self.services = services
    }
    
    func getData(){
        services.getProfile()
            .sink { [weak self] data in
                guard let self = self else {return}
                self.profileModel = data.addresses
            }.store(in: &cancellables)
    }
}

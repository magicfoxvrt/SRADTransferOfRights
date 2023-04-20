//
//  CapabilityViewModel.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 20.04.2023.
//

import Foundation
import Combine

class CapabilityViewModel: ObservableObject {
    
    @Published var payment = false
    @Published var transmissionOfTestimony = false
    @Published var returnText = CapabilityState.default.text
    
    @Published private var paymentCheck = false
    @Published private var transmissionOfTestimonyCheck = false
    
    private var cancellable: Set<AnyCancellable> = []
    
    @Published var addressesModel: Addresses
    
    init(addressesModel: Addresses) {
        self.addressesModel = addressesModel
        
        configurationToggleView(addressesModel: addressesModel)
        
        $payment
            .map { payment in
                return payment
            }
            .assign(to: \.paymentCheck, on: self)
            .store(in: &cancellable)
        
        $transmissionOfTestimony
            .map { transmissionOfTestimony in
                return transmissionOfTestimony
            }
            .assign(to: \.transmissionOfTestimonyCheck, on: self)
            .store(in: &cancellable)
        
        Publishers.CombineLatest($paymentCheck, $transmissionOfTestimonyCheck)
            .map { paymentCheck, transmissionOfTestimonyCheck in

                self.returnText(name: self.configurationDiscription(addressesModel: addressesModel),
                                address: addressesModel.address,
                                toggle1: paymentCheck,
                                toggle2: transmissionOfTestimonyCheck)
            }
            .assign(to: \.returnText, on: self)
            .store(in: &cancellable)
    }
    
    private func returnText(name: String, address: String, toggle1: Bool, toggle2: Bool) -> String {
        if (toggle1 && toggle2) {
            return CapabilityState.paymentAndTransmissionOfTestimony(name, address).text
        }
        
        if (toggle1 && !toggle2) {
            return CapabilityState.payment(name, address).text
        }
        
        if (!toggle1 && toggle2) {
            return CapabilityState.transmissionOfTestimony(name, address).text
        }
        
        return CapabilityState.default.text
    }
    
    private func configurationDiscription(addressesModel: Addresses) -> String{
        guard let firstName = addressesModel.people?.last?.firstName else {
            return ""
        }
        
        guard let lastName = addressesModel.people?.last?.lastName.prefix(1) else {
            return  firstName + ""
        }
        
        return firstName + " " + lastName + "."
    }
    
    private func configurationToggleView(addressesModel: Addresses) {
        guard let payment = addressesModel.people?.last?.possibilities?.payment,
              let presentTestimony = addressesModel.people?.last?.possibilities?.presentTestimony else {
            return
        }
        self.payment = payment
        self.transmissionOfTestimony = presentTestimony
    }
}

extension CapabilityViewModel {
    enum CapabilityState {
        case payment(String, String)
        case transmissionOfTestimony(String, String)
        case paymentAndTransmissionOfTestimony(String, String)
        case `default`
        
        var text: String {
            switch self {
            case .payment(let name, let address):
                return "\(name) сможет оплачивать квитанции по квартире \(address)"
            case .transmissionOfTestimony(let name, let address):
                return "\(name) сможет передавать показания счетчиков по квартире \(address)"
            case .paymentAndTransmissionOfTestimony(let name, let address):
                return "\(name) сможет оплачивать квитанции и передавать показания счетчиков по квартире \(address)"
            case .default:
                return ""
            }
        }
    }
}

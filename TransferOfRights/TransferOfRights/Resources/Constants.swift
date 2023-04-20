//
//  Constants.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 20.04.2023.
//

import Foundation
import SwiftUI

enum K {
    enum DefaultColors {
        static let colorGrey03 = Color(UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.3))
        static let colorGreyAlpha4 = Color(UIColor(red: 0.153, green: 0.153, blue: 0.153, alpha: 0.4))
        static let colorBlue = Color(UIColor(red: 0.953, green: 0.957, blue: 0.961, alpha: 1))
        static let colorGreyLight = Color(UIColor(red: 0.247, green: 0.447, blue: 0.961, alpha: 1))
        static let colorRedLight = Color(UIColor(red: 1, green: 0.922, blue: 0.918, alpha: 1))
    }
    
    enum DefaultFont {
        static let rubikMedium = "Rubik-Medium"
        static let rubikRegular = "Rubik-Regular"
    }
    
    enum Images {
        static let nextView = "Vector"
        static let backView = "VectorBackBlue"
        static let nextWithView = "VectorWithNext"
    }
    
    enum DefaultConstants {
        static let defaultPadding: CGFloat = 16
        static let defaultCornerRadius: CGFloat = 22
    }
    
    enum Text {
        static let chooseAnAddress: String = "Выбрать адрес"
        
        static let chooseAndAddress: String = "Выберите адрес"
        static let clickOnTheApartment: String = "Нажмите на квартиру, которой хотите поделиться"
        
        static let addPerson: String = "Добавить человека"
        static let phoneNumberPholder: String = "Номер телефона"
        static let lastNamePholder: String = "Фамилия"
        static let firstNamePholder: String = "Имя"
        static let surNamePholder: String = "Отчество"
        
        static let continueNext: String = "Продолжить"
        static let continueFinish: String = "Завершить"
        
        static let possibilities: String = "Возможности"
        static let paymentOfReceipts: String = "Оплата квитанций"
        static let transferOfTestimony: String = "Передача показаний счетчиков"
    }
}

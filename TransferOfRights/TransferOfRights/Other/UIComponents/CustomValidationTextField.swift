//
//  CustomValidationTextField.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 20.04.2023.
//

import SwiftUI

struct CustomValidationTextField: View {
    
    @Binding var text: String
    @Binding var textCheck: Bool
    
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .font(.custom(K.DefaultFont.rubikRegular, size: 16))
            .lineLimit(1)
            .padding(.leading, K.DefaultConstants.defaultPadding)
            .frame(height: Constants.textHeight)
            .background(textCheck ? K.DefaultColors.colorRedLight : K.DefaultColors.colorBlue)
            .cornerRadius(Constants.textCornerRadius)
    }
}

extension CustomValidationTextField {
    enum Constants {
        static let textHeight: CGFloat = 56
        static let textCornerRadius: CGFloat = 12
    }
}

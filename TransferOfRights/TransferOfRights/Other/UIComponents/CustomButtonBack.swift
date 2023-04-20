//
//  CustomButtonBack.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 20.04.2023.
//

import SwiftUI

struct CustomButtonBack: View {
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .fill(K.DefaultColors.colorBlue)
                .frame(width: Constants.rectangleBackFrame.width,
                       height: Constants.rectangleBackFrame.height)
                .cornerRadius(Constants.rectangleCornerRadius)
            
            Image(K.Images.backView)
                .frame(width: Constants.imageFrame.width,
                       height: Constants.imageFrame.height)
        }
    }
}

extension CustomButtonBack {
    enum Constants {
        static let rectangleBackFrame = CGSize(width: 50, height: 50)
        static let imageFrame = CGSize(width: 14, height: 7)
        static let rectangleCornerRadius: CGFloat = 12
        
    }
}

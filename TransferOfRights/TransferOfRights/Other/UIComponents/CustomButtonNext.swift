//
//  CustomButtonNext.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 20.04.2023.
//

import SwiftUI

struct CustomButtonNext: View {
    
    let titleButton: String
    let action: () -> Void
    
    var body: some View {
        
        Button {
            action()
        } label: {
            HStack(alignment: .center) {
                Text(titleButton)
                    .font(.custom(K.DefaultFont.rubikRegular, size: 16))
                    .foregroundColor(.white)
                    .padding(.trailing, 8)
                Image(K.Images.nextWithView)
                    .frame(width: Constants.imageFrame.width,
                           height: Constants.imageFrame.height)
                    .padding(.top, 1)
            }
            .frame(width: Constants.rectangleNextFrame.width,
                   height: Constants.rectangleNextFrame.height)
            .background(K.DefaultColors.colorGreyLight)
            .cornerRadius(Constants.rectangleCornerRadius)
        }
    }
}

extension CustomButtonNext {
    enum Constants {
        static let imageFrame = CGSize(width: 14, height: 7)
        static let rectangleCornerRadius: CGFloat = 12
        static let rectangleNextFrame = CGSize(width: 164, height: 50)
    }
}

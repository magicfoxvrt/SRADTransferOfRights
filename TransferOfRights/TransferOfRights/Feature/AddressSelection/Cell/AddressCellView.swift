//
//  AddressCellView.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 19.04.2023.
//

import SwiftUI

struct AddressCellView: View {
    
    @Binding var addressesModel: Addresses
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(addressesModel.city)
                    .font(.custom(K.DefaultFont.rubikMedium, size: 20))
                    .foregroundColor(.black)
                    .padding([.top, .leading], K.DefaultConstants.defaultPadding)
                
                Spacer()
                
                Text(addressesModel.address)
                    .font(.custom(K.DefaultFont.rubikRegular, size: 16))
                    .foregroundColor(.black.opacity(0.4))
                    .padding([.bottom, .leading], K.DefaultConstants.defaultPadding)
            }
            
            Spacer()
            
            Image(K.Images.nextView)
                .frame(width: Constants.imageNextFrame.width,
                       height: Constants.imageNextFrame.height)
                .padding(.trailing, Constants.imagePaddingRight)
        }
        .background(Color.white)
        .frame(height: Constants.viewFrameHeight)
        .cornerRadius(K.DefaultConstants.defaultCornerRadius)
        .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 20)
    }
}

extension AddressCellView {
    enum Constants {
        static let imageNextFrame = CGSize(width: 8, height: 14)
        static let imagePaddingRight: CGFloat = 19
        static let viewFrameHeight: CGFloat = 84
    }
}

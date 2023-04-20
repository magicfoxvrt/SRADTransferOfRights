//
//  MainScreenView.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 19.04.2023.
//

import SwiftUI

struct MainScreenView: View {
    
    @State private var showingSheet = true
    
    var body: some View {
        VStack {
            Spacer()
            
            presentButtonTap
            
                .sheet(isPresented: $showingSheet) {
                    AddressSelectionView(viewModel: AddressSelectionViewModel(services: ProfileService()), isPresented: $showingSheet)
                }
            
        }
    }
    
    var presentButtonTap: some View {
        Button {
            showingSheet.toggle()
        } label: {
            ZStack(alignment: .center) {
                Rectangle()
                    .fill(K.DefaultColors.colorGrey03)
                    .frame(minWidth: Constants.zeroSize, maxWidth: .infinity,
                           minHeight: Constants.zeroSize, maxHeight: Constants.buttonHeight)
                    .cornerRadius(Constants.buttonCRadius)
                    .padding(.horizontal, K.DefaultConstants.defaultPadding)
                
                Text(K.Text.chooseAnAddress)
                    .font(.custom(K.DefaultFont.rubikRegular, size: 16))
                    .foregroundColor(.black)
            }
        }
    }
}

extension MainScreenView {
    enum Constants {
        static let buttonHeight: CGFloat = 56
        static let buttonCRadius: CGFloat = 18
        static let zeroSize: CGFloat = 0
    }
}

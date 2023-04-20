//
//  CapabilityView.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 20.04.2023.
//

import SwiftUI

struct CapabilityView: View {
    
    @Binding var isPresented: Bool
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel: CapabilityViewModel
    
    var body: some View {
        VStack {
            LineView()
            
            VStack(alignment: .leading){
                Text(K.Text.possibilities)
                    .foregroundColor(.black)
                    .font(.custom(K.DefaultFont.rubikMedium, size: 28))
                    .padding(.bottom, Constants.titlePaddingBot)
                
                toggleMenu
                
                Text(viewModel.returnText)
                    .font(.custom(K.DefaultFont.rubikRegular, size: 15))
                    .foregroundColor(K.DefaultColors.colorGreyAlpha4)
                    .padding(.top, Constants.descriptionTextPaddingBot)
                
                Spacer()
                
                botNavigation
                
            }
            .padding(.top, Constants.containerViewTPadding)
        }
        .padding(.top, Constants.containerViewAllTPadding)
        .padding(.horizontal, K.DefaultConstants.defaultPadding)
        .navigationBarHidden(true)
    }
    
    var toggleMenu: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(K.DefaultColors.colorBlue)
                    .cornerRadius(Constants.rectangleCornerRadius)
                
                VStack {
                    HStack {
                        Text(K.Text.paymentOfReceipts)
                            .font(.custom(K.DefaultFont.rubikRegular, size: 16))
                        
                        Spacer()
                        
                        Toggle("", isOn: $viewModel.payment)
                            .frame(width: Constants.toggleWidth)
                            .padding(.trailing, K.DefaultConstants.defaultPadding)
                            .toggleStyle(SwitchToggleStyle(tint: K.DefaultColors.colorGreyLight))
                    }
                    .padding(.top, Constants.togglePedding)
                    .padding(.horizontal, K.DefaultConstants.defaultPadding)
                    .padding(.bottom, Constants.togglePedding)
                    
                    HStack {
                        Text(K.Text.transferOfTestimony)
                            .font(.custom(K.DefaultFont.rubikRegular, size: 16))
                        
                        Spacer()
                        
                        Toggle("", isOn: $viewModel.transmissionOfTestimony)
                            .frame(width: Constants.toggleWidth)
                            .padding(.trailing, K.DefaultConstants.defaultPadding)
                            .toggleStyle(SwitchToggleStyle(tint: K.DefaultColors.colorGreyLight))
                    }
                    .padding(.bottom, Constants.togglePedding)
                    .padding(.horizontal, K.DefaultConstants.defaultPadding)
                }
            }
            
        }
        .frame(height: Constants.toggleStackWidth)
    }
    
    var botNavigation: some View {
        HStack {
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                CustomButtonBack()
            }
            .padding(.trailing, Constants.buttonSpacing)
            
            Button {
            } label: {
                CustomButtonNext(titleButton: K.Text.continueFinish){
                    isPresented = false
                }
            }
            .padding(.trailing, Constants.buttonSpacing)
        }
        .padding(.bottom, Constants.botNavigationPaddingBot)
    }
}

extension CapabilityView {
    enum Constants {
        static let titlePaddingBot: CGFloat = 24
        static let rectangleCornerRadius: CGFloat = 22
        static let toggleWidth: CGFloat = 50
        static let toggleStackWidth: CGFloat = 136
        static let togglePedding: CGFloat = 24
        static let buttonSpacing: CGFloat = 8
        static let containerViewTPadding: CGFloat = 28
        static let containerViewAllTPadding: CGFloat = 5
        static let botNavigationPaddingBot: CGFloat = 13
        static let descriptionTextPaddingBot: CGFloat = 12
    }
}

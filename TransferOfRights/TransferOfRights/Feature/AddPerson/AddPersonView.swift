//
//  AddPersonView.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 19.04.2023.
//

import SwiftUI

struct AddPersonView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel: AddPersonViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            LineView()
            
            VStack(alignment: .leading){
                Text(K.Text.addPerson)
                    .foregroundColor(.black)
                    .font(.custom(K.DefaultFont.rubikMedium, size: 28))
                    .padding(.bottom, Constants.titlePaddingBot)
                
                numberTextField
                
                lastNameTextField
                
                firstNameTextField
                
                surNameField
                
                Spacer()
                
                botNavigation
                
            }
            .padding(.top, Constants.containerViewTPadding)
        }
        .padding(.top, Constants.containerViewAllTPadding)
        .padding(.horizontal, K.DefaultConstants.defaultPadding)
        .navigationBarHidden(true)
    }
    
    var numberTextField: some View {
        CustomValidationTextField(text: $viewModel.number, textCheck: $viewModel.isValidateNumber, placeholder: K.Text.phoneNumberPholder)
            .onChange(of: viewModel.number, perform: { oldValue in
                viewModel.number = viewModel.number.format(with: "+X (XXX) XXX-XX-XX", phone: viewModel.number)
                
                let isEmpty = viewModel.number.isEmpty
                viewModel.isValidateNumber = isEmpty
            })
            .padding(.bottom, Constants.paddingCellBot)
    }
    
    var lastNameTextField: some View {
        CustomValidationTextField(text: $viewModel.lastName, textCheck: $viewModel.isValidateLastName, placeholder: K.Text.lastNamePholder)
            .onChange(of: viewModel.lastName, perform: { oldValue in
                let isEmpty = viewModel.lastName.isEmpty
                viewModel.isValidateLastName = isEmpty
            })
            .padding(.bottom, Constants.paddingCellBot)
    }
    
    var firstNameTextField: some View {
        CustomValidationTextField(text: $viewModel.firstName, textCheck: $viewModel.isValidateFirstName, placeholder: K.Text.firstNamePholder)
            .onChange(of: viewModel.firstName, perform: { oldValue in
                let isEmpty = viewModel.firstName.isEmpty
                viewModel.isValidateFirstName = isEmpty
            })
            .padding(.bottom, Constants.paddingCellBot)
    }
    
    var surNameField: some View {
        CustomValidationTextField(text: $viewModel.surName, textCheck: $viewModel.isValidateSurName, placeholder: K.Text.surNamePholder)
            .onChange(of: viewModel.surName, perform: { oldValue in
                let isEmpty = viewModel.surName.isEmpty
                viewModel.isValidateSurName = isEmpty
            })
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
            
            NavigationLink(isActive: $viewModel.isShowCapability) {
                CapabilityView(isPresented: $isPresented, viewModel: CapabilityViewModel())
            } label: {}
            
            CustomButtonNext(titleButton: K.Text.continueNext){
                viewModel.fieldValidation {
                    viewModel.isShowCapability = true
                }
            }
        }
        .padding(.bottom, Constants.botNavigationPaddingBot)
    }
}

extension AddPersonView {
    enum Constants {
        static let containerViewTPadding: CGFloat = 28
        static let containerViewAllTPadding: CGFloat = 5
        static let titlePaddingBot: CGFloat = 24
        static let paddingCellBot: CGFloat = 16
        static let buttonSpacing: CGFloat = 8
        static let botNavigationPaddingBot: CGFloat = 13
    }
}


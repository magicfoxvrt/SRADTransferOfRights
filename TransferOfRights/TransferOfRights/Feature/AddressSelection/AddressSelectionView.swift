//
//  AddressSelectionView.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 19.04.2023.
//

import SwiftUI

struct AddressSelectionView: View {
    
    @StateObject var viewModel: AddressSelectionViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                LineView()
                
                VStack(alignment: .leading) {
                    Text(K.Text.chooseAndAddress)
                        .foregroundColor(.black)
                        .font(.custom(K.DefaultFont.rubikMedium, size: 28))
                        .padding(.bottom, Constants.titlePaddingBot)
                        .padding(.horizontal, K.DefaultConstants.defaultPadding)
                    
                    Text(K.Text.clickOnTheApartment)
                        .font(.custom(K.DefaultFont.rubikRegular, size: 16))
                        .foregroundColor(.black.opacity(0.4))
                        .padding(.horizontal, K.DefaultConstants.defaultPadding)
                    
                    tableAddress
                }
                .padding(.top, Constants.containerViewTPadding)
                
                Spacer()
                
            }
            .padding(.top, Constants.containerViewAllTPadding)
        }
        .navigationBarHidden(true)
        
        .onAppear{
            viewModel.getData()
        }
    }
    
    var tableAddress: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach($viewModel.profileModel, id: \.self) { item in
                NavigationLink {
                    AddPersonView(viewModel: AddPersonViewModel(), isPresented: $isPresented)
                } label: {
                    AddressCellView(addressesModel: item)
                        .padding(.bottom, Constants.cellPadding)
                }
            }
            .padding(.top, Constants.tableCellPaddingTop)
            .padding(.bottom, K.DefaultConstants.defaultPadding)
            .padding(.horizontal, K.DefaultConstants.defaultPadding)
        }
        .padding(.top, Constants.tablePaddingTop)
    }
}

extension AddressSelectionView {
    enum Constants {
        static let cellPadding: CGFloat = 16
        static let titlePaddingBot: CGFloat = 24
        static let tablePaddingTop: CGFloat = 19
        static let tableCellPaddingTop: CGFloat = 5
        static let containerViewTPadding: CGFloat = 28
        static let containerViewAllTPadding: CGFloat = 5
    }
}

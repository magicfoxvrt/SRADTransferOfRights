//
//  LineView.swift
//  TransferOfRights
//
//  Created by Алексей Воротников on 19.04.2023.
//

import SwiftUI

struct LineView: View {
    
    enum Constants {
        static let capsuleFrame = CGSize(width: 36, height: 5)
    }
    
    var body: some View {
        VStack {
            Capsule()
                .fill(K.DefaultColors.colorGrey03)
                .frame (width: Constants.capsuleFrame.width,
                        height: Constants.capsuleFrame.height)
        }
    }
}

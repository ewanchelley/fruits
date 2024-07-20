//
//  FruitsBackground.swift
//  Fruits
//
//  Created by Ewan Chelley on 15/07/2024.
//

import SwiftUI

struct FruitsBackground: View {
    var body: some View {
        Image("fruit-background")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .blur(radius: 2)
    }
}

#Preview {
    FruitsBackground()
}

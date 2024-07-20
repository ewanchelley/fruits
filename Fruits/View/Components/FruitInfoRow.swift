//
//  FruitInfoRow.swift
//  Fruits
//
//  Created by Ewan Chelley on 15/07/2024.
//

import SwiftUI

struct FruitInfoRow: View {
    let iconName: String
    let label: String
    let value: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundStyle(color)
            Text(label)
                .foregroundStyle(.black)
            Spacer()
            Text(value)
                .foregroundStyle(color)
                .underline()
        }
        .font(.title2)
        .fontWeight(.medium)
    }
}

#Preview {
    FruitInfoRow(iconName: "figure", label: "Example", value: "23", color: .purple)
}

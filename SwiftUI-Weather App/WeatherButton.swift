//
//  WeatherButton.swift
//  SwiftUI-Weather App
//
//  Created by ADPopov on 13.01.2024.
//
import SwiftUI

struct ButtonView: View {
    let label: String
    let textColor: Color
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action();
        } label: {
            Text(label)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(10)
        }
    }
}

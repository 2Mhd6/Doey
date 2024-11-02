//
//  onboardingView.swift
//  Todo List
//
//  Created by Mohammed on 29/10/2024.
//

import SwiftUI

struct onboardingDetailView: View {
    
    var title: String
    var description: String
    var buttonTitle: String
    let action: () -> Void
    
    
    var body: some View {
        
        VStack(alignment:.center){
            Spacer()
            Spacer()
            Spacer()
            
            Spacer()
                .frame(height: 200)
            
            Text(title)
                .font(.title)
                .foregroundStyle(.primaryText)
                .bold()
                .multilineTextAlignment(.leading)

            Text(description)
                .foregroundStyle(.secondaryText)

            Spacer()
            Spacer()
            Spacer()
            
            Button {
                action()
            } label: {
                Text(buttonTitle)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .font(.title2)
                    .background(.blue)
                    .clipShape(.rect(cornerRadius: 15))
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.horizontal)
            }

            Spacer()
            
            
        }
        
    }
}

#Preview {
    onboardingDetailView(title: "Welcome to Todo List", description: "Organise your tasks effortlessly", buttonTitle: "Continue", action: {})
}

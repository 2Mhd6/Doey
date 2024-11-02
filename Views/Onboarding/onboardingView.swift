//
//  onboardingView.swift
//  Todo List
//
//  Created by Mohammed on 29/10/2024.
//

import SwiftUI

struct onboardingView: View {
    
    @State var selecetedTab: Int = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            
            AppColor.BackgroundColor
                .ignoresSafeArea()
            
            TabView(selection: $selecetedTab) {
                
                onboardingDetailView(title: "Welcome to Doey", description: "Organise your tasks effortlessly", buttonTitle: "Next", action: {
                    withAnimation {
                        selecetedTab = 1
                    }
                })
                .tag(0)
                
                onboardingDetailView(title: "Get Organised Today", description: "Get things done, effortlessly organised", buttonTitle: "Create My First Task") {
                    withAnimation {
                        dismiss()
                    }
                }
                .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
            .overlay{
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.leading,40)
                    .offset(y: -100)
            }
            .overlay {
                HStack{
                    
                    Circle()
                        .fill(selecetedTab == 0 ? .white : Color(red: 208/255, green: 213/255, blue: 221/255))
                        .frame(width: 10)
                        .padding(.horizontal)
                    
                    Circle()
                        .fill(selecetedTab == 1 ? .white : Color(red: 208/255, green: 213/255, blue: 221/255))
                        .frame(width: 10)
                        .padding(.horizontal)
                    
                }
                .padding(4)
                .clipShape(.rect(cornerRadius: 14))
                .offset(y: 140)
            }
        }
    }
}

#Preview {
    onboardingView()
}

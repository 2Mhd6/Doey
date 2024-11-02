//
//  StatusView.swift
//  Todo List
//
//  Created by Mohammed on 30/10/2024.
//

import SwiftUI

struct StatusView: View {
    
    let totalTask: Int
    let notCompletedTask: Int
    let completedTask: Int
    
    var colors: [Gradient.Stop] = [
        Gradient.Stop(color: AppColor.NotesTextColor, location: 0.2),
        Gradient.Stop(color: AppColor.BackgroundColor, location: 0.8)
    ]
    
    var body: some View {
        
        HStack(spacing: 20){
            
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(stops: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 100, height: 60)
                .overlay {
                    VStack{
                        Text("Tasks")
                            .font(.caption)
                        
                        Text(String(totalTask))
                            .font(.title3)
                            .bold()
                            .contentTransition(.numericText())
                    }
                }
            
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(stops: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 100, height: 60)
                .overlay {
                    VStack{
                        Text("Not Completed")
                            .font(.caption)
                        
                        Text(String(notCompletedTask))
                            .font(.title3)
                            .bold()
                            .contentTransition(.numericText())
                    }
                }
            
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(stops: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 100, height: 60)
                .overlay {
                    VStack{
                        Text("Completed")
                            .font(.caption)
                        
                        Text(String(completedTask))
                            .font(.title3)
                            .bold()
                            .contentTransition(.numericText())
                    }
                }
                
        }
        .foregroundStyle(AppColor.SecondaryTextColor)
        
    }
}

#Preview {
    StatusView(totalTask: 1, notCompletedTask: 1, completedTask: 1)
}

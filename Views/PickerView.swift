//
//  PickerView.swift
//  Todo List
//
//  Created by Mohammed on 30/10/2024.
//

import SwiftUI

struct PickerView: View {
    
    @State var isOptional = false
    @State var isImportant = false
    @State var isUrgent = false
    @Binding var typeOfTask: Int
    let isEditMode: Bool
    
    var selectedImportance: Int {
        if isOptional {
            return 0
        }else if isImportant {
            return 1
        }else if isUrgent{
            return 2
        }else {
            return -1
        }
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            HStack{
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(isOptional ? AppColor.OptionalTaskColor : AppColor.BackgroundColor)
                    .frame(width: 180, height: 40)
                    .onTapGesture {
                        withAnimation {
                            isOptional = true
                            isImportant = false
                            isUrgent = false
                            
                            typeOfTask = selectedImportance
                        }
                    }
                    .overlay {
                        Text("Optional")
                            .foregroundStyle(isOptional ? .white : .black)
                            .font(.title3)
                            .fontWeight(isOptional ? .bold : .regular)
                    }
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(isImportant ? AppColor.ImportantTaskColor : AppColor.BackgroundColor)
                    .frame(width: 180, height: 40)
                    .onTapGesture {
                        withAnimation {
                            isOptional = false
                            isImportant = true
                            isUrgent = false
                            
                            typeOfTask = selectedImportance
                        }
                    }
                    .overlay {
                        Text("Important")
                            .foregroundStyle(isImportant ? .white : .black)
                            .font(.title3)
                            .fontWeight(isImportant ? .bold : .regular)
                    }
                
            }
            
            RoundedRectangle(cornerRadius: 15)
                .fill(isUrgent ? AppColor.UrgentTaskColor : AppColor.BackgroundColor)
                .frame(width: .infinity, height: 40)
                .onTapGesture {
                    withAnimation {
                        isOptional = false
                        isImportant = false
                        isUrgent = true
                        
                        typeOfTask = selectedImportance
                    }
                }
                .overlay {
                    Text("Urgent")
                        .foregroundStyle(isUrgent ? .white : .black)
                        .font(.title3)
                        .fontWeight(isUrgent ? .bold : .regular)
                }
            
        }
        .onAppear{
            if isEditMode{
                
                switch typeOfTask {
                case 0:
                    isOptional = true
                case 1:
                    isImportant = true
                case 2:
                    isUrgent = true
                default:
                    isOptional = false
                    isImportant = false
                    isUrgent = false
                    
                }
            }
        }
        
    }
}

#Preview {
    PickerView(typeOfTask: .constant(0), isEditMode: true)
}

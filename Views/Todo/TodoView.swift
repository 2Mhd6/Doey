//
//  TodoView.swift
//  Todo List
//
//  Created by Mohammed on 29/10/2024.
//

import SwiftUI

struct TodoView: View {
    
    let todo: Todo
    var color: Color {
        switch todo.typeOfTask {
        case 0:
            Color(AppColor.OptionalTaskColor)
            
        case 1:
            Color(AppColor.ImportantTaskColor)
            
        case 2:
            Color(AppColor.UrgentTaskColor)
            
        default:
            Color(AppColor.OptionalTaskColor)
        }
    }
    
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 15)
                .fill(todo.isCompleted ? AppColor.TaskCompletedColor : color)
                .frame(width: .infinity, height: 100)
                .padding()
                .shadow(radius: 4,y: 4)
                .animation(.spring(.smooth), value: todo.isCompleted)
            
            HStack{
                

                
                Image(systemName: todo.isCompleted ? "checkmark.square" : "square")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .onTapGesture {
                        withAnimation{
                            todo.isCompleted.toggle()
                            
                        }
                    }

                Text(todo.title)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .bold()
                
                Spacer()
                
            }
            .padding(.horizontal)
            .overlay {
                
                RoundedRectangle(cornerRadius: 15)
                    .padding(.horizontal)
                    .frame(width: 258,height: todo.isCompleted ? 3 : 0)
                    .padding(.trailing,8)
                    .foregroundStyle(todo.isCompleted ? .white : .clear)
                    .animation(.bouncy, value: todo.isCompleted)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TodoView(todo: Todo())
}

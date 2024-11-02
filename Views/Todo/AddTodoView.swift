//
//  AddTodo.swift
//  Todo List
//
//  Created by Mohammed on 29/10/2024.
//

import SwiftUI
import SwiftData


struct AddTodoView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State var selectionOfPicker = 0
    @State var title: String = ""
    @State var typeOfTask: Int = -1
    var todo : Todo
    let isEditMode: Bool
    
    var body: some View {
        
        VStack(spacing: 20){
            
            VStack(alignment: .leading){
                Text(isEditMode ? "Edit Task" : "Add Tsak")
                    .font(.title2)
                    .foregroundStyle(AppColor.PrimaryTextColor)
                
                TextField("Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: title) { oldValue, newValue in
                        title = TextHelper.limtText(text: title, limt: 20)
                    }
                
                HStack{
                    Spacer()
                    
                    Text("\(title.count)/20")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                        .padding(.trailing,2)
                }
                

            }
            
            PickerView(typeOfTask: $typeOfTask, isEditMode: isEditMode)
            
            VStack{
                
                Button {
                    todo.title = title
                    todo.typeOfTask = typeOfTask
                    
                    
                    if !isEditMode {
                        todo.date = .now
                        context.insert(todo)
                    }
                    
                    do{
                        try context.save()
                    }catch{
                        print("Something went wrong while saving the todo")
                    }
                    
                    dismiss()
                    
                } label: {
                    Text(isEditMode ? "Save" : "Add")
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background( (title.isEmpty || typeOfTask == -1) ? .gray : .blue)
                        .font(.title2)
                        .clipShape(.rect(cornerRadius: 14))
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                }
                .padding(.top)
                .disabled(title.isEmpty || typeOfTask == -1)
                
                if isEditMode {
                    
                    Button {
                        
                        context.delete(todo)
                        do {
                            try context.save()
                        } catch {
                            print("Something went wrong while deleting the todo")
                        }
                        
                        dismiss()
                        
                    } label: {
                        Text("Delete")
                            .frame(maxWidth: .infinity, maxHeight: 40)
                            .background(.red)
                            .font(.title2)
                            .clipShape(.rect(cornerRadius: 14))
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    }

                }
            }

         
            Spacer()
        }
        .padding()
        .padding(.top,20)
        .background(.ultraThickMaterial)
        .onAppear {
            if isEditMode {
                title = todo.title
                typeOfTask = todo.typeOfTask
            }
        }

    }
}

#Preview {
    AddTodoView(todo: Todo(), isEditMode: false)
}

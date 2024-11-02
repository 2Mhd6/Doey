//
//  ContentView.swift
//  Todo List
//
//  Created by Mohammed on 29/10/2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @State var selectedTodo: Todo?
    @Query private var todos: [Todo]
    @State private var selectionOrder: SortBy = .Name
    
    // -> Status Info
    var tasks: Int {
        todos.count
    }
    var completedTask: Int {
        todos.filter{ $0.isCompleted }.count
    }
    
    var notCompletedTask: Int {
        todos.filter{ $0.isCompleted != true }.count
    }
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            Color(AppColor.BackgroundColor)
                .ignoresSafeArea()
            
            VStack{
                
                VStack{
                    
                    HStack{
                        Text("Doey")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Spacer()
                        
                        
                        Menu {
                            
                            Picker("", selection: $selectionOrder) {
                                Text("Sort by Name")
                                    .tag(SortBy.Name)
                                
                                Text("Sort by Date")
                                    .tag(SortBy.Date)
                                
                                Text("Sort by Importance")
                                    .tag(SortBy.Importance)
                            }
                            
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .font(.title3)
                                .foregroundStyle(.white)
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    
                    StatusView(totalTask: tasks, notCompletedTask: notCompletedTask, completedTask: completedTask)
                        .padding(.bottom)
                    
                }
                .background(
                    Color.secondaryText
                        .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15))
                        .ignoresSafeArea()
                )
                
                if todos.isEmpty{
                    
                    Spacer()
                    Spacer()
                    
                    VStack{
                        Text("No Tasks Yet!")
                            .font(.title)
                            .foregroundStyle(.primaryText)
                        
                        Text("Start adding tasks to stay organised...")
                            .foregroundStyle(.secondaryText)
                    }
                    .shadow(radius: 4, x: 0, y: 4)
                    
                    Spacer()
                    Spacer()
                    
                }else{
//                    ScrollView {
//                        
//                        
//                        ForEach(Array(todos.enumerated()), id: \.element) { index, todo in
//                            TodoView(todo: todo)
//                                .onTapGesture {
//                                    selectedTodo = todo
//                                }
//
//                        }
//                    }
//                    .scrollIndicators(.hidden)
                    
                    ScrollView {
                        ListView(sort: selectionOrder, selectedTodo: $selectedTodo)
                            .animation(.default, value: selectionOrder)
                        

                    }
                    .scrollIndicators(.hidden)
                        
                }
                
                
            }
            .animation(.default, value: todos.count)
            .sheet(item: $selectedTodo) { todo in
                
                // If there is a name make the edit editMode true
                // If the there is no name make the editMode false
                let editMode = todo.title.trimmingCharacters(in: .whitespacesAndNewlines) != ""
                
                AddTodoView(todo: todo, isEditMode: editMode)
                    .presentationDetents([.fraction(0.6)])
                    .presentationDragIndicator(.visible)

            }
            
            Button {
                selectedTodo = Todo()
            } label: {
                Circle()
                    .frame(width: 60)
                    .foregroundStyle(AppColor.CircleButtonColor)
                    .overlay {
                        Image(systemName: "plus")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    .padding()
            }


        }

    }
}

enum SortBy {
    case Name, Importance, Date
}

#Preview {
    HomeView()
}

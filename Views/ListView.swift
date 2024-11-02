//
//  ListView.swift
//  Todo List
//
//  Created by Mohammed on 31/10/2024.
//

import SwiftUI
import SwiftData

struct ListView: View {
    
    @Query private var todos: [Todo]
    @Binding var selectedTodo: Todo?
    @State var animationOffset = 200
    
    
    init(sort: SortBy, selectedTodo: Binding<Todo?>) {
        _selectedTodo = selectedTodo
        
        switch sort {
        case .Name:
            _todos = Query(sort: [
                SortDescriptor(\Todo.isCompleted, order: .forward),
                SortDescriptor(\Todo.title, order: .forward)
            ])
        case .Date:
            _todos = Query(sort: [
                SortDescriptor(\Todo.isCompleted, order: .forward),
                SortDescriptor(\Todo.date, order: .forward)
            ])
        case .Importance:
            _todos = Query(sort:[
                SortDescriptor(\Todo.isCompleted, order: .forward),
                SortDescriptor(\Todo.typeOfTask, order: .reverse)
            ])
            
        }
    }
    
    var body: some View {
        
        ForEach(Array(todos.enumerated()), id: \.element) { index, todo in
            TodoView(todo: todo)
                .animation(.easeOut.delay(TimeInterval(0.05) * Double(index)), value: animationOffset)
                .offset(y: CGFloat(animationOffset))
                .onTapGesture {
                    selectedTodo = todo
                }
        }
        .onAppear {
            withAnimation {
                animationOffset = 0
            }
        }
    }
}

#Preview {
    ListView(sort: .Date, selectedTodo: .constant(Todo()))
}

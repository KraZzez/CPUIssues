//
//  StoredTasks.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-01.
//

import SwiftUI


enum taskSelector: String, Identifiable, CaseIterable {
    
    var id: UUID {
        return UUID()
    }
    
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
}

extension taskSelector {
    var title: String {
        switch self {
            case .daily:
                return "Daily"
            case .weekly :
                return "Weekly"
            case .monthly:
                return "Monthly"
        }
    }
}

struct StoredTasks: View {
    
    let storedTasks: [Tasks] = [
    Tasks(name: "Go to the gym", category: "Fitness"),
    Tasks(name: "Buy Groceries", category: "Shopping"),
    Tasks(name: "Walk the dog", category: "Health"),
    ]
    
    @Binding var selectedTask: String
    
    var body: some View {
       
        Picker (
            selection: $selectedTask) {
                ForEach(storedTasks, id: \.self) { task in
                    
                        Text(task.name)
                            .tag(task.name)
                    }
            } label: {
                Text("\(selectedTask)")
            }
    }
}

struct StoredTasks_Preview: PreviewProvider {
    @State static var selectedTask = "Go to the gym"
    static var previews: some View {
        StoredTasks(selectedTask: $selectedTask)
    }
}

struct Tasks: Hashable {
   // var id = UUID()
    
    var name: String
    var category: String
}
//
//  Calendar.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 04/11/23.
//

import SwiftUI

struct Calendar: View {
    @State private var selectedDate: Date = Date()
    @State private var reminders: [Date: String] = [:]
    @State private var noteInput: String = ""
    
    var body: some View {
                
        NavigationView {
            
            VStack{
                
                CalendarView(selectedDate: $selectedDate, reminders: $reminders, noteInput: $noteInput)
                ReminderListView(reminders: $reminders)
            }
            
            .navigationBarTitle("Calendario ")
        }
    }
}

struct CalendarView: View {
    @Binding var selectedDate: Date
    @Binding var reminders: [Date: String]
    @Binding var noteInput: String
    
    var body: some View {
        Form {
            DatePicker("Selecciona una fecha", selection: $selectedDate, displayedComponents: .date)
            TextField("Añade una nota", text: $noteInput)
            Button("Agregar Recordatorio") {
                if !noteInput.isEmpty {
                    reminders[selectedDate] = noteInput
                    noteInput = ""
                }
            }
        }
    }
}

struct ReminderListView: View {
    @Binding var reminders: [Date: String]
    
    var body: some View {
        Text("Recordatorios")
        VStack{
        List {
            ForEach(Array(reminders.keys).sorted(by: <), id: \.self) { date in
                if let reminder = reminders[date] {
                    Text("\(date, style: .date) - \(reminder)")
                    }
                }
            }
        }
    }
}


#Preview {
    Calendar()
}

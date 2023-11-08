//
//  ContentView.swift
//  AnimatedTabBar
//
//  Created by ximena juana mejia jacobo on 21/10/23.
//
import SwiftUI

struct ContentView: View {
    // Estado para la fecha seleccionada y la colección de recordatorios
    @State private var selectedDate: Date = Date()
    @State private var reminders: [Date: Reminder] = [:]
    
    var body: some View {
        NavigationView {
            VStack {
                // Vista del calendario que permite a los usuarios elegir una fecha y agregar recordatorios
                CalendarView(selectedDate: $selectedDate, reminders: $reminders)
                
                // Vista de lista que muestra los recordatorios junto con sus notas
                ReminderListView(reminders: $reminders)
            }
            .navigationBarTitle("Calendario con Recordatorios")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CalendarView: View {
    // Enlace a la fecha seleccionada y a la colección de recordatorios
    @Binding var selectedDate: Date
    @Binding var reminders: [Date: Reminder]
    
    // Estado para el campo de entrada de notas
    @State private var noteInput: String = ""
    
    var body: some View {
        Form {
            // Selector de fecha para elegir la fecha del recordatorio
            DatePicker("Selecciona una fecha", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
            
            // Campo de entrada de notas para que los usuarios ingresen una nota
            TextField("Añade una nota", text: $noteInput)
            
            // Botón para agregar un nuevo recordatorio con una nota predeterminada
            Button("Agregar Recordatorio") {
                if !noteInput.isEmpty {
                    // Al agregar un recordatorio, se almacena la fecha y la nota en la colección de recordatorios
                    reminders[selectedDate] = Reminder(note: noteInput, text: "Nuevo Recordatorio")
                    noteInput = ""
                }
            }
        }
    }
}

struct ReminderListView: View {
    @Binding var reminders: [Date: Reminder]
    
    var body: some View {
        List {
            ForEach(reminders.sorted(by: { $0.key < $1.key }), id: \.key) { date, reminder in
                Text("\(date, style: .date) - \(reminder.text) - Nota: \(reminder.note)")
            }
        }
    }
}

struct Reminder {
    var note: String
    var text: String
}

#Preview {
    ContentView()
}
//

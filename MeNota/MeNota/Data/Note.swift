//
// Note.swift
// MeNota
//
// Created by Carol Quiterio on 23/05/23.
//

import Foundation

struct Note : Identifiable {
    let id : Int
    let title : String
    let description : String
    let tag : String
    let time: String
    let date: Date
    let folderID: Int // Added folderID property
}

struct Folder : Identifiable {
    let id : Int
    let title : String
    let icon : String
    let quantity: Int
    var notes: NoteList
}

class NoteList: ObservableObject {
    @Published var noteList: [Note]
    
    init(noteList: [Note]) {
        self.noteList = noteList
    }
}

class FolderList: ObservableObject {
    @Published var data: [Folder] = [Folder(
        id: 1,
        title: "Notes",
        icon: "folder",
        quantity: 4,
        notes: NoteList(noteList: [Note(
            id: 1,
            title: "Reminders",
            description: "1. Call the bank to talk about my account\n2. Ask Milena to tell me her story\n3. Go to the grocery",
            tag: "Reminder",
            time: "10:30",
            date: Date(),
            folderID: 1 // Set folderID to match the folder's ID
            ),
            
            Note(
            id: 2,
            title: "Market List",
            description: "1. Pasta\n2. Tomato\n3. Lettuce\n4. Rice\n5. Beans",
            tag: "Reminder",
            time: "09:45",
            date: Date(),
            folderID: 1 // Set folderID to match the folder's ID
            ),])
      ),
        Folder(
        id: 2,
        title: "Recently Deleted",
        icon: "trash",
        quantity: 1,
        notes: NoteList(noteList: [Note(
            id: 3,
            title: "Work Tasks",
            description: "1. Prepare presentation for the meeting\n2. Review project proposal\n3. Follow up with clients",
            tag: "Work",
            time: "Monday",
            date: Date(),
            folderID: 2 // Set folderID to match the folder's ID
           ),
                                      
           Note(
            id: 4,
            title: "Travel Plans",
            description: "1. Book flights\n2. Reserve hotel\n3. Create itinerary",
            tag: "Travel",
            time: "Sunday",
            date: Date(),
            folderID: 2 // Set folderID to match the folder's ID
           )
      ]))]
      
    func getFolderByID(_ folderID: Int) -> Folder? {
        return data.first { $0.id == folderID }
    }
}

func getDateBeforeFifteenDays() -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = -15
        
        if let pastDate = Calendar.current.date(byAdding: dateComponent, to: Date()) {
            return pastDate
        }
        
        // Caso ocorra algum erro ao calcular a data, retorna a data atual
        return Date()
}

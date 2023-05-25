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
}

let noteList = [
  Note(
    id: 1,
    title: "Reminders",
     description: "1. Call the bank to talk about my account\n2. Ask Milena to tell me her story\n3. Go to the grocery",
    tag: "Reminder"
  ),
  Note(
    id: 2,
    title: "Market List",
    description: "1. Pasta\n2. Tomato\n3. Lettuce\n4. Rice\n5. Beans",
    tag: "Reminder"
  ),
  Note(
    id: 3,
    title: "Work Tasks",
    description: "1. Prepare presentation for the meeting\n2. Review project proposal\n3. Follow up with clients",
    tag: "Work"
  ),
  Note(
    id: 4,
    title: "Travel Plans",
    description: "1. Book flights\n2. Reserve hotel\n3. Create itinerary",
    tag: "Travel"
  ),
 ]

struct Folder : Identifiable {
 let id : Int
 let title : String
}

let folderList = [
   Folder(
    id: 1,
    title: "Notes"
  ),
    Folder(
    id: 2,
    title: "Recently Deleted"
  )
 ]

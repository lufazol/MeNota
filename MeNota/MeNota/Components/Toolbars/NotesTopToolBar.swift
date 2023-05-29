//
//  NotesTopToolBar.swift
//  MeNota
//
//  Created by Luan Fazolin on 26/05/23.
//

import SwiftUI

struct NotesTopToolBar: View {
    var body: some View {
        HStack {
            Spacer()

            Menu {
                HStack {
                    Button {
                        print("Test")
                    } label: {
                            Image(systemName: "list.bullet")
                            Text("View as List")
                    }
                    Divider()
                    Button {
                        print("Test")
                    } label: {
                            Image(systemName: "checkmark.circle")
                            Text("Select Notes")
                    }
                    Button {
                        print("Test")
                    } label: {
                        Menu {
                            Button {
                                print("Test")
                            } label: {
                                    Text("Default (Date Edited)")
                            }
                            Button {
                                print("Test")
                            } label: {
                                    Text("Date Edited")
                            }
                            Button {
                                print("Test")
                            } label: {
                                    Text("Date Created")
                            }
                            Button {
                                print("Test")
                            } label: {
                                    Text("Title")
                            }
                            Divider()
                            Button {
                                print("Test")
                            } label: {
                                    Text("Newest First")
                            }
                            Button {
                                print("Test")
                            } label: {
                                    Text("Oldest First")
                            }
                        } label: {
                                Text("Sort By")
                                Image(systemName: "arrow.up.arrow.down")
                        }
                    }
                    Button {
                        print("Test")
                    } label: {
                        Menu {
                            Button {
                                print("Test")
                            } label: {
                                Text("Default (On)")
                            }
                            Button {
                                print("Test")
                            } label: {
                                Text("On")
                            }
                            Button {
                                print("Test")
                            } label: {
                                Text("Off")
                            }

                        } label: {
                            Text("Group By Date")
                            Image(systemName: "calendar")
                        }
                    }
                    Button {
                        print("Test")
                    } label: {
                            Image(systemName: "paperclip")
                            Text("View Attachments")
                    }
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)

            }
            .padding()
        }
    }
}

struct NotesTopToolBar_Previews: PreviewProvider {
    static var previews: some View {
        NotesTopToolBar()
    }
}

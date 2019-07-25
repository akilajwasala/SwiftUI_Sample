//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Akila J Wasala on 7/24/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id: Int
    let username, message, imageName: String
}

struct Group: Identifiable {
    var id: Int
    let imageName, name: String
}

struct ContentView : View {
    
    let users: [User] = [
        .init(id: 1, username: "Tim Cook", message: "Deep earth had wherein had living above. After. Shall. Second grass, unto first under ", imageName: "food3"),
        .init(id: 2, username: "Dude perfect", message: "We run a series of webshops - maybe you're interested? Check them out", imageName: "food1"),
        .init(id: 3, username: "Dude", message: "seas. Likeness. It god god. Likeness won't place from.", imageName: "food2"),
        .init(id: 4, username: "No more", message: "Bearing upon greater years he set above let upon, ", imageName: "food3"),
        .init(id: 5, username: "Dude Yooo", message: "Deep earth had wherein had living above. After. Shall. Second grass, unto first under Bearing upon greater years he set above let upon, seas. Likeness. It god god. Likeness won't place from.", imageName: "food4"),
        .init(id: 6, username: "Boom perfect", message: "Deep earth had wherein had living above.", imageName: "food3"),
        .init(id: 7, username: "Dude Nowayyy", message: "Broooo Dude fuck off ", imageName: "food4"),
        .init(id: 8, username: "Dude Mydad", message: "Deep earth had wherein had living above. After. Shall. Second grass, unto first under Bearing upon greater years he set above let upon, seas. Likeness. It god god. Likeness won't place from.", imageName: "food2")
    ]
    
    let groups: [Group] = [
        .init(id: 1, imageName: "food4", name: "Grilled Salmon"),
        .init(id: 2, imageName: "food2", name: "Baken Salmon"),
        .init(id: 3, imageName: "food3", name: "BBQ Salmon"),
        .init(id: 4, imageName: "food1", name: "Seafood"),
        .init(id: 5, imageName: "sky", name: "Brokely"),
        .init(id: 6, imageName: "sky", name: "Grilled Salmon"),
        .init(id: 7, imageName: "sky", name: "Grilled Salmon"),
        .init(id: 8, imageName: "sky", name: "Grilled Salmon"),
        .init(id: 9, imageName: "sky", name: "Grilled Salmon"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                VStack (alignment: .leading) {
                    ScrollView {
                        VStack (alignment: .leading) {
                            HStack {
                                ForEach(groups.identified(by: \.id)) { group in
                                    NavigationLink(destination:GroupDetailView()) {
                                        GroupView(group: group)
                                    }
                                }
                            }
                        }
                    }.frame(height: 200)
                }
                HStack (alignment: .firstTextBaseline) {
                    Text("Order Request").font(.headline)
                    Text("Waiting 10+").font(.subheadline)
                }
                ForEach(users.identified(by: \.id)) { user in
                    UserRow(user: user)
                }
            }.navigationBarTitle(Text("Foodzz"), displayMode: .automatic)
        }
    }
}

struct GroupDetailView: View {
    var body: some View {
        Text("Here is the details view bro")
    }
}

struct GroupView: View {
    let group: Group
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(group.imageName).renderingMode(.original).resizable().cornerRadius(10).shadow(radius: 5)
            Text(group.name).font(.subheadline).color(.black).lineLimit(nil)
        }.frame(width: 110, height:170).padding(.leading, 0)
    }
}

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .shadow(radius: 10)
                .frame(width: 120, height: 120)
                .cornerRadius(10)
            VStack (alignment: .leading) {
                Text(user.username).font(.headline)
                Text(user.message).font(.subheadline).lineLimit(nil)
                HStack (alignment: .lastTextBaseline) {
                    Button("Accept") {
                        print("Accept clicked")
                    }
                    Button("Reject") {
                        print("Reject clicked")
                    }
                }
            }.padding(.leading, 8)
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

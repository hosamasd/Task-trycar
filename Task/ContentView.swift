//
//  ContentView.swift
//  Task
//
//  Created by hosam on 22/01/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
   
    @EnvironmentObject var vm:FavoriteViewModel//()

    var body: some View {
        
//        PostsScene()
        SHomeTabBar()
            .environmentObject(vm)
    }

   
}

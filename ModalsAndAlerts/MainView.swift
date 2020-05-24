//
//  MainView.swift
//  ModalsAndAlerts
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    private var modalData: [(id: Int, display: String, destination: AnyView)] = [
        (0, "Simple Modal Example", AnyView(SimpleModalView())),
        (1, "Broken Modal Example", AnyView(BrokenModalView())),
        (2, "Extracted Modal Example", AnyView(ExtractedModalView())),
        (3, "Broken Extracted Modal Example", AnyView(BrokenExtractedModalView())),
        (4, "Container Modal Example", AnyView(ContainerModalView())),
    ]
    private var alertData: [(id: Int, display: String, destination: AnyView)] = [
        (0, "Simple Alert Example", AnyView(SimpleAlertView())),
        (1, "Broken Alert Example", AnyView(BrokenAlertView())),
        (2, "Extracted Alert Example", AnyView(ExtractedAlertView())),
        (3, "Broken Extracted Alert Example", AnyView(BrokenExtractedAlertView())),
        (4, "Container Alert Example", AnyView(ContainerAlertView())),
    ]
    private var actionSheetData: [(id: Int, display: String, destination: AnyView)] = []
    
    private var allData: [(id: Int, title: String, data: [(id: Int, display: String, destination: AnyView)])] {
        [(0, "Modals", modalData), (1, "Alerts", alertData), (2, "Action Sheets", actionSheetData)]
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(allData, id: \.id) { item in
                    Section(header: Text(item.title)) {
                        ForEach(item.data, id: \.id) { element in
                            NavigationLink(destination: element.destination) { Text(element.display) }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Modals & Alerts")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

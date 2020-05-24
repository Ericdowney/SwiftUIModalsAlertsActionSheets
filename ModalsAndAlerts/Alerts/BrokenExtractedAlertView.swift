//
//  BrokenExtractedAlertView.swift
//  ModalsAndAlerts
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

struct BrokenExtractedAlertView: View {
    
    @State private var displayOuterAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Extracted Alert")
            Alert1Button()
            Alert2Button()
            Button(action: { self.displayOuterAlert.toggle() }) { Text("Outer Alert") }
        }
        .alert(isPresented: $displayOuterAlert) { Alert(title: Text("Outer Alert"), dismissButton: .cancel(Text("OK"))) }
        .navigationBarTitle("Extracted Modal View")
        .navigationBarItems(trailing: Alert1Button())
    }
}

fileprivate struct Alert1Button: View {
    
    @State private var displayAlert: Bool = false
    
    var body: some View {
        Button(action: { self.displayAlert.toggle() }) { Text("Display Alert #1") }
            .alert(isPresented: $displayAlert) { Alert(title: Text("Simple Alert #1"), dismissButton: .cancel(Text("OK"))) }
    }
}

fileprivate struct Alert2Button: View {
    
    @State private var displayAlert: Bool = false
    
    var body: some View {
        Button(action: { self.displayAlert.toggle() }) { Text("Display Alert #2") }
            .alert(isPresented: $displayAlert) { Alert(title: Text("Simple Alert #2"), dismissButton: .cancel(Text("OK"))) }
    }
}

struct BrokenExtractedAlertView_Previews: PreviewProvider {
    static var previews: some View {
        BrokenExtractedAlertView()
    }
}

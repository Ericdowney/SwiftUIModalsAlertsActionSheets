//
//  ContainerAlertView.swift
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

fileprivate class AlertContainer: Identifiable {
    
    var id: ObjectIdentifier { ObjectIdentifier(self) }
    var alert: Alert
    
    init(alert: Alert) {
        self.alert = alert
    }
}

struct ContainerAlertView: View {
    
    @State private var alertContainer: AlertContainer? = nil
    
    private var outerAlert: AlertContainer { .init(alert: Alert(title: Text("Outer Alert"), dismissButton: .cancel(Text("OK")))) }
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Extracted Alert")
            Alert1Button(alertContainer: $alertContainer)
            Alert2Button(alertContainer: $alertContainer)
            Button(action: { self.alertContainer = self.outerAlert }) { Text("Outer Alert") }
        }
        .alert(item: $alertContainer) { $0.alert }
        .navigationBarTitle("Container Alert View")
        .navigationBarItems(trailing: Alert1Button(alertContainer: $alertContainer))
    }
}

fileprivate struct Alert1Button: View {
    
    @Binding var alertContainer: AlertContainer?
    
    private var alert: AlertContainer { .init(alert: Alert(title: Text("Alert #1"), dismissButton: .cancel(Text("OK")))) }
    
    var body: some View {
        Button(action: { self.alertContainer = self.alert }) { Text("Display Alert #1") }
    }
}

fileprivate struct Alert2Button: View {
    
    @Binding var alertContainer: AlertContainer?
    
    private var alert: AlertContainer { .init(alert: Alert(title: Text("Alert #2"), dismissButton: .cancel(Text("OK")))) }
    
    var body: some View {
        Button(action: { self.alertContainer = self.alert }) { Text("Display Alert #2") }
    }
}

struct ContainerAlertView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerAlertView()
    }
}

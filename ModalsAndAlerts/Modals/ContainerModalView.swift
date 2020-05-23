//
//  ContainerModalView.swift
//  ModalsAndAlerts
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

fileprivate class ViewContainer: Identifiable {
    
    var id: ObjectIdentifier { ObjectIdentifier(self) }
    var view: AnyView
    
    init<V: View>(view: V) {
        self.view = AnyView(view)
    }
}

struct ContainerModalView: View {
    
    @State private var modalContainer: ViewContainer? = nil
    
    private var outerModalView: ViewContainer { .init(view: ModalView(modalName: "Outer Modal")) }
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Extracted Modal")
            Modal1Button(modalContainer: $modalContainer)
            Modal2Button(modalContainer: $modalContainer)
            Button(action: { self.modalContainer = self.outerModalView }) { Text("Outer Modal") }
        }
        .sheet(item: $modalContainer) { $0.view }
        .navigationBarTitle("Container Modal View")
        .navigationBarItems(trailing: Modal1Button(modalContainer: $modalContainer))
    }
}

fileprivate struct Modal1Button: View {
    
    @Binding var modalContainer: ViewContainer?
    
    private var modalView: ViewContainer { .init(view: ModalView(modalName: "Modal #1")) }
    
    var body: some View {
        Button(action: { self.modalContainer = self.modalView }) { Text("Display Modal #1") }
    }
}

fileprivate struct Modal2Button: View {
    
    @Binding var modalContainer: ViewContainer?
    
    private var modalView: ViewContainer { .init(view: ModalView(modalName: "Modal #2")) }
    
    var body: some View {
        Button(action: { self.modalContainer = self.modalView }) { Text("Display Modal #2") }
    }
}

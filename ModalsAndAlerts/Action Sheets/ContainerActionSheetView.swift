//
//  ContainerActionSheetView.swift
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

fileprivate class ActionSheetContainer: Identifiable {
    
    var id: ObjectIdentifier { ObjectIdentifier(self) }
    var actionSheet: ActionSheet
    
    init(actionSheet: ActionSheet) {
        self.actionSheet = actionSheet
    }
}

struct ContainerActionSheetView: View {
    
    @State private var actionSheetContainer: ActionSheetContainer? = nil
    
    private var outerActionSheet: ActionSheetContainer { .init(actionSheet: ActionSheet(title: Text("Outer ActionSheet"), buttons: [.cancel(Text("OK"))])) }
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Extracted ActionSheet")
            ActionSheet1Button(actionSheetContainer: $actionSheetContainer)
            ActionSheet2Button(actionSheetContainer: $actionSheetContainer)
            Button(action: { self.actionSheetContainer = self.outerActionSheet }) { Text("Outer ActionSheet") }
        }
        .actionSheet(item: $actionSheetContainer) { $0.actionSheet }
        .navigationBarTitle("Container ActionSheet View")
        .navigationBarItems(trailing: ActionSheet1Button(actionSheetContainer: $actionSheetContainer))
    }
}

fileprivate struct ActionSheet1Button: View {
    
    @Binding var actionSheetContainer: ActionSheetContainer?
    
    private var actionSheet: ActionSheetContainer { .init(actionSheet: ActionSheet(title: Text("ActionSheet #1"), buttons: [.cancel(Text("OK"))])) }
    
    var body: some View {
        Button(action: { self.actionSheetContainer = self.actionSheet }) { Text("Display ActionSheet #1") }
    }
}

fileprivate struct ActionSheet2Button: View {
    
    @Binding var actionSheetContainer: ActionSheetContainer?
    
    private var actionSheet: ActionSheetContainer { .init(actionSheet: ActionSheet(title: Text("ActionSheet #2"), buttons: [.cancel(Text("OK"))])) }
    
    var body: some View {
        Button(action: { self.actionSheetContainer = self.actionSheet }) { Text("Display ActionSheet #2") }
    }
}

struct ContainerActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerActionSheetView()
    }
}

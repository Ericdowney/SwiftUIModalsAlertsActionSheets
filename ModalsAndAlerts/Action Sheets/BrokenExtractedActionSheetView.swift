//
//  BrokenExtractedActionSheetView.swift
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

struct BrokenExtractedActionSheetView: View {
    
    @State private var displayOuterActionSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Extracted ActionSheet")
            ActionSheet1Button()
            ActionSheet2Button()
            Button(action: { self.displayOuterActionSheet.toggle() }) { Text("Outer ActionSheet") }
        }
        .actionSheet(isPresented: $displayOuterActionSheet) { ActionSheet(title: Text("Outer ActionSheet"), buttons: [.cancel(Text("OK"))]) }
        .navigationBarTitle("Extracted Modal View")
        .navigationBarItems(trailing: ActionSheet1Button())
    }
}

fileprivate struct ActionSheet1Button: View {
    
    @State private var displayActionSheet: Bool = false
    
    var body: some View {
        Button(action: { self.displayActionSheet.toggle() }) { Text("Display ActionSheet #1") }
            .actionSheet(isPresented: $displayActionSheet) { ActionSheet(title: Text("Simple ActionSheet #1"), buttons: [.cancel(Text("OK"))]) }
    }
}

fileprivate struct ActionSheet2Button: View {
    
    @State private var displayActionSheet: Bool = false
    
    var body: some View {
        Button(action: { self.displayActionSheet.toggle() }) { Text("Display ActionSheet #2") }
            .actionSheet(isPresented: $displayActionSheet) { ActionSheet(title: Text("Simple ActionSheet #2"), buttons: [.cancel(Text("OK"))]) }
    }
}

struct BrokenExtractedActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BrokenExtractedActionSheetView()
    }
}

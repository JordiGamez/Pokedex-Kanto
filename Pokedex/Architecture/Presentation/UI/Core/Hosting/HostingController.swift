//
//  HostingController.swift
//  Pokedex
//
//  Created by Jordi Gámez on 16/10/23.
//

import SwiftUI

final class HostingController<ContentView: View>: UIHostingController<AnyView> {
    
    init(rootView: ContentView) {
        let view: AnyView
        view = AnyView(rootView)
        super.init(rootView: view)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // iOS 15: Needed to hide an ugly effect hiding the back button when navigating
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    // iOS 15-16: Needed to enable the Toolbar user interaction
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

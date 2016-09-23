//
//  SimpleSideViewController.swift
//  SimpleSideMenu
//
//  Created by m3touch on 20/09/16.
//  Copyright © 2016 m3touch. All rights reserved.
//

import UIKit

protocol SimpleSideMenuDelegate {
    
}

class SimpleSideViewController: UIViewController, MenuTableDelegate {
    
    
    // MARK: PUBLIC VARIABLES
    public var delegate: SimpleSideMenuDelegate?
    
    // MARK: PRIVATE VARIABLES
    private var menu: MenuTableViewController? { didSet { configureMenu() } }
    
    // MARK: OUTLETS
    @IBOutlet weak var centralControllerView: UIView!
    
    
    
    // MARK: Class Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        
    }
    
    
    // MARK: Central Controller Initiallisation
    
    private func configureCentralControllerView() {
        print("configureCentralControllerView")
    }
    
    
    
    // MARK: Table View Controller Initiallisation
    
    private enum StoryBoard {
        static let menuPresentation = "EmbeedMenu"
    }
    
    // Save a refference to the table view controller at time it is embeeded inside the Content View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == StoryBoard.menuPresentation else { return }
        menu = segue.destination as? MenuTableViewController
        print("Embeeded menu")
    }

    // Configure the menu
    private func configureMenu() {
        
        // Get the first section of buttons
        let sideMenuSection1 = [
            SideMenuButton.init(named: "title 1", index: 0),
            SideMenuButton.init(named: "title 2", index: 1),
            SideMenuButton.init(named: "title 3", index: 2),
            SideMenuButton.init(named: "title 4", index: 3),
            SideMenuButton.init(named: "title 5", index: 4),
            ]
        
        // Get the second section of buttons
        let sideMenuSection2 = [
            SideMenuButton.init(named: "title 6", index: 0),
            SideMenuButton.init(named: "title 7", index: 1),
            ]
        
        // Save the menu sections on the menu
        menu?.menuSections = [sideMenuSection1, sideMenuSection2]
        menu?.myDelegate = self
    }
    
    // Menu Table Delegation
    func menuButtonSelected(at indexPath: IndexPath) {
        print ("Core :: button \(indexPath.row) has been selected in submenu \(indexPath.section)")
    }
}


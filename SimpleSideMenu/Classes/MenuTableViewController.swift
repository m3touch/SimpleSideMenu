//
//  MenuTableViewController.swift
//  SimpleSideMenu
//
//  Created by Roger on 20/09/16.
//  Copyright © 2016 Marta. All rights reserved.
//

import UIKit

// MARK: - Delegation
protocol MenuTableDelegate {
    func menuButtonSelected(at indexPath: IndexPath)
}

class MenuTableViewController: UITableViewController {
    
    var menuSections: [SideMenuSection]?
    var myDelegate: MenuTableDelegate?
    
    
    // MARK: - Class Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        print("table view did load")
        
        // Customize table view
        customizeTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view customisation
    
    private func customizeTableView() {
        
        // Create a blur effect for the background
        addBlurEffect()
    }

    public func addBlurEffect() {
        
        // Create a blur & vibrancy effect for the background
        let blurEffect = UIBlurEffect(style: .light)
        
        // Create the blur view with the blur effect
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        // Avoid blurring also the subviews
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.frame = self.view.bounds
        
        // Add the blurring view
        self.view.insertSubview(blurView, at: 0)
        
        // Add vibrancy to the table cell separators
        self.tableView.separatorEffect = UIVibrancyEffect(blurEffect: blurEffect)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = menuSections { return sections.count }
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuSections![section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        
        let button = menuSections![indexPath.section][indexPath.row]
        cell.textLabel?.text = button.buttonName

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Notify delegate
        myDelegate?.menuButtonSelected(at: indexPath)
        
        // Diselect the button
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

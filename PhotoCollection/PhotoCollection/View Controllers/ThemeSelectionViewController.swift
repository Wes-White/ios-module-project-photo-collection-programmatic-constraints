//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    
    override func viewDidLoad() {
        setUpSubviews()
    }
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    func setUpSubviews() {
        let themeLabel = UILabel()
        themeLabel.textAlignment = .center
        themeLabel.text = "Choose your theme:"
        
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(themeLabel)
        
        themeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        themeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        themeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        let blueThemeButton = UIButton(type: .system)
        blueThemeButton.setTitle("Blue", for: .normal)
        blueThemeButton.translatesAutoresizingMaskIntoConstraints = false
        blueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueThemeButton)
        
        blueThemeButton.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 20).isActive = true
        blueThemeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 170).isActive = true
        
        let darkThemeButton = UIButton(type: .system)
        darkThemeButton.setTitle("Dark", for: .normal)
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(darkThemeButton)
        
        darkThemeButton.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 20).isActive = true
        darkThemeButton.leadingAnchor.constraint(equalTo: blueThemeButton.trailingAnchor, constant: 20).isActive = true
    }
}


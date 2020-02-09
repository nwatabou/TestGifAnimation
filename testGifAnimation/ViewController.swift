//
//  ViewController.swift
//  testGifAnimation
//
//  Created by nancy on 2020/02/09.
//  Copyright © 2020 nancy. All rights reserved.
//

import UIKit
import SwiftyGif
import Lottie

class ViewController: UIViewController {
    
    let gifUrl = "http://icon-park.com/imagefiles/loading7_orange.gif"
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let animationView: AnimationView = {
        let view = AnimationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 60.0),
            imageView.heightAnchor.constraint(equalToConstant: 60.0),
            
            animationView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16.0),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 60.0),
            animationView.heightAnchor.constraint(equalToConstant: 60.0)
        ])
        guard let url = URL(string: gifUrl) else { return }
        imageView.setGifFromURL(url)
        
        Animation.loadedFrom(url: url, closure: { [weak self] animation in
            guard let animation = animation else { return }
            self?.animationView.animation = animation
            self?.animationView.play()
            }, animationCache: nil)
    }
}


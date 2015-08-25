//
//  ViewController.swift
//  adentification
//
//  Created by Shuyu Chen on 8/25/15.
//  Copyright (c) 2015 Shuyu Chen. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController, FlurryAdNativeDelegate {
    
    let nativeAd = FlurryAdNative(space: "Ad")

    @IBOutlet weak var headline: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var summary: UILabel!

    /*
    @IBAction func choice0(sender: UIButton) {
        var asset = nativeAd.assetList;
        for item in asset {
            if item.name == "source" {
                sender.setTitle(item.value, forState: UIControlState.Normal)
            }
        }
    }
    
    @IBAction func choice1(sender: UIButton) {
    }
    
    @IBAction func choice2(sender: UIButton) {
    }
    */
    
    @IBOutlet weak var choice1: UIButton!
    
    @IBOutlet weak var choice2: UIButton!
    
    @IBOutlet weak var choice3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nativeAd.adDelegate = self;
        nativeAd.viewControllerForPresentation = self;
        nativeAd.fetchAd();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func adNativeDidFetchAd(nativeAd: FlurryAdNative!) {
        
        var asset = nativeAd.assetList;
        for item in asset {
            if item.name == "headline" {
                headline.text = item.value
            }
            if item.name == "summary" {
                summary.text = item.value
            }
            if item.name == "secHqImage" {
                let url: NSURL? = NSURL(string: item.value!!);
                if let actualURL = url {
                    let imageData = NSData(contentsOfURL: actualURL);
                    if let actualImageData = imageData {
                        image.image = UIImage(data: actualImageData);
                    }
                }
            }
            if item.name == "source" {
                var correctChoice = Int(arc4random_uniform(3))
                if correctChoice == 0 {
                    choice1.setTitle(item.value, forState: UIControlState.Normal)
                    choice2.setTitle("General Motor", forState: UIControlState.Normal)
                    choice3.setTitle("Geico", forState: UIControlState.Normal)
                } else if correctChoice == 1 {
                    choice1.setTitle("Brisk Iced Tea", forState:UIControlState.Normal)
                    choice2.setTitle(item.value, forState: UIControlState.Normal)
                    choice3.setTitle("Marriot", forState: UIControlState.Normal)
                } else {
                    choice1.setTitle("McDonald", forState: UIControlState.Normal)
                    choice2.setTitle("Papa John's", forState: UIControlState.Normal)
                    choice3.setTitle(item.value, forState: UIControlState.Normal)
                }
            }
        }
    }
}


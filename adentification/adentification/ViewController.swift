//
//  ViewController.swift
//  adentification
//
//  Created by Shuyu Chen on 8/25/15.
//  Copyright (c) 2015 Shuyu Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FlurryAdNativeDelegate {
    
    let nativeAd = FlurryAdNative(space: "Ad")

    @IBOutlet weak var headline: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var summary: UILabel!
    
    
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
        }
    }
}


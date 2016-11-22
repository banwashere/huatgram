//
//  CameraViewController.swift
//  Huatgram
//
//  Created by Chee Kok Ban on 5/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import UIKit
import AVFoundation
import CameraManager

class CameraViewController: UIViewController {

  
    let cameraManager = CameraManager()



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _ = cameraManager.addPreviewLayerToView(self.view)
        cameraManager.cameraDevice = .front
        //cameraManager.cameraDevice = .back
        cameraManager.cameraOutputMode = .videoWithMic
        cameraManager.cameraOutputQuality = .low
        cameraManager.flashMode = .auto
        cameraManager.showAccessPermissionPopupAutomatically = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func takeVideoAction(_ sender: AnyObject) {
        cameraManager.startRecordingVideo()
    }
}

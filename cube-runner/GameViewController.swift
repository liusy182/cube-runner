//
//  GameViewController.swift
//  cube-runner
//
//  Created by liusy182 on 24/4/16.
//  Copyright (c) 2016 liusy182. All rights reserved.
//
import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    private let scnView = SCNView()
    private var scene: SCNScene!
    private var cameraNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scnView.frame = view.bounds
        view.addSubview(scnView)
        
        createContents()
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

// MARK: content builder
private extension GameViewController {
    func createContents() {
        scene = SCNScene(named: "art.scnassets/eurofighter.dae")
        scnView.showsStatistics = true
        scnView.debugOptions = .ShowPhysicsShapes
        
        let jetfighterNode = createJetfighter()
        
        cameraNode = createCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        scnView.scene = scene
    }
    
    func createCamera() -> SCNNode{
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 7, 20)
        cameraNode.rotation = SCNVector4Make(1, 0, 0, -atan2f(7, 20.0))
        return cameraNode
    }
    
    func createJetfighter() -> SCNNode{
        let jetfighterNode = scene!.rootNode.childNodeWithName("jetfighter", recursively: true)!
        
        jetfighterNode.scale = SCNVector3(x: 0.03, y: 0.03, z: 0.03)
        jetfighterNode.position = SCNVector3(x: 0, y: 1.0, z: 13)
        jetfighterNode.rotation = SCNVector4(x: 0, y: 1, z: 0, w: Float(M_PI))
        return jetfighterNode
    }
    
}



//
//  HomeViewController.swift
//  WorkOut
//
//  Created by Eunseo Choi on 2020/05/28.
//  Copyright © 2020 Eunseo Choi. All rights reserved.
//

import UIKit
import CoreMotion
import CoreData

class ExerciseViewController: UIViewController {

   // var workoutType: WorkoutType?
    
    var startDate: Date!
    
    var durationTimer: Timer! = nil
    var statusTimer: Bool? = false
    var duration = (hours: 0, minutes: 0, seconds: 0)
    var pedometer = CMPedometer()
    var stepsCount: Int = 0
    var distanceUnit: String?
    
    @IBOutlet var walkCycleView: UIView!
    @IBOutlet weak var distanceValue: UILabel!
    @IBOutlet weak var durationValue: UILabel!
    @IBOutlet weak var stepValue: UILabel!
    @IBOutlet weak var caloriesValue: UILabel!
    
    func setupUI(){
        distanceValue.text = "0"
        durationValue.text = String(format: "%.2d:%.2d:%.2d", duration.0, duration.1, duration.2)
        stepValue.text = "----"
        caloriesValue.text = "0"
        
    }
    
    func setupWalk(){
        if CMPedometer.isStepCountingAvailable(){
            pedometer.startUpdates(from: Date(), withHandler: {(CMPedometerData, error) in
                if let CMPedmeterData = CMPedometerData{
                DispatchQueue.main.async {
                    self.distanceValue.text = "\(CMPedometerData!.numberOfSteps)"
                    if CMPedometerData?.distance == nil {
                        self.stepValue.text = "----"
                    }else {
                        //self.stepValue.text = "\(Int(truncating: CMPedometerData?.distance!))"
                    }
                }
                
                }
                
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

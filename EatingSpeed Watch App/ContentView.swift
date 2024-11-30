//
//  ContentView.swift
//  EatingSpeed Watch App
//
//  Created by Ankit Bawanthade on 29/11/24.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    let motion = CMMotionManager()
    var currentFrequency: Int = 60
    var body: some View {
        VStack {
            Button(action: startGettingData, label: {
                Text("START")
            })
        }
        .padding()
    }
//    
//    func startButtonPressed() {
//        
//        var csvText = "Time,AccelX,AccelY,AccelZ,GyroX,GyroY,GyroZ\n"
//        let time = Date()
//        
//        
//        var acclInX: Double = 0.0
//        var acclInY: Double = 0.0
//        var acclInZ: Double = 0.0
//        var gyroInX: Double = 0.0
//        var gyroInY: Double = 0.0
//        var gyroInZ: Double = 0.0
//        
//        let motionManager = CMMotionManager()
//        if motionManager.isAccelerometerAvailable {
//            print("Hello3")
//            motionManager.accelerometerUpdateInterval = 0.1 // Adjust the frequency
//            motionManager.startAccelerometerUpdates(to: .main) { data, error in
//                
//                if let data = data {
//                    // Access accelerometer data: data.acceleration.x, data.acceleration.y, data.acceleration.z
//                    // Save this data to an array or other storage
//                    acclInX = data.acceleration.x
//                    print("Hello")
//                    acclInY = data.acceleration.y
//                    acclInZ = data.acceleration.z
//                }
//                
//                if let error = error {
//                    print("Error of accl",error)
//                }
//            }
//        }
//
//        if motionManager.isGyroAvailable {
//            print("Hello3")
//            motionManager.gyroUpdateInterval = 0.1 // Adjust the frequency
//            motionManager.startGyroUpdates(to: .main) { data, error in
//                
//                print("Hello3")
//                if let data = data {
//                    // Access gyroscope data: data.rotationRate.x, data.rotationRate.y, data.rotationRate.z
//                    // Save this data to an array or other storage
//                    gyroInX = data.rotationRate.x
//                    print("Hello2")
//                    gyroInY = data.rotationRate.y
//                    gyroInZ = data.rotationRate.z
//                }
//                
//                if let error = error {
//                    print("Error of gyro",error)
//                }
//            }
//        }
//        
//        let newLine = "\(time),\(acclInX),\(acclInY),\(acclInZ),\(gyroInX),\(gyroInY),\(gyroInZ)\n"
//        csvText.append(newLine)
//        print(newLine)
//        
////        let fileName = "sensorData.csv"
////        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
////
////        do {
////            //try csvText.write(to: path, atomically: true, encoding: .utf8)
////            print("CSV file saved to: \(path)")
////        } catch {
////            print("Failed to create file")
////            print("\(error)")
////        }
//        
//        
//    }
    
    
    func startGettingData() {
        var motionUpdateTimer = Timer()
        self.motion.startGyroUpdates()
        self.motion.deviceMotionUpdateInterval = 3
        
//        self.motion.startDeviceMotionUpdates(to: OperationQueue.main) { deviceMotion, error in
//            print(deviceMotion)
//        }
        //print(self.motion.deviceMotion?.rotationRate)
        // Make sure the motion hardware is available.
        //print(self.motion.isAccelerometerAvailable, self.motion.isGyroAvailable, self.motion.isMagnetometerAvailable)
        if self.motion.isAccelerometerAvailable {
            
            self.motion.accelerometerUpdateInterval = 1.0 / Double (currentFrequency)
            //self.motion.gyroUpdateInterval = 1.0 / Double (currentFrequency)
            //self.motion.magnetometerUpdateInterval = 1.0 / Double (currentFrequency)
            
            self.motion.startAccelerometerUpdates()
            //self.motion.startGyroUpdates()
            //self.motion.startMagnetometerUpdates()
            
            // Configure a timer to fetch the data.
            motionUpdateTimer = Timer.scheduledTimer(withTimeInterval: 1.0/Double (currentFrequency), repeats: true, block: { (timer1) in
                // Get the motion data.
                if let dataAcc = self.motion.accelerometerData {
//                    , let dataMag = self.motion.magnetometerData, let dataGyro = self.motion.gyroData {
                    
                    // let currenTime = self.returnCurrentTime()
                    
//                    let GyroX = dataGyro.rotationRate.x
//                    let GyroY = dataGyro.rotationRate.y
//                    let GyroZ = dataGyro.rotationRate.z
                    
                    let AccX = dataAcc.acceleration.x
                    let AccY = dataAcc.acceleration.y
                    let AccZ = dataAcc.acceleration.z
                    
//                    let MagX = dataMag.magneticField.x
//                    let MagY = dataMag.magneticField.y
//                    let MagZ = dataMag.magneticField.z
                    
                    
//                     print ( "Gyro:  \(GyroX), \(GyroY), \(GyroZ)")
                     print ( "\(AccX), \(AccY), \(AccZ)")
//                     print ( "Mag :  \(MagX), \(MagY), \(MagZ)")
                    
                    
//                    let sensorOutput = SensorOutput()
                    
//                    sensorOutput.timeStamp = Date()
//                    
//                    sensorOutput.gyroX = GyroX
//                    sensorOutput.gyroY = GyroY
//                    sensorOutput.gyroZ = GyroZ
//                    
//                    sensorOutput.accX = AccX
//                    sensorOutput.accY = AccY
//                    sensorOutput.accZ = AccZ
//                    
//                    sensorOutput.magX = MagX
//                    sensorOutput.magY = MagY
//                    sensorOutput.magZ = MagZ
//                    
//                    self.sensorOutputs.append(sensorOutput)
                    
                }
            }
            )}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

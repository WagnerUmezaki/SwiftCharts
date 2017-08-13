import Foundation
import UIKit

class PieChartFactory {
    private let π = Double.pi
    
    private static var INSTANCE: PieChartFactory = PieChartFactory()
    
    public static func getInstance() -> PieChartFactory {
        return INSTANCE
    }
    
    private init(){
    }
    
    public func gimmeAChart(bounds:CGRect, arcWidth:CGFloat, dataToDisplay:[PieChartData]) -> CALayer {
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = min(bounds.width, bounds.height)/2
        
        let resultLayer:CALayer = CALayer()
        
        let totalDataValue = Double(getTotal(data: dataToDisplay))
        
        var startAngle:CGFloat = CGFloat((-1/2)*π)
        
        for data in dataToDisplay {
            let endAngle:CGFloat = CGFloat((Double(data.value * 2)*π)/totalDataValue) + startAngle
            let path = UIBezierPath(arcCenter: center,
                                    radius: radius - arcWidth/2,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)
            path.lineWidth = arcWidth
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeColor = data.color.cgColor
            shapeLayer.lineWidth = arcWidth
            shapeLayer.strokeEnd = 1.0
            resultLayer.addSublayer(shapeLayer)
            startAngle = endAngle
        }
        
        return resultLayer
    }
    
    public func createMask(bounds:CGRect, arcWidth:CGFloat) ->  CAShapeLayer{
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = min(bounds.width, bounds.height)/2
        
        let maskStartAngle = CGFloat((3/2)*π)
        let maskEndAngle = CGFloat((-1/2)*π)
        let maskPath = UIBezierPath(arcCenter: center,
                                    radius: radius - arcWidth/2,
                                    startAngle: maskStartAngle,
                                    endAngle: maskEndAngle,
                                    clockwise: false)
        maskPath.lineWidth = arcWidth
        let maskShapeLayer = CAShapeLayer()
        maskShapeLayer.path = maskPath.cgPath
        maskShapeLayer.fillColor = UIColor.clear.cgColor
        maskShapeLayer.strokeColor = UIColor.lightGray.cgColor
        maskShapeLayer.lineWidth = arcWidth
        maskShapeLayer.strokeEnd = 1.0
        
        return maskShapeLayer
    }
    
    private func getTotal(data: [PieChartData]) -> Int {
        var result = 0
        for el in data {
            result = result + el.value
        }
        return result
    }
}

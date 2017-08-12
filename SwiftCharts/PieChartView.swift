import UIKit

@IBDesignable public class PieChartView: UIView {

    private var data:[DonutChartData] = []
    
    private var chartLayer:CALayer?
    private var maskChartLayer: CAShapeLayer?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func draw(_ rect: CGRect) {
        createMaskLayer()
    }
    
    public func setChartData(chartData:[DonutChartData]) {
        self.layer.sublayers?.removeAll()
        self.data = chartData
        createChartLayer()
        createMaskLayer()
        self.animate(duration: 1)
    }
    
    private func animate(duration:TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 1
        animation.toValue = 0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        maskChartLayer?.strokeEnd = 0.0
        maskChartLayer?.add(animation, forKey: "animateCircle")
    }
    
    private func createChartLayer() {
        let arcWidth = calculateArcWidth()
        chartLayer = DonutChartFactory.getInstance().gimmeAChart(
            bounds: self.layer.bounds,
            arcWidth: arcWidth,
            dataToDisplay: data)
        self.layer.addSublayer(chartLayer!)
    }
    
    private func createMaskLayer() {
        let arcWidth = calculateArcWidth()
        maskChartLayer = DonutChartFactory.getInstance().createMask(bounds: self.layer.bounds, arcWidth: arcWidth)
        self.layer.addSublayer(maskChartLayer!)
    }
    
    private func calculateArcWidth() -> CGFloat {
        return NumberUtils.min(value1: self.layer.bounds.height, value2: self.layer.bounds.width)/2
    }
}

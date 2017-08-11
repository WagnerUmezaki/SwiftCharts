import UIKit

@IBDesignable public class DonutChartView: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func draw(_ rect: CGRect) {
        var chartData:[DonutChartData] = []

        chartData.append(DonutChartData(label: "Label1", value: 3, color: UIColor.red))
        chartData.append(DonutChartData(label: "Label2", value: 3, color: UIColor.blue))
        chartData.append(DonutChartData(label: "Label3", value: 3, color: UIColor.yellow))
        
        let chartLayer = DonutChartFactory.getInstance().gimmeAChart(
            bounds: self.layer.bounds,
            arcWidth: self.layer.bounds.height/4,
            dataToDisplay: chartData)
        
        self.layer.addSublayer(chartLayer)
    }

}

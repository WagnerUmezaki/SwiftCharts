import UIKit

public class PieChartView: UIView {

    private var data:[DonutChartData] = []
    
    override public init(frame: CGRect) {
        data.append(DonutChartData(label: "Label1", value: 100, color: UIColor.red))
        data.append(DonutChartData(label: "Label2", value: 200, color: UIColor.blue))
        data.append(DonutChartData(label: "Label3", value: 50, color: UIColor.green))
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func draw(_ rect: CGRect) {
        let chartLayer = DonutChartFactory.getInstance().gimmeAChart(
            bounds: self.layer.bounds,
            arcWidth: NumberUtils.min(value1: self.layer.bounds.height, value2: self.layer.bounds.width)/2,
            dataToDisplay: data)
        
        self.layer.addSublayer(chartLayer)
    }
    
    public func setChartData(chartData:[DonutChartData]) {
        self.data = chartData
        self.setNeedsDisplay()
    }

}

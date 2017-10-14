# SwiftCharts

Simple framework to draw customizable charts for iOS.

![Swift 4](https://img.shields.io/badge/Swift-4-orange.svg) ![platforms](https://img.shields.io/badge/platform-iOS-lightgrey.svg) ![licence](https://img.shields.io/badge/license-MIT-blue.svg)

## Using
#### First of all - Import module
Import SwiftCharts module on your ViewController
``` swift
import SwiftCharts
```


#### Charts
Create a UIView on storyboard and set it`s class module to **SwiftCharts** and class to one of these listed below:
##### DiscreteLineChartView
Create reference
```swift
@IBOutlet weak var discreteLineChart: DiscreteLineChartView!
```
Updating data:
```swift
discreteLineChart.setChartData(data: [1, 2, 0, 5])
```
##### DonutChartView
Create reference
```swift
@IBOutlet weak var donutChartView: DonutChartView!
```
Updating data:
```swift
var chartData:[DonutChartData] = []
chartData.append(DonutChartData(label: "Label1", value: 100, color: UIColor.red))
chartData.append(DonutChartData(label: "Label2", value: 200, color: UIColor.blue))
donutChartView.setChartData(chartData: chartData)
```
##### PieChartView
Create reference
```swift
@IBOutlet weak var pieChartView: PieChartView!
```
Updating data:
```swift
var pieChartData:[DonutChartData] = []
pieChartData.append(DonutChartData(label: "Label1", value: 100, color: UIColor.red))
pieChartData.append(DonutChartData(label: "Label2", value: 200, color: UIColor.blue))
pieChartView.setChartData(chartData: pieChartData)
```

##### SimpleBarChartView
Create reference
```swift
@IBOutlet weak var simpleBarChartView: SimpleBarChartView!
```
Updating data:
```swift
var simpleBarChartData:[SimpleBarChartData] = []
simpleBarChartData.append(SimpleBarChartData(label: "label1", value: 100))
simpleBarChartData.append(SimpleBarChartData(label: "label2", value: 50))
//or if you don`t wanna to use default color setted on attribute inspector
simpleBarChartData.append(SimpleBarChartData(label: "label3", value: 150, color: UIColor.blue))
self.simpleBarChartView.setData(newData: simpleBarChartData)
```

##### Basic example
<p align="center">
    <img src="Images/screenshot.png" width="200"/>
</p>

## Up next (todo)
- Bar chart.
- Continous line chart.
- Animation for charts.
- Transparent charts.
- Add more information on charts (labels, values, etc...).
- Add event listener on charts.
- Tests.
- Tests.
- More tests.

## Contribution
Feel free to open [issues](https://github.com/WagnerUmezaki/SwiftCharts/issues) for report bugs, discuss some ideas or anything to make this a good framework. :)
## Lisence
MIT

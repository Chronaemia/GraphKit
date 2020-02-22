
<span align='center'>
    <img src="logo.png" alt="logo" />
    <h2>GraphKit ( WIP )</h2>
</span>
<p align='center'>Graphing library for SwiftUI</p>
<br />

The eventual goal here is to slowly over time offer similar functionality to D3.js but in a Swift package that can be installed easily via the Swift Package Manager

**If you'd like to follow the development of this project, we have a public feature board [here](https://trello.com/b/1b60nVkE).**

Until version 0.1.0, all development on this repository will be on the dev branch. This is to discourage anyone from using this library in production before it's completed.

### Graph Types

#### Bar Graphs
![Bar Graphs](./_readme/assets/Bar_Graph.png)

A simple line graph can be created using `BarGraph(data : [Double])` or optionally with a `BarGraphStyle` struct that contains settings for stroke widths, fill colors / gradients, and a few other options. More on this later.
****

#### Pie Graphs
![Pie Graphs](./_readme/assets/Pie_Graph.png)

A simple pie graph can be created using `PieGraph(data : [Double])` or optionally with a `PieGraphStyle` struct that contains settings for stroke widths, fill colors / gradients, and a few other options. More on this later.
****
#### Line Graph
![Line Graphs](./_readme/assets/Line_Graph.png)

A simple line graph can be created using `LineGraph(data : [Double])` or optionally with a `LineGraphStyle` struct that contains settings for stroke widths, fill colors / gradients, and a few other options. More on this later.

****
#### Bubble Chart / Scatter Plot
![Bubble Chart / Scatter Plot](./_readme/assets/Bubble_Chart.png)

A simple bubble / scatter chart can be created using `BubbleGraph(data: [Point])` or optionally with a `BubbleGraphStyle` struct that contains settings for stroke widths, fill colors / gradients, and a few other options. More on this later.
****
#### Gantt Chart
![Gantt Chart](./_readme/assets/Gantt.png)

A simple gantt chart can be created using `GanttChart(data : [DateInterval])` or optionally with a `GanttChartStyle` struct that contains settings for stroke widths, fill colors / gradients, and a few other options. More on this later.

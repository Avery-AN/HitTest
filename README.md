# HitTest

示意图如下:<br>
------------

![示意图](https://github.com/Avery-AN/HitTest/raw/master/DEMO_images/demo.png)<br>
<br>

如上图所示、各视图之间的关系是: ‘->表示子视图’<br>
RedView -> BrownView -> YellowView -> GreenView<br>
<br>
<br>

【 HitTest传统的处理方案 】<br>
------------------------
需要处理YellowView中的hittest方法、需要处理中BrownView的hittest方法；一共需要处理GreenView的两个父视图中的hittest方法。<br>
如果YellowView是A大仙开发的、那么则需要告诉他需要处理一下YellowView中的hittest方法；<br>
如果BrownView是B大姨开发的、那么也得告诉她需要处理一下BrownView中的hittest方法；<br>
这么做特别麻烦不说、此处还得需要修改别人的代码(或者麻烦别人修改Ta的代码)、很是影响你开发与测试的进度。。。<br>
<br>
<br>


【 优雅的处理方案 - Category 】<br>
------------------------
使用方法:
![使用方法](https://github.com/Avery-AN/HitTest/raw/master/DEMO_images/demo2.png)<br>
<br>
<br>


【 为了规避不可预见的风险、以及性能方面的考虑、最好创建类似于”RedView+HitTest”的 Category、而不是直接使用本例中的”UIView+HitTest”Category 】
------------------------

#  For Dark Mode GuideLines

1. If you want to avoid the dark mode in iOS 13, you have to define this Key in your plist "UIUserInterfaceStyle" and its value should be "Light". If you want to support only dark mode in your app then the value of "UIUserInterfaceStyle" == Dark.

2. When your application runs on iOS 13 and if you enable the dark mode in your settings of your device. Then your application would support the dark mode. And all the views of your view controller would become the black in Dark Mode. Only If your views color is white(systemBackgroundColor) then it will change the color of your view to black.

3. In Dark Mode, text Fields of text color would be white, if you don't apply the custom color to your text field.

4. You have to set two images for single asset. You can select any image and then choose the option of appearance and then choose the value of Any, Dark. In which you have to set the images for dark mode and for light mode. You have to do for all the images if its not looking good in dark mode.



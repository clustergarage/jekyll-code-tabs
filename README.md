# jekyll-code-tabs

> 💎 Separate language snippets with fenced code tabs for documentation pages

## Usage

````
{% codetabs %}

{% codetab C %}
```c
printf("Hello, world!");
```
{% endcodetab %}

{% codetab Go %}
```go
fmt.Println("Hello, world!")
```
{% endcodetab %}

{% codetab Python %}
```python
print("Hello, world!")
```
{% endcodetab %}

{% endcodetabs %}
````

This will create a tabbed-view (hardcoded to UIkit classes for now) that will
allow the user to toggle between content.

![alt
text](https://raw.githubusercontent.com/clustergarage/jekyll-code-tabs/master/docs/screencap.gif)

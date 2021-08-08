# Notepad in a browser
```html
data:text/html;charset=utf-8, <title>Notepad</title><textarea style="font-size: 1.2em; width: 100%; height: 100%; border: 10px; outline: line grey; padding: 10px;" autofocus />
```

# Insert text in the active field
```javascript
javascript:(function(a){a.value=a.value.slice(0,a.selectionStart) + "abc" + a.value.slice(a.selectionEnd);})(document.activeElement);
```

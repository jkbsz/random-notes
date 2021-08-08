// Insert text in the active field
javascript:(function(a){a.value=a.value.slice(0,a.selectionStart) + "abc" + a.value.slice(a.selectionEnd);})(document.activeElement);

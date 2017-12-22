/* https://www.reddit.com/r/nim/comments/3141gm/ajax_in_nim_with_the_js_backend/ */
var lazyRequest = function(endpoint) {
    var httpRequest = new XMLHttpRequest();
    httpRequest.open('GET', endpoint, false);
    httpRequest.send();
    return httpRequest.responseText;
};

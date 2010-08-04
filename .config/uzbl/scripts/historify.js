/*
 * Historious Bookmarklet
 */
historious_base_url='http://historio.us/';
historious_key='tcoz7yqd';
hs = document.createElement('script');
hs.type = 'text/javascript';
hs.src = 'http://historio.us/media/js/bookmarklet.js?x=' +(Math.random());
document.getElementsByTagName('head')[0].appendChild(hs);

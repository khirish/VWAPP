var responseData = null;
function setItem(data) {
    let marumeru = 10;
    let main =  data["紙面情報"];
    // console.log(main);

    let w = main["紙面サイズX"] / marumeru;
    let h = main["紙面サイズY"] / marumeru;
    let bw = main["大組サイズX"] / marumeru;
    let bh = main["大組サイズY"] / marumeru;

    let kx = main["基準点X"] / marumeru;
    let ky = main["基準点Y"] / marumeru;

    let pw = main["PDFサイズX"] / marumeru;
    let ph = main["PDFサイズY"] / marumeru;

    let yol = main["PDF左余白"] / marumeru;
    let mx = main["PDF右余白"] / marumeru;
    let my = main["PDF天余白"] / marumeru;
    let yoc = main["PDF地余白"] / marumeru;

    let hi = document.querySelector('#article-area').clientHeight / ph;
    let canvas = document.querySelector('#article');
    canvas.style.width = pw+"px";
    canvas.style.height = ph+"px";
    canvas.style.transform = 'scale3d('+hi+', '+hi+', 1)';
    resize();

    let area = document.querySelector("#area");
    area.style.width = pw - mx - yol +"px";
    area.style.height = ph - my - yoc +"px";
    area.style.right = mx +"px";
    area.style.top = my +"px";

    let daihi = (pw - mx - yol) / w;

    hi = bw * daihi / bw;

    console.log(`ratio:${hi} point_x:${kx} point_y:${ky}`);
    let items = data["素材"];
    // console.log(items)

    // let item = items[0];
    for(let i in items) {
        let item = items[i];
        // console.log(item)
        let id = item["組版ID"];

        let rtx = item["右上X座標"];
        let rty = item["右上Y座標"];
        let lbx = item["左下X座標"];
        let lby = item["左下Y座標"];

        for(let k in rtx) {
            let cx = rtx[k] / marumeru;
            let cy = rty[k] / marumeru;
            let cxe = lbx[k] / marumeru;
            let cye = lby[k] / marumeru;

            let cw = cxe - cx;
            let ch = cye - cy;

            let itemID = id+'-'+k;

            document.querySelector('#area').insertAdjacentHTML('beforeend', '<span class="item" data-id="'+itemID+'"></span>');

            let x = cx - kx;
            let y = cy - ky;

            let item = document.querySelector('[data-id='+itemID+']');
            item.style.right = x*hi+"px";
            item.style.top = y*hi+"px";
            item.style.width = cw*hi+"px";
            item.style.height = ch*hi+"px";
        }
        // break;
    }
    setTimeout(function(){
        document.body.classList.add('animated');
    }, 300);
}

function resize() {
    let pw = document.querySelector('#article-container').clientWidth / document.querySelector('#article').clientWidth;
    let ph = document.querySelector('#article-container').clientHeight / document.querySelector('#article').clientHeight;
    let hi = pw > ph ? ph : pw;
    document.querySelector('#article').style.transform = 'scale3d('+hi+', '+hi+', 1)';
}

let resizeTimer;
window.addEventListener('resize', function (event) {
  if (resizeTimer !== false) { clearTimeout(resizeTimer); }
  resizeTimer = setTimeout(function () {
    resize();
  }, 500);
});

let xhr = new XMLHttpRequest();
xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
        let items = JSON.parse(xhr.response);
        responseData = items["位置情報"];
        setItem(responseData)
    }
  }
xhr.onerror = function() {
  console.warn("Error while getting XML.");
}
xhr.open("GET", "../assets/temp/xml.json");
xhr.send();


// var element = document.querySelector('#article')
// // And pass it to panzoom
// panzoom(element, {
//   // zoomSpeed: 1,
//   // pinchSpeed: 0.05,
//    zoomDoubleClickSpeed: 1,
//    bounds: true,
//   boundsPadding: 0.1,
//   maxZoom: 3,
//   minZoom: 1
// });
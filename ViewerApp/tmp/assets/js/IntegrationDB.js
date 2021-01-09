let Alert = function() {
};
Alert.prototype = {
  //アラートの表示
  error: function(msg, code) {
    swal({
      text: "",
      buttons: {cancel: "閉じる"},
      content: {
        element: 'div',
        attributes: {
          innerHTML: `<div id="alert-error"><strong id="title"><i class="fas fa-exclamation-circle"></i>エラーが発生しました</strong><p>${code != '' ? `<small class="code">${code}</small>` : '' }${msg}</p></div>`
        },
      }
    });
  }
};

/*------------------------------
検索API
------------------------------*/
let IntegrationDB = function(option) {
  this.id = option.id;
  this.xml = option.xml;
  this.xhr = null;
  this.timeout = 30000;
  this.timerResize = null;
  this.alert = new Alert();

  this.downscale = 10; //大きくすると精度が悪くなる: 1 - 50
  this.container = document.querySelector('#article-container');
  this.article = document.querySelector('#article-container .article-img');
  this.itemsArea = document.querySelector('#article-items');
  this.timerHover = null;

  this.tapCount = 0;
  this._panzoom = null;
};
IntegrationDB.prototype = {
  //画面に合わせてリサイズを行う
  resize: function(){
    let width = this.container.clientWidth / this.article.clientWidth;
    let height = this.container.clientHeight / this.article.clientHeight;
    let ratio = width > height ? height : width;
    this.article.style.transform = 'scale3d('+ratio+', '+ratio+', 1)';
  },

  //紙面情報から比率や位置情報を取得
  setInit: function(info) {
    let article_x = info["紙面サイズX"] / this.downscale;
    let article_y = info["紙面サイズY"] / this.downscale;
    let largeGroup_x = info["大組サイズX"] / this.downscale;
    let largeGroup_y = info["大組サイズY"] / this.downscale;

    let point_x = info["基準点X"] / this.downscale;
    let point_y = info["基準点Y"] / this.downscale;

    let pdf_x = info["PDFサイズX"] / this.downscale;
    let pdf_y = info["PDFサイズY"] / this.downscale;

    let pd_margin_light = info["PDF左余白"] / this.downscale;
    let pdf_margin_right = info["PDF右余白"] / this.downscale;
    let pdf_margin_top = info["PDF天余白"] / this.downscale;
    let pdf_margin_bottom = info["PDF地余白"] / this.downscale;

    let ratio = this.container.clientHeight / pdf_y;

    this.article.style.width = pdf_x+"px";
    this.article.style.height = pdf_y+"px";
    this.article.style.transform = 'scale3d('+ratio+', '+ratio+', 1)';
    
    this.resize();

    this.itemsArea.style.width = pdf_x - pdf_margin_right - pd_margin_light +"px";
    this.itemsArea.style.height = pdf_y - pdf_margin_top - pdf_margin_bottom +"px";
    this.itemsArea.style.right = pdf_margin_right +"px";
    this.itemsArea.style.top = pdf_margin_top +"px";

    let ratio_largeGroup = (pdf_x - pdf_margin_right - pd_margin_light) / article_x;

    ratio = largeGroup_x * ratio_largeGroup / largeGroup_x;

    return {ratio: ratio, point_x: point_x, point_y: point_y};
  },
  //位置を反映
  set: function(id, data) {
    if(data) {
      let res = this.setInit(data["紙面情報"]);
      let items = data["素材"];
      for(let i in items) {
        let item = items[i];
        let id = item["組版ID"];

        let point_x_right = item["右上X座標"];
        let point_y_right = item["右上Y座標"];
        let point_x_left = item["左下X座標"];
        let point_y_left = item["左下Y座標"];

        let z_index = item["優先順"];
        let kind = item["素材種別"];

        for(let k in point_x_right) {
          let scale_point_x_right = point_x_right[k] / this.downscale;
          let scale_point_y_right = point_y_right[k] / this.downscale;
          let scale_point_x_left = point_x_left[k] / this.downscale;
          let scale_point_y_left = point_y_left[k] / this.downscale;

          let width = scale_point_x_left - scale_point_x_right;
          let height = scale_point_y_left - scale_point_y_right;

          let itemID = id+'-'+k;

          document.querySelector('#article-items').insertAdjacentHTML('beforeend', '<span class="article-item" data-id-org="'+id+'" data-id="'+itemID+'" data-z_index="'+z_index+'" data-kind="'+kind+'"></span>');
          let item = document.querySelector('[data-id='+itemID+']');

          let x = scale_point_x_right - res.point_x;
          let y = scale_point_y_right - res.point_y;

          item.style.right = x * res.ratio + "px";
          item.style.top = y *res.ratio +"px";
          item.style.width = width * res.ratio + "px";
          item.style.height = height * res.ratio + "px";

          item.addEventListener('click', this.link.bind(this), false);
        }
      }
      //ダブルタップ
      this.container.addEventListener("touchstart", function(e){
        ++this.tapCount;
        document.body.touchstart = true;
        if(this.tapCount < 2) {
          setTimeout(function(){
            document.body.touchstart = false;
            this.tapCount = 0;
          }.bind(this), 250);
        } else {
          e.preventDefault();
          console.log( "ダブルタップに成功しました!!" ) ;
          // this._panzoom.zoomIn;
          if(this._panzoom.getScale() >= this._panzoom.getOptions().maxScale) {
            this._panzoom.zoom(1, {animate: true});
          } else {
            this._panzoom.zoom(this._panzoom.getScale() + 1, {animate: true});
          }
        }
      }.bind(this), false);

      setTimeout(function() {
        this.resize();
        this.zoom();
        // console.log("aaa")
      }.bind(this), 1000);
    } else {
      setTimeout(function() {
        this.resize();
        this.zoom();
      }.bind(this), 600);
    }
    // this.itemsHover();
  },

  link: function(e) {
    window.webkit.messageHandlers.log.postMessage("link");
    window.webkit.messageHandlers.log.postMessage(this.tapCount);
    if(this.tapCount >= 2) { return false; }
    window.webkit.messageHandlers.log.postMessage(this.tapCount);
    // if(document.body.classList.contains('image-move')) {
    //   return false;
    // }
    let id = e.currentTarget.getAttribute('data-id-org');
    this.hoverGroupsRemove();
    this.hoverGroups(id);

    setTimeout(function(){
      window.webkit.messageHandlers.news.postMessage(id);
      setTimeout(function(){
        this.hoverGroupsRemove();
      }.bind(this), 500);
    }.bind(this), 300);
    // if(document.querySelector('.link[data-id='+id+']')) {
      // document.querySelector('.link[data-id='+id+']').click();
    // } else {
      // document.querySelector('#article-list a[data-id*='+id+']').click();
    // }
  },
  imageLoaded: function() {
    this.resize();
    setTimeout(function(){
      this.zoom();
    }.bind(this), 50);
    setTimeout(function(){
    }.bind(this), 100);
    setTimeout(function(){
      document.body.classList.add('animated');
    }.bind(this), 300);
  },
  zoom: function() {
    //ズーム機能
    this._panzoom = Panzoom(this.container, {
      maxScale: 4,
      contain: 'outside'
    });
    
    //移動中はクリックを無効
    this.container.addEventListener('panzoomchange', function(){
      document.body.classList.add('image-move');
    }, false);
    //移動がすんだタイミングでクリックを可能にする
    this.container.addEventListener('panzoomend', function(){
        setTimeout(function(){
          document.body.classList.remove('image-move');
        }, 150);
    }, false);
  },

  //アクション
  action: function(){
    //画面リサイズ時に、再度計算をする
    window.addEventListener('resize', function () {
      if (this.timerResize !== false) { clearTimeout(this.timerResize); }
      this.timerResize = setTimeout(function () {
        this.resize();
      }.bind(this), 500);
    }.bind(this), false);
  },

  hoverGroups: function(id) {
    let findItems = document.querySelectorAll('#article-items .article-item[data-id-org='+id+']');
    this.hoverGroupsRemove();
    if(findItems) {
      for(let i = 0; i < findItems.length; i++) {
        findItems[i].classList.add('action-hover');
      }
    }
  },
  hoverGroupsRemove: function() {
    let befores = document.querySelectorAll('#article-items .article-item');
    for(let i = 0; i < befores.length; i++) {
      befores[i].classList.remove('action-hover');
    }
  },

  //初期設定
  init: function(){
    //各種イベントを登録
    this.action();
    //紙面情報XMLを取得
    this.set(this.id, this.xml);

    //画像が読み込み終わるのを監視する
    let paperImage = this.article.querySelector('img');
    let _this = this;
    paperImage.addEventListener('load', function() {
      _this.imageLoaded();
    }.bind(this), false);
  }
};

import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="image-switcher"
export default class extends Controller {
  static targets = ["image"];

  connect() {
    console.log("ImageSwitcher controller connected");
  }

  // サムネイル画像をクリックした際にメイン画像を変更するメソッド
  switch(event) {
    // クリックされたサムネイルのデータインデックスを取得
    const index = event.target.dataset.index;
    // メイン画像の要素を取得
    const mainImage = document.getElementById("main-event-image");
    // クリックされたサムネイルの画像URLを取得
    const thumbnailSrc = this.imageTargets[index].src;
    // メイン画像のURLをサムネイルのURLに変更
    mainImage.src = thumbnailSrc;
  }
}

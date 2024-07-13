document.addEventListener('turbo:load', function(){
  // 新規投稿・編集ページのフォームを取得
  const eventForm = document.getElementById('new_event');

  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!eventForm) return null;
  console.log("preview.jsが読み込まれました");
});

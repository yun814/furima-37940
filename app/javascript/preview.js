function preview() {
  // 新規投稿・編集ページのフォームを取得
  const postForm = document.getElementById('post');
  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('previews');
  // 新規投稿・編集ページのフォームがないなら処理終了
  if (!postForm) return null;

  // 投稿できる枚数の制限を定義
  const imageLimits = 5;

  // プレビュー画像を生成・表示する関数
  const buildPreviewImage = (dataIndex, blob) => {
    // 画像を表示するためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.setAttribute('data-index', dataIndex);

    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    // 削除ボタンを生成
    const deleteButton = document.createElement('div');
    deleteButton.setAttribute('class', 'image-delete-button');
    deleteButton.innerText = "削除";

    // 削除ボタンをクリックしたら削除機能を起動させる
    deleteButton.addEventListener('click', () => deleteImage(dataIndex));
    
    // 生成したHTMLの要素をブラウザに表示させる
    previewWrapper.appendChild(previewImage);
    previewWrapper.appendChild(deleteButton);
    previewList.appendChild(previewWrapper);
  };

  // file_fieldを生成・表示する関数
  const buildNewFileField = () => {
    // 新しいfile_fieldを作成
    const newFileField = document.createElement('input');
    newFileField.setAttribute('type', 'file');
    newFileField.setAttribute('name', 'item[images][]');

    // 最後のfile_fieldを取得
    const lastFileField = document.querySelector('input[type="file"][name="item[images][]"]:last-child');
    // 新しいfile_fieldのdata-indexを最後のfile_fieldの+1に設定
    const nextDataIndex = Number(lastFileField.getAttribute('data-index')) + 1;
    newFileField.setAttribute('data-index', nextDataIndex);

    // 追加されたfile_fieldにchangeイベントをセット
    newFileField.addEventListener('change', changedFileField);

    // 生成したfile_fieldを表示
    const fileFieldsArea = document.querySelector('.click-upload');
    fileFieldsArea.appendChild(newFileField);
  };

  // 指定したdata-indexを持つプレビューとfile_fieldを削除する関数
  const deleteImage = (dataIndex) => {
    const deletePreviewImage = document.querySelector(`.preview[data-index="${dataIndex}"]`);
    deletePreviewImage.remove();
    const deleteFileField = document.querySelector(`input[type="file"][data-index="${dataIndex}"]`);
    deleteFileField.remove();

    const imageCount = document.querySelectorAll('.preview').length;
    if (imageCount == imageLimits - 1) buildNewFileField();
  }
  
  // input要素で値が変化したときに処理される関数
  const changedFileField = (e) => {
    const dataIndex = e.target.getAttribute('data-index');
    
    const file = e.target.files[0];

    // fileが空の場合プレビュー等を削除して終了する
    if (!file) {
      deleteImage(dataIndex);
      return null;
    };

    const blob = window.URL.createObjectURL(file);

    // data-indexを使用して、すでにプレビューが表示されているかを確認する
    const alreadyPreview = document.querySelector(`.preview[data-index="${dataIndex}"]`);

    if (alreadyPreview) {
      const alreadyPreviewImage = alreadyPreview.querySelector('img');
      alreadyPreviewImage.setAttribute('src', blob);
      return null;
    }

    buildPreviewImage(dataIndex, blob);
    const imageCount = document.querySelectorAll('.preview').length;
    if (imageCount < imageLimits) buildNewFileField();
  };

  // input要素を取得
  const fileField = document.querySelector('input[type="file"][name="item[images][]"]');
  // input要素の値の変化を検知
  fileField.addEventListener('change', changedFileField);
};

document.addEventListener('DOMContentLoaded', preview)
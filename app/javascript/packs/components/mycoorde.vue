<template>
  <div class="p-5">
    <h1 class="text-center pt-1 pb-4 font-weight-bold">あなたのお気に入りのコーディネートを登録しよう！</h1>
  <form>
    <div class="form-row">
      <!-- 左部 -->
      <div class="col">
        <div class="form-group col-md-12">
          <input type="email" class="form-control" placeholder="登録したい画像のURLを入力してください">
        </div>
        <img class="w-100 px-3" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMcQDaIjUOTO7jDRKoMa7ZU6BcFgGGqUlZKKwovb0pHVEJ1gO9" alt="コーディネートイメージ">
      </div>

      <!-- 右部 -->
      <div class="col">
        <div class="form-group col-md-12">
          <input type="email" class="form-control" placeholder="title">
        </div>
        <div class="form-group col-md-12">
          <h4>トップス</h4>
        </div>
        <div class="form-group col-md-6 float-left">
          <input type="text" class="form-control" placeholder="category">
        </div>
        <div class="form-group col-md-6 float-right">
          <input type="text" class="form-control" placeholder="color">
        </div>
        <div class="form-group col-md-12">
          <h4>インナー</h4>
        </div>
        <div class="form-group col-md-6 float-left">
          <input type="text" class="form-control" placeholder="category">
        </div>
        <div class="form-group col-md-6 float-right">
          <input type="text" class="form-control" placeholder="color">
        </div>
        <div class="form-group col-md-12">
          <h4>ボトムス</h4>
        </div>
        <div class="form-group col-md-6 float-left">
          <input type="text" class="form-control" placeholder="category">
        </div>
        <div class="form-group col-md-6 float-right">
          <input type="text" class="form-control" placeholder="color">
        </div>
        <div class="form-group col-md-12">
          <h4>シューズ</h4>
        </div>
        <div class="form-group col-md-6 float-left">
          <input type="text" class="form-control" placeholder="category">
        </div>
        <div class="form-group col-md-6 float-right">
          <input type="text" class="form-control" placeholder="color">
        </div>
        <div class="form-group col-md-12">
          <h4>アクセサリ</h4>
        </div>
        <div class="form-group col-md-6 float-left">
          <input type="text" class="form-control" placeholder="category">
        </div>
        <div class="form-group col-md-6 float-right">
          <input type="text" class="form-control" placeholder="color">
        </div>
      <button type="submit" class="btn btn-primary float-right mr-3">登録！</button>
    </div>

    </div>


  </form>
  </div>
</template>

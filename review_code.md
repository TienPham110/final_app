
###### controllers/albums_controller.rb
  1. Đặt tên biến sai. Album find id nên là số ít, còn list album nên là số nhiều
  2. Sử dụng before_action trong controllers để fetch album cho action edit, update
  3.
    ```
    def title_params
      params.require(:album).permit(:title)[:title]
    end
    ```
    Hàm này khó để tái sử dụng được. Thay thế bằng cách
      ```
        def album_params
          params.require(:album).permit(:title)
        end
      ```
    Trên action update sẽ dùng album.update(album_params)
  4. mỗi action nen có 1 line trống

###### app/views/albums/show.html.erb
  1. sửa lại tên biến
  2. hạn chế dùng css inline

NOTE:
  - Layout: hạn chế sử dụng css inline
  - Controller: xem lại cách đặt tên biến, mỗi action nên có 1 line trống, Xóa action rổng không xài
  - Model: Sử dụng couter_cache để đếm
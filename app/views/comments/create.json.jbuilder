if @comment.persisted?
  json.form render(partial: "comments/form", formats: :html, locals: {item: @item, comment: Comment.new})
  json.inserted_item render(partial: "items/comment", formats: :html, locals: {comment: @comment})
else
  json.form render(partial: "comments/form", formats: :html, locals: {item: @item, comment: @comment})
end

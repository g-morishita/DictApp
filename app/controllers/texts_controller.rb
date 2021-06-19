class TextsController < ApplicationController
  def show
    @item = Item.find(params[:item_id])
    # If order is not specified, it is the first one.
    order = params[:order] || 1
    @text = @item.texts.find_by(order: order)
    if @text.nil?
      flash[:danger] = "不正なパラメタです"
      redirect_to root_path
    end
    @progress = ((@text.order * 100) / @item.texts.count)
    @give_up = params[:give_up]
  end

  def update
    text = Text.find(params[:id])
    if text.update(body: params[:body])
      flash[:success] = "Updated!"
      redirect_to item_text_url(params[:item_id], params[:id], order: text.order)
    else
      flash[:danger] = "Failed to update!"
      redirect_to item_text_url(params[:item_id], params[:id], order: text.order)
    end
  end

  def create
    @text = Text.create(text_params)
  end

  # Check dictation
  def check
    # TODO: Want to check word by word.
    # For now, check the whole sentence.
    @text = Text.find(params[:text_id])
    correct_body = @text.body
    if params[:body] == correct_body
      flash[:success] = "Correct"
    else
      flash[:danger] = "Wrong"
    end
    redirect_to item_text_url(params[:item_id], params[:text_id], order: @text.order)
  end

  private

    def text_params
      params.require(:text).permit(:item_id, :body, :sound, :order)
    end
end

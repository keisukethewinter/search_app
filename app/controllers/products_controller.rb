class ProductsController < ApplicationController

  before_action :search_product, only: [:index, :search]

  def index
    @products = Product.all
    set_product_column # private内に定義したメソッドを実行
    set_category_column # private内に定義したメソッドを実行
  end

  def search
    @results = @p.result.includes(:category) # 検索条件にマッチした商品の情報を取得
  end

  private

  def search_product
    @p = Product.ransack(params[:q]) # 検索オブジェクトを生成
  end

  def set_product_column
    @product_name = Product.select("name").distinct # 重複なくnameカラムのデータを取り出す
    @product_size = Product.select("size").distinct # 重複なくnameカラムのデータを取り出す
    @product_status = Product.select("status").distinct # 重複なくnameカラムのデータを取り出す
  end

  def set_category_column
    @category_name = Category.select("name").distinct
  end

end

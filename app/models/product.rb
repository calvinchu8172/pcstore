class Product < ActiveRecord::Base
  include SoftDestroy
  mount_uploader :image, ProductImageUploader

  belongs_to :category



  default_scope { where(is_deleted: false) }

  # 被include SoftDestroy所取代，SoftDestroy方法寫在concern內
  # def set_delete
    # self.is_deleted = true
    # save
  # end

  def status
   # if is_online
      # "上架中"
    # else
      # "未上架"
    # end
    # 以下為更簡潔的寫法
    is_online ? I18n.t("On_shelf") : I18n.t("Off_shelf")
  end

end

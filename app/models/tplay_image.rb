class TplayImage < ApplicationRecord

belongs_to :tplay

has_attached_file :image, styles: {
    small: '60^x60',
    sub: '200^x200',
    main: "900x"
}
validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
validates_attachment_size :image, in: 0..10.megabytes

end

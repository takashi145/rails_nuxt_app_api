class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # 文字サイズ制限
    max = 255
    record.errors.add(attribute, :too_long, count: max) if value.length > max

    # email format判定
    format = /\A\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\z/
    record.errors.add(attribute, :invalid) unless format =~ value

    # アクティブなメールアドレスの一意性判定
    record.errors.add(attribute, :taken) if record.email_activated?
  end
end

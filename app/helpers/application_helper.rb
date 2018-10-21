module ApplicationHelper
  def calc_time(obj)
    before_time = Time.now() - obj.updated_at
    if before_time < 60
      p before_time.round.to_s + "秒前"
    elsif before_time < 60 * 60
      p (before_time/60).round.to_s + "分前"
    elsif before_time < 60 * 60 *24
      p (before_time/60/60).round.to_s + "時間前"
    else
      p obj.created_at.strftime("%Y年%m月%d日")
    end
  end
end

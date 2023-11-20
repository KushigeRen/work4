require "csv"

##新規メモ作成メソッド
def create_csv()
    ##新規ファイル名入力
    puts "拡張子を除いたファイル名を入力してください"
    title = gets.chomp
    ##メモ内容入力
    puts "メモしたい内容を入力してctrl+Dを押してください。"
    memo = STDIN.read
    csv_options = {quote_char: ''}
    ##csv出力
    CSV.open("#{title}.csv","w", **csv_options) do |csv|
        csv << [memo]
    end
end

##メモ編集メソッド
def edit_csv()
    ##編集するファイル名を入力
    puts "編集するcsvファイル名を拡張子なしで入力してください"
    title = gets.chomp
    ##ファイルの存在確認
    if File.exist?("./#{title}.csv")
        ##メモ内容上書き
        puts "編集内容を入力してctrl+Dを押してください"
        memo = STDIN.read
        csv_options = {quote_char: ''}
        CSV.open("#{title}.csv","w", **csv_options) do |csv|
            csv << [memo]
        end
    else
        puts "指定されたファイルは存在しません"
    end
end


puts "1か２のいずれかの数字を入力しEnterを押してください"
puts "1(新規でメモを作成) 2(既存のメモを編集)"
## ユーザの入力を待機
num = gets.to_i

##入力値によって処理分岐
case num
when 1
    create_csv()
when 2
    edit_csv()
else
    puts "入力値が不正です １か２の数字を入力してください"
end
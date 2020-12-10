resipe = Category.create(name: "レシピ")
resipe_children_array = ['肉', '野菜', '麺類', '丼もの']
resipe_grandchildren_array = [
  ['牛肉', '豚肉', '鶏肉'], #肉
  ['レタス', 'トマト', 'キャベツ'], #野菜
  ['ラーメン', 'つけ麺', '僕イケメン'], #麺類
  ['牛丼', '豚丼', '親子丼'] #丼もの
]

resipe_children_array.each_with_index do |child, index|
  child = resipe.children.create(name: child)
  resipe_grandchildren_array[index].each do |grandchild|
    child.children.create(name: grandchild)
  end
end
ApplicationRecord.transaction do
	Recipe.delete_all

	Recipe.create(
		"title": "トマトスープ",
		"making_time": "15分",
		"serves": "5人",
		"ingredients": "玉ねぎ, トマト, スパイス, 水",
		"cost": "450"
	)
end
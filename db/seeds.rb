# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ name: 'bob', state: 0 },
             { name: 'alice', state: 0 },
             { name: 'jiro', state: 0 },
             { name: 'john', state: 0 }])

Tag.create([{name: 'ツール',
             description: '在宅勤務で使うツールについての質問を見たり、質問したりしてみましょう。'},
            {name: '会議',
             description: '在宅勤務の会議のやり方や会議の進め方についての質問を見たり、質問したりしてみましょう。'},
            {name: '働き方',
             description: '在宅勤務で使う会議についての質問を見たり、質問したりしてみましょう。'},
            {name: '制度設計',
             description: '在宅勤務の制度設計についての質問を見たり、質問したりしてみましょう。'},
            {name: '総合',
             description: '在宅勤務で使う会議についての質問を見たり、質問したりしてみましょう。'}])

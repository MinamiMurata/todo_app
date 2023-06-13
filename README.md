| Model | column          | datatype |
| :---: | :-------------- | :------- |
| User  | name            | string   |
|       | email           | string   |
|       | password_digest | string   |

| Model | column   | datatype |
| :---: | :------- | :------- |
| Task  | user_id  |          |
|       | title    | string   |
|       | content  | text     |
|       | deadline | datetime |
|       | priority | integer  |
|       | status   | integer  |

|   Model    | column   | datatype |
| :--------: | :------- | :------- |
| Task_label | task_id  |          |
|            | label_id |          |

| Model | column | datatype |
| :---: | :----- | :------- |
| Label | label1 | string   |
|       | label2 | string   |

---

# Heroku へのデプロイ手順

1. Heroku ユーザ登録
   [公式サイト](https://www.heroku.com/)にアクセスし、ユーザー登録する。

2. herokuCLI をインストールする

```
$ brew tap heroku/brew && brew install heroku
```

3. heroku にログインする

```
$ heroku login
```

4. Heroku に新しいアプリケーションを作成する

```
$ heroku create
```

5. Gemfile に Gem を追加し、bundle install を実行

```
gem 'net-smtp'
gem 'net-imap'
gem 'net-pop'
```

6. コミットする

```
$ git add .
$ git commit -m "commit message"
```

7. Heroku buildpack を追加する

```
$ heroku buildpacks:set heroku/ruby
$ heroku buildpacks:add --index 1 heroku/nodejs
$ heroku addons:create heroku-postgresql
```

8. Heroku にデプロイをする

```
git push heroku master
```

- ① エラー内容／対処法

```
remote: ! The Ruby version you are trying to install does not exist on this stack.
remote: !
remote: ! You are trying to install ruby-3.0.1 on heroku-22.
remote: !
remote: ! Ruby ruby-3.0.1 is present on the following stacks:
remote: !
remote: ! - heroku-20
```

↓

```
$ heroku stack:set heroku-20
```

- ② エラー内容／対処法

```
remote: Your bundle only supports platforms ["arm64-darwin-21"] but your local platform
remote: is x86_64-linux. Add the current platform to the lockfile with
remote: `bundle lock --add-platform x86_64-linux` and try again.
remote: Bundler Output: Your bundle only supports platforms ["arm64-darwin-21"] but your local platform
remote: is x86_64-linux. Add the current platform to the lockfile with
remote: `bundle lock --add-platform x86_64-linux` and try again.
remote:
remote: !
remote: ! Failed to install gems via Bundler.
remote: !
remote: ! Push rejected, failed to compile Ruby app.
```

↓

```
$ bundle lock --add-platform x86_64-linux
```

- ③ エラー内容／対処法

```
remote: Error: error:0308010C:digital envelope routines::unsupported

remote: Node.js v18.16.0
remote:
remote:
remote: !
remote: ! Precompiling assets failed.
remote: !
```

↓
package.json に以下を追記

```
"engines": {
"node": "16.x"
}
```

9. データベースの移行

```
$ heroku run rails db:migrate
```

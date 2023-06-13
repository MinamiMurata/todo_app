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

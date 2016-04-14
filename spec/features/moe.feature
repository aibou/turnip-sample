Feature: moe
  Scenario Outline: userごとの挙動
    Given user_nameは <user_name>
    And ブラウザは safari

    When requestを投げる

    Then HTTPステータスは <status>
    
    Examples:
    | user_name | status |
    | aibou    |    200 |
    | axross   |    404 |



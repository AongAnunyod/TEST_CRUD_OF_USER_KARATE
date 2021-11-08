Feature: karate test
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'http://localhost:6969/profile/v1/user'

  Scenario: create user
    Given path 'createdata'
    And request {firstName:'Anunyod',lastName:'Kiattiyodpakdee',nickName:'Aong',phoneNumber:'0894561231'}
    When method post
    Then status 201
    And match $ == {message:'#notnull'}
    And match $ == {message:'#string'}
    And match $.message != '#null'

  Scenario: deleteuser
    Given path 'deleteuser'
    And request {userId:1}
    When method DELETE
    Then status 201
    And match $ == {message:'#string'}
    And match $ == {message:'#notnull'}
    And match $.message != '#null'

  Scenario: getdata
    Given path 'getdata'
    When method GET
    Then status 200
    And match $ == {userId:'#number',firstName:'#string',lastName:'#string',nickName:'#string',phoneNumber:'#string'}
    And match $ == {userId:'#notnull',firstName:'#notnull',lastName:'#notnull',nickName:'#notnull',phoneNumber:'#notnull'}
    And match $.userId != '#null'
    And match $.firstName != '#null'
    And match $.lastname != '#null'
    And match $.nickName != '#null'
    And match $.phoneNumber != '#null'

  Scenario: updateUser
    Given path 'updateUser'
    And request {userId:1,new_firstName:'Anunyod2',new_lastName:'Kiattiyodpakdee2',new_nickName:'Aong2',new_phoneNumber:'0894561232'}
    When method PUT
    Then status 200
    And match $ == {message:'#notnull'}
    And match $ == {message:'#string'}
    And match $.message != '#null'




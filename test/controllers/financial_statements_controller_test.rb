require 'test_helper'

class FinancialStatementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @financial_statement = financial_statements(:one)
  end

  test "should get index" do
    get financial_statements_url
    assert_response :success
  end

  test "should get new" do
    get new_financial_statement_url
    assert_response :success
  end

  test "should create financial_statement" do
    assert_difference('FinancialStatement.count') do
      post financial_statements_url, params: { financial_statement: { name: @financial_statement.name, price: @financial_statement.price, symbol: @financial_statement.symbol } }
    end

    assert_redirected_to financial_statement_url(FinancialStatement.last)
  end

  test "should show financial_statement" do
    get financial_statement_url(@financial_statement)
    assert_response :success
  end

  test "should get edit" do
    get edit_financial_statement_url(@financial_statement)
    assert_response :success
  end

  test "should update financial_statement" do
    patch financial_statement_url(@financial_statement), params: { financial_statement: { name: @financial_statement.name, price: @financial_statement.price, symbol: @financial_statement.symbol } }
    assert_redirected_to financial_statement_url(@financial_statement)
  end

  test "should destroy financial_statement" do
    assert_difference('FinancialStatement.count', -1) do
      delete financial_statement_url(@financial_statement)
    end

    assert_redirected_to financial_statements_url
  end
end

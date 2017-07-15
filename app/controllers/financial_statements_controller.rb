class FinancialStatementsController < ApplicationController
  before_action :set_financial_statement, only: [:show, :edit, :update, :destroy]

  # POST /financial_statements
  def scrape
    return if params[:symbol].blank?

    ScrapeYahooJob.perform_later(params[:symbol])

    render plain: "Job submitted"
  end

  # GET /financial_statements
  # GET /financial_statements.json
  def index
    @financial_statements = FinancialStatement.all
  end

  # GET /financial_statements/1
  # GET /financial_statements/1.json
  def show
    render json: @financial_statement
  end

  # GET /financial_statements/new
  def new
    @financial_statement = FinancialStatement.new
  end

  # GET /financial_statements/1/edit
  def edit
  end

  # POST /financial_statements
  # POST /financial_statements.json
  def create
    @financial_statement = FinancialStatement.new(financial_statement_params)

    respond_to do |format|
      if @financial_statement.save
        format.html { redirect_to @financial_statement, notice: 'Financial statement was successfully created.' }
        format.json { render :show, status: :created, location: @financial_statement }
      else
        format.html { render :new }
        format.json { render json: @financial_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financial_statements/1
  # PATCH/PUT /financial_statements/1.json
  def update
    respond_to do |format|
      if @financial_statement.update(financial_statement_params)
        format.html { redirect_to @financial_statement, notice: 'Financial statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @financial_statement }
      else
        format.html { render :edit }
        format.json { render json: @financial_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_statements/1
  # DELETE /financial_statements/1.json
  def destroy
    @financial_statement.destroy
    respond_to do |format|
      format.html { redirect_to financial_statements_url, notice: 'Financial statement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_statement
      @financial_statement = FinancialStatement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financial_statement_params
      params.require(:financial_statement).permit(:symbol, :name, :price)
    end
end

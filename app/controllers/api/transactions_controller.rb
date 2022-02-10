class Api::TransactionsController < Api::BaseController
  before_action :set_transaction, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1 or /transactions/1.json
  def show
       render json: { status: :ok, data: @transaction }

  end


  # POST /transactions or /transactions.json
  def create
    params[:transaction][:user_id] = current_user.id if params[:transaction]
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
       render json: { status: :created, data: @transaction }
     else
       render json: { status: :unprocessable_entity, data: @transaction.errors }
    end

  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
      if @transaction.update(transaction_params)
        render json: {status: :ok, data: @transaction }
      else
        render json: {status: :unprocessable_entity, data: @transaction.errors }
      end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    # @transaction.destroy
    #   render json: { head: :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:user_id, :customer_id, :input_amount, :input_currency, :output_amount, :output_currency)
    end
end

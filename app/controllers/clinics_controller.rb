class ClinicsController < ApplicationController
  # クリニック一覧
  def index
  	@clinics = Clinic.order(id: :desc)
  		.reverse_order.page(params[:page]).per(10)
  end

  # クリニック詳細
  def show
  	@clinic = Clinic.find(params[:id])
  end

  # 会計登録フォーム
  def new
  	@clinic = Clinic.new
  end

  # 編集フォーム
  def edit
  	@clinic = Clinic.find(params[:id])
  end

  # 会計作成フォーム
  def create
  	@clinic = Clinic.new(clinic_params)
  	@clinic.receipt.build
  	if @clinic.save
  		redirect_to @clinic, notice: "登録が完了しました"
  	else
  		render "new"
  	end
  end

  # 更新
  def update
  	@clinic = Clinic.find(params[:id])
  	@clinic.assign_attributes(clinic_params)
  	if @clinic.save
  		redirect_to @clinic, notice: "クリニックを更新しました"
  	else
  		render "edit"
  	end
  end

  # 削除
  def destroy
  	@clinic = Clinic.find(params[:id])
  	@clinic.destroy
  	redirect_to :clinics, notice: "クリニックを削除しました"
  end

  private
  def clinic_params
  	params.require(:receipt).permit(:name, receipt_attributes: [:id, :payday, :payment_method, :service, :payment, :gained_point, :payee, :_destroy)
  end
end

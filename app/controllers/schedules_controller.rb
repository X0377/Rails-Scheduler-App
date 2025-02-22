class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @schedules_count = @schedules.count
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      redirect_to :schedules, notice: "予定を作成しました"
    else
      flash.now[:alert] = '予定の作成に失敗しました'
      render :new
    end
  end

    def show
      @schedule = Schedule.find_by(id: params[:id])

      unless @schedule
        flash[:alert] = "スケジュールが見つかりません"
        redirect_to schedules_path
      end
    end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to @schedule, notice: '予定を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    redirect_to @schedule, notice: '予定を削除しました'
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :start_at, :end_at, :all_day, :memo)
  end


end

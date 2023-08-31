defmodule FreelancerRates do
  @hours_per_day 8.0
  @billable_days_per_month 22.0

  def daily_rate(hourly_rate), do: hourly_rate * @hours_per_day

  def apply_discount(before_discount, discount) do
    before_discount * (1.0 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
    |> then(&ceil(&1 * @billable_days_per_month))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
    |> then(&Float.floor(budget / &1, 1))
  end
end

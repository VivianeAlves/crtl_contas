require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

# Agendar para o primeiro dia de cada mês
scheduler.cron '0 0 1 * *' do
  ProcessarContasJob.perform_now
end
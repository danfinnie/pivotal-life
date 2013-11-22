mantras = [
  'Do the right thing.',
  'Do what works.',
  'Be kind.'
]

SCHEDULER.every '5s' do
  send_event('mantra', { text: mantras.sample })
end

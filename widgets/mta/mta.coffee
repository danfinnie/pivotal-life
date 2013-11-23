class Dashing.Mta extends Dashing.Widget

  ready: ->
    @subwayStatusElement = $(@node).find('.subway-status-container')
    @startCarousel()

  startCarousel: ->
    setInterval(@nextStatus, 4000)
    @nextStatus()

  nextStatus: =>
    @currentIndex ||= 0
    statuses = @get('statuses') || []

    @set('current_status', statuses[@currentIndex])
    $(".line").removeClass("yes")
    $(".line-#{train}").addClass("yes") for train in @get('current_status').trains

    @currentIndex = (@currentIndex + 1) % statuses.length

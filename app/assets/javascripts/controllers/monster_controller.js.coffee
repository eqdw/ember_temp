App.MonsterController = Ember.ObjectController.extend(
  needs: ['game']
  
  cost: (-> 
    @get('baseCost') * Math.pow(@get('controllers.game').get('growthRate'), 
      @get('count'))
  ).property('count')
  
  buy: ->
    gameController = @get('controllers.game')
    if gameController.get("count") > @get('cost')
      gameController.get("game").incrementProperty('count', -@get('cost'))
      @incrementProperty('count')
      gameController.setNotice("Congratulations on your new " + @get("name").toLowerCase() + ".")
      gameController.recalculate()
      
      
)

function itemContentChanged() 
    itemData = m.top.itemContent
    m.time.text = itemData.time
    m.name.text = itemData.name
    m.away_score.text = itemData.away_score
    m.home_score.text = itemData.home_score
  end function
  
  function init() 
    m.time = m.top.findNode("time") 
    m.name = m.top.findNode("name") 
    m.away_score = m.top.findNode("away_score") 
    m.home_score = m.top.findNode("home_score") 
  end function
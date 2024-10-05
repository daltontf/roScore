function init() 
  m.time = m.top.findNode("time") 
  m.name = m.top.findNode("name") 
  m.away_score = m.top.findNode("away_score") 
  m.home_score = m.top.findNode("home_score") 
  m.dateTime = CreateObject("roDateTime")
  m.secondsOffSet = m.dateTime.GetTimeZoneOffset() * 60
end function

function itemContentChanged() 
  itemData = m.top.itemContent
 
  m.dateTime.FromISO8601String(itemData.time)
  adjTime = m.dateTime.AsSeconds() - m.secondsOffSet
  m.dateTime.FromSeconds(adjTime)

  m.time.text = m.dateTime.asDateStringLoc("MM/dd/yy ") + m.dateTime.asTimeStringLoc("h:mm a")
  m.name.text = itemData.name
  m.away_score.text = itemData.away_score
  m.home_score.text = itemData.home_score
end function


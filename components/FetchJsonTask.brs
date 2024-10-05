sub init()
    m.top.functionName = "getContent"
end sub

sub getContent()
  data = CreateObject("roSGNode", "ContentNode")

  searchRequest = CreateObject("roUrlTransfer")
  searchRequest.setURL(m.top.contenturi)
  payload = searchRequest.GetToString()
  response = ParseJson(payload)

  response.events.SortBy("date")

  For Each event in response.events
      dataItem = data.CreateChild("ScoreListItemData")
      dataItem.name = event.name
      dataItem.time = event.date
      
      if event.competitions[0].competitors[0].homeAway = "home" then
           dataItem.home_score = event.competitions[0].competitors[0].score
           dataItem.away_score = event.competitions[0].competitors[1].score
      else
           dataItem.home_score = event.competitions[0].competitors[1].score
           dataItem.away_score = event.competitions[0].competitors[0].score
      end if
  End For

  m.top.content = data
end sub
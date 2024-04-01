#* A Capacitated Vehicle Routing Problem solver
#*
#* @get /cw
function(req) {
  # demand, distances, vehicles, restrictions = NULL
  clarke_wright(demand, distances, vehicles, restrictions)
}

#* Echo the parameter that was sent in
#* @param msg The message to echo back.
#* @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

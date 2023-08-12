const defaultSettings =  {
  "server": "",
  "listen": "",
  "uuid": "",
  "password": "",
  "sni": "",
  "allow_insecure": false,
  "congestion_control": "bbr",
  "log_level": "info"
}

export const mergeSettings = (
  server: Record<string, any>,
  settings: Record<string, any>,
) => {
  let next = Object.assign({}, defaultSettings, {
    server: `${server.address}:${server.port}`,
    listen: `:${settings.socksPort}`,
    uuid: server.uuid,
    password: server.password,
    sni: server.sni,
    "allow_insecure": server.allowInsecure
  })
  return next
}
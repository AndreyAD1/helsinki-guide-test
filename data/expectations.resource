*** Variables ***
${expected building info} =    Name: As Oy Kaislakallio
...  Address: Gyldenintie 10 A,B
...  Description: A four-story building with one basement and an attic.
...  Completion year: 1951
...  Authors: Antero Pernaja
...  Facades: The pitched roof of the building is covered with bricks. The facades are splash plaster painted yellow. The concrete plinth is painted dark gray. Lacquered front doors have beautiful details.
...  Interesting details: no data
...  Notable features: The architecture of the building is well thought out and finished. The building has been partially preserved in its original condition.
...  Surroundings: no data
...  Building history: In 1976, the concrete balustrades of the building's balconies were designed to be covered with plasticized profiled sheets (builder Ensio Palamaa). In 1987, additional insulation and plastering of the building ends, replacement of end windows and painting of facades were planned (builder Esa Levänen). In 1988, it was planned to replace the windows and doors on the long sides of the building with aluminum-clad wooden windows and doors (builder Esa Levänen).
...  separator=\n

${expected start response} =    Hello! I'm a bot that provides information about Helsinki buildings.
...
...  If you send me a message, I will provide all addresses I know that are similar to your message.
...  If you click the button "Share my location and get the nearest buildings", I will provide all known addresses that are close to your location.
...
...  Available commands:
...  /start - I will send a greeting message.
...  /addresses - I will return all addresses I know.
...  /settings - I will return a menu so that you can manage your preferences.
...  /help - I will show this message.
...  separator=\n

${expected help response} =    If you send me a message, I will provide all addresses I know that are similar to your message.
...  If you click the button "Share my location and get the nearest buildings", I will provide all known addresses that are close to your location.
...
...  Available commands:
...  /start - I will send a greeting message.
...  /addresses - I will return all addresses I know.
...  /settings - I will return a menu so that you can manage your preferences.
...  /help - I will show this message.
...  separator=\n

${expected addresses response template} =    Search address: {}
...  Available building addresses and names:
...  separator=\n

${language response template} =    I will return the building information in {}.
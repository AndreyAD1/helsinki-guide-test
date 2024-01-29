*** Settings ***
Name    Smoke tests
Documentation    This test suite checks the basic functionality.
Resource    ../resources/common.resource
Resource    ../resources/chat.resource
Suite Setup    Start the Bot    ${WEB_TELEGRAM_URL}  ${BROWSER}  ${BOT_NAME}
Suite Teardown    Teardown

*** Variables ***
${WEB_TELEGRAM_URL} =    https://web.telegram.org/a/
${BROWSER} =    firefox
${BOT_NAME}
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

*** Test Cases ***
Basic Commands
    [Template]    Send and Verify A Basic Command
    start    ${expected start response}
    help    ${expected help response}

A Setting Command
    Send And Verify The '/settings' Command

An Address Command
    Send And Verify the '/addresses' Command

An Arbitrary Address
    Send And Verify An Arbitrary Message    Gyldenintie
    Get Building    Gyldenintie 10 A,B - As Oy Kaislakallio  ${expected building info}

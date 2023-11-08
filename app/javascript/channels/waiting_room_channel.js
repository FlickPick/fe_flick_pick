import consumer from "./consumer"

const queryString = window.location.search
const urlParams = new URLSearchParams(queryString)
const partyID = urlParams.get('party_id')

consumer.subscriptions.create({channel: "WaitingRoomChannel", room: "party_${partyID}"})
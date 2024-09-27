class_name NetworkManager
extends Node

const DEFAULT_PORT = 7000
const DEFAULT_SERVER_IP = "127.0.0.1"
const MAX_CONNECTIONS = 2

@export_group("Server Configuration")
@export var ip_address := DEFAULT_SERVER_IP
@export_range(1025, 65536) var port := DEFAULT_PORT

func create_game():
	var peer = ENetMultiplayerPeer.new()
	var response := peer.create_server(port)
	
	if response == OK:
		multiplayer.multiplayer_peer = peer
		print("server Created")
	else:
		print("cannot create game.")
	
func join_game():
	var peer = ENetMultiplayerPeer.new()
	var response := peer.create_client(ip_address, port)
	
	if response == OK:
		multiplayer.multiplayer_peer = peer
		print("Server joined")
	else:
		print("cannot join game.")

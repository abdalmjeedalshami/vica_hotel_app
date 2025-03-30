import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vica_hotel_app/providers/room_card_1.dart';
import 'package:vica_hotel_app/providers/room_provider.dart';
import 'package:vica_hotel_app/providers/room_screen.dart';
import 'package:vica_hotel_app/providers/room_state.dart';

class RoomListView extends StatelessWidget {
  const RoomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<RoomCubit>().deleteDatabaseFile();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Database deleted successfully")),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<RoomCubit, RoomState>(
        builder: (context, state) {
          if (state is RoomLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RoomLoaded) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.rooms.length,
              itemBuilder: (context, index) {
                final room = state.rooms[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RoomScreen(room: room),
                      ),
                    );
                  },
                  child: RoomCard1(room: room),
                );
              },
            );
          } else if (state is RoomError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text("No rooms available"));
        },
      ),
    );
  }
}

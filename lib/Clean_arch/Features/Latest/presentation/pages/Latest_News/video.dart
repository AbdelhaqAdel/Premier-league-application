import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../../modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key,int? index}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  late String title ,author ;
  late bool isPlaying, isMute;
  late YoutubePlayer youtubePlayer;
  late YoutubePlayerController _controller;
  late String id;



  @override
  void initState() {
    super.initState();
    isMute = false;
  }
 @override
  Widget build(BuildContext context) {
    return BlocConsumer<PremCubitCubit, PremCubitState>(
      listener: (context, state) {},
      builder: (context, state) {

        PremCubitCubit cubit =PremCubitCubit.get(context);
         id = YoutubePlayer.convertUrlToId('${cubit.videosList[cubit.videoIndex]['video']}')!;
        _controller= YoutubePlayerController(initialVideoId: id,
          flags: YoutubePlayerFlags(autoPlay: true),
        );
        youtubePlayer= YoutubePlayer(controller: _controller,);
        title = _controller.metadata.title;
        author= _controller.metadata.author;
        return  Scaffold(
          appBar: AppBar(
            title: Text('Highlights'),
          ),
          body: Column(
            children: [
              Container(height: 250, width: 400, color: Colors.pink, child: youtubePlayer,),
              /* title==null?  setTitle():
        textBuilder(_controller.metadata.title),*/
              // buttonRowBuilder()
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              if(isMute)
              {_controller.unMute();}
              else{
                _controller.mute();
              }
              setState(() {
                isMute= !isMute;
              });
            },
            child: isMute?Icon(Icons.volume_off):Icon(Icons.volume_up),
          ),
        );
      },
    );




  }

  @override

  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  }

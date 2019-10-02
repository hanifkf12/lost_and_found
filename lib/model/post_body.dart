import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lost_and_found/model/user.dart';

class PostBody{
  String img;
  String user;
  String deskripsi;
  String nama;
  String info;
  String lokasi;
  String category;
  User owner;
  PostBody({this.img,this.user,this.deskripsi,this.nama,this.info,this.lokasi, this.category});
  factory PostBody.fromSnapshot(DocumentSnapshot snapshot){
    return PostBody(
      img: snapshot.data['image_url'],
      user: snapshot.data['user_id'],
      deskripsi: snapshot.data['deskripsi'],
      nama: snapshot.data['nama_barang'],
      info: snapshot.data['info'],
      lokasi: snapshot.data['lokasi'],
      category: snapshot.data['category']
    );
  }

  void setUser(User user) => this.owner = user;






}
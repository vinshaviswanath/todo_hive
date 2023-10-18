import 'package:flutter/material.dart';
import 'package:todohive/view/nextscreen.dart';

class _Todolist extends StatefulWidget {
  const _Todolist({super.key,this.title='',this.description='',this.date='',required this.onPressed,});

  final String title;
  final String description;
  final String date;
  final Function onPressed;

  @override
  State<_Todolist> createState() => __TodolistState();
}

class __TodolistState extends State<_Todolist> {
  @override
  Widget build(BuildContext context) {
  dynamic width = MediaQuery.of(context).size.width;
   return Container(
      height: 130,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Container(
          padding: EdgeInsets.all(10),
          height: 100,
          width: width * 0.85,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 235, 124, 232), borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>NextScreen(title: widget.title, description: widget.description, date: widget.date)));
                    },
                     
                    child: Text(widget.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                  InkWell(
                    onTap: () {
                      widget.onPressed();
                    },
          
                    child: Icon(Icons.delete_outline)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen(title: widget.title, description: widget.description, date: widget.date),));
                    },   
                    child: Container(
                      height: 18,
                      width: width*0.5,
                      child: Text(widget.description,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(widget.date),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
//init
if object_exists(obj_block1) instance_destroy(obj_block1);
if object_exists(obj_door1) instance_destroy(obj_door1);
if object_exists(obj_block_start) instance_destroy(obj_block_start)
if object_exists(obj_block_end) instance_destroy(obj_block_end)

pos_x_max_=room_width/sprite_get_width(spr_block1);
pos_y_max_=room_height/sprite_get_height(spr_block1);
pos_x_=16;
pos_y_=9;
room_quantity_=1;  //一开始就会放置一个START房间

//create_rooms

room_want_to_create_= get_integer("How many rooms do you want to create?",100);

first_block_id_=instance_create_layer(pos_x_*32,pos_y_*32,"Instances",obj_block1);
first_block_id_.block1_image_index_=2;
instance_create_layer(pos_x_*32,pos_y_*32,"stair",obj_block_start); //第一个房间

while (room_quantity_<room_want_to_create_-1){

    randir_=irandom_range(1,4);
    switch randir_
    {
        case 1:  //right
            if pos_x_+1>pos_x_max_-1 break; //超限跳出，不生成房间
            if !position_meeting(pos_x_*32+29,pos_y_*32+13,obj_door1){ //没有门的话开一道门
                instance_create_layer(pos_x_*32+29,pos_y_*32+13,"doors",obj_door1);
            }
            pos_x_+=1;
            break;
        case 2:   //up
            if pos_y_-1<0 break;
            if !position_meeting(pos_x_*32+13,pos_y_*32-3,obj_door1){
                instance_create_layer(pos_x_*32+13,pos_y_*32-3,"doors",obj_door1);
            }
            pos_y_-=1;
            break;
        case 3:   //left
            if pos_x_-1<0 break;
            if !position_meeting(pos_x_*32-3,pos_y_*32+13,obj_door1){
                instance_create_layer(pos_x_*32-3,pos_y_*32+13,"doors",obj_door1);
            }
            pos_x_-=1;
            break;
        case 4:   //down
            if pos_y_+1>pos_y_max_-1 break;
            if !position_meeting(pos_x_*32+13,pos_y_*32+29,obj_door1){
                instance_create_layer(pos_x_*32+13,pos_y_*32+29,"doors",obj_door1);
            }            
            pos_y_+=1;
            break;    
    }
    if !position_meeting(pos_x_*32,pos_y_*32,obj_block1) and !position_meeting(pos_x_*32,pos_y_*32,obj_block_start)  //原本有房间了就不再创造了
    {
        if (room_quantity_<room_want_to_create_-2){
            instance_create_layer(pos_x_*32,pos_y_*32,"Instances",obj_block1); //放在后面生成，否则会多生成一扇门
        }else{
            instance_create_layer(pos_x_*32,pos_y_*32,"Instances",obj_block_end);    
        }
        room_quantity_+=1;
    }

}
up_block1_id_=instance_position(x,y-32,obj_block1);
up_door_=position_meeting(x+13,y-3,obj_door1);
down_block1_id_=instance_position(x,y+32,obj_block1);
down_door_=position_meeting(x+13,y+29,obj_door1);
left_block1_id_=instance_position(x-32,y,obj_block1);
left_door_=position_meeting(x-3,y+13,obj_door1);
right_block1_id_=instance_position(x+32,y,obj_block1);
right_door_=position_meeting(x+29,y+13,obj_door1);

draw_sprite(spr_block1,block1_image_index_,x,y);

if block1_image_index_!=2{
	if (up_block1_id_!=noone){
	    if (up_block1_id_.block1_image_index_=2 and up_door_){
	        block1_image_index_=1;
	    }
	}
	if (down_block1_id_!=noone) {
	    if (down_block1_id_.block1_image_index_=2 and down_door_){
	        block1_image_index_=1;
	    }
	}
	if (left_block1_id_!=noone){
	    if (left_block1_id_.block1_image_index_=2 and left_door_){
	        block1_image_index_=1;
	    }
	}
	if (right_block1_id_!=noone){
	    if (right_block1_id_.block1_image_index_=2 and right_door_){
	        block1_image_index_=1;
	    }
	}
	draw_sprite(spr_block1,block1_image_index_,x,y);
}


if mouse_enter_{
    draw_text(10,100,string(up_block1_id_));
    draw_text(10,130,string(left_block1_id_)+"/"+string(id)+"/"+string(right_block1_id_));   
    draw_text(10,160,string(down_block1_id_));
}
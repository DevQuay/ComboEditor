#define gridbuil
keyleft = keyboard_check_pressed(vk_left);
keyright = keyboard_check_pressed(vk_right);
editorgrid[0,0] = -1 //first is row number, second is column number
originx = self.x
originy = self.y
if keyright {
colnum += 1;
    var i;
    for (i=0; i<rownum ;i+=1){//for rows of numbers
        var j;
        for (j=0; j<colnum; j+=1){//for columns of numbers
            editorgrid[i,j] = editorgrid[i,j-1] + 16;
        }
    } 
}

#define checkgrid

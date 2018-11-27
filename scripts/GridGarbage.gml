#define GridGarbage
testgrid = ds_grid_create(5,5);
gengrid();

#define gengrid
var i, j;
for (j = 0; j < ds_grid_height(testgrid); j += 1)

{
for (i = 0; i < ds_grid_width(testgrid); i += 1)
      {
         instance_create(self.x+32+i * 32, self.y+32+j * 32, obj_selector);
      }
   }

#define readgrid
var i, j;
for (j = 0; j < ds_grid_height(testgrid); j += 1)

{
for (i = 0; i < ds_grid_width(testgrid); i += 1)
      {
         selplace = instance_place(self.x+32+i * 32, self.y+32+j * 32, obj_selector);
         ds_grid_set(testgrid,i,j,selplace.colnum);
      }
   }

#define RegenGrid
var i, j;
instance_destroy(obj_selector)
for (j = 0; j < ds_grid_height(testgrid); j += 1)
{
for (i = 0; i < ds_grid_width(testgrid); i += 1)
      {
         genned = instance_create(self.x+32+i * 32, self.y+32+j * 32, obj_selector);
         genned.colnum = ds_grid_get(testgrid,i, j);
      }
   }

#define SaveGridToFile
readgrid();
var file;
var i, j;
file = get_save_filename("Level File (*.Blox)|*.Blox", "");
ini_open(file)
for (j = 0; j < ds_grid_height(testgrid); j += 1)
{
for (i = 0; i < ds_grid_width(testgrid); i += 1)
      {
         selplace = instance_place(self.x+32+i * 32, self.y+32+j * 32, obj_selector);
         ini_write_string("Row"+string(i),j,selplace.colnum);
      }
}
ini_write_string("Options","RowNumber",ds_grid_height(testgrid));
ini_write_string("Options","ColumNumber",ds_grid_width(testgrid));
ini_write_string("Options","ColorNum",colonum);
ini_write_real("Options","Interval",interval);
ini_close();

#define GridLoader
var file,i,j;
readgrid();
file = get_open_filename("Level File (*.Blox)|*.Blox", "");
if file_exists(file){
ini_open(file)
rownum = ini_read_string("Options","RowNumber",10);
colnum = ini_read_string("Options","ColumNumber",10);
colonumin = ini_read_string("Options","ColorNum",3);
interval = ini_read_real("Options","Interval",1);
ds_grid_resize(testgrid,colnum,rownum);
for (i=0;i<int64(rownum);i+=1){//run through each row
    for(j=0;j<int64(colnum);j+=1){//run through each column
        boxval = ini_read_string("Row"+string(i),j,2);
        ds_grid_set(testgrid,i,j,boxval);
    }
}
RegenGrid();
ini_close();
colonum = int64(colonumin);
}
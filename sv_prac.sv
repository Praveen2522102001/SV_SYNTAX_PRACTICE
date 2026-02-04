//module top;

/*class que;
	int a[];
	int k[$];
endclass

initial
	begin
		que q1=new;
		
		q1.a=new[10];
		for(int i=0;i<q1.a.size;i++)
			begin
				q1.k.push_back(i);
				$display(q1.k);
			end
		for(int j=0;j<=q1.k.size;j++)
			begin
			q1.k.pop_front();
			$display(q1.k);
			end
		$display("%d",q1.k.size);
	end*/

/*class cons;
	rand bit a[][];

	constraint abc{a.size==5;
			foreach(a[i])
				a[i].size==5;
			foreach(a[i,j])
				if({i,j}==2'b00)
				a[i][j]==2;
				else
					a[i][j]==0;}
endclass
initial
	begin
		cons c1=new();
		c1.randomize();
		$display(c1);
	end*/
	
/*	initial
		begin	
			fork
				fork	
					#4 $display("A");
					#0 $display("b");
					$display("c");
				join_none
					$display("d");
			join_any
					$display("e");
		end		*/
		
		/*
class  prime;
	rand  int a[10];
	constraint abc{a inside {[1:100]};
					foreach(a[i])
						a[i]==}
			
   
endmodule
				*/
				
				/*initial begin 
                               fork
				  fork:a
				    begin:A  
					  $display("a");
					  #5;
					  $display("a compl");
					end
					begin:B 
					   $display("b");
					    #3;
						$display("b comp");
					end
				   join
				   //wait fork;
				//disable a;
				    $display("wait");
				join_none	
				   
			end*/

/*class abc;
	rand logic [7:0] a[][];
	
	constraint ab{a.size==4;
			foreach(a[i])
				a[i].size==4;
			foreach(a[i,j])
				if(i==j)
				a[i][j]==0;
				else
				a[i][j]=="x";}
endclass
initial
	begin
		abc a1=new();
		a1.randomize();
		$display(a1);
	end
endmodule*/
/*
module test;

class prac;
	int a;
endclass
	function prac create();
		create = new;
		create.a = 25;
		//$display(p1.a);
	endfunction


initial
	begin
		prac p2;
		p2 = create();
		$display(p2.a);
	end
endmodule*/

/*class trans;
  randc bit [3:0] data;
endclass:trans


class gen;
  trans t1;
  task start; 
  fork 
   repeat(3)
    begin
     t1=new();
     assert(t1.randomize());
     $display("%0t |Gen t1:=%p",$time,t1); 
    end 
  join_none
  endtask:start 
endclass :gen


class drv ;
 trans t2;
 gen g ;
 function new(gen g );
  this.g=g;
 endfunction:new
 task start; 
  fork 
   repeat(3)
    begin
     t2=g.t1;
     $display("%0t| drv t2:=%p",$time,t2); 
    end 
   join_none
  endtask:start 
endclass :drv


class env ;
 gen g;
 drv d;
function new ();
  g=new();
  d=new(g);
endfunction :new

 task start();
 
  begin
   g.start;
   d.start;
  end
 endtask:start
endclass:env

module test;
 env e;
  initial 
   begin
    e= new();
    e.start;
   end
endmodule:test*/

class a;
	rand int b;
endclass
a a1;
module ab;
	//a1=new();
	int success;
	initial
	begin
		a1=new();
		//int success;

		repeat(10)
			begin
				success = a1.randomize();
				$display(a1);
			end
	end
endmodule
		

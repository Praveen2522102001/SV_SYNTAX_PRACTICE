/*
module test();
class rando;
	rand bit [2:0]pktlength;
	randc bit [2:0]pktle;
endclass
rando h1;
initial
	begin
		int hii;
		h1=new();
		repeat(8)
		begin
		hii=h1.randomize();
		$display("%d",h1.pktlength);
		$display("%d",h1.pktle);
	end
end
endmodule
*/
/*
module test();
class transaction;
rand bit[0:7] data;
rand bit[0:1] ch;
function void post_randomize;
	$display("data is %d",data);
	$display("channel is %b",ch);
endfunction
endclass
initial
	begin
		int suc;
		transaction trans_h=new;
		suc=trans_h.randomize();
	end
endmodule
*/		// constraints 
module test;
/*
	class trans;
		rand bit [15:0] pktlength;
		constraint undersize {pktlength <=84;}
	endclass 
trans trans_h=new();
initial
	begin 
		int success;
		for(int i=0; i<16;i++)
		begin
			success=trans_h.randomize();
			$display("pktlength transaction is %d",trans_h.pktlength);
		end
	end*/
/*class trans;
	rand bit[15:0] pktlength;
	constraint undersize {pktlength<=199;}
endclass
trans trans_h=new();
initial
	begin
		int success;
		if(trans_h.pktlength.rand_mode())
			begin
				for(int i=0;i<16;i++)
				begin
					success =trans_h.randomize();
					$display(trans_h.pktlength);
			end
			end
		trans_h.undersize.constraint_mode(0);
		success = trans_h.randomize();
		$display("rekjhi=",trans_h.pktlength);
		success=trans_h.randomize() with {pktlength>64;};
		trans_h.undersize.constraint_mode(1);
		success=trans_h.randomize();
		$display("kdhhirjbu",trans_h.pktlength);
	end*/
/*
class trans;
rand bit [15:0] pktlength;
constraint oversize {pktlength>=16'hff00;}
endclass

class trans_ext extends trans;
	constraint undersize {pktlength<=16'hff50;}
endclass 
trans_ext h=new();
initial
	begin
		assert(h.randomize());
		$display("pktlength value is %b",h.pktlength);
	end
*/
/*class trans;
	rand bit[15:0]pktlength;
	constraint oversize{pktlength>=16'hff00;}
endclass
class trans_ext extends trans;
	constraint oversize {pktlength<=16'hff50;}
endclass
trans_ext h=new();
initial
	begin
		assert(h.randomize());
		$display("pktlength of value is =%h",h.pktlength);
	end*/
/*class trans;
	rand bit [5:0]addr;
	constraint addr_range { soft addr>15;}
endclass
initial
	begin
		trans h=new();
		repeat(2)
		begin
		h.randomize()with {addr<15;};
		$display("\t addr=%0d",h.addr);
		end
	end*/
/*class trans ;
randc bit [3:0]addr;
constraint adc {addr inside {3,7,[11:15]};}
endclass 
trans h=new();
initial 
	begin
		int success;
		repeat(10)
		begin
		success=h.randomize();
		$display("Address is %d",h.addr);
		end
	end*/
/*
class trans;
	rand bit[15:0] addr;
	bit[15:0] addr_previous[7]={1,4,6,7,556,32,11};
        //constraint adc {addr_previous.size==7;}
	constraint abc{addr inside{addr_previous};}
	constraint d{addr dist{556 := 2};}
	function void post_randomize;
		$display("addr=%d",addr);
	endfunction
endclass
trans trans_h=new();
initial
	begin
		repeat(10)
		assert(trans_h.randomize);
	end*/
/*
class trans;
	rand int a;
	constraint tag{a dist{5:/5,6:/3};}
	function void post_randomize;
		$display("%d",a);
	endfunction
endclass
trans trans_h=new();
initial
	begin
		repeat(8)
		assert(trans_h.randomize);
	end*/
/*class trans;
	rand bit[3:0] a;
	bit odin;
	bit[15:0] addr_previous[7]={1,4,6,7,556,32,11};
	constraint tag{odin==1-> a inside{addr_previous} ;}
endclass
trans trans_h=new();
initial
	begin
		int success;
		trans_h.odin=1;
repeat(10)
begin
		success=trans_h.randomize();
		$display("%d",trans_h.a);
end
	end*/

class trans;
	rand bit [3:0]addr;
	static constraint valid_addr{addr<8;}
endclass
initial
	begin
		trans h1=new(),h2=new();
		repeat(10)
		begin
		assert(h1.randomize());
		assert(h2.randomize());
		$display("vv",h2.addr);
		h1.valid_addr.constraint_mode(0);
		assert(h2.randomize());
		$display("khgouihvjkk",h2.addr);
			h1.valid_addr.constraint_mode(1);

		end
	end
/*
class packet;
	rand bit [3:0] addr;
	//constraint valid_addr;
	endclass
//constraint packet ::valid_addr{addr>10;}
//constraint packet ::valid_addr{addr<10;}
initial
	begin
		packet pkt=new();
		repeat(2)
			begin
				assert(pkt.randomize() with {addr>5;})
				$display("addr=%d",pkt.addr);
			end
	end
*/
//inline constraints

/*
class inline;
	rand bit[7:0]x,y,z;
	constraint c;
endclass
initial
	begin
		inline h=new();
		if(!h.randomize() with{x<y;})
		$display("randomization failed");
		else
		$display(h.x,h.y,h.z);
		
	end
*/
//calling function
/*
class packet;
	rand bit [3:0]s_addr;
	rand bit [3:0]e_addr;
	constraint valid {e_addr==addr_calc(s_addr);}
	function bit[3:0] addr_calc(bit [3:0]s_addr);
		if(s_addr>8)
			addr_calc=0;
		else
			addr_calc=s_addr;
			$display(addr_calc);
	endfunction
	function void post_randomize();
		$display("s_addr=%d,e_addr=%d",s_addr,e_addr);
	endfunction
endclass

initial
	begin
		packet pkt=new();
//int suc;
		repeat(6)
		begin
		assert(pkt.randomize());
		//suc=pkt.addr_calc;
		$display("%d,,,,,,%d",pkt.s_addr,pkt.e_addr);
		//$display("%d",suc);
		end
	end
*/               ////////////scope randomization
/*
int a,b;
bit success;
initial
	begin
		success=std::randomize(a,b) with {a>10; a<20;b<100;b>50;};
		$display("a=%d,b=%d",a,b);
	end*/
/*class trans ;
int a=10;
int b=4;
int summ;
randc bit[3:0] hand[4][4];
//randc bit[3:0] band[4][4];
constraint abc {foreach(hand[i,j])
		if(i==j)
		hand[i][j]==10;
    foreach(hand[i]);}
function bit [3:0]addr(bit[3:0]hand[4][4]);
		//foreach(hand[i,j])
		//	begin
			//if(i==j)
			hand[i][j]=10;
			addr=hand[i][j]+addr;
			//end
			$display("jhgjhg=%d",addr);
endfunction
endclass
initial
	begin
		trans h=new;
		assert(h.randomize());
		foreach(h.hand[i,j])
		$display("\n%p",h.hand[i][j]);
		//$display("sum=%d",h.addr);
	end*/
endmodule
			

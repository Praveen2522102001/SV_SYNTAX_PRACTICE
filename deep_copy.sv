module deep();
class sub;
	int obj;
function sub copy();
	copy=new();
	$display("address of sub_class=%d",copy);
	$display("***********************/////////////////********************");
	copy.obj=this.obj;
endfunction
endclass

class trans;
	int data;
	sub sub_h=new();
function trans copy();
	copy=new();
	$display("address of trans copy=%d",copy);
	$display("***********************/////////////////********************");
	copy.data=this.data;
	copy.sub_h=this.sub_h.copy;
endfunction
endclass

trans t_h1,t_h2;

initial
	begin
		t_h1=new();
		t_h1.data=4;
		t_h2= new t_h1;      //shallow copy
		$display("h1=%d,h2=%d",t_h1.data,t_h2.data);
		$display("address t_h1=%d,%d",t_h1,t_h1.sub_h);
		t_h2.data=8;
		$display("h1=%d,h2=%d",t_h1.data,t_h2.data);
		$display("address t_h1=%d,%d",t_h1,t_h1.sub_h);
		t_h1.sub_h.obj=5;
		t_h2.data=10;
		t_h2.sub_h.obj=7;
		$display("value of t_h1=%p,%p",t_h1,t_h1.sub_h);
		$display("value of t_h2=%p,%p",t_h2,t_h2.sub_h);
		$display("***********************/////////////////********************");

		$display("address t_h1=%d,%d",t_h1,t_h1.sub_h);
		$display("address of t_h2=%d,%d",t_h2,t_h2.sub_h);
		$display("***********************/////////////////********************");

		t_h1.sub_h.obj=5;
		t_h2=t_h1.copy;     //deep copy
		$display("address after deep t_h1=%d,%d",t_h1,t_h1.sub_h);
		$display("address of after deep t_h2=%d,%d",t_h2,t_h2.sub_h);
		$display("***********************/////////////////********************");

		t_h2.sub_h.obj=10;
		t_h2.data=15;
		$display("value of  t_h1 after deep=%p,%p",t_h1,t_h1.sub_h);
		$display("value of t_h2 after deep=%p,%p",t_h2,t_h2.sub_h);

	end
endmodule

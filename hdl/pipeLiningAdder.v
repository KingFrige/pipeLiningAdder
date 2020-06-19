module  pipeLiningAdder(
  output    reg     [3:0]    s,
  output    reg              co,
  input             [3:0]    a,
  input             [3:0]    b,
  input                      ci,

  input                      clk,
  input                      rstn
);

reg    [3:0]       a_tmp;
reg    [3:0]       b_tmp;
reg    [1:0]       a_tmp2;
reg    [1:0]       b_tmp2;
reg                ci_tmp;
reg    [1:0]       s_tmp3;

reg                co_low;
reg    [1:0]       s_low;
reg                co_hign;
reg    [1:0]       s_hign;

always@(posedge  clk,negedge  rstn) begin
  if(!rstn) begin
    a_tmp   <= 4'b0;
    b_tmp   <= 4'b0;
    ci_tmp  <= 1'b0;
  end else begin                   //����������ݻ�������
    a_tmp  <= a; 
    b_tmp  <= b; 
    ci_tmp <= ci; 
  end
end

always@(posedge  clk,negedge  rstn)
begin
  if(!rstn)
  begin
    co_low  <=  1'b0;
    s_low   <=  2'b0; 
    a_tmp2  <=  2'b0; 
    b_tmp2  <=  2'b0; 
  end
  else
  begin                  //����λ��ӣ��������λ
  {co_low,s_low} <= a_tmp[1:0] + b_tmp[1:0] + ci_tmp;
  a_tmp2 <= a_tmp[3:2];
  b_tmp2 <= b_tmp[3:2];
end
end

always@(posedge  clk,negedge  rstn)
begin
  if(!rstn)
  begin
    co_hign <= 2'b0;
    s_hign  <= 2'b0;
  end
  else
  begin                   //����λ��Ӽ���֮��ĵ���λһ�����
  {co_hign,s_hign} <= a_tmp2 + b_tmp2 + co_low;
  s_tmp3   <= s_low; //�Ĵ���һ���Ľ��
end
end

always@(posedge  clk,negedge  rstn)
begin
  if(!rstn)
  begin
    co <= 1'b0;
    s  <= 4'b0;
  end
  else
  begin
    {co,s} = {co_hign,s_hign,s_tmp3}; //�ϲ���������������������
  end
end

endmodule

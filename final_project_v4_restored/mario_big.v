module mario_big(ix,iy,oR,oG,oB,mask,clk);
input clk;
input [10:0] ix;
input [10:0] iy;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
reg [128:0] mario_big_r;
reg [128:0] mario_big_g;
reg [128:0] mario_big_b;
reg [32:0] mario_big_a;
parameter x_size = 32,y_size = 43;
wire mask;

assign oR = (ix<x_size&&iy<y_size)?{mario_big_r[4*ix+3],mario_big_r[4*ix+2],mario_big_r[4*ix+1],mario_big_r[4*ix],4'b0000}:{ix[7:0]};
assign oG = (ix<x_size&&iy<y_size)?{mario_big_g[4*ix+3],mario_big_g[4*ix+2],mario_big_g[4*ix+1],mario_big_g[4*ix],4'b0000}:{iy[7:0]};
assign oB = (ix<x_size&&iy<y_size)?{mario_big_b[4*ix+3],mario_big_b[4*ix+2],mario_big_b[4*ix+1],mario_big_b[4*ix],4'b0000}:{ix+iy}; 
assign mask = (ix<x_size&&iy<y_size)?{mario_big_a[ix]}:0; 
always @(posedge clk)
begin
case(iy[5:0])
6'd0:mario_big_r=128'h000000000fffeedc0000000000000000;
6'd1:mario_big_r=128'h00000000ffffeedcbb00000000000000;
6'd2:mario_big_r=128'h000000ffffffeedcbbba000000000000;
6'd3:mario_big_r=128'h000000ffffffeedcbbaa000000000000;
6'd4:mario_big_r=128'h00000fffffffecba9999880000000000;
6'd5:mario_big_r=128'h00000fffffffaaa98888770000000000;
6'd6:mario_big_r=128'h00000fffffec789a8777660000000000;
6'd7:mario_big_r=128'h00000fffffc8457c8776000000000000;
6'd8:mario_big_r=128'h0000ffffdcbbbbcdbbbdfe0000000000;
6'd9:mario_big_r=128'h00fffffeaceeb89eeeefed6000000000;
6'd10:mario_big_r=128'h00feffed8cffc56effffec9ceee00000;
6'd11:mario_big_r=128'h00efeeda8adfd55dffffebaceee00000;
6'd12:mario_big_r=128'h00ffeffe89bf95348bcc889cdeedaa00;
6'd13:mario_big_r=128'h000ffffebbdfc96445676789cddca900;
6'd14:mario_big_r=128'h0000ffffeeeffd9532356678accb9a00;
6'd15:mario_big_r=128'h0000ffffffffffd9546b57789aaa9900;
6'd16:mario_big_r=128'h0000fffeacdffeed899956779aba9900;
6'd17:mario_big_r=128'h0000ffffccdc9abdba9887669aaa8800;
6'd18:mario_big_r=128'h00ffffffeedb758bda8677659aa98800;
6'd19:mario_big_r=128'h00ffffffedddb302a86256669aa90000;
6'd20:mario_big_r=128'h00ffffedccccc66b721028969aa90000;
6'd21:mario_big_r=128'hfdeffedbaaaab54a620014679aa80000;
6'd22:mario_big_r=128'hdeeffdca989993264100013799940000;
6'd23:mario_big_r=128'heffeeca8068a31000000000276600000;
6'd24:mario_big_r=128'hffeeca9701110000000000009aa98800;
6'd25:mario_big_r=128'hfffeb9860000000000000000bbba8760;
6'd26:mario_big_r=128'hfffeb9760f00000000000000bcba8767;
6'd27:mario_big_r=128'hefeeca860000000000000002ccb99887;
6'd28:mario_big_r=128'heeedba960000000000000014bbaa9998;
6'd29:mario_big_r=128'heddc99860000000000000026baaa9998;
6'd30:mario_big_r=128'h0bbb87658400000000000028aaaaa998;
6'd31:mario_big_r=128'h0099549b863000000000003a99999997;
6'd32:mario_big_r=128'h00aa57aa831000000000014989989886;
6'd33:mario_big_r=128'h00000bba620000000000014988888760;
6'd34:mario_big_r=128'h00000bba310000000000014888777600;
6'd35:mario_big_r=128'h000009aa100000000000015789997700;
6'd36:mario_big_r=128'h0000babb000000000000014788986600;
6'd37:mario_big_r=128'h0000babc100000000000006678870000;
6'd38:mario_big_r=128'h0000babc310000000000000000000000;
6'd39:mario_big_r=128'h00009aab742200000000000000000000;
6'd40:mario_big_r=128'h0000a99a765400000000000000000000;
6'd41:mario_big_r=128'h00008889776500000000000000000000;
6'd42:mario_big_r=128'h00000577666000000000000000000000;
endcase
case(iy[5:0])
6'd0:mario_big_g=128'h00000000000026840000000000000000;
6'd1:mario_big_g=128'h00000000000075544300000000000000;
6'd2:mario_big_g=128'h00000000000086442100000000000000;
6'd3:mario_big_g=128'h00000000000036640000000000000000;
6'd4:mario_big_g=128'h00000000000000000000000000000000;
6'd5:mario_big_g=128'h00000000000001221000000000000000;
6'd6:mario_big_g=128'h00000000000002452100000000000000;
6'd7:mario_big_g=128'h00000000000123475310000000000000;
6'd8:mario_big_g=128'h0000000003578999888aba0000000000;
6'd9:mario_big_g=128'h0000000017aba99cbccca94000000000;
6'd10:mario_big_g=128'h0000000018ceb89ddedca98ceed00000;
6'd11:mario_big_g=128'h0000000026aeb77cddcb989ceee00000;
6'd12:mario_big_g=128'h000059a9259f73125788579cdeedaa00;
6'd13:mario_big_g=128'h00009ab968afb64223454679cddc9900;
6'd14:mario_big_g=128'h0000dcbabbceea7321134678acca9900;
6'd15:mario_big_g=128'h0000ddddedddcca6434746788aaa9900;
6'd16:mario_big_g=128'h0000fcbb689baaa9455636679aaa9900;
6'd17:mario_big_g=128'h0000013323457789765202459aaa8800;
6'd18:mario_big_g=128'h00000000000135678640002378887800;
6'd19:mario_big_g=128'h00000000000004541001000012100000;
6'd20:mario_big_g=128'h000000000000037c8644564000000000;
6'd21:mario_big_g=128'h0a5000000000037b8654554000000000;
6'd22:mario_big_g=128'hbb710000000014797545443000000000;
6'd23:mario_big_g=128'heeb50000021045654554443200000000;
6'd24:mario_big_g=128'hffec8543055456655566543335554400;
6'd25:mario_big_g=128'hfffea865065566666666554477764330;
6'd26:mario_big_g=128'hfffeb875005566666677665578774434;
6'd27:mario_big_g=128'heeeeca86005556666666666688865544;
6'd28:mario_big_g=128'heeedba96055566666666666677766665;
6'd29:mario_big_g=128'heddca986055556655556666677677776;
6'd30:mario_big_g=128'h0bbb8765545555555555666666677775;
6'd31:mario_big_g=128'h00995467444555555445556656667764;
6'd32:mario_big_g=128'h00aa5567655544544444555645666554;
6'd33:mario_big_g=128'h00000777655543444333555545555540;
6'd34:mario_big_g=128'h00000877665533333333455555544400;
6'd35:mario_big_g=128'h00000667555543333332044456775500;
6'd36:mario_big_g=128'h00008778554443333332043356664400;
6'd37:mario_big_g=128'h00007778544433333330003245650000;
6'd38:mario_big_g=128'h00007778443333221000000000000000;
6'd39:mario_big_g=128'h00006678433210000000000000000000;
6'd40:mario_big_g=128'h00005566433200000000000000000000;
6'd41:mario_big_g=128'h00008555433300000000000000000000;
6'd42:mario_big_g=128'h00000344333000000000000000000000;
endcase
case(iy[5:0])
6'd0:mario_big_b=128'h00000000011147850000000000000000;
6'd1:mario_big_b=128'h00000000222186554400000000000000;
6'd2:mario_big_b=128'h00000021222186552100000000000000;
6'd3:mario_big_b=128'h00000012222146651100000000000000;
6'd4:mario_big_b=128'h00000122222111000000110000000000;
6'd5:mario_big_b=128'h00000222221111221000000000000000;
6'd6:mario_big_b=128'h00000222211112342100000000000000;
6'd7:mario_big_b=128'h00000122111112364210000000000000;
6'd8:mario_big_b=128'h00001111134678877778980000000000;
6'd9:mario_big_b=128'h00001111168999aa9aa9872000000000;
6'd10:mario_big_b=128'h0001111106aba9acabb9877ceed00000;
6'd11:mario_big_b=128'h00111110047c989caaa9879ceee00000;
6'd12:mario_big_b=128'h00005887026c52124677479cdeedaa00;
6'd13:mario_big_b=128'h00007887458c953122344679cddca900;
6'd14:mario_big_b=128'h0000a99889acb85211123578accb9900;
6'd15:mario_big_b=128'h0000aaabbbbba985323646789aaa9900;
6'd16:mario_big_b=128'h0000a99946798887444536679aba9900;
6'd17:mario_big_b=128'h0000133423458777654203459aaa8800;
6'd18:mario_big_b=128'h00001111111268876541002378888800;
6'd19:mario_big_b=128'h00321111111129b92113100022210000;
6'd20:mario_big_b=128'h002221111000167369a9720000000000;
6'd21:mario_big_b=128'h0a6111100000188469ba852000000000;
6'd22:mario_big_b=128'hbc821100011039b779aa985000000000;
6'd23:mario_big_b=128'heec6100005319cdbabba998400000000;
6'd24:mario_big_b=128'hffec86430bbaccdcccccb98613322100;
6'd25:mario_big_b=128'hfffea8650bccdddcddddcba944432100;
6'd26:mario_big_b=128'hfffeb97600ccdddddeeedcca45542112;
6'd27:mario_big_b=128'heeeeca8600cccdddddddddcb56633222;
6'd28:mario_big_b=128'heeedba970ccccdddcccdddc955544443;
6'd29:mario_big_b=128'heddca9870bccccdcccccddb754444443;
6'd30:mario_big_b=128'h0bbb986425bcccccbbbcdda444445443;
6'd31:mario_big_b=128'h00995434225bcccbbaabcc9333444443;
6'd32:mario_big_b=128'h00aa544458abaaaaa999ba8323334332;
6'd33:mario_big_b=128'h000004447abb88889888b97323333330;
6'd34:mario_big_b=128'h000004449bcc87677776886223332200;
6'd35:mario_big_b=128'h00000344abbb97777774074134443300;
6'd36:mario_big_b=128'h00005445aaaa97777774083133432200;
6'd37:mario_big_b=128'h00004456999987777760000023330000;
6'd38:mario_big_b=128'h00004456678766663200000000000000;
6'd39:mario_big_b=128'h00003445234322000000000000000000;
6'd40:mario_big_b=128'h00003334111220000000000000000000;
6'd41:mario_big_b=128'h00000222100000000000000000000000;
6'd42:mario_big_b=128'h00000111000000000000000000000000;
endcase
case(iy[5:0])
6'd0:mario_big_a=32'b00000000000111100000000000000000;
6'd1:mario_big_a=32'b00000000011111110000000000000000;
6'd2:mario_big_a=32'b00000000111111111000000000000000;
6'd3:mario_big_a=32'b00000000111111111111000000000000;
6'd4:mario_big_a=32'b00000001111111111111000000000000;
6'd5:mario_big_a=32'b00000011111111111111000000000000;
6'd6:mario_big_a=32'b00000011111111111111000000000000;
6'd7:mario_big_a=32'b00000111111111111111000000000000;
6'd8:mario_big_a=32'b00000111111111111111000000000000;
6'd9:mario_big_a=32'b00000111111111111111100000000000;
6'd10:mario_big_a=32'b00001111111111111111100000000000;
6'd11:mario_big_a=32'b00001111111111111111111111000000;
6'd12:mario_big_a=32'b00001111111111111111111111110000;
6'd13:mario_big_a=32'b00001111111111111111111111110000;
6'd14:mario_big_a=32'b00000111111111111111111111110000;
6'd15:mario_big_a=32'b00000111111111111111111111110000;
6'd16:mario_big_a=32'b00000001111111111111001111110000;
6'd17:mario_big_a=32'b00000001111111111111001111110000;
6'd18:mario_big_a=32'b00000011111111111111101111110000;
6'd19:mario_big_a=32'b00001111111111111111111111110000;
6'd20:mario_big_a=32'b00011111111111111111111111110000;
6'd21:mario_big_a=32'b00011111111111111111111111100000;
6'd22:mario_big_a=32'b01111111111111111111111111100000;
6'd23:mario_big_a=32'b01111111001111111111111000000000;
6'd24:mario_big_a=32'b01111110001111111111111100000000;
6'd25:mario_big_a=32'b11111110000111111111111101111000;
6'd26:mario_big_a=32'b11111110000111111111111111111110;
6'd27:mario_big_a=32'b11111111000111111111111111111110;
6'd28:mario_big_a=32'b01111111000111111111111111111111;
6'd29:mario_big_a=32'b01111110000111111111111111111111;
6'd30:mario_big_a=32'b00111100000111111111111111111111;
6'd31:mario_big_a=32'b00000000111111111111111111111110;
6'd32:mario_big_a=32'b00000001111111111111111111111100;
6'd33:mario_big_a=32'b00000001111111111111111111111000;
6'd34:mario_big_a=32'b00000001111111111111011111111000;
6'd35:mario_big_a=32'b00000001111111111110001111110000;
6'd36:mario_big_a=32'b00000111111111111100000011110000;
6'd37:mario_big_a=32'b00000111111111111000000011100000;
6'd38:mario_big_a=32'b00000111111111100000000000000000;
6'd39:mario_big_a=32'b00000111111100000000000000000000;
6'd40:mario_big_a=32'b00000111111100000000000000000000;
6'd41:mario_big_a=32'b00000011111000000000000000000000;
6'd42:mario_big_a=32'b00000001110000000000000000000000;
endcase
end
endmodule

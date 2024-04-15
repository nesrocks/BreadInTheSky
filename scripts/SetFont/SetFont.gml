function SetFont() {
	globalvar retrofont;
	retrofont = font_add_sprite_ext(spr_8bitfont,
	"!\'#$%¨\'()\'+,-./0123456789:;<=>?" +
	"@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]" +
	"^_\'abcdefghijklmnopqrstuvwxyz[\\]~àãáâéêíóôõúçÇ" + 
	"あいうえお" +
	"かきくけこさしすせそたちつてとな" +
	"にぬねのはひふへほまみむめもやホ" + 
	"ゆ中よらりるれろぁぃぅぇぉゃ ゅ" +
	"ーょわんっ。をがぎぐげござじずぜ" + 
	"ぞだぢづでどばびぶべぼぱぴぷぺぽ" +
	"アイウエオカキクケコサシスセソァ" +
	"ィゥタチツッテトナニヌネノハヒフ" +
	"ヘホマミムメモヤャユュヨョラリル" +
	"レロワヲンェォガギグゲゴザジズゼ" +
	"ゾダヂヅデドバビブベボパピプペポ", true, 1);
	draw_set_font(retrofont);

	globalvar segafont;
	segafont = font_add_sprite_ext(spr_segafont,
	"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ: abcdefghijklmnopqrstuvwxyz$", true, 1);

	globalvar o2font;
	o2font = font_add_sprite_ext(spr_o2font,
	"0123456789:$ ?LP+WERTUIOQSDFGHJKAZXCVBM.-x%=YN/stba{}f>^[]&\"qwer~", true, 0);


}

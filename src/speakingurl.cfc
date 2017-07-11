/*
* CF SpeakingURL
* v0.1.0
* https://github.com/kevindb/cf-speakingurl
*
* Generate a speaking, semantic, or SEO-friendly URL or slug
*
* Copyright 2016 Kevin Morris
*
* This library is free software; you can redistribute it and/or modify it under the terms
* of the GNU Lesser General Public License as published by the Free Software Foundation;
* either version 2.1 of the License, or (at your option) any later version.
*
* This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
* without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
* See the GNU Lesser General Public License for more details.
*/


component displayname="SpeakingURL" {
	variables.separator = "-";
	variables.uricChars = [";", "?", ":", "@", "&", "=", "+", "$", ",", "/"];
	variables.uricNoSlashChars = [";", "?", ":", "@", "&", "=", "+", "$", ","];
	variables.markChars = [".", "!", "~", "*", "\'", "(", ")"];
	variables.customReplacements = {};

	variables.defaultOpts = {
		"convertSymbols" = true,
		"customReplacements" = variables.customReplacements,
		"maintainCase" = false,
		"markFlag" = false,
		"maxLength" = 0,
		"separator" = variables.separator,
		"titleCase" = false,
		"uricFlag" = false,
		"uricNoSlashFlag" = false
	};

	/**
	 * charMap
	 * @type {Object}
	 */
	variables.charMap = {

		// latin
		'À': 'A',
		'Á': 'A',
		'Â': 'A',
		'Ã': 'A',
		'Ä': 'Ae',
		'Å': 'A',
		'Æ': 'AE',
		'Ç': 'C',
		'È': 'E',
		'É': 'E',
		'Ê': 'E',
		'Ë': 'E',
		'Ì': 'I',
		'Í': 'I',
		'Î': 'I',
		'Ï': 'I',
		'Ð': 'D',
		'Ñ': 'N',
		'Ò': 'O',
		'Ó': 'O',
		'Ô': 'O',
		'Õ': 'O',
		'Ö': 'Oe',
		'Ő': 'O',
		'Ø': 'O',
		'Ù': 'U',
		'Ú': 'U',
		'Û': 'U',
		'Ü': 'Ue',
		'Ű': 'U',
		'Ý': 'Y',
		'Þ': 'TH',
		'ß': 'ss',
		'à': 'a',
		'á': 'a',
		'â': 'a',
		'ã': 'a',
		'ä': 'ae',
		'å': 'a',
		'æ': 'ae',
		'ç': 'c',
		'è': 'e',
		'é': 'e',
		'ê': 'e',
		'ë': 'e',
		'ì': 'i',
		'í': 'i',
		'î': 'i',
		'ï': 'i',
		'ð': 'd',
		'ñ': 'n',
		'ò': 'o',
		'ó': 'o',
		'ô': 'o',
		'õ': 'o',
		'ö': 'oe',
		'ő': 'o',
		'ø': 'o',
		'ù': 'u',
		'ú': 'u',
		'û': 'u',
		'ü': 'ue',
		'ű': 'u',
		'ý': 'y',
		'þ': 'th',
		'ÿ': 'y',
		'ẞ': 'SS',

		// language specific

		// Arabic
				'ا': 'a',
				'أ': 'a',
				'إ': 'i',
				'آ': 'aa',
				'ؤ': 'u',
				'ئ': 'e',
				'ء': 'a',
				'ب': 'b',
				'ت': 't',
				'ث': 'th',
				'ج': 'j',
				'ح': 'h',
				'خ': 'kh',
				'د': 'd',
				'ذ': 'th',
				'ر': 'r',
				'ز': 'z',
				'س': 's',
				'ش': 'sh',
				'ص': 's',
				'ض': 'dh',
				'ط': 't',
				'ظ': 'z',
				'ع': 'a',
				'غ': 'gh',
				'ف': 'f',
				'ق': 'q',
				'ك': 'k',
				'ل': 'l',
				'م': 'm',
				'ن': 'n',
				'ه': 'h',
				'و': 'w',
				'ي': 'y',
				'ى': 'a',
				'ة': 'h',
				'ﻻ': 'la',
				'ﻷ': 'laa',
				'ﻹ': 'lai',
				'ﻵ': 'laa',

				// Persian additional characters than Arabic
				'گ': 'g',
				'چ': 'ch',
				'پ': 'p',
				'ژ': 'zh',
				'ک': 'k',
				'ی': 'y',

		// Arabic diactrics
		'َ': 'a',
		'ً': 'an',
		'ِ': 'e',
		'ٍ': 'en',
		'ُ': 'u',
		'ٌ': 'on',
		'ْ': '',

		// Arabic numbers
		'٠': '0',
		'١': '1',
		'٢': '2',
		'٣': '3',
		'٤': '4',
		'٥': '5',
		'٦': '6',
		'٧': '7',
		'٨': '8',
		'٩': '9',

		// Persian numbers
		'۰': '0',
		'۱': '1',
		'۲': '2',
		'۳': '3',
		'۴': '4',
		'۵': '5',
		'۶': '6',
		'۷': '7',
		'۸': '8',
		'۹': '9',

		// Burmese consonants
		'က': 'k',
		'ခ': 'kh',
		'ဂ': 'g',
		'ဃ': 'ga',
		'င': 'ng',
		'စ': 's',
		'ဆ': 'sa',
		'ဇ': 'z',
		'စျ': 'za',
		'ည': 'ny',
		'ဋ': 't',
		'ဌ': 'ta',
		'ဍ': 'd',
		'ဎ': 'da',
		'ဏ': 'na',
		'တ': 't',
		'ထ': 'ta',
		'ဒ': 'd',
		'ဓ': 'da',
		'န': 'n',
		'ပ': 'p',
		'ဖ': 'pa',
		'ဗ': 'b',
		'ဘ': 'ba',
		'မ': 'm',
		'ယ': 'y',
		'ရ': 'ya',
		'လ': 'l',
		'ဝ': 'w',
		'သ': 'th',
		'ဟ': 'h',
		'ဠ': 'la',
		'အ': 'a',
		// consonant character combos
		'ြ': 'y',
		'ျ': 'ya',
		'ွ': 'w',
		'ြွ': 'yw',
		'ျွ': 'ywa',
		'ှ': 'h',
		// independent vowels
		'ဧ': 'e',
		'၏': '-e',
		'ဣ': 'i',
		'ဤ': '-i',
		'ဉ': 'u',
		'ဦ': '-u',
		'ဩ': 'aw',
		'သြော': 'aw',
		'ဪ': 'aw',
		// numbers
		'၀': '0',
		'၁': '1',
		'၂': '2',
		'၃': '3',
		'၄': '4',
		'၅': '5',
		'၆': '6',
		'၇': '7',
		'၈': '8',
		'၉': '9',
		// virama and tone marks which are silent in transliteration
		'္': '',
		'့': '',
		'း': '',

		// Czech
		'č': 'c',
		'ď': 'd',
		'ě': 'e',
		'ň': 'n',
		'ř': 'r',
		'š': 's',
		'ť': 't',
		'ů': 'u',
		'ž': 'z',
		'Č': 'C',
		'Ď': 'D',
		'Ě': 'E',
		'Ň': 'N',
		'Ř': 'R',
		'Š': 'S',
		'Ť': 'T',
		'Ů': 'U',
		'Ž': 'Z',

		// Dhivehi
		'ހ': 'h',
		'ށ': 'sh',
		'ނ': 'n',
		'ރ': 'r',
		'ބ': 'b',
		'ޅ': 'lh',
		'ކ': 'k',
		'އ': 'a',
		'ވ': 'v',
		'މ': 'm',
		'ފ': 'f',
		'ދ': 'dh',
		'ތ': 'th',
		'ލ': 'l',
		'ގ': 'g',
		'ޏ': 'gn',
		'ސ': 's',
		'ޑ': 'd',
		'ޒ': 'z',
		'ޓ': 't',
		'ޔ': 'y',
		'ޕ': 'p',
		'ޖ': 'j',
		'ޗ': 'ch',
		'ޘ': 'tt',
		'ޙ': 'hh',
		'ޚ': 'kh',
		'ޛ': 'th',
		'ޜ': 'z',
		'ޝ': 'sh',
		'ޞ': 's',
		'ޟ': 'd',
		'ޠ': 't',
		'ޡ': 'z',
		'ޢ': 'a',
		'ޣ': 'gh',
		'ޤ': 'q',
		'ޥ': 'w',
		'ަ': 'a',
		'ާ': 'aa',
		'ި': 'i',
		'ީ': 'ee',
		'ު': 'u',
		'ޫ': 'oo',
		'ެ': 'e',
		'ޭ': 'ey',
		'ޮ': 'o',
		'ޯ': 'oa',
		'ް': '',

		// Greek
		'α': 'a',
		'β': 'v',
		'γ': 'g',
		'δ': 'd',
		'ε': 'e',
		'ζ': 'z',
		'η': 'i',
		'θ': 'th',
		'ι': 'i',
		'κ': 'k',
		'λ': 'l',
		'μ': 'm',
		'ν': 'n',
		'ξ': 'ks',
		'ο': 'o',
		'π': 'p',
		'ρ': 'r',
		'σ': 's',
		'τ': 't',
		'υ': 'y',
		'φ': 'f',
		'χ': 'x',
		'ψ': 'ps',
		'ω': 'o',
		'ά': 'a',
		'έ': 'e',
		'ί': 'i',
		'ό': 'o',
		'ύ': 'y',
		'ή': 'i',
		'ώ': 'o',
		'ς': 's',
		'ϊ': 'i',
		'ΰ': 'y',
		'ϋ': 'y',
		'ΐ': 'i',
		'Α': 'A',
		'Β': 'B',
		'Γ': 'G',
		'Δ': 'D',
		'Ε': 'E',
		'Ζ': 'Z',
		'Η': 'I',
		'Θ': 'TH',
		'Ι': 'I',
		'Κ': 'K',
		'Λ': 'L',
		'Μ': 'M',
		'Ν': 'N',
		'Ξ': 'KS',
		'Ο': 'O',
		'Π': 'P',
		'Ρ': 'R',
		'Σ': 'S',
		'Τ': 'T',
		'Υ': 'Y',
		'Φ': 'F',
		'Χ': 'X',
		'Ψ': 'PS',
		'Ω': 'O',
		'Ά': 'A',
		'Έ': 'E',
		'Ί': 'I',
		'Ό': 'O',
		'Ύ': 'Y',
		'Ή': 'I',
		'Ώ': 'O',
		'Ϊ': 'I',
		'Ϋ': 'Y',

		// Latvian
		'ā': 'a',
		// 'č': 'c', // duplicate
		'ē': 'e',
		'ģ': 'g',
		'ī': 'i',
		'ķ': 'k',
		'ļ': 'l',
		'ņ': 'n',
		// 'š': 's', // duplicate
		'ū': 'u',
		// 'ž': 'z', // duplicate
		'Ā': 'A',
		// 'Č': 'C', // duplicate
		'Ē': 'E',
		'Ģ': 'G',
		'Ī': 'I',
		'Ķ': 'k',
		'Ļ': 'L',
		'Ņ': 'N',
		// 'Š': 'S', // duplicate
		'Ū': 'U',
		// 'Ž': 'Z', // duplicate

		// Macedonian
		'Ќ': 'Kj',
		'ќ': 'kj',
		'Љ': 'Lj',
		'љ': 'lj',
		'Њ': 'Nj',
		'њ': 'nj',
		'Тс': 'Ts',
		'тс': 'ts',

		// Polish
		'ą': 'a',
		'ć': 'c',
		'ę': 'e',
		'ł': 'l',
		'ń': 'n',
		// 'ó': 'o', // duplicate
		'ś': 's',
		'ź': 'z',
		'ż': 'z',
		'Ą': 'A',
		'Ć': 'C',
		'Ę': 'E',
		'Ł': 'L',
		'Ń': 'N',
		'Ś': 'S',
		'Ź': 'Z',
		'Ż': 'Z',

		// Ukranian
		'Є': 'Ye',
		'І': 'I',
		'Ї': 'Yi',
		'Ґ': 'G',
		'є': 'ye',
		'і': 'i',
		'ї': 'yi',
		'ґ': 'g',

		// Romanian
		'ă': 'a',
		'Ă': 'A',
		'ș': 's',
		'Ș': 'S',
		// 'ş': 's', // duplicate
		// 'Ş': 'S', // duplicate
		'ț': 't',
		'Ț': 'T',
		'ţ': 't',
		'Ţ': 'T',

		// Russian https://en.wikipedia.org/wiki/Romanization_of_Russian
		// ICAO

		'а': 'a',
		'б': 'b',
		'в': 'v',
		'г': 'g',
		'д': 'd',
		'е': 'e',
		'ё': 'yo',
		'ж': 'zh',
		'з': 'z',
		'и': 'i',
		'й': 'i',
		'к': 'k',
		'л': 'l',
		'м': 'm',
		'н': 'n',
		'о': 'o',
		'п': 'p',
		'р': 'r',
		'с': 's',
		'т': 't',
		'у': 'u',
		'ф': 'f',
		'х': 'kh',
		'ц': 'c',
		'ч': 'ch',
		'ш': 'sh',
		'щ': 'sh',
		'ъ': '',
		'ы': 'y',
		'ь': '',
		'э': 'e',
		'ю': 'yu',
		'я': 'ya',
		'А': 'A',
		'Б': 'B',
		'В': 'V',
		'Г': 'G',
		'Д': 'D',
		'Е': 'E',
		'Ё': 'Yo',
		'Ж': 'Zh',
		'З': 'Z',
		'И': 'I',
		'Й': 'I',
		'К': 'K',
		'Л': 'L',
		'М': 'M',
		'Н': 'N',
		'О': 'O',
		'П': 'P',
		'Р': 'R',
		'С': 'S',
		'Т': 'T',
		'У': 'U',
		'Ф': 'F',
		'Х': 'Kh',
		'Ц': 'C',
		'Ч': 'Ch',
		'Ш': 'Sh',
		'Щ': 'Sh',
		'Ъ': '',
		'Ы': 'Y',
		'Ь': '',
		'Э': 'E',
		'Ю': 'Yu',
		'Я': 'Ya',

		// Serbian
		'ђ': 'dj',
		'ј': 'j',
		// 'љ': 'lj',  // duplicate
		// 'њ': 'nj', // duplicate
		'ћ': 'c',
		'џ': 'dz',
		'Ђ': 'Dj',
		'Ј': 'j',
		// 'Љ': 'Lj', // duplicate
		// 'Њ': 'Nj', // duplicate
		'Ћ': 'C',
		'Џ': 'Dz',

		// Slovak
		'ľ': 'l',
		'ĺ': 'l',
		'ŕ': 'r',
		'Ľ': 'L',
		'Ĺ': 'L',
		'Ŕ': 'R',

		// Turkish
		'ş': 's',
		'Ş': 'S',
		'ı': 'i',
		'İ': 'I',
		// 'ç': 'c', // duplicate
		// 'Ç': 'C', // duplicate
		// 'ü': 'u', // duplicate, see langCharMap
		// 'Ü': 'U', // duplicate, see langCharMap
		// 'ö': 'o', // duplicate, see langCharMap
		// 'Ö': 'O', // duplicate, see langCharMap
		'ğ': 'g',
		'Ğ': 'G',

		// Vietnamese
		'ả': 'a',
		'Ả': 'A',
		'ẳ': 'a',
		'Ẳ': 'A',
		'ẩ': 'a',
		'Ẩ': 'A',
		'đ': 'd',
		'Đ': 'D',
		'ẹ': 'e',
		'Ẹ': 'E',
		'ẽ': 'e',
		'Ẽ': 'E',
		'ẻ': 'e',
		'Ẻ': 'E',
		'ế': 'e',
		'Ế': 'E',
		'ề': 'e',
		'Ề': 'E',
		'ệ': 'e',
		'Ệ': 'E',
		'ễ': 'e',
		'Ễ': 'E',
		'ể': 'e',
		'Ể': 'E',
		'ọ': 'o',
		'Ọ': 'o',
		'ố': 'o',
		'Ố': 'O',
		'ồ': 'o',
		'Ồ': 'O',
		'ổ': 'o',
		'Ổ': 'O',
		'ộ': 'o',
		'Ộ': 'O',
		'ỗ': 'o',
		'Ỗ': 'O',
		'ơ': 'o',
		'Ơ': 'O',
		'ớ': 'o',
		'Ớ': 'O',
		'ờ': 'o',
		'Ờ': 'O',
		'ợ': 'o',
		'Ợ': 'O',
		'ỡ': 'o',
		'Ỡ': 'O',
		'Ở': 'o',
		'ở': 'o',
		'ị': 'i',
		'Ị': 'I',
		'ĩ': 'i',
		'Ĩ': 'I',
		'ỉ': 'i',
		'Ỉ': 'i',
		'ủ': 'u',
		'Ủ': 'U',
		'ụ': 'u',
		'Ụ': 'U',
		'ũ': 'u',
		'Ũ': 'U',
		'ư': 'u',
		'Ư': 'U',
		'ứ': 'u',
		'Ứ': 'U',
		'ừ': 'u',
		'Ừ': 'U',
		'ự': 'u',
		'Ự': 'U',
		'ữ': 'u',
		'Ữ': 'U',
		'ử': 'u',
		'Ử': 'ư',
		'ỷ': 'y',
		'Ỷ': 'y',
		'ỳ': 'y',
		'Ỳ': 'Y',
		'ỵ': 'y',
		'Ỵ': 'Y',
		'ỹ': 'y',
		'Ỹ': 'Y',
		'ạ': 'a',
		'Ạ': 'A',
		'ấ': 'a',
		'Ấ': 'A',
		'ầ': 'a',
		'Ầ': 'A',
		'ậ': 'a',
		'Ậ': 'A',
		'ẫ': 'a',
		'Ẫ': 'A',
		// 'ă': 'a', // duplicate
		// 'Ă': 'A', // duplicate
		'ắ': 'a',
		'Ắ': 'A',
		'ằ': 'a',
		'Ằ': 'A',
		'ặ': 'a',
		'Ặ': 'A',
		'ẵ': 'a',
		'Ẵ': 'A',

		// symbols
		'“': '"',
		'”': '"',
		'‘': '\',
		'’': '\',
		'∂': 'd',
		'ƒ': 'f',
		'™': '(TM)',
		'©': '(C)',
		'œ': 'oe',
		'Œ': 'OE',
		'®': '(R)',
		'†': '+',
		'℠': '(SM)',
		'…': '...',
		'˚': 'o',
		'º': 'o',
		'ª': 'a',
		'•': '*',
		'၊': ',',
		'။': '.',

		// currency
		'$': 'USD',
		'€': 'EUR',
		'₢': 'BRN',
		'₣': 'FRF',
		'£': 'GBP',
		'₤': 'ITL',
		'₦': 'NGN',
		'₧': 'ESP',
		'₩': 'KRW',
		'₪': 'ILS',
		'₫': 'VND',
		'₭': 'LAK',
		'₮': 'MNT',
		'₯': 'GRD',
		'₱': 'ARS',
		'₲': 'PYG',
		'₳': 'ARA',
		'₴': 'UAH',
		'₵': 'GHS',
		'¢': 'cent',
		'¥': 'CNY',
		'元': 'CNY',
		'円': 'YEN',
		'﷼': 'IRR',
		'₠': 'EWE',
		'฿': 'THB',
		'₨': 'INR',
		'₹': 'INR',
		'₰': 'PF',
		'₺': 'TRY',
		'؋': 'AFN',
		'₼': 'AZN',
		'лв': 'BGN',
		'៛': 'KHR',
		'₡': 'CRC',
		'₸': 'KZT',
		'ден': 'MKD',
		'zł': 'PLN',
		'₽': 'RUB',
		'₾': 'GEL'

	};

	/**
	 * special look ahead character array
	 * These characters form with consonants to become 'single'/consonant combo
	 * @type [Array]
	 */
	variables.lookAheadCharArray = [
		// burmese
		'်',

		// Dhivehi
		'ް'
	];

	/**
	 * diatricMap for languages where transliteration changes entirely as more diatrics are added
	 * @type {Object}
	 */
	variables.diatricMap = {
		// Burmese
		// dependent vowels
		'ာ': 'a',
		'ါ': 'a',
		'ေ': 'e',
		'ဲ': 'e',
		'ိ': 'i',
		'ီ': 'i',
		'ို': 'o',
		'ု': 'u',
		'ူ': 'u',
		'ေါင်': 'aung',
		'ော': 'aw',
		'ော်': 'aw',
		'ေါ': 'aw',
		'ေါ်': 'aw',
		'်': '်', // this is special case but the character will be converted to latin in the code
		'က်': 'et',
		'ိုက်': 'aik',
		'ောက်': 'auk',
		'င်': 'in',
		'ိုင်': 'aing',
		'ောင်': 'aung',
		'စ်': 'it',
		'ည်': 'i',
		'တ်': 'at',
		'ိတ်': 'eik',
		'ုတ်': 'ok',
		'ွတ်': 'ut',
		'ေတ်': 'it',
		'ဒ်': 'd',
		'ိုဒ်': 'ok',
		'ုဒ်': 'ait',
		'န်': 'an',
		'ာန်': 'an',
		'ိန်': 'ein',
		'ုန်': 'on',
		'ွန်': 'un',
		'ပ်': 'at',
		'ိပ်': 'eik',
		'ုပ်': 'ok',
		'ွပ်': 'ut',
		'န်ုပ်': 'nub',
		'မ်': 'an',
		'ိမ်': 'ein',
		'ုမ်': 'on',
		'ွမ်': 'un',
		'ယ်': 'e',
		'ိုလ်': 'ol',
		'ဉ်': 'in',
		'ံ': 'an',
		'ိံ': 'ein',
		'ုံ': 'on'
	};

	/**
	 * langCharMap language specific characters translations
	 * @type   {Object}
	 */
	variables.langCharMap = {

		'en': {}, // default language

		'az': { // Azerbaijani
			'ç': 'c',
			'ə': 'e',
			'ğ': 'g',
			'ı': 'i',
			'ö': 'o',
			'ş': 's',
			'ü': 'u',
			'Ç': 'C',
			'Ə': 'E',
			'Ğ': 'G',
			'İ': 'I',
			'Ö': 'O',
			'Ş': 'S',
			'Ü': 'U'
		},

		'cs': { // Czech
			'č': 'c',
			'ď': 'd',
			'ě': 'e',
			'ň': 'n',
			'ř': 'r',
			'š': 's',
			'ť': 't',
			'ů': 'u',
			'ž': 'z',
			'Č': 'C',
			'Ď': 'D',
			'Ě': 'E',
			'Ň': 'N',
			'Ř': 'R',
			'Š': 'S',
			'Ť': 'T',
			'Ů': 'U',
			'Ž': 'Z'
		},

		'fi': { // Finnish
			// 'å': 'a', duplicate see charMap/latin
			// 'Å': 'A', duplicate see charMap/latin
			'ä': 'a', // ok
			'Ä': 'A', // ok
			'ö': 'o', // ok
			'Ö': 'O' // ok
		},

		'hu': { // Hungarian
			'ä': 'a', // ok
			'Ä': 'A', // ok
			// 'á': 'a', duplicate see charMap/latin
			// 'Á': 'A', duplicate see charMap/latin
			'ö': 'o', // ok
			'Ö': 'O', // ok
			// 'ő': 'o', duplicate see charMap/latin
			// 'Ő': 'O', duplicate see charMap/latin
			'ü': 'u',
			'Ü': 'U',
			'ű': 'u',
			'Ű': 'U'
		},

		'lt': { // Lithuanian
			'ą': 'a',
			'č': 'c',
			'ę': 'e',
			'ė': 'e',
			'į': 'i',
			'š': 's',
			'ų': 'u',
			'ū': 'u',
			'ž': 'z',
			'Ą': 'A',
			'Č': 'C',
			'Ę': 'E',
			'Ė': 'E',
			'Į': 'I',
			'Š': 'S',
			'Ų': 'U',
			'Ū': 'U'
		},

		'lv': { // Latvian
			'ā': 'a',
			'č': 'c',
			'ē': 'e',
			'ģ': 'g',
			'ī': 'i',
			'ķ': 'k',
			'ļ': 'l',
			'ņ': 'n',
			'š': 's',
			'ū': 'u',
			'ž': 'z',
			'Ā': 'A',
			'Č': 'C',
			'Ē': 'E',
			'Ģ': 'G',
			'Ī': 'i',
			'Ķ': 'k',
			'Ļ': 'L',
			'Ņ': 'N',
			'Š': 'S',
			'Ū': 'u',
			'Ž': 'Z'
		},

		'pl': { // Polish
			'ą': 'a',
			'ć': 'c',
			'ę': 'e',
			'ł': 'l',
			'ń': 'n',
			'ó': 'o',
			'ś': 's',
			'ź': 'z',
			'ż': 'z',
			'Ą': 'A',
			'Ć': 'C',
			'Ę': 'e',
			'Ł': 'L',
			'Ń': 'N',
			'Ó': 'O',
			'Ś': 'S',
			'Ź': 'Z',
			'Ż': 'Z'
		},

		'sk': { // Slovak
			'ä': 'a',
			'Ä': 'A'
		},

		'sr': { // Serbian
			'љ': 'lj',
			'њ': 'nj',
			'Љ': 'Lj',
			'Њ': 'Nj',
			'đ': 'dj',
			'Đ': 'Dj'
		},

		'tr': { // Turkish
			'Ü': 'U',
			'Ö': 'O',
			'ü': 'u',
			'ö': 'o'
		}
	};

	/**
	 * symbolMap language specific symbol translations
	 * translations must be transliterated already
	 * @type   {Object}
	 */
	variables.symbolMap = {

		'ar': {
			'∆': 'delta',
			'∞': 'la-nihaya',
			'♥': 'hob',
			'&': 'wa',
			'|': 'aw',
			'<': 'aqal-men',
			'>': 'akbar-men',
			'∑': 'majmou',
			'¤': 'omla'
		},

		'az': {},

		'ca': {
			'∆': 'delta',
			'∞': 'infinit',
			'♥': 'amor',
			'&': 'i',
			'|': 'o',
			'<': 'menys que',
			'>': 'mes que',
			'∑': 'suma dels',
			'¤': 'moneda'
		},

		'cs': {
			'∆': 'delta',
			'∞': 'nekonecno',
			'♥': 'laska',
			'&': 'a',
			'|': 'nebo',
			'<': 'mensi nez',
			'>': 'vetsi nez',
			'∑': 'soucet',
			'¤': 'mena'
		},

		'de': {
			'∆': 'delta',
			'∞': 'unendlich',
			'♥': 'Liebe',
			'&': 'und',
			'|': 'oder',
			'<': 'kleiner als',
			'>': 'groesser als',
			'∑': 'Summe von',
			'¤': 'Waehrung'
		},

		'dv': {
			'∆': 'delta',
			'∞': 'kolunulaa',
			'♥': 'loabi',
			'&': 'aai',
			'|': 'noonee',
			'<': 'ah vure kuda',
			'>': 'ah vure bodu',
			'∑': 'jumula',
			'¤': 'faisaa'
		},

		'en': {
			'∆': 'delta',
			'∞': 'infinity',
			'♥': 'love',
			'&': 'and',
			'|': 'or',
			'<': 'less than',
			'>': 'greater than',
			'∑': 'sum',
			'¤': 'currency'
		},

		'es': {
			'∆': 'delta',
			'∞': 'infinito',
			'♥': 'amor',
			'&': 'y',
			'|': 'u',
			'<': 'menos que',
			'>': 'mas que',
			'∑': 'suma de los',
			'¤': 'moneda'
		},

		'fa': {
			'∆': 'delta',
			'∞': 'bi-nahayat',
			'♥': 'eshgh',
			'&': 'va',
			'|': 'ya',
			'<': 'kamtar-az',
			'>': 'bishtar-az',
			'∑': 'majmooe',
			'¤': 'vahed'
		},

		'fi': {
			'∆': 'delta',
			'∞': 'aarettomyys',
			'♥': 'rakkaus',
			'&': 'ja',
			'|': 'tai',
			'<': 'pienempi kuin',
			'>': 'suurempi kuin',
			'∑': 'summa',
			'¤': 'valuutta'
		},

		'fr': {
			'∆': 'delta',
			'∞': 'infiniment',
			'♥': 'Amour',
			'&': 'et',
			'|': 'ou',
			'<': 'moins que',
			'>': 'superieure a',
			'∑': 'somme des',
			'¤': 'monnaie'
		},

		'gr': {},

		'hu': {
			'∆': 'delta',
			'∞': 'vegtelen',
			'♥': 'szerelem',
			'&': 'es',
			'|': 'vagy',
			'<': 'kisebb mint',
			'>': 'nagyobb mint',
			'∑': 'szumma',
			'¤': 'penznem'
		},

		'it': {
			'∆': 'delta',
			'∞': 'infinito',
			'♥': 'amore',
			'&': 'e',
			'|': 'o',
			'<': 'minore di',
			'>': 'maggiore di',
			'∑': 'somma',
			'¤': 'moneta'
		},

		'lt': {
			'∆': 'delta',
			'∞': 'begalybe',
			'♥': 'meile',
			'&': 'ir',
			'|': 'ar',
			'<': 'maziau nei',
			'>': 'daugiau nei',
			'∑': 'suma',
			'¤': 'valiuta'
		},

		'lv': {
			'∆': 'delta',
			'∞': 'bezgaliba',
			'♥': 'milestiba',
			'&': 'un',
			'|': 'vai',
			'<': 'mazak neka',
			'>': 'lielaks neka',
			'∑': 'summa',
			'¤': 'valuta'
		},

		'my': {
			'∆': 'kwahkhyaet',
			'∞': 'asaonasme',
			'♥': 'akhyait',
			'&': 'nhin',
			'|': 'tho',
			'<': 'ngethaw',
			'>': 'kyithaw',
			'∑': 'paungld',
			'¤': 'ngwekye'
		},

		'mk': {},

		'nl': {
			'∆': 'delta',
			'∞': 'oneindig',
			'♥': 'liefde',
			'&': 'en',
			'|': 'of',
			'<': 'kleiner dan',
			'>': 'groter dan',
			'∑': 'som',
			'¤': 'valuta'
		},

		'pl': {
			'∆': 'delta',
			'∞': 'nieskonczonosc',
			'♥': 'milosc',
			'&': 'i',
			'|': 'lub',
			'<': 'mniejsze niz',
			'>': 'wieksze niz',
			'∑': 'suma',
			'¤': 'waluta'
		},

		'pt': {
			'∆': 'delta',
			'∞': 'infinito',
			'♥': 'amor',
			'&': 'e',
			'|': 'ou',
			'<': 'menor que',
			'>': 'maior que',
			'∑': 'soma',
			'¤': 'moeda'
		},

		'ro': {
			'∆': 'delta',
			'∞': 'infinit',
			'♥': 'dragoste',
			'&': 'si',
			'|': 'sau',
			'<': 'mai mic ca',
			'>': 'mai mare ca',
			'∑': 'suma',
			'¤': 'valuta'
		},

		'ru': {
			'∆': 'delta',
			'∞': 'beskonechno',
			'♥': 'lubov',
			'&': 'i',
			'|': 'ili',
			'<': 'menshe',
			'>': 'bolshe',
			'∑': 'summa',
			'¤': 'valjuta'
		},

		'sk': {
			'∆': 'delta',
			'∞': 'nekonecno',
			'♥': 'laska',
			'&': 'a',
			'|': 'alebo',
			'<': 'menej ako',
			'>': 'viac ako',
			'∑': 'sucet',
			'¤': 'mena'
		},

		'sr': {},

		'tr': {
			'∆': 'delta',
			'∞': 'sonsuzluk',
			'♥': 'ask',
			'&': 've',
			'|': 'veya',
			'<': 'kucuktur',
			'>': 'buyuktur',
			'∑': 'toplam',
			'¤': 'para birimi'
		},

		'uk': {
			'∆': 'delta',
			'∞': 'bezkinechnist',
			'♥': 'lubov',
			'&': 'i',
			'|': 'abo',
			'<': 'menshe',
			'>': 'bilshe',
			'∑': 'suma',
			'¤': 'valjuta'
		},

		'vn': {
			'∆': 'delta',
			'∞': 'vo cuc',
			'♥': 'yeu',
			'&': 'va',
			'|': 'hoac',
			'<': 'nho hon',
			'>': 'lon hon',
			'∑': 'tong',
			'¤': 'tien te'
		}
	};


	public speakingurl function init () {
		// Merge default and argument options into local.opts
		variables.opts = structCopy(variables.defaultOpts);
		structAppend(variables.opts, arguments);

		variables.symbol = variables.symbolMap.en;
		variables.langChar = variables.langCharMap.en;

		variables.allowedChars = "";

		if (variables.opts.uricFlag) {
			variables.allowedChars &= variables.uricChars;
		}

		if (variables.opts.uricNoSlashFlag) {
			variables.allowedChars &= variables.opts.uricNoSlashChars;
		}

		if (variables.opts.markFlag) {
			variables.allowedChars &= variables.opts.markChars;
		}

		// add all custom replacement to allowed charlist
		for (local.ch in variables.opts.customReplacements) {
			variables.allowedChars &= local.ch;
		}

		variables.allowedChars &= variables.opts.separator;

		return this;
	}

	public string function getSlug (
		required string input
	) {
		// Initialize empty response
		local.response = "";

		// Trim leading and trailing whitespace (incl non-breaking-space)
		arguments.input = arguments.input.reReplaceNoCase("^[\s|\xA0]+|[\s|\xA0]+$", "", "all");

		// Shortcircuit if input is an empty string
		if (len(arguments.input) == 0) {
			return "";
		}

		local.l = arguments.input.len();

		// Loop over each character in the input string
		for (local.i=1; local.i <= local.l; local.i++) {
			local.ch = arguments.input.mid(local.i, 1);

			// Replace disallowed char with seperator. Add resulting char to response.
			local.response &= local.ch.reReplaceNoCase("[^\w\s" & variables.allowedChars & "_-]", variables.opts.separator, "all");
		}

		if (variables.opts.titleCase) {
			local.response = local.response.reReplace("\b([^\s" & variables.opts.separator & "])([^\s" & variables.opts.separator & "]*)\b", "\u\1\L\2", "all");
		}

		// Replace whitespace with seperator
		local.response = local.response.reReplaceNoCase("\s+", variables.opts.separator, "all")
			// Eliminate duplicate separators
			.reReplaceNoCase("\" & variables.opts.separator & "+", variables.opts.separator, "all")
			// Trim separators from start and end
			.reReplaceNoCase("(^\" & variables.opts.separator & "+|\" & variables.opts.separator & "+$)", "", "all");

		local.response = this.truncate(local.response, variables.opts.maxLength);

		if (!variables.opts.maintainCase && !variables.opts.titleCase) {
			local.response = local.response.lCase();
		}

		return local.response;
	}

	public string function truncate (
		required string input,
		required numeric maxLength
	) {
		if (arguments.maxLength <= 0) {
			return arguments.input;

		} else if (arguments.input.len() > arguments.maxLength) {
			local.response = arguments.input.left(arguments.maxLength);

			// If last character is seperator charater, trim it from the end
			if (local.response.right(1) == variables.opts.separator) {
				local.response = local.response.left(local.response.len()-1);
			}
		}

		return local.response;
	}
}

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


	public speakingurl function init () {
		// Merge default and argument options into local.opts
		variables.opts = structCopy(variables.defaultOpts);
		structAppend(variables.opts, arguments);

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
		if (arguments.maxLength <= 0 || arguments.input.len() <= arguments.maxLength) {
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

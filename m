Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA9D65144C
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 21:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232548AbiLSUqo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 15:46:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232681AbiLSUq3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 15:46:29 -0500
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1366C12A9D
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:46:29 -0800 (PST)
Received: by mail-io1-xd49.google.com with SMTP id o16-20020a056602225000b006e032e361ccso4622578ioo.13
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VwPD0qy3Fd4MZbZ1UDU3b7vBqkh0mNCuHHOa6+XoRDI=;
        b=IHg6+Gv3Z3EE3ZvZcHJip+nkzkOLPOiU2MKzy/1YcYpE9p6Vhub6QpTm6zYdFvxZSr
         vC1qM6HZkvMXHTT+cMTj7gfPLbh4je7ixHxoyyvg140Jnt7PtuNZa/gzHBIZu0mFGlrO
         xMuN+neqE0Hi0oHReaRSt8oJJNWwNmPIBWf1bLJMeuxIFi0pmYzk/xNUsE7lxmECL3R7
         uBn0n4KfdsfFsPdhxa1nlscMZwymsK5UbWJ/5vVZB3YDCHIC3qw2ZtfA1WPsacIhO3gM
         3KHFxJEAvv3sXEyXU3n2vqq+GuOODnT+XhxWvEySHzaDGW8awt2SSKymYf4TE1MWKB0R
         PTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwPD0qy3Fd4MZbZ1UDU3b7vBqkh0mNCuHHOa6+XoRDI=;
        b=caoRrSB6Mnhwqxfc+1dL5q97+mX3X0Oxs+H9EFGzuZ9uCLlIFlOJtcme8g131EpvJk
         cfh5kZxmldpkjdxAwsw48lYpezdDSNBQU981Eng+sGWFs3psx1z8GZ7RBkfvkXCRd6+m
         ZuEQRHdaDIuqmD0opXH3iq5ugPx5t9EhkXWKBdH7mELS4B8si0NMCzNh4o6+6vC0XlhP
         GvH/le2u/ErqrmKj9dhmRfVLubRXG9KQ891oR2NKL8ZYgdtu/npWCvjZ6V4QHlXtOb99
         ILNBxQXnqw8/yHc7H6iTSX9FE8bAitr8zjdWOO2QjfM6SkEVkenYKzxbjsLadK5QaFhM
         CNPw==
X-Gm-Message-State: AFqh2kqQQqygPeRrKKloHUpXnraQ3Mr9Hrqm+NR+OF0jRFuyKFJ/U3k1
        7gMEi0pXU8YMHOT9gPCFVT7EZj/bh9RqnkI=
X-Google-Smtp-Source: AMrXdXtErnffUf94+aOsMuIAFIq+YEitPYxuq2ImZ/W1ZAcJNX/BZz3zTtmbyKVGFPzq0VgstzZ5NmIez23BHQA=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a6b:90b:0:b0:6ec:6abf:f5eb with SMTP id
 t11-20020a6b090b000000b006ec6abff5ebmr225969ioi.91.1671482788508; Mon, 19 Dec
 2022 12:46:28 -0800 (PST)
Date:   Mon, 19 Dec 2022 14:46:14 -0600
In-Reply-To: <20221219204619.2205248-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221219191855.2010466-1-allenwebb@google.com> <20221219204619.2205248-1-allenwebb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221219204619.2205248-7-allenwebb@google.com>
Subject: [PATCH v9 06/10] modpost: Track module name for built-in modules
From:   Allen Webb <allenwebb@google.com>
To:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Allen Webb <allenwebb@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Keep track of the module name when processing match table symbols.

Signed-off-by: Allen Webb <allenwebb@google.com>
---
 scripts/mod/file2alias.c | 39 +++++++++++++++++++++++++++++++++++----
 scripts/mod/modpost.h    |  1 +
 2 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 80d973144fde..e41ff8de7a87 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -28,6 +28,7 @@ typedef Elf64_Addr	kernel_ulong_t;
 #include <stdint.h>
 #endif
 
+#include <assert.h>
 #include <ctype.h>
 #include <stdbool.h>
 
@@ -1540,9 +1541,9 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 			Elf_Sym *sym, const char *symname)
 {
 	void *symval;
-	char *zeros = NULL;
-	const char *name, *identifier;
-	unsigned int namelen;
+	char *zeros = NULL, *modname_str = NULL;
+	const char *name, *identifier, *modname;
+	unsigned int namelen, modnamelen;
 
 	/* We're looking for a section relative symbol */
 	if (!sym->st_shndx || get_secindex(info, sym) >= info->num_sections)
@@ -1552,7 +1553,12 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	if (ELF_ST_TYPE(sym->st_info) != STT_OBJECT)
 		return;
 
-	/* All our symbols are of form __mod_<name>__<identifier>_device_table. */
+	/*
+	 * All our symbols are either of form
+	 *   __mod_<name>__<identifier>_device_table
+	 * or
+	 *   __mod_<name>__<identifier>__kmod_<builtin-name>_device_table
+	 */
 	if (strncmp(symname, "__mod_", strlen("__mod_")))
 		return;
 	name = symname + strlen("__mod_");
@@ -1564,8 +1570,30 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	identifier = strstr(name, "__");
 	if (!identifier)
 		return;
+	modnamelen = namelen;
 	namelen = identifier - name;
 
+	/*
+	 * In the vmlinuz.o case we want to handle __kmod_ so aliases from
+	 * builtin modules are attributed correctly.
+	 */
+	modname = strstr(identifier + 2, "__kmod_");
+	if (modname) {
+		modname += strlen("__kmod_");
+		modnamelen -= (modname - name) + strlen("_device_table");
+		modname_str = malloc(modnamelen + 1);
+		/* We don't want to continue if the allocation fails. */
+		assert(modname_str);
+		memcpy(modname_str, modname, modnamelen);
+		modname_str[modnamelen] = '\0';
+	}
+
+	if (modname_str)
+		modname = modname_str;
+	else
+		modname = mod->name;
+	mod->builtin_name = modname;
+
 	/* Handle all-NULL symbols allocated into .bss */
 	if (info->sechdrs[get_secindex(info, sym)].sh_type & SHT_NOBITS) {
 		zeros = calloc(1, sym->st_size);
@@ -1597,6 +1625,9 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 		}
 	}
 	free(zeros);
+	mod->builtin_name = NULL;
+	if (modname_str)
+		free(modname_str);
 }
 
 /* Now add out buffered information to the generated C source */
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 1178f40a73f3..34fe5fc0b02c 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -128,6 +128,7 @@ struct module {
 	struct list_head missing_namespaces;
 	// Actual imported namespaces
 	struct list_head imported_namespaces;
+	const char *builtin_name;
 	char name[];
 };
 
-- 
2.37.3


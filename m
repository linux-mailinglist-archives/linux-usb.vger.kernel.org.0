Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFA26DA091
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 21:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240480AbjDFTBh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 15:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240048AbjDFTB2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 15:01:28 -0400
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07449EE0
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 12:01:05 -0700 (PDT)
Received: by mail-io1-xd49.google.com with SMTP id d204-20020a6bb4d5000000b00758cfdd36c3so24633499iof.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Apr 2023 12:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680807665;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt77I86eFgSbNaHK2t0i9/m/bTrUBRuYsHv7CbhjIr4=;
        b=gGaKPKflAxPJskJy8MYWIZ1zGy8JetUF3tcjeHXdaxT9RttPBdGV08CwKIrPIo+1+v
         GdrlN+UenxsaTd6j37BEg+IeE8RAXAb1nZvuujxF1SDejaQ6L5VlOT1mPFNxmzdShJ42
         jWDSXooi1wn60L0/ZPaJqCSHCabEVM5k2IuBzu+3e1Bjl45I1n69jie8qj9ZKPhH3FAv
         6nUSYGmVucJp1xtsyijza3z9sodintasi2zjYpdAdjOZjD04JaBOCzqMbvksTqMA21+e
         HsOsDewz6OvWSPAX4YEGOl6qFQS4nhG23kRhNad8SEYLTI9+httLSlZo5osesgMiNws/
         7fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680807665;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt77I86eFgSbNaHK2t0i9/m/bTrUBRuYsHv7CbhjIr4=;
        b=ZaN35oy9Wsiq3hoMNW4lAqduOobOdcj40DHIS2Df0mLYCIvHnNAJDcopL1xctRpNjY
         QCEAvwRcsT2bzaMqcUuMb+Ko7cLIvFv94eSPI0kKky0vWWKJWjbDm63c6iCXKh9+QYeM
         tJz3pCCol4+Fj7veeIxV2f3tSBC6L30wXXU4phb9N4yg+S9qShJ9tnDbExxnJ3i+iXiE
         nGaaCBrEIV+5L00ytn76DQFz62jXBTaCwAwzXIS1RrzQDu5G5RneFs/b2HmbMP3i2AbD
         HSbjVYENFXdHi8uM0cSWvmtU43+UALvAtGMAmc1BwAX/3UPhQKrqv9Ju2gxH/MCbo/mn
         1z5Q==
X-Gm-Message-State: AAQBX9f6LZVpg+D/ifJwuSeHXnX+RB2eD/9pTZSjQ9PvQXnNttoApG14
        kDuiE15nw6iJjO/DjBELk842CW2ZQqh63VM=
X-Google-Smtp-Source: AKy350YvGrGN4n61kxqDKxiBKleyueyiQrPvC6O+CnLmm0EGLHXB3+GJdstqxviJ7IrnooMhhcchZlrK/+eB4BI=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a02:848e:0:b0:408:f9aa:a54d with SMTP id
 f14-20020a02848e000000b00408f9aaa54dmr5772053jai.6.1680807664892; Thu, 06 Apr
 2023 12:01:04 -0700 (PDT)
Date:   Thu,  6 Apr 2023 14:00:26 -0500
In-Reply-To: <20230406190030.968972-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221219204619.2205248-1-allenwebb@google.com> <20230406190030.968972-1-allenwebb@google.com>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
Message-ID: <20230406190030.968972-8-allenwebb@google.com>
Subject: [PATCH v10 07/11] file2alias.c: Implement builtin.alias generation
From:   Allen Webb <allenwebb@google.com>
To:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     gregkh@linuxfoundation.org, mcgrof@kernel.org,
        christophe.leroy@csgroup.eu, nick.alcock@oracle.com,
        Allen Webb <allenwebb@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This populates the mod->modalias_buf with aliases for built-in modules
when modpost is run against vmlinuz.o.

Signed-off-by: Allen Webb <allenwebb@google.com>
---
 scripts/mod/file2alias.c | 61 ++++++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 21 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index b392d51c3b06..3793d4632b94 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -233,6 +233,8 @@ static void do_usb_entry(void *symval,
 	add_wildcard(alias);
 	buf_printf(&mod->dev_table_buf,
 		   "MODULE_ALIAS(\"%s\");\n", alias);
+	if (mod->builtin_name)
+		buf_printf(&mod->modalias_buf, "alias %s %s\n", alias, mod->builtin_name);
 }
 
 /* Handles increment/decrement of BCD formatted integers */
@@ -377,9 +379,13 @@ static void do_of_entry_multi(void *symval, struct module *mod)
 			*tmp = '_';
 
 	buf_printf(&mod->dev_table_buf, "MODULE_ALIAS(\"%s\");\n", alias);
+	if (mod->builtin_name)
+		buf_printf(&mod->modalias_buf, "alias %s %s\n", alias, mod->builtin_name);
 	strcat(alias, "C");
 	add_wildcard(alias);
 	buf_printf(&mod->dev_table_buf, "MODULE_ALIAS(\"%s\");\n", alias);
+	if (mod->builtin_name)
+		buf_printf(&mod->modalias_buf, "alias %s %s\n", alias, mod->builtin_name);
 }
 
 static void do_of_table(void *symval, unsigned long size,
@@ -611,12 +617,18 @@ static void do_pnp_device_entry(void *symval, unsigned long size,
 
 		buf_printf(&mod->dev_table_buf,
 			   "MODULE_ALIAS(\"pnp:d%s*\");\n", *id);
+		if (mod->builtin_name)
+			buf_printf(&mod->modalias_buf, "alias pnp:d%s* %s\n",
+				   *id, mod->builtin_name);
 
 		/* fix broken pnp bus lowercasing */
 		for (j = 0; j < sizeof(acpi_id); j++)
 			acpi_id[j] = toupper((*id)[j]);
 		buf_printf(&mod->dev_table_buf,
 			   "MODULE_ALIAS(\"acpi*:%s:*\");\n", acpi_id);
+		if (mod->builtin_name)
+			buf_printf(&mod->modalias_buf, "alias acpi*:%s:* %s\n",
+				   acpi_id, mod->builtin_name);
 	}
 }
 
@@ -638,6 +650,8 @@ static void do_pnp_card_entries(void *symval, unsigned long size,
 			const char *id = (char *)(*devs)[j].id;
 			int i2, j2;
 			int dup = 0;
+			char acpi_id[PNP_ID_LEN];
+			int k;
 
 			if (!id[0])
 				break;
@@ -663,19 +677,23 @@ static void do_pnp_card_entries(void *symval, unsigned long size,
 			}
 
 			/* add an individual alias for every device entry */
-			if (!dup) {
-				char acpi_id[PNP_ID_LEN];
-				int k;
-
-				buf_printf(&mod->dev_table_buf,
-					   "MODULE_ALIAS(\"pnp:d%s*\");\n", id);
-
-				/* fix broken pnp bus lowercasing */
-				for (k = 0; k < sizeof(acpi_id); k++)
-					acpi_id[k] = toupper(id[k]);
-				buf_printf(&mod->dev_table_buf,
-					   "MODULE_ALIAS(\"acpi*:%s:*\");\n", acpi_id);
-			}
+			if (dup)
+				continue;
+
+			buf_printf(&mod->dev_table_buf,
+				   "MODULE_ALIAS(\"pnp:d%s*\");\n", id);
+			if (mod->builtin_name)
+				buf_printf(&mod->modalias_buf, "alias pnp:d%s* %s\n",
+					   id, mod->builtin_name);
+
+			/* fix broken pnp bus lowercasing */
+			for (k = 0; k < sizeof(acpi_id); k++)
+				acpi_id[k] = toupper(id[k]);
+			buf_printf(&mod->dev_table_buf,
+				   "MODULE_ALIAS(\"acpi*:%s:*\");\n", acpi_id);
+			if (mod->builtin_name)
+				buf_printf(&mod->modalias_buf, "alias acpi*:%s:* %s\n",
+					   acpi_id, mod->builtin_name);
 		}
 	}
 }
@@ -1476,10 +1494,13 @@ static void do_table(void *symval, unsigned long size,
 	size -= id_size;
 
 	for (i = 0; i < size; i += id_size) {
-		if (do_entry(mod->name, symval+i, alias)) {
-			buf_printf(&mod->dev_table_buf,
-				   "MODULE_ALIAS(\"%s\");\n", alias);
-		}
+		if (!do_entry(mod->name, symval + i, alias))
+			continue;
+		buf_printf(&mod->dev_table_buf, "MODULE_ALIAS(\"%s\");\n", alias);
+		if (!mod->builtin_name)
+			continue;
+		buf_printf(&mod->modalias_buf, "alias %s %s\n", alias,
+			   mod->builtin_name);
 	}
 }
 
@@ -1554,10 +1575,8 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 		return;
 
 	/*
-	 * All our symbols are either of form
-	 *   __mod_<name>__<identifier>_device_table
-	 * or
-	 *   __mod_<name>__<identifier>__kmod_<builtin-name>_device_table
+	 * All our symbols are of form
+	 *   __mod_<name>__<identifier>__kmod_<modname>_device_table
 	 */
 	if (strncmp(symname, "__mod_", strlen("__mod_")))
 		return;
-- 
2.39.2


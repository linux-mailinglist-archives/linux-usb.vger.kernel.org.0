Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A73526DA08E
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 21:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240389AbjDFTBe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 15:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240368AbjDFTBX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 15:01:23 -0400
Received: from mail-il1-x14a.google.com (mail-il1-x14a.google.com [IPv6:2607:f8b0:4864:20::14a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF14783FF
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 12:01:04 -0700 (PDT)
Received: by mail-il1-x14a.google.com with SMTP id s1-20020a92ae01000000b0032637be81d1so15770374ilh.4
        for <linux-usb@vger.kernel.org>; Thu, 06 Apr 2023 12:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680807663;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lPtoJrKBH3N2nk7pm0WBiOte1w3zyXs+2rCz5/qKsmI=;
        b=hUyI2+lLsq229AiQVyYaVj59ugHM5SqIn1EqV+za7saQ4CQrQuFyLKiSrN7COMM2wq
         2hzLDZ2jSzvMQhrePCF1mFnp6bOK6gTDVT0Sdcs2Gt7pFRXg2/Y0D2mRwnmeW1c2HRrt
         tHx/vzeR2O6es87fnmCvObeGTqohq0bevkCC/52BlAmGKwhn06UDwDJWkrQCFxeG/cO5
         k8LwrAhU2HIGN0M4vWvREdfDV5qSrHzRBdVCMLi/4Cg+v91i8FqB/AbFr/DlchYSeU10
         AEHuG4UVpMbPj6YBUDNyGrUXQYIVmo4729n+mECFyhng3QYE5BBZHs5IX6caMnqNoXWo
         cAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680807663;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lPtoJrKBH3N2nk7pm0WBiOte1w3zyXs+2rCz5/qKsmI=;
        b=DTIAexqpKWM8KYeqYzmKvc2cixvCRl79Zw4ty7q0co1yw3Cji+o0X4MFcJSoCQhFuk
         ZcgWKk845/1tCLFke1xIqrrdEwG4GfTO2jaKEiVkObKMmDZC/f7QVt7Iucn/s3ZQAPeM
         9QbQSC2rKg4Mybcjs9lhoWRSIaYm0CL9+l377PZrcDWYkpoJSJ89vyytSMr3MxDETygf
         /daaNbYfCHWJbRfTjDnj86j8cCOjFhKTSZ+WesnzOMeLL1HBL+O8jgCN2CvjobyUKJpq
         D6p41DdSlU+PZaAWqmtPpSU8Bikn9K4lOPmAyBsUP5HcPecuHigv6O3g3H0l88w+kIG+
         9iMQ==
X-Gm-Message-State: AAQBX9fcU02PH7fkLtsJdomh8hlcQYx5m/UbjTA7Qa18heJXDyfb179X
        MfWvNONh020ROAOyvD4m/zeDh4YUKozIVDs=
X-Google-Smtp-Source: AKy350b3ywgYGOuNRaHCfri+YC25Y0XY6ETeOx4MfHOdbQbf18wi5MjpLqXr6pg04A8qD1H12AIVIIUEY6rzGOQ=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a02:85ae:0:b0:3ec:dc1f:12dd with SMTP id
 d43-20020a0285ae000000b003ecdc1f12ddmr6262286jai.6.1680807663728; Thu, 06 Apr
 2023 12:01:03 -0700 (PDT)
Date:   Thu,  6 Apr 2023 14:00:25 -0500
In-Reply-To: <20230406190030.968972-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221219204619.2205248-1-allenwebb@google.com> <20230406190030.968972-1-allenwebb@google.com>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
Message-ID: <20230406190030.968972-7-allenwebb@google.com>
Subject: [PATCH v10 06/11] modpost: Add -b option for emitting built-in aliases
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

This adds a command line option for writing the match-id based built-in
aliases to a file. A future patch extends file2alias.c to support this
command.

The -b option accepts the output path as a parameter and requires
vmlinuz.o to be one of the input files for the aliases to be found.

Signed-off-by: Allen Webb <allenwebb@google.com>
---
 scripts/mod/modpost.c | 30 ++++++++++++++++++++++++++++--
 scripts/mod/modpost.h |  1 +
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index efff8078e395..2e452aec0fc6 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2173,6 +2173,19 @@ static void write_if_changed(struct buffer *b, const char *fname)
 	write_buf(b, fname);
 }
 
+/* Write the builtin aliases to the specified file. */
+static void write_builtin(const char *fname)
+{
+	struct buffer buf = { };
+	struct module *mod;
+
+	list_for_each_entry(mod, &modules, list)
+		buf_write(&buf, mod->modalias_buf.p, mod->modalias_buf.pos);
+
+	write_if_changed(&buf, fname);
+	free(buf.p);
+}
+
 static void write_vmlinux_export_c_file(struct module *mod)
 {
 	struct buffer buf = { };
@@ -2329,13 +2342,23 @@ int main(int argc, char **argv)
 {
 	struct module *mod;
 	char *missing_namespace_deps = NULL;
-	char *dump_write = NULL, *files_source = NULL;
+	char *builtin_write = NULL, *dump_write = NULL, *files_source = NULL;
 	int opt;
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "b:ei:mnT:o:awENd:")) != -1) {
 		switch (opt) {
+		case 'b':
+			/*
+			 * Writes the match-id based built-in module aliases to
+			 * the specified path.
+			 *
+			 * vmlinuz.o needs to be one of the input files for the
+			 * aliases to be found.
+			 */
+			builtin_write = optarg;
+			break;
 		case 'e':
 			external_module = true;
 			break;
@@ -2398,6 +2421,9 @@ int main(int argc, char **argv)
 			write_mod_c_file(mod);
 	}
 
+	if (builtin_write)
+		write_builtin(builtin_write);
+
 	if (missing_namespace_deps)
 		write_namespace_deps_files(missing_namespace_deps);
 
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 34fe5fc0b02c..c55a6aeb46bf 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -123,6 +123,7 @@ struct module {
 	bool has_init;
 	bool has_cleanup;
 	struct buffer dev_table_buf;
+	struct buffer modalias_buf;
 	char	     srcversion[25];
 	// Missing namespace dependencies
 	struct list_head missing_namespaces;
-- 
2.39.2


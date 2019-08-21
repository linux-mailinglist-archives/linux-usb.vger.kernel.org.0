Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77F3F97878
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 13:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbfHULyJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 07:54:09 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:54581 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbfHULyJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 07:54:09 -0400
Received: by mail-qk1-f202.google.com with SMTP id x28so1820474qki.21
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 04:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=uOv8ZVUXw4B5LiGRR+kjcrlEBVKgrrvFGm/lppkYW7E=;
        b=LD/8CSp/RxQw+2lyviI3tg24wVYD3DH58HPqAwJLXDZx3uFVYieKuUe7oe5T4AioW9
         vjtJ7MmIbCwlkq5034E/aCLr7rPwHV0bYDL1oLV/k2tmUGEGoqvrUk3qEumsTmk6GH/3
         JuAj/FjWli9aoIqMsTDmEfJZ6PW4VA3di3cPhMYBoEbzwVcOwVshHR/8AiGMr1zev5g0
         ROmVTWCHDhIR4J55vBh5GtMiTBY5dh3h0WURCvlmGnxAJOkj0Kn/N41grJcLmjMX0k0s
         vzQ6ra500Ia9KNq8TpjjEYCZi1bIj64t16V6ns699jTEmp/IaKkwzZcyVozq0vyOfSWR
         oqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=uOv8ZVUXw4B5LiGRR+kjcrlEBVKgrrvFGm/lppkYW7E=;
        b=i2pRbU3kX4g+jeklfRp0VzUMV8BQY1ZR4mlT+0nm1G1dsZ+jUF67kcY1E2djMA9fJw
         WT4M0b0VMzrwGFPJS/YnFMi3azmMHkPtuPfruno/XMUmSJS2je/QMG0/jGlLfxCD+lPi
         zVtfx4TeV3+9u59rKul/HkOC6FXIzF4prjPr4ZrO3fapjNoJFbvuvBCDt/y+J2oaCv+l
         T3vzVqTZrR1eeNa8b6FU5OgtgDD2KGYvy4OEDyd6Ye9TGwVCrJs/7jV/JUYYNwWNUfBw
         3xjyKelstiiX91RnoKnCbSi1hrcUhigYjAh0b+KqQVHn+UXhRx1G4gZBIi9/uvWgHZoZ
         tnXQ==
X-Gm-Message-State: APjAAAWtdEeBNo2WB0JfK2z3iDQWW92/ytPEp8MiYDwD8DJniGvMLWwr
        2XuoI3LP6w0qjGgaEIBV0VwAPFi0W4lL2w==
X-Google-Smtp-Source: APXvYqxlS9YHlJGjPey+iEejjE7Li2lRg3JRhE6Q+qpdLfd2tQ+XVL+cX2AfZiyt6A1piFzErIXWpt3zZ9mzgg==
X-Received: by 2002:ac8:25f2:: with SMTP id f47mr30077518qtf.195.1566388448166;
 Wed, 21 Aug 2019 04:54:08 -0700 (PDT)
Date:   Wed, 21 Aug 2019 12:49:16 +0100
In-Reply-To: <20190821114955.12788-1-maennich@google.com>
Message-Id: <20190821114955.12788-2-maennich@google.com>
Mime-Version: 1.0
References: <20190813121733.52480-1-maennich@google.com> <20190821114955.12788-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v3 01/11] module: support reading multiple values per modinfo tag
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com,
        jeyu@kernel.org, joel@joelfernandes.org,
        kstewart@linuxfoundation.org, linux-arch@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-modules@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-usb@vger.kernel.org, lucas.de.marchi@gmail.com,
        maco@android.com, maco@google.com, michal.lkml@markovi.net,
        mingo@redhat.com, oneukum@suse.com, pombredanne@nexb.com,
        sam@ravnborg.org, sspatil@google.com, stern@rowland.harvard.edu,
        tglx@linutronix.de, usb-storage@lists.one-eyed-alien.net,
        x86@kernel.org, yamada.masahiro@socionext.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Similar to modpost's get_next_modinfo(), introduce get_next_modinfo() in
kernel/module.c to acquire any further values associated with the same
modinfo tag name. That is useful for any tags that have multiple
occurrences (such as 'alias'), but is in particular introduced here as
part of the symbol namespaces patch series to read the (potentially)
multiple namespaces a module is importing.

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Reviewed-by: Martijn Coenen <maco@android.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 kernel/module.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index 5933395af9a0..a23067907169 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2481,7 +2481,8 @@ static char *next_string(char *string, unsigned long *secsize)
 	return string;
 }
 
-static char *get_modinfo(struct load_info *info, const char *tag)
+static char *get_next_modinfo(const struct load_info *info, const char *tag,
+			      char *prev)
 {
 	char *p;
 	unsigned int taglen = strlen(tag);
@@ -2492,13 +2493,25 @@ static char *get_modinfo(struct load_info *info, const char *tag)
 	 * get_modinfo() calls made before rewrite_section_headers()
 	 * must use sh_offset, as sh_addr isn't set!
 	 */
-	for (p = (char *)info->hdr + infosec->sh_offset; p; p = next_string(p, &size)) {
+	char *modinfo = (char *)info->hdr + infosec->sh_offset;
+
+	if (prev) {
+		size -= prev - modinfo;
+		modinfo = next_string(prev, &size);
+	}
+
+	for (p = modinfo; p; p = next_string(p, &size)) {
 		if (strncmp(p, tag, taglen) == 0 && p[taglen] == '=')
 			return p + taglen + 1;
 	}
 	return NULL;
 }
 
+static char *get_modinfo(const struct load_info *info, const char *tag)
+{
+	return get_next_modinfo(info, tag, NULL);
+}
+
 static void setup_modinfo(struct module *mod, struct load_info *info)
 {
 	struct module_attribute *attr;
-- 
2.23.0.rc1.153.gdeed80330f-goog


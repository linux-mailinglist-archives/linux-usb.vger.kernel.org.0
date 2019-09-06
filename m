Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F4FAB5F8
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2019 12:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391963AbfIFKcr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Sep 2019 06:32:47 -0400
Received: from mail-vs1-f73.google.com ([209.85.217.73]:48654 "EHLO
        mail-vs1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391954AbfIFKcq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Sep 2019 06:32:46 -0400
Received: by mail-vs1-f73.google.com with SMTP id h11so653301vsj.15
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2019 03:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=XfkuPAzUg0cWTsSII8UxfvUGODgh66Dt0PdffmfP8ds=;
        b=C6Jr4basPVZinLvyQuBY/r7Xehq/6fD8Z4AwI7Ou+U4iz1SeaCsIMGK5UzEFoCh3kL
         7k+AJ2YSXHXGw7QNTRiJ8ltZGyCQPp9P8eS73HOTuEOJsoR6PNQDV8v2IxULBZN84cHA
         TXZZKLn19IDXXLcvqMtJnYTMw7fID+m98MyQT7iIlal6isZEfCLfpoaZj/JP7G/aFrvH
         lRXWpI55ga6IiMMdNLTpvlpvMqZeZvvh9Wx5t87nOEC/zjwrXBzP/G7pdhYaxZqpXc3p
         qqZw126iKby/JWoA6BWfF8d/YLQxx1rrFDojmSnGcNrzbwONWZ8OoJksM4hdUYlQmUoZ
         +bUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=XfkuPAzUg0cWTsSII8UxfvUGODgh66Dt0PdffmfP8ds=;
        b=do3Fdtpl0fvlEnrDdyks3pFS7h7WqhsgM3yMfPPO2oNHqml0yBEwquYGaGE0cG//E5
         qN2q4A8o/ZruP3GvVHLr6FVBeAQtP6DU8HEbr5KJT3sfGVRJUnpKZjOWcnCO6Up1dQmQ
         givI0MSsbg8OOqIDUXGCgFdQQVtRDfdok+/KtQiPxz0P33CKyXSudGDe2/qB1PPnlrC5
         ax/vyxUM4HOqGcbbCxLRChLkT23mtso3Szl3hFakRNA9RH3EgpCWq3/6Xf0eEO3JrQzP
         ST97PEJ9irpCWKvspSaDJgnDaEX33eUWDJxV/8SZ7OQ+bdy4jYDtS8EfAB1sV9Cc8Rgb
         k6bQ==
X-Gm-Message-State: APjAAAUO/tTlPb2q1GPxJy99Go7qYu2w9SbRpWLw2iNo6yULPlfHQJnO
        hlZWkYE+KV/o1JMMMSCLcT6AhThT5cIegw==
X-Google-Smtp-Source: APXvYqx66gHD+SeaL9xmE31R3KTiX9kgRcczCw8/S2SwjY37EWST9lA0u7geo0wJ4WJyTzo4D12jZ8sHy9W3hA==
X-Received: by 2002:a1f:a3d8:: with SMTP id m207mr3707720vke.49.1567765964933;
 Fri, 06 Sep 2019 03:32:44 -0700 (PDT)
Date:   Fri,  6 Sep 2019 11:32:25 +0100
In-Reply-To: <20190906103235.197072-1-maennich@google.com>
Message-Id: <20190906103235.197072-2-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190906103235.197072-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v5 01/11] module: support reading multiple values per modinfo tag
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, jeyu@kernel.org,
        joel@joelfernandes.org, lucas.de.marchi@gmail.com,
        maco@android.com, sspatil@google.com, will@kernel.org,
        yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
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
index 9ee93421269c..3ee507c0a92f 100644
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
2.23.0.187.g17f5b7556c-goog


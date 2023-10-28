Return-Path: <linux-usb+bounces-2320-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 432D57DA7F4
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 18:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 740721C209A8
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 16:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404EB171A6;
	Sat, 28 Oct 2023 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="m2c4u+Ew"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDB116418
	for <linux-usb@vger.kernel.org>; Sat, 28 Oct 2023 16:05:06 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 881FCE1
	for <linux-usb@vger.kernel.org>; Sat, 28 Oct 2023 09:05:04 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id wlo5q1cN8yBwnwlo6qKaMv; Sat, 28 Oct 2023 18:05:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698509103;
	bh=lJV0nrXGftDw+3aoT/GoqGQ9MO17enJwu7GrGnJ+O5s=;
	h=From:To:Cc:Subject:Date;
	b=m2c4u+Ew1ymLvM7aeveClQml6joGS6GtBS/tZTl21IhQB0cobcEtGP1V2iVVyi3Gn
	 8gnVIMtkaBD96x9AJvnMpQA0Sb5LTYM/xzYCpQWQ4fcIrRO99EARgVybpzQOKWRyg8
	 qVB6OYn9fNjCIbKMUj+06GIB/8Flz7EueT+1TEFob++hnkxZM0WKUoXHn0gZAVcauP
	 cJc3ie0Vs6AbpXi/nFyUIofgBQtlsGWKTRnI4Gv67UVWUWojLBQJeFh1B+Cq69vNYt
	 tM9WHgAvwBVlEp3OJzNKzWQlZUJNggzNnqU/wVeoFjvOrcUDhnPdG9A7O8p+9A/hDo
	 7qxkmxbxWNtMQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 28 Oct 2023 18:05:03 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: dwc2: Use seq_buf instead of hand writing it
Date: Sat, 28 Oct 2023 18:05:00 +0200
Message-Id: <4eafde20b0fb4894a00f9749a2b17e847a7efa8c.1698509078.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cat_printf() re-implements what the seq_buf API does.
So, switch to the seq_buf API to save some line of code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
seq_buf_printf(&buf, ", "); could be seq_buf_puts(), but the result could
be slightly different. So I kept a conservative approach.

If only some seq_buf_printf() are used, the final seq_buf_terminate() can
be avoided, but I think it is cleaner with it.

Changes in v2:
   - compile tested with DWC2_PRINT_SCHEDULE defined
   - Fix some built issues

v1: https://lore.kernel.org/all/4c8b71efe4fe05ed0cc37f33ef774746d4d55299.1698489641.git.christophe.jaillet@wanadoo.fr/
---
 drivers/usb/dwc2/hcd_queue.c | 53 ++++++++----------------------------
 1 file changed, 11 insertions(+), 42 deletions(-)

diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index 0d4495c6b9f7..4edb87c4247c 100644
--- a/drivers/usb/dwc2/hcd_queue.c
+++ b/drivers/usb/dwc2/hcd_queue.c
@@ -18,6 +18,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
+#include <linux/seq_buf.h>
 
 #include <linux/usb/hcd.h>
 #include <linux/usb/ch11.h>
@@ -359,41 +360,6 @@ static unsigned long *dwc2_get_ls_map(struct dwc2_hsotg *hsotg,
 }
 
 #ifdef DWC2_PRINT_SCHEDULE
-/*
- * cat_printf() - A printf() + strcat() helper
- *
- * This is useful for concatenating a bunch of strings where each string is
- * constructed using printf.
- *
- * @buf:   The destination buffer; will be updated to point after the printed
- *         data.
- * @size:  The number of bytes in the buffer (includes space for '\0').
- * @fmt:   The format for printf.
- * @...:   The args for printf.
- */
-static __printf(3, 4)
-void cat_printf(char **buf, size_t *size, const char *fmt, ...)
-{
-	va_list args;
-	int i;
-
-	if (*size == 0)
-		return;
-
-	va_start(args, fmt);
-	i = vsnprintf(*buf, *size, fmt, args);
-	va_end(args);
-
-	if (i >= *size) {
-		(*buf)[*size - 1] = '\0';
-		*buf += *size;
-		*size = 0;
-	} else {
-		*buf += i;
-		*size -= i;
-	}
-}
-
 /*
  * pmap_print() - Print the given periodic map
  *
@@ -417,8 +383,7 @@ static void pmap_print(unsigned long *map, int bits_per_period,
 
 	for (period = 0; period < periods_in_map; period++) {
 		char tmp[64];
-		char *buf = tmp;
-		size_t buf_size = sizeof(tmp);
+		struct seq_buf s;
 		int period_start = period * bits_per_period;
 		int period_end = period_start + bits_per_period;
 		int start = 0;
@@ -426,6 +391,8 @@ static void pmap_print(unsigned long *map, int bits_per_period,
 		bool printed = false;
 		int i;
 
+		seq_buf_init(&s, tmp, sizeof(tmp));
+
 		for (i = period_start; i < period_end + 1; i++) {
 			/* Handle case when ith bit is set */
 			if (i < period_end &&
@@ -442,17 +409,19 @@ static void pmap_print(unsigned long *map, int bits_per_period,
 				continue;
 
 			if (!printed)
-				cat_printf(&buf, &buf_size, "%s %d: ",
-					   period_name, period);
+				seq_buf_printf(&s, "%s %d: ", period_name,
+					       period);
 			else
-				cat_printf(&buf, &buf_size, ", ");
+				seq_buf_printf(&s, ", ");
 			printed = true;
 
-			cat_printf(&buf, &buf_size, "%d %s -%3d %s", start,
-				   units, start + count - 1, units);
+			seq_buf_printf(&s, "%d %s -%3d %s", start, units,
+				       start + count - 1, units);
 			count = 0;
 		}
 
+		seq_buf_terminate(&s);
+
 		if (printed)
 			print_fn(tmp, print_data);
 	}
-- 
2.34.1



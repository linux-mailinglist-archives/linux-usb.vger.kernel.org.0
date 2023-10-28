Return-Path: <linux-usb+bounces-2313-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8D87DA68B
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 12:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EE5F1C20D5F
	for <lists+linux-usb@lfdr.de>; Sat, 28 Oct 2023 10:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709C4DF51;
	Sat, 28 Oct 2023 10:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="d0lOpQhB"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAF69471
	for <linux-usb@vger.kernel.org>; Sat, 28 Oct 2023 10:41:23 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924A1F3
	for <linux-usb@vger.kernel.org>; Sat, 28 Oct 2023 03:41:20 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id wgkmq33su5fs2wgkmqHoZ5; Sat, 28 Oct 2023 12:41:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698489678;
	bh=Hvnsw6tiEqX0nnVX9A8IeBCG+0I6cphWZAOIfJoabhA=;
	h=From:To:Cc:Subject:Date;
	b=d0lOpQhBtwL2y5sCjIptt+P+dH2W6OPXgmaBfxhjpgB8MqUnVnn/KWR9ueM0kfAma
	 ZYdNUuU4iApkxoAgDvQE9DDP3T+MITcL0K8W8GOdSGU8Iz2ibQEpc4ukqqRddj2CPU
	 6CvrakjWoA44h+vaYBzI1Scyzvb0Qos5Iq721fJ5hQ7Q6u8gne0uHcVVrxydHKXk1k
	 DIpjeCF08FrIokT4r1lY8t+NEDWJG1looGecBU/Mel8oQR2uR8xSlcros1L5IWt3Di
	 63J7VtM6hp1q3Sc/JCqZXowF2JZsOgggNGL0hYHNfVL3eBc+R7LkGnFVvnn38awb2D
	 BxAkdtkcl1Tug==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 28 Oct 2023 12:41:18 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc2: Use seq_buf instead of hand writing it
Date: Sat, 28 Oct 2023 12:41:02 +0200
Message-Id: <4c8b71efe4fe05ed0cc37f33ef774746d4d55299.1698489641.git.christophe.jaillet@wanadoo.fr>
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
---
 drivers/usb/dwc2/hcd_queue.c | 53 ++++++++----------------------------
 1 file changed, 11 insertions(+), 42 deletions(-)

diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index 0d4495c6b9f7..66fb74a70bdd 100644
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
+		struct seq_buf buf;
 		int period_start = period * bits_per_period;
 		int period_end = period_start + bits_per_period;
 		int start = 0;
@@ -426,6 +391,8 @@ static void pmap_print(unsigned long *map, int bits_per_period,
 		bool printed = false;
 		int i;
 
+		seq_buf_init((&s, tmp, sizeof(tmp));
+
 		for (i = period_start; i < period_end + 1; i++) {
 			/* Handle case when ith bit is set */
 			if (i < period_end &&
@@ -442,17 +409,19 @@ static void pmap_print(unsigned long *map, int bits_per_period,
 				continue;
 
 			if (!printed)
-				cat_printf(&buf, &buf_size, "%s %d: ",
-					   period_name, period);
+				seq_buf_printf(&buf, "%s %d: ", period_name,
+					       period);
 			else
-				cat_printf(&buf, &buf_size, ", ");
+				seq_buf_printf(&buf, ", ");
 			printed = true;
 
-			cat_printf(&buf, &buf_size, "%d %s -%3d %s", start,
-				   units, start + count - 1, units);
+			seq_buf_printf(&buf, "%d %s -%3d %s", start, units,
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



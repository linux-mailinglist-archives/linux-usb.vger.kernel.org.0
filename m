Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32611631CCA
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 10:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbiKUJZm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 04:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiKUJZl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 04:25:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D10527DCF
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 01:25:41 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24702E61;
        Mon, 21 Nov 2022 10:25:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669022736;
        bh=kP37ODIPxKzC6npoFrbinG945sO2Q0cQ6Wmkj6XcDxA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RR9737Zb+hecxVDjAEPB0zS/2YWNDAqs9rwI97UTApU/tiZeOXDx+LtmxQwxntocX
         f9rgiDK+uP6AgGt0s1MSmmudNg+9r2uogAwbWAqaADe4edKseR/yUheCPkETHRVuPa
         VL0tn1SNkXrzGdo+RVrzOgiSNhoT9fbE9fIfxPjU=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 2/9] usb: gadget: uvc: Generalise helper functions for reuse
Date:   Mon, 21 Nov 2022 09:25:10 +0000
Message-Id: <20221121092517.225242-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221121092517.225242-1-dan.scally@ideasonboard.com>
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

the __uvcg_*frm_intrv() helper functions can be helpful when adding
support for similar attributes. Generalise the function names and
move them higher in the file for better coverage. We also need copies
of the functions for different sized targets, so refactor them to
a macro with configurable bit size.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:

	- none

 drivers/usb/gadget/function/uvc_configfs.c | 109 +++++++++++----------
 1 file changed, 56 insertions(+), 53 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index af4258120f9a..d542dd251633 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -594,6 +594,60 @@ static const struct uvcg_config_group_type uvcg_terminal_grp_type = {
 	},
 };
 
+static inline int __uvcg_count_item_entries(char *buf, void *priv)
+{
+	++*((int *)priv);
+	return 0;
+}
+
+#define UVCG_ITEM_ENTRY_FUNCS(bits)					\
+static inline int __uvcg_fill_item_entries_u##bits(char *buf, void *priv)\
+{									\
+	u##bits num, **interv;						\
+	int ret;							\
+									\
+	ret = kstrtou##bits(buf, 0, &num);				\
+	if (ret)							\
+		return ret;						\
+									\
+	interv = priv;							\
+	**interv = num;							\
+	++*interv;							\
+									\
+	return 0;							\
+}									\
+									\
+static int __uvcg_iter_item_entries_u##bits(const char *page, size_t len,\
+				 int (*fun)(char *, void *), void *priv)\
+{									\
+	/* sign, base 2 representation, newline, terminator */		\
+	char buf[1 + sizeof(u##bits) * 8 + 1 + 1];			\
+	const char *pg = page;						\
+	int i, ret;							\
+									\
+	if (!fun)							\
+		return -EINVAL;						\
+									\
+	while (pg - page < len) {					\
+		i = 0;							\
+		while (i < sizeof(buf) && (pg - page < len) &&		\
+				*pg != '\0' && *pg != '\n')		\
+			buf[i++] = *pg++;				\
+		if (i == sizeof(buf))					\
+			return -EINVAL;					\
+		while ((pg - page < len) && (*pg == '\0' || *pg == '\n'))\
+			++pg;						\
+		buf[i] = '\0';						\
+		ret = fun(buf, priv);					\
+		if (ret)						\
+			return ret;					\
+	}								\
+									\
+	return 0;							\
+}
+
+UVCG_ITEM_ENTRY_FUNCS(32)
+
 /* -----------------------------------------------------------------------------
  * control/class/{fs|ss}
  */
@@ -1186,57 +1240,6 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
 	return result;
 }
 
-static inline int __uvcg_count_frm_intrv(char *buf, void *priv)
-{
-	++*((int *)priv);
-	return 0;
-}
-
-static inline int __uvcg_fill_frm_intrv(char *buf, void *priv)
-{
-	u32 num, **interv;
-	int ret;
-
-	ret = kstrtou32(buf, 0, &num);
-	if (ret)
-		return ret;
-
-	interv = priv;
-	**interv = num;
-	++*interv;
-
-	return 0;
-}
-
-static int __uvcg_iter_frm_intrv(const char *page, size_t len,
-				 int (*fun)(char *, void *), void *priv)
-{
-	/* sign, base 2 representation, newline, terminator */
-	char buf[1 + sizeof(u32) * 8 + 1 + 1];
-	const char *pg = page;
-	int i, ret;
-
-	if (!fun)
-		return -EINVAL;
-
-	while (pg - page < len) {
-		i = 0;
-		while (i < sizeof(buf) && (pg - page < len) &&
-				*pg != '\0' && *pg != '\n')
-			buf[i++] = *pg++;
-		if (i == sizeof(buf))
-			return -EINVAL;
-		while ((pg - page < len) && (*pg == '\0' || *pg == '\n'))
-			++pg;
-		buf[i] = '\0';
-		ret = fun(buf, priv);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 						  const char *page, size_t len)
 {
@@ -1260,7 +1263,7 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 		goto end;
 	}
 
-	ret = __uvcg_iter_frm_intrv(page, len, __uvcg_count_frm_intrv, &n);
+	ret = __uvcg_iter_item_entries_u32(page, len, __uvcg_count_item_entries, &n);
 	if (ret)
 		goto end;
 
@@ -1270,7 +1273,7 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 		goto end;
 	}
 
-	ret = __uvcg_iter_frm_intrv(page, len, __uvcg_fill_frm_intrv, &tmp);
+	ret = __uvcg_iter_item_entries_u32(page, len, __uvcg_fill_item_entries_u32, &tmp);
 	if (ret) {
 		kfree(frm_intrv);
 		goto end;
-- 
2.34.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 377456165E6
	for <lists+linux-usb@lfdr.de>; Wed,  2 Nov 2022 16:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiKBPSd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Nov 2022 11:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiKBPS3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Nov 2022 11:18:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626DFB3A
        for <linux-usb@vger.kernel.org>; Wed,  2 Nov 2022 08:18:21 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A90721585;
        Wed,  2 Nov 2022 16:18:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667402297;
        bh=mN7+cVRuDdvavsJinV9RhdXd3rImHcfeUy6GsopMSJg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LB71I9qEMdb5hGAOom02p2YzGxRoQOzEyuqaFhY+iWsI9756H0+B6hdeHwpuEl26t
         Tx2mmwLGedhJ5Adr9H8YsnrIdlzeNRuIOAchUWNwEWP2ncD4vaB93wPm6KQxY/Bntb
         RXntmctCz2Ewhd7Po+gd48OmDo3Niu8rStqpbxrE=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 2/4] usb: gadget: uvc: Generalise helper functions for reuse
Date:   Wed,  2 Nov 2022 15:17:53 +0000
Message-Id: <20221102151755.1022841-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102151755.1022841-1-dan.scally@ideasonboard.com>
References: <20221102151755.1022841-1-dan.scally@ideasonboard.com>
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
 drivers/usb/gadget/function/uvc_configfs.c | 109 +++++++++++----------
 1 file changed, 56 insertions(+), 53 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 832565730d22..9bacd8573a46 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -596,6 +596,60 @@ static const struct uvcg_config_group_type uvcg_terminal_grp_type = {
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
@@ -1188,57 +1242,6 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
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
@@ -1262,7 +1265,7 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 		goto end;
 	}
 
-	ret = __uvcg_iter_frm_intrv(page, len, __uvcg_count_frm_intrv, &n);
+	ret = __uvcg_iter_item_entries_u32(page, len, __uvcg_count_item_entries, &n);
 	if (ret)
 		goto end;
 
@@ -1272,7 +1275,7 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 		goto end;
 	}
 
-	ret = __uvcg_iter_frm_intrv(page, len, __uvcg_fill_frm_intrv, &tmp);
+	ret = __uvcg_iter_item_entries_u32(page, len, __uvcg_fill_item_entries_u32, &tmp);
 	if (ret) {
 		kfree(frm_intrv);
 		goto end;
-- 
2.34.1


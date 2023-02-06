Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53DDA68C301
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 17:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbjBFQUF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 11:20:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbjBFQTf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 11:19:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2C34219
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 08:19:06 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 292A3891;
        Mon,  6 Feb 2023 17:18:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675700304;
        bh=cu3RvyO6FC79Mu4QOzvet0ZhzlON6Bvuec3Nmx3V3fE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=daf02BiAYO7MBDRSg3IQxSn5BMXxI8gKiqi9v+Vym/AGjlAISyR36w62aWASV44Xh
         qoqG5Bp0qMC8OpntM2DT5MXX0EhwSVEICiSS+yskx5wgTcB8t+wvEXLeNFXnMl9eTC
         Fp0vreHvC8jwp2JeLi3ioqVi5WublNJ7mVhsOHzI=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v5 02/11] usb: gadget: uvc: Generalise helper functions for reuse
Date:   Mon,  6 Feb 2023 16:17:53 +0000
Message-Id: <20230206161802.892954-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206161802.892954-1-dan.scally@ideasonboard.com>
References: <20230206161802.892954-1-dan.scally@ideasonboard.com>
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

The __uvcg_*frm_intrv() helper functions can be helpful when adding
support for similar attributes. Generalise the functions and
move them higher in the file for better coverage.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v5:

	- None

Changes in v4:

	- None

Changes in v3 (Laurent):

	- Spelling
	- Renamed the "interv" variable to "values"
	- Switched to functions taking a size argument rather than a macro that
	duplicated the implementation.
	
Changes in v2:

	- none

 drivers/usb/gadget/function/uvc_configfs.c | 120 ++++++++++++---------
 1 file changed, 67 insertions(+), 53 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index b52aae924d66..b32ecbdfd88d 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -47,6 +47,71 @@ static int uvcg_config_compare_u32(const void *l, const void *r)
 	return li < ri ? -1 : li == ri ? 0 : 1;
 }
 
+static inline int __uvcg_count_item_entries(char *buf, void *priv, unsigned int size)
+{
+	++*((int *)priv);
+	return 0;
+}
+
+static inline int __uvcg_fill_item_entries(char *buf, void *priv, unsigned int size)
+{
+	unsigned int num;
+	u8 **values;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &num);
+	if (ret)
+		return ret;
+
+	if (num != (num & GENMASK((size * 8) - 1, 0)))
+		return -ERANGE;
+
+	values = priv;
+	memcpy(*values, &num, size);
+	*values += size;
+
+	return 0;
+}
+
+static int __uvcg_iter_item_entries(const char *page, size_t len,
+				    int (*fun)(char *, void *, unsigned int),
+				    void *priv, unsigned int size)
+{
+	/* sign, base 2 representation, newline, terminator */
+	unsigned int bufsize = 1 + size * 8 + 1 + 1;
+	const char *pg = page;
+	int i, ret = 0;
+	char *buf;
+
+	if (!fun)
+		return -EINVAL;
+
+	buf = kzalloc(bufsize, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	while (pg - page < len) {
+		i = 0;
+		while (i < sizeof(buf) && (pg - page < len) &&
+		       *pg != '\0' && *pg != '\n')
+			buf[i++] = *pg++;
+		if (i == sizeof(buf)) {
+			ret = -EINVAL;
+			goto out_free_buf;
+		}
+		while ((pg - page < len) && (*pg == '\0' || *pg == '\n'))
+			++pg;
+		buf[i] = '\0';
+		ret = fun(buf, priv, size);
+		if (ret)
+			goto out_free_buf;
+	}
+
+out_free_buf:
+	kfree(buf);
+	return ret;
+}
+
 struct uvcg_config_group_type {
 	struct config_item_type type;
 	const char *name;
@@ -1336,57 +1401,6 @@ static ssize_t uvcg_frame_dw_frame_interval_show(struct config_item *item,
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
@@ -1410,7 +1424,7 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 		goto end;
 	}
 
-	ret = __uvcg_iter_frm_intrv(page, len, __uvcg_count_frm_intrv, &n);
+	ret = __uvcg_iter_item_entries(page, len, __uvcg_count_item_entries, &n, sizeof(u32));
 	if (ret)
 		goto end;
 
@@ -1420,7 +1434,7 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 		goto end;
 	}
 
-	ret = __uvcg_iter_frm_intrv(page, len, __uvcg_fill_frm_intrv, &tmp);
+	ret = __uvcg_iter_item_entries(page, len, __uvcg_fill_item_entries, &tmp, sizeof(u32));
 	if (ret) {
 		kfree(frm_intrv);
 		goto end;
-- 
2.34.1


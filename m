Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64525681322
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 15:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237666AbjA3O2h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 09:28:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237659AbjA3O2V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 09:28:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726CE4390A
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 06:26:56 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F8088CC;
        Mon, 30 Jan 2023 15:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675088814;
        bh=zBkGrwRDHWHywkJHoP6K+Hj7LmjV58MAq+PA/1BulJo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K2vb27eLUZxGDsYELJyUAAf8GoY+WDeXDWCw5Y1yj/Ex05Dw31la8GiXML1mTa2gr
         LilhKuQps0q5bTBYGiJoUuPKCMVV1cbda0BMdOEGxG7s19tTyE8g7wRrORAAEgAHSI
         BOZNbormw8sQVFwEYj6+RLt71ljSiBkMdceaEzmI=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 1/7] usb: gadget: usb: Remove "default" from color matching attributes
Date:   Mon, 30 Jan 2023 14:26:33 +0000
Message-Id: <20230130142639.217885-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130142639.217885-1-dan.scally@ideasonboard.com>
References: <20230130142639.217885-1-dan.scally@ideasonboard.com>
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

Color matching attributes in the configfs for UVC are named with the
phrase "default". The implication of that is that they will only be
used _with_ the default color matching descriptor, and that will
shortly no longer be the case.

Remove the "default" from the color matching descriptor attribute
variables.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- None

Changes in v2:

	- None

 drivers/usb/gadget/function/uvc_configfs.c | 29 +++++++++++-----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 76cb60d13049..e28becd435bf 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1783,8 +1783,8 @@ static const struct uvcg_config_group_type uvcg_mjpeg_grp_type = {
  * streaming/color_matching/default
  */
 
-#define UVCG_DEFAULT_COLOR_MATCHING_ATTR(cname, aname, bits)		\
-static ssize_t uvcg_default_color_matching_##cname##_show(		\
+#define UVCG_COLOR_MATCHING_ATTR(cname, aname, bits)			\
+static ssize_t uvcg_color_matching_##cname##_show(			\
 	struct config_item *item, char *page)				\
 {									\
 	struct config_group *group = to_config_group(item);		\
@@ -1808,26 +1808,25 @@ static ssize_t uvcg_default_color_matching_##cname##_show(		\
 	return result;							\
 }									\
 									\
-UVC_ATTR_RO(uvcg_default_color_matching_, cname, aname)
+UVC_ATTR_RO(uvcg_color_matching_, cname, aname)
 
-UVCG_DEFAULT_COLOR_MATCHING_ATTR(b_color_primaries, bColorPrimaries, 8);
-UVCG_DEFAULT_COLOR_MATCHING_ATTR(b_transfer_characteristics,
-				 bTransferCharacteristics, 8);
-UVCG_DEFAULT_COLOR_MATCHING_ATTR(b_matrix_coefficients, bMatrixCoefficients, 8);
+UVCG_COLOR_MATCHING_ATTR(b_color_primaries, bColorPrimaries, 8);
+UVCG_COLOR_MATCHING_ATTR(b_transfer_characteristics, bTransferCharacteristics, 8);
+UVCG_COLOR_MATCHING_ATTR(b_matrix_coefficients, bMatrixCoefficients, 8);
 
-#undef UVCG_DEFAULT_COLOR_MATCHING_ATTR
+#undef UVCG_COLOR_MATCHING_ATTR
 
-static struct configfs_attribute *uvcg_default_color_matching_attrs[] = {
-	&uvcg_default_color_matching_attr_b_color_primaries,
-	&uvcg_default_color_matching_attr_b_transfer_characteristics,
-	&uvcg_default_color_matching_attr_b_matrix_coefficients,
+static struct configfs_attribute *uvcg_color_matching_attrs[] = {
+	&uvcg_color_matching_attr_b_color_primaries,
+	&uvcg_color_matching_attr_b_transfer_characteristics,
+	&uvcg_color_matching_attr_b_matrix_coefficients,
 	NULL,
 };
 
-static const struct uvcg_config_group_type uvcg_default_color_matching_type = {
+static const struct uvcg_config_group_type uvcg_color_matching_type = {
 	.type = {
 		.ct_item_ops	= &uvcg_config_item_ops,
-		.ct_attrs	= uvcg_default_color_matching_attrs,
+		.ct_attrs	= uvcg_color_matching_attrs,
 		.ct_owner	= THIS_MODULE,
 	},
 	.name = "default",
@@ -1844,7 +1843,7 @@ static const struct uvcg_config_group_type uvcg_color_matching_grp_type = {
 	},
 	.name = "color_matching",
 	.children = (const struct uvcg_config_group_type*[]) {
-		&uvcg_default_color_matching_type,
+		&uvcg_color_matching_type,
 		NULL,
 	},
 };
-- 
2.34.1


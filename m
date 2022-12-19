Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8102D650DAE
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 15:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbiLSOn5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 09:43:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbiLSOni (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 09:43:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF1C6369
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 06:43:35 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4CCECDB;
        Mon, 19 Dec 2022 15:43:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671461013;
        bh=AynpK64Ts8VOlHWeG4+2lPJPJ+TYXo2ZEwztYbaBOO8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l+H0ehNut3REqp0Kq5Ds+fADew9ldwrQj8jTWBiJi2bH80/LxLBMjADAocie+oweU
         3WVLAdSNYWeyKqaKBtvvdIAji7eHMwH5bNyDsKoqw70iRz/bGpv3JEe9Zjumj9k+L4
         BhNSiTBzmGukbhPPWmFP4rOvL0bIA1N4f5FyYiwY=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 1/7] usb: gadget: usb: Remove "default" from color matching attributes
Date:   Mon, 19 Dec 2022 14:43:10 +0000
Message-Id: <20221219144316.757680-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219144316.757680-1-dan.scally@ideasonboard.com>
References: <20221219144316.757680-1-dan.scally@ideasonboard.com>
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


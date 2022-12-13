Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8A464B143
	for <lists+linux-usb@lfdr.de>; Tue, 13 Dec 2022 09:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234605AbiLMIhx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Dec 2022 03:37:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234581AbiLMIhu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Dec 2022 03:37:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF8C1836D
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 00:37:48 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 416BA7C5;
        Tue, 13 Dec 2022 09:37:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670920666;
        bh=HaxRhGqdO03wPF52CT8egCnnulTnxVYlwWuCDh4n6M0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B5d1RaC68eIVb54sejEtPeRvia+Vkd1SeStwgWKkclMu1+kYWSLlLypxl3Yka+CJy
         CaC05nOHfjoifIUxtYEWOecQy2gpzQiaeoDz2weQuCPpVhAmOHv6vF5PRB3/IbZSUX
         s29bo5Jlt7MjpZVKWIEga/pjSxZvbh7GjC23TvcI=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 1/6] usb: gadget: usb: Remove "default" from color matching attributes
Date:   Tue, 13 Dec 2022 08:37:31 +0000
Message-Id: <20221213083736.2284536-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
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

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 29 +++++++++++-----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 4303a3283ba0..26d092790f12 100644
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


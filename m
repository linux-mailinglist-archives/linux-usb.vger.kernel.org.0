Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A060650DAB
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 15:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbiLSOoC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 09:44:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232413AbiLSOnn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 09:43:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D4E62C5
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 06:43:38 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8431E127D;
        Mon, 19 Dec 2022 15:43:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671461013;
        bh=1GzGPRcC9KPiI8Wl/Aq6sGgnr5WlT95F/+CF8/BZyaQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DUHziih0GO74JOY7q8SaVer3jfALP8wLODoppLgA8Tfv4bf7LARvK/0iUoC/EDkT+
         4vYAugUZQ7yW0D2USm+AzhDYA8AquPfMFfaFMl695zrW+32bqCe6tudgjnGLn6dJdt
         4UGZyHn+v+TINgQ4gidKivo2qJ0ZXXOp8BO6TOlE=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 2/7] usb: uvc: Enumerate valid values for color matching
Date:   Mon, 19 Dec 2022 14:43:11 +0000
Message-Id: <20221219144316.757680-3-dan.scally@ideasonboard.com>
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

The color matching descriptors defined in the UVC 1.5 Specification
contain 3 fields with discrete numeric values representing particular
settings. Enumerate those values so that later code setting them can
be more readable.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:

  - New patch

 include/uapi/linux/usb/video.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
index 6e8e572c2980..08606a52e1e2 100644
--- a/include/uapi/linux/usb/video.h
+++ b/include/uapi/linux/usb/video.h
@@ -179,6 +179,36 @@
 #define UVC_CONTROL_CAP_AUTOUPDATE			(1 << 3)
 #define UVC_CONTROL_CAP_ASYNCHRONOUS			(1 << 4)
 
+/* ref Color Matching Descriptor Values */
+enum uvc_color_primaries_values {
+	UVC_COLOR_PRIMARIES_UNSPECIFIED,
+	UVC_COLOR_PRIMARIES_BT_709_SRGB,
+	UVC_COLOR_PRIMARIES_BT_470_2_M,
+	UVC_COLOR_PRIMARIES_BT_470_2_B_G,
+	UVC_COLOR_PRIMARIES_SMPTE_170M,
+	UVC_COLOR_PRIMARIES_SMPTE_240M,
+};
+
+enum uvc_transfer_characteristics_values {
+	UVC_TRANSFER_CHARACTERISTICS_UNSPECIFIED,
+	UVC_TRANSFER_CHARACTERISTICS_BT_709,
+	UVC_TRANSFER_CHARACTERISTICS_BT_470_2_M,
+	UVC_TRANSFER_CHARACTERISTICS_BT_470_2_B_G,
+	UVC_TRANSFER_CHARACTERISTICS_SMPTE_170M,
+	UVC_TRANSFER_CHARACTERISTICS_SMPTE_240M,
+	UVC_TRANSFER_CHARACTERISTICS_LINEAR,
+	UVC_TRANSFER_CHARACTERISTICS_SRGB,
+};
+
+enum uvc_matrix_coefficients {
+	UVC_MATRIX_COEFFICIENTS_UNSPECIFIED,
+	UVC_MATRIX_COEFFICIENTS_BT_709,
+	UVC_MATRIX_COEFFICIENTS_FCC,
+	UVC_MATRIX_COEFFICIENTS_BT_470_2_B_G,
+	UVC_MATRIX_COEFFICIENTS_SMPTE_170M,
+	UVC_MATRIX_COEFFICIENTS_SMPTE_240M,
+};
+
 /* ------------------------------------------------------------------------
  * UVC structures
  */
-- 
2.34.1


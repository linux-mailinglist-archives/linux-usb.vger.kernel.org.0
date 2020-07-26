Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B368822DB2F
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 03:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgGZBgI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 21:36:08 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50668 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726870AbgGZBgI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 21:36:08 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1FD2D40141;
        Sun, 26 Jul 2020 01:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595727367; bh=In4vjXQYh/rtDxeA2nUouc6MthDzwKvSAUN2HxNn9iI=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=JgJm4Bc7HJHxAJZYsjQyzC355Ku3nPeXPhCR+kSjeG+LWGMqjbzsAC59DU0Wow7ym
         MiHo2C3UyfiC96RsvFCxxBokXQLLIPs3MwadIz4tAxn8FPJLLTzgdCO4G19m+qGe8N
         Fkk4wU1v4BI3BqNcG2Z60521z8y3WdstmPhZEbHaThLw87szUIiYOtNHe3bQCne6q1
         r0c2uK7+syk6ltWEdUJJN2aQLUkoGJPY9HlW3Ku6zWsW4u4Ri21hUckP8ndSyEcbnR
         WowHoSAY2bUfmm3Bv0RTquTJlqJxuS58io+frJatRyq/Dr1ka6rk2CcU9C+oNdxuL8
         8bBnDo7ul83VA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 07522A006F;
        Sun, 26 Jul 2020 01:36:06 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sat, 25 Jul 2020 18:36:05 -0700
Date:   Sat, 25 Jul 2020 18:36:05 -0700
Message-Id: <dd116fb1325d369c8c6f3c30ae6f785827fa0a22.1595727196.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595727196.git.thinhn@synopsys.com>
References: <cover.1595727196.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v4 02/12] usb: gadget: composite: Avoid using magic numbers
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Magic numbers are difficult to read. Use macros for super-speed-plus BOS
descriptor attributes in the composite driver. They're self-documented.
So there's no need to provide comments as we did previously for the
magic numbers.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Changes in v4:
 - None
 Changes in v3:
 - None
 Changes in v2:
 - None

 drivers/usb/gadget/composite.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 05b176c82cc5..0aa4cb49aa53 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/utsname.h>
+#include <linux/bitfield.h>
 
 #include <linux/usb/composite.h>
 #include <linux/usb/otg.h>
@@ -743,32 +744,30 @@ static int bos_desc(struct usb_composite_dev *cdev)
 		ssp_cap->bReserved = 0;
 		ssp_cap->wReserved = 0;
 
-		/* SSAC = 1 (2 attributes) */
-		ssp_cap->bmAttributes = cpu_to_le32(1);
+		ssp_cap->bmAttributes =
+			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_ATTRIBS, 1) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_IDS, 0));
 
-		/* Min RX/TX Lane Count = 1 */
 		ssp_cap->wFunctionalitySupport =
-			cpu_to_le16((1 << 8) | (1 << 12));
+			cpu_to_le16(FIELD_PREP(USB_SSP_MIN_SUBLINK_SPEED_ATTRIBUTE_ID, 0) |
+				    FIELD_PREP(USB_SSP_MIN_RX_LANE_COUNT, 1) |
+				    FIELD_PREP(USB_SSP_MIN_TX_LANE_COUNT, 1));
 
-		/*
-		 * bmSublinkSpeedAttr[0]:
-		 *   ST  = Symmetric, RX
-		 *   LSE =  3 (Gbps)
-		 *   LP  =  1 (SuperSpeedPlus)
-		 *   LSM = 10 (10 Gbps)
-		 */
 		ssp_cap->bmSublinkSpeedAttr[0] =
-			cpu_to_le32((3 << 4) | (1 << 14) | (0xa << 16));
-		/*
-		 * bmSublinkSpeedAttr[1] =
-		 *   ST  = Symmetric, TX
-		 *   LSE =  3 (Gbps)
-		 *   LP  =  1 (SuperSpeedPlus)
-		 *   LSM = 10 (10 Gbps)
-		 */
+			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, 0) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE, USB_LSE_GBPS) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
+					       USB_ST_SYMMETRIC_RX) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP, USB_LP_SSP) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
+
 		ssp_cap->bmSublinkSpeedAttr[1] =
-			cpu_to_le32((3 << 4) | (1 << 14) |
-				    (0xa << 16) | (1 << 7));
+			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, 0) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE, USB_LSE_GBPS) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
+					       USB_ST_SYMMETRIC_TX) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP, USB_LP_SSP) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
 	}
 
 	return le16_to_cpu(bos->wTotalLength);
-- 
2.11.0


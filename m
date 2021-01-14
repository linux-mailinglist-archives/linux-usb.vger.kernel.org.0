Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B092F58B5
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 04:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbhANCx6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 21:53:58 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:42054 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726483AbhANCx4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 21:53:56 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EEF51401AB;
        Thu, 14 Jan 2021 02:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610592776; bh=6CBDdlrv+A6Ghz+/mqsfBowiJ/NGWn8TeU4qmIgOrsM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=k2qcgG6mJegDsB/AaPRleBbpyT1sbPH5hEuOeh84Gf3hUcuSEzf+hYcMeixC4GwOl
         a+RzL1peyyUGWYpznLsMljx71aKla3iicgz/pSsGaMEiDuMlq2vdXVNjr0eQcNqZiS
         b2S7OKCn01vvpmLVqEUAH6kpQfFzR1s096WJX/FDG//52lX5Z85z43j077Ha/TrrvM
         tuLfg+yo2a1oAYt+NoUMVNVjWmzbdLsN4MsLqn+5WwjI11rJLDFCMcfSPwiFAEpVnT
         04EOuw4xAvnra891LwFgxdhFP7GQyGR1V/HU5NBr++V0DIefmW/qMVupJ7danFnBJK
         5/MQweRF1WPmg==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 82ED1A0070;
        Thu, 14 Jan 2021 02:52:54 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 13 Jan 2021 18:52:54 -0800
Date:   Wed, 13 Jan 2021 18:52:54 -0800
Message-Id: <6f74d446aa164f66fbe4161e28547e28851f6a02.1610592135.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v6 02/11] usb: gadget: composite: Use SSP sublink speed macros
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use SuperSpeed Plus sublink speed macros to fill the BOS descriptor
sublink speed attributes in the composite driver. They're
self-documented so we can remove some of the comments, and this helps
with readability by removing the magic numbers.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v6:
- Rebase on Greg's usb-testing branch
- Use the updated macros
- Update commit message
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- None
Changes in v3:
- None
Changes in v2:
- None

 drivers/usb/gadget/composite.c | 45 ++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 9a7cc08d6593..bc17302a9e85 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/utsname.h>
+#include <linux/bitfield.h>
 
 #include <linux/usb/composite.h>
 #include <linux/usb/otg.h>
@@ -749,32 +750,34 @@ static int bos_desc(struct usb_composite_dev *cdev)
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
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE,
+					       USB_SSP_SUBLINK_SPEED_LSE_GBPS) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
+					       USB_SSP_SUBLINK_SPEED_ST_SYM_RX) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP,
+					       USB_SSP_SUBLINK_SPEED_LP_SSP) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
+
 		ssp_cap->bmSublinkSpeedAttr[1] =
-			cpu_to_le32((3 << 4) | (1 << 14) |
-				    (0xa << 16) | (1 << 7));
+			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, 0) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE,
+					       USB_SSP_SUBLINK_SPEED_LSE_GBPS) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
+					       USB_SSP_SUBLINK_SPEED_ST_SYM_TX) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP,
+					       USB_SSP_SUBLINK_SPEED_LP_SSP) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
 	}
 
 	return le16_to_cpu(bos->wTotalLength);
-- 
2.28.0


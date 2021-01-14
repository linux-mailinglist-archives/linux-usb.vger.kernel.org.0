Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00B7A2F58B8
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 04:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbhANCyS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 21:54:18 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:54726 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726266AbhANCyQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 21:54:16 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 49B8CC00EC;
        Thu, 14 Jan 2021 02:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610592795; bh=B9vUG7TcqjYb+YoXx63KO2ohR6T7y5FbM/ETBsWjuH8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=HYymyQVNf9HDXZujOntOVRj6QN8H6NOpetDaNhNjI517vOJ0xkFhf75GkU36ku/zO
         9yXO31e9xHG5+pA6CQcbQRjTxbEt1YKTDfcBhTX9j2dKkSXSoqjAwyAjDexzF1r0GI
         jWIeTndJWfIG/cHxEx0reGcJHb9SjMfYAnIXzoI1/QxtSqz85ZK6uWGkHn6+2T9pEH
         ScVj2M+4xMJ3J1sc95D8bSt5ONozaE18ThEDkDE9hiWsiVT+u6XitIE8RpWl5Et+s4
         hvWHHj8zLBPfaAg9DKtVOLoQAm1QN5sUSTf3j0tHslUp+jMPTfoYRM2ZdbjMVW8J4A
         hrveXXnmtLxJg==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 1BF97A009A;
        Thu, 14 Jan 2021 02:53:14 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 13 Jan 2021 18:53:14 -0800
Date:   Wed, 13 Jan 2021 18:53:14 -0800
Message-Id: <eb0386fdd5d87a858281e8006a72723d3732240f.1610592135.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v6 05/11] usb: gadget: composite: Report various SSP sublink speeds
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If a gadget supports SuperSpeed Plus, then it may operate in different
sublink speeds. For example, if the gadget supports SuperSpeed Plus
gen2x2, then it can support 2 sublink speeds gen1 and gen2. Inform the
host of these speeds in the BOS descriptor.

Use 1 SSID if the gadget supports up to gen2x1, or not specified:
- SSID 0 for symmetric RX/TX sublink speed of 10 Gbps.

Use 1 SSID if the gadget supports up to gen1x2:
- SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.

Use 2 SSIDs if the gadget supports up to gen2x2:
- SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.
- SSID 1 for symmetric RX/TX sublink speed of 10 Gbps.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v6:
- Rebase on Greg's usb-testing branch
- Use gadget->max_ssp_rate instead of all the sublink attribute fields (now
  removed) in usb_gadget
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

 drivers/usb/gadget/composite.c | 80 +++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index bc17302a9e85..72a9797dbbae 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -735,49 +735,77 @@ static int bos_desc(struct usb_composite_dev *cdev)
 	/* The SuperSpeedPlus USB Device Capability descriptor */
 	if (gadget_is_superspeed_plus(cdev->gadget)) {
 		struct usb_ssp_cap_descriptor *ssp_cap;
+		u8 ssac = 1;
+		u8 ssic;
+		int i;
 
-		ssp_cap = cdev->req->buf + le16_to_cpu(bos->wTotalLength);
-		bos->bNumDeviceCaps++;
+		if (cdev->gadget->max_ssp_rate == USB_SSP_GEN_2x2)
+			ssac = 3;
 
 		/*
-		 * Report typical values.
+		 * Paired RX and TX sublink speed attributes share
+		 * the same SSID.
 		 */
+		ssic = (ssac + 1) / 2 - 1;
 
-		le16_add_cpu(&bos->wTotalLength, USB_DT_USB_SSP_CAP_SIZE(1));
-		ssp_cap->bLength = USB_DT_USB_SSP_CAP_SIZE(1);
+		ssp_cap = cdev->req->buf + le16_to_cpu(bos->wTotalLength);
+		bos->bNumDeviceCaps++;
+
+		le16_add_cpu(&bos->wTotalLength, USB_DT_USB_SSP_CAP_SIZE(ssac));
+		ssp_cap->bLength = USB_DT_USB_SSP_CAP_SIZE(ssac);
 		ssp_cap->bDescriptorType = USB_DT_DEVICE_CAPABILITY;
 		ssp_cap->bDevCapabilityType = USB_SSP_CAP_TYPE;
 		ssp_cap->bReserved = 0;
 		ssp_cap->wReserved = 0;
 
 		ssp_cap->bmAttributes =
-			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_ATTRIBS, 1) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_IDS, 0));
+			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_ATTRIBS, ssac) |
+				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_IDS, ssic));
 
 		ssp_cap->wFunctionalitySupport =
 			cpu_to_le16(FIELD_PREP(USB_SSP_MIN_SUBLINK_SPEED_ATTRIBUTE_ID, 0) |
 				    FIELD_PREP(USB_SSP_MIN_RX_LANE_COUNT, 1) |
 				    FIELD_PREP(USB_SSP_MIN_TX_LANE_COUNT, 1));
 
-		ssp_cap->bmSublinkSpeedAttr[0] =
-			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, 0) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE,
-					       USB_SSP_SUBLINK_SPEED_LSE_GBPS) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
-					       USB_SSP_SUBLINK_SPEED_ST_SYM_RX) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP,
-					       USB_SSP_SUBLINK_SPEED_LP_SSP) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
-
-		ssp_cap->bmSublinkSpeedAttr[1] =
-			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, 0) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE,
-					       USB_SSP_SUBLINK_SPEED_LSE_GBPS) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
-					       USB_SSP_SUBLINK_SPEED_ST_SYM_TX) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP,
-					       USB_SSP_SUBLINK_SPEED_LP_SSP) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
+		/*
+		 * Use 1 SSID if the gadget supports up to gen2x1 or not
+		 * specified:
+		 * - SSID 0 for symmetric RX/TX sublink speed of 10 Gbps.
+		 *
+		 * Use 1 SSID if the gadget supports up to gen1x2:
+		 * - SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.
+		 *
+		 * Use 2 SSIDs if the gadget supports up to gen2x2:
+		 * - SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.
+		 * - SSID 1 for symmetric RX/TX sublink speed of 10 Gbps.
+		 */
+		for (i = 0; i < ssac + 1; i++) {
+			u8 ssid;
+			u8 mantissa;
+			u8 type;
+
+			ssid = i >> 1;
+
+			if (cdev->gadget->max_ssp_rate == USB_SSP_GEN_2x1 ||
+			    cdev->gadget->max_ssp_rate == USB_SSP_GEN_UNKNOWN)
+				mantissa = 10;
+			else
+				mantissa = 5 << ssid;
+
+			if (i % 2)
+				type = USB_SSP_SUBLINK_SPEED_ST_SYM_TX;
+			else
+				type = USB_SSP_SUBLINK_SPEED_ST_SYM_RX;
+
+			ssp_cap->bmSublinkSpeedAttr[i] =
+				cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, ssid) |
+					    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE,
+						       USB_SSP_SUBLINK_SPEED_LSE_GBPS) |
+					    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST, type) |
+					    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP,
+						       USB_SSP_SUBLINK_SPEED_LP_SSP) |
+					    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, mantissa));
+		}
 	}
 
 	return le16_to_cpu(bos->wTotalLength);
-- 
2.28.0


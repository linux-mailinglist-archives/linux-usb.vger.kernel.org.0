Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873C722D24C
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 01:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgGXXjB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 19:39:01 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:52820 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726783AbgGXXjA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 19:39:00 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5FEDE4016D;
        Fri, 24 Jul 2020 23:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595633940; bh=HdTg00LCMpLuKvpMLDPJJsOGvtTYXeoGF35nlPmyznY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=D3bOv6fuXWVKihEnABv7il7TVDGIUq2Ci81zhZS/05QiNAKFQIZOBQ8rQPtZaPOSv
         pTnyBRzqUGXw1lZ3M2Yb44EwEw83tJOc+ExzpPBGE/FEF0aapRDyNB/xygOCsBaFyU
         SQgriZmDfVVO0vhDWMXfHNY29Dq8x5Y1pHAIwyG7wi534R5D0MIkm/5hZJEPG+bgLY
         eLBFXpZRk4KYIssy4kj5u7+dneT3iZyDoIDKUGPuAXfanvJU8sBbAU15gM8KJS7S9M
         OQoMpYiGFQd6+AwG8YwnHQoqnK8yyhX+337lNIcU4mBasYANQnw+YksVfzgWyQsroW
         6ir1exbmplZjg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 4B4BCA006F;
        Fri, 24 Jul 2020 23:38:59 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 24 Jul 2020 16:38:59 -0700
Date:   Fri, 24 Jul 2020 16:38:59 -0700
Message-Id: <a086193e182517f90b8fb7abe5463368774a9709.1595631457.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595631457.git.thinhn@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 05/12] usb: composite: Properly report sublink speed
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the max sublink speed attributes reported in the gadget structure
to write to the super-speed-plus BOS descriptor if available.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Changes in v3:
 - None
 Changes in v2:
 - None

 drivers/usb/gadget/composite.c | 76 +++++++++++++++++++++++++++++-------------
 1 file changed, 52 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 0aa4cb49aa53..2d0b7af4b08f 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -729,45 +729,73 @@ static int bos_desc(struct usb_composite_dev *cdev)
 	/* The SuperSpeedPlus USB Device Capability descriptor */
 	if (gadget_is_superspeed_plus(cdev->gadget)) {
 		struct usb_ssp_cap_descriptor *ssp_cap;
+		unsigned int ssac = 1;
+		unsigned int ssic = 0;
+		unsigned int min_ssid = 0;
+		int i;
+
+		if (cdev->gadget->ssac) {
+			ssac = cdev->gadget->ssac;
+
+			/*
+			 * Paired RX and TX sublink speed attributes share
+			 * the same SSID.
+			 */
+			ssic = (ssac + 1) / 2 - 1;
+			min_ssid = cdev->gadget->min_speed_ssid;
+		}
 
 		ssp_cap = cdev->req->buf + le16_to_cpu(bos->wTotalLength);
 		bos->bNumDeviceCaps++;
 
-		/*
-		 * Report typical values.
-		 */
-
-		le16_add_cpu(&bos->wTotalLength, USB_DT_USB_SSP_CAP_SIZE(1));
-		ssp_cap->bLength = USB_DT_USB_SSP_CAP_SIZE(1);
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
-			cpu_to_le16(FIELD_PREP(USB_SSP_MIN_SUBLINK_SPEED_ATTRIBUTE_ID, 0) |
+			cpu_to_le16(FIELD_PREP(USB_SSP_MIN_SUBLINK_SPEED_ATTRIBUTE_ID, min_ssid) |
 				    FIELD_PREP(USB_SSP_MIN_RX_LANE_COUNT, 1) |
 				    FIELD_PREP(USB_SSP_MIN_TX_LANE_COUNT, 1));
 
-		ssp_cap->bmSublinkSpeedAttr[0] =
-			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, 0) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE, USB_LSE_GBPS) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
-					       USB_ST_SYMMETRIC_RX) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP, USB_LP_SSP) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
-
-		ssp_cap->bmSublinkSpeedAttr[1] =
-			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, 0) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE, USB_LSE_GBPS) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
-					       USB_ST_SYMMETRIC_TX) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP, USB_LP_SSP) |
-				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
+		/*
+		 * If the sublink speed attributes are not specified, then the
+		 * default will be a pair symmetric RX/TX sublink speed
+		 * attributes of 10 Gbps.
+		 */
+		for (i = 0; i < ssac + 1; i++) {
+			struct usb_sublink_speed default_ssa;
+			struct usb_sublink_speed *ptr;
+
+			if (cdev->gadget->ssac) {
+				ptr = &cdev->gadget->sublink_speed[i];
+			} else {
+				default_ssa.id = i / 2;
+				default_ssa.protocol = USB_LP_SSP;
+				default_ssa.exponent = USB_LSE_GBPS;
+				default_ssa.mantissa = 10;
+
+				if (i % 2)
+					default_ssa.type = USB_ST_SYMMETRIC_TX;
+				else
+					default_ssa.type = USB_ST_SYMMETRIC_RX;
+
+				ptr = &default_ssa;
+			}
+
+			ssp_cap->bmSublinkSpeedAttr[i] =
+				cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, ptr->id) |
+					    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE, ptr->exponent) |
+					    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST, ptr->type) |
+					    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP, ptr->protocol) |
+					    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, ptr->mantissa));
+		}
 	}
 
 	return le16_to_cpu(bos->wTotalLength);
-- 
2.11.0


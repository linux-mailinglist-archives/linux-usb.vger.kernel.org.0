Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F69422A523
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 04:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387762AbgGWCNA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 22:13:00 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:34956 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387467AbgGWCNA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 22:13:00 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C06D1C0086;
        Thu, 23 Jul 2020 02:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595470379; bh=0Af4Y3G9+HLMw9CKf/oJcaLYUvvbvyPsuZ7iiARt+i4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=GkLhf+2sISLhXnRoZbj/FN+dytrlOyfHJkj/QNSWSVr7OPtmZz/hFbYJOqWAcORUi
         xOXfjnY/P49QSbSsrGMaACy7Y0zia2iDhGzCVf37+QN0h7jTWGLwWpo7jfahrKVaJY
         in7WZEKmbfg1LRlEypztlYSPjBXg/JhFRTuGipeUncLbMbALGgHIAoVwy8XNuuXMIp
         oRuAVpMGR0NghYX2UmHbr3hDk+tQR5zULupI+24/tjNYAkOCKEnlNQGs0jNRplWIGJ
         AKPopgMegKu6Gj3nh4FjhAbrI978oH9XP7xrdnTjVMKMLPgYuyx5UnxsiYdlnZJcJC
         WexoaS1ivPa+A==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 90CFEA0096;
        Thu, 23 Jul 2020 02:12:58 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 22 Jul 2020 19:12:58 -0700
Date:   Wed, 22 Jul 2020 19:12:58 -0700
Message-Id: <53d6c389f6e63e0cef120b58ba22aa8d6ef5a2aa.1595468673.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595468673.git.thinhn@synopsys.com>
References: <cover.1595468673.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 09/12] usb: dwc3: gadget: Report sublink speed capability
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Report the sublink speed attributes to the usb_gadget structure based on
the dwc3 device capability maximum_lsm and maximum_num_lanes.

Only DWC_usb32 supports 2 sublink speeds if it can operate with 2 lanes.
(i.e. at SSP, it can operate as gen1x2)

Note: the SSID DWC3_SSP_SSID_GEN2 and DWC3_SSP_SSID_GEN1 are arbitrary.
There's no standard according to the USB 3.2 spec as long as they are
unique and within 0-15.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2:
- Fix missing check for gen1x2 when writing to sublink speed attributes
- Minor fix in commit message (first commit sentence ended with comma)

 drivers/usb/dwc3/core.h   |  4 ++++
 drivers/usb/dwc3/gadget.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 0e37a0471e5a..b44550173599 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -44,6 +44,10 @@
 #define DWC3_LSM_5_GBPS		5
 #define DWC3_LSM_10_GBPS	10
 
+/* Sublink Speed Attribute ID */
+#define DWC3_SSP_SSID_GEN2	2
+#define DWC3_SSP_SSID_GEN1	1
+
 #define DWC3_SCRATCHBUF_SIZE	4096	/* each buffer is assumed to be 4KiB */
 #define DWC3_EVENT_BUFFERS_SIZE	4096
 #define DWC3_EVENT_TYPE_MASK	0xfe
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 80c3ef134e41..69f64bb324ed 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3662,6 +3662,55 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 				dwc->revision);
 
 	dwc->gadget.max_speed		= dwc->maximum_speed;
+	dwc->gadget.max_num_lanes	= dwc->maximum_num_lanes;
+
+	if (dwc->maximum_speed == USB_SPEED_SUPER_PLUS) {
+		struct usb_sublink_speed *ssa;
+		int i;
+
+		/*
+		 * Multiple sublink speeds are only available to DWC_usb32
+		 * devices that can operate at gen2x2 max.
+		 */
+		if (dwc->maximum_lsm == DWC3_LSM_10_GBPS &&
+		    dwc->maximum_num_lanes == 2) {
+			dwc->gadget.ssac = 3;
+			dwc->gadget.min_speed_ssid = DWC3_SSP_SSID_GEN1;
+			dwc->gadget.max_speed_ssid = DWC3_SSP_SSID_GEN2;
+		} else if (dwc->maximum_lsm == DWC3_LSM_5_GBPS &&
+			   dwc->maximum_num_lanes == 2) {
+			dwc->gadget.ssac = 1;
+			dwc->gadget.min_speed_ssid = DWC3_SSP_SSID_GEN1;
+			dwc->gadget.max_speed_ssid = DWC3_SSP_SSID_GEN1;
+		} else {
+			dwc->gadget.ssac = 1;
+			dwc->gadget.min_speed_ssid = DWC3_SSP_SSID_GEN2;
+			dwc->gadget.max_speed_ssid = DWC3_SSP_SSID_GEN2;
+		}
+
+		for (i = 0; i < dwc->gadget.ssac + 1; i++) {
+			ssa = &dwc->gadget.sublink_speed[i];
+
+			if (dwc->gadget.ssac > 1 && i > 1)
+				ssa->id = dwc->gadget.max_speed_ssid;
+			else
+				ssa->id = dwc->gadget.min_speed_ssid;
+
+			if (ssa->id == DWC3_SSP_SSID_GEN1)
+				ssa->mantissa = DWC3_LSM_5_GBPS;
+			else
+				ssa->mantissa = DWC3_LSM_10_GBPS;
+
+			/* First attribute is RX followed by TX */
+			if (i % 2)
+				ssa->type = USB_ST_SYMMETRIC_TX;
+			else
+				ssa->type = USB_ST_SYMMETRIC_RX;
+
+			ssa->exponent = USB_LSE_GBPS;
+			ssa->protocol = USB_LP_SSP;
+		}
+	}
 
 	/*
 	 * REVISIT: Here we should clear all pending IRQs to be
-- 
2.11.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBB4F22D251
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 01:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgGXXjZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 19:39:25 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:41882 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726639AbgGXXjZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 19:39:25 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C775DC0086;
        Fri, 24 Jul 2020 23:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595633964; bh=9Lq2/zVc6BbTscvRNDgXwlM3fhirfm+1CB4ppedBS1I=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=jvUqYaqJUB+FErmruDG5QTnPfzOhgnIeMJSwVapPj46CUa3JQaeSIlDp0+ifRWSrG
         1r1cDB9gBuF1RUidx4/emaqK9RNmxE/EN9gohbquDCOSfFsP8IZAupq0+pmblfq/0X
         0bZnQdStT3YqK7SdCx6Wk78qNE2hkot9TKMnVIJ4dtbd85uzdOtZXZXVVp9sjkjF7G
         MI4FxVVO4cxJLkLBDGBVziK8DU7LBzb4JHJOt/bLQLVm+JX1yHT5dukI43VmLqjzyi
         kQbatpXUmfxgJT5o/6FZcZz2htrzKGegY9jUEaI7YbWjzp4JQOpZadD2zHssn3SQ/H
         kcBldqfyuA0FA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 98691A006F;
        Fri, 24 Jul 2020 23:39:23 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 24 Jul 2020 16:39:23 -0700
Date:   Fri, 24 Jul 2020 16:39:23 -0700
Message-Id: <4355f743840acd523d609c1d90d3c6e49666c0e0.1595631457.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595631457.git.thinhn@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 09/12] usb: dwc3: gadget: Report sublink speed capability
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
the HW capability from the device maximum_speed property.

Only DWC_usb32 supports 2 sublink speeds if it can operate with 2 lanes.
(i.e. at SSP, it can operate as gen1x2)

Note: the SSID DWC3_SSP_SSID_GEN2 and DWC3_SSP_SSID_GEN1 are arbitrary.
There's no standard according to the USB 3.2 spec as long as they are
unique and within 0-15.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v3:
- Update commit with updated field name
- No longer use DWC3_LSM_5/10_GBPS macros
Changes in v2:
- Fix missing check for gen1x2 when writing to sublink speed attributes
- Minor fix in commit message (first commit sentence ended with comma)

 drivers/usb/dwc3/core.h   |  4 ++++
 drivers/usb/dwc3/gadget.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 3bbfbeaa67d8..0ec675327014 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -40,6 +40,10 @@
 #define DWC3_XHCI_RESOURCES_NUM	2
 #define DWC3_ISOC_MAX_RETRIES	5
 
+/* Sublink Speed Attribute ID */
+#define DWC3_SSP_SSID_GEN2	2
+#define DWC3_SSP_SSID_GEN1	1
+
 #define DWC3_SCRATCHBUF_SIZE	4096	/* each buffer is assumed to be 4KiB */
 #define DWC3_EVENT_BUFFERS_SIZE	4096
 #define DWC3_EVENT_TYPE_MASK	0xfe
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e44bfc3b5096..3038dae970f3 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3686,6 +3686,55 @@ int dwc3_gadget_init(struct dwc3 *dwc)
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
+		if (dwc->maximum_phy_gen == USB_PHY_GEN_2 &&
+		    dwc->maximum_num_lanes == 2) {
+			dwc->gadget.ssac = 3;
+			dwc->gadget.min_speed_ssid = DWC3_SSP_SSID_GEN1;
+			dwc->gadget.max_speed_ssid = DWC3_SSP_SSID_GEN2;
+		} else if (dwc->maximum_phy_gen == USB_PHY_GEN_1 &&
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
+				ssa->mantissa = 5;
+			else
+				ssa->mantissa = 10;
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


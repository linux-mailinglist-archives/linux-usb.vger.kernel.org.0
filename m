Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6B222DB37
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 03:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgGZBgw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 21:36:52 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:44764 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726870AbgGZBgw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 21:36:52 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B0A8CC00A4;
        Sun, 26 Jul 2020 01:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595727411; bh=J/cZTYFQc7GJmEpeGYVEejAFKP3fdn61nUpOic6jVG8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Kbov/VRtl9xoSFIFj5DqgYKfu2FQJ1zb/VHCLKamjQemasWCKoorSI9uERvYkaUfP
         984eSd0LCNavy8aFHspoTWRRWwkeew22ZAJyKk02rmge9nvnGlpL7+G1/99Mlb/OWd
         H8MgXDH65LfpJOpIdSCdYjRCbbnc/ndbm2Gh8zGJTmt59pnH7500YZE3W9GV7MvILc
         qDAShM/n48MemDbDDAzxTSC9IjtE5DPA+Z+iBCo8wGettXQ8fKG4k/L60p7KSHP1hc
         ow5e4clbL5fnkhRJS1X1GFhOtGsDqfJJ0fU/edcuveDn/jXv64zjpr/tk2tocj5cSP
         VkCAqJetX57DQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 5D4AFA0070;
        Sun, 26 Jul 2020 01:36:50 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sat, 25 Jul 2020 18:36:50 -0700
Date:   Sat, 25 Jul 2020 18:36:50 -0700
Message-Id: <d3072c866013799d3919a23823a55b2087239015.1595727196.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595727196.git.thinhn@synopsys.com>
References: <cover.1595727196.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v4 09/12] usb: dwc3: gadget: Report sublink speed capability
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
Changes in v4:
- None
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


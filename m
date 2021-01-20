Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0C32FC6FE
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 02:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbhATBnT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 20:43:19 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57282 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729741AbhATBhX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 20:37:23 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 115854016D;
        Wed, 20 Jan 2021 01:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1611106583; bh=P1rSB6Ekgc7DTKBIFrhJZ+TNi7XYxThHUmSFS1/jRJs=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=XyBgBL9BWSfPig+Obiu9Mm4pwdTqyrNlU8wWzoqdme2uwndLPvroQTVKZQQEnQD6l
         /a+DYq+gufn6X6Uz2mRlPcJwxNNizw7sS8DrJ4d6KU9GuumgnWI3396KWtAJDNdauV
         ubOZr4wH384RRgmA2OjqC7VDP3wLkEogLphr/hxaIicaQXY5qCxeJbJgUR8uTkK3pV
         9qj0co5g6/6abgC8rN3rmkYVS5TtNahHOc90o12aFG2l4Tyb6Neeh6RGDkAG44NMqE
         NWfvJbBEKi5PPJwQ3v+AW3dSaJe6GJ4XnvVnBRPUQbbtZ21ObtdxH6DiE57I1F8NwD
         nQtZSCR23tcvg==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id B7737A006F;
        Wed, 20 Jan 2021 01:36:21 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 19 Jan 2021 17:36:21 -0800
Date:   Tue, 19 Jan 2021 17:36:21 -0800
Message-Id: <08d43f2a99198bed84895c272340449a6d03710e.1611106162.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
References: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v7 3/6] usb: dwc3: core: Check maximum_speed SSP genXxY
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The DWC_usb32 controller supports dual-lane SuperSpeed Plus. Check the
maximum_speed property for any limitation in the HW to initialize and
validate the maximum number of lanes and speed the device will operate.

Currently the controller has no visibility into the HW parameter to
determine the maximum number of lanes the HW supports. If the number of
lanes is not specified for SSP, then set the default rate to gen2x2 for
DWC_usb32 and gen2x1 for DWC_usb31.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v7:
- Rebase on Greg's usb-testing branch
Changes in v6:
- Rebase on Greg's usb-testing branch
- Update to check for lane count and gen# via usb_ssp_rate enum
- Update commit message
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- Use new common funtions to get SSP Gen and number of lanes
Changes in v3:
- Use new common function to get maximum-speed
- Remove num_lanes and lsm validation since they are no longer separate
  properties
- Replace dwc->maxmum_lsm field with dwc->maximum_ssp_rate for gen1/gen2
Changes in v2:
- Use common functions to get num_lanes and lsm properties

 drivers/usb/dwc3/core.c   | 37 +++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h   |  2 ++
 drivers/usb/dwc3/gadget.c |  1 +
 3 files changed, 40 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 6969196fccd6..931ccf93eabd 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1252,6 +1252,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	hird_threshold = 12;
 
 	dwc->maximum_speed = usb_get_maximum_speed(dev);
+	dwc->max_ssp_rate = usb_get_maximum_ssp_rate(dev);
 	dwc->dr_mode = usb_get_dr_mode(dev);
 	dwc->hsphy_mode = of_usb_get_phy_mode(dev->of_node);
 
@@ -1423,6 +1424,42 @@ static void dwc3_check_params(struct dwc3 *dwc)
 		}
 		break;
 	}
+
+	/*
+	 * Currently the controller does not have visibility into the HW
+	 * parameter to determine the maximum number of lanes the HW supports.
+	 * If the number of lanes is not specified in the device property, then
+	 * set the default to support dual-lane for DWC_usb32 and single-lane
+	 * for DWC_usb31 for super-speed-plus.
+	 */
+	if (dwc->maximum_speed == USB_SPEED_SUPER_PLUS) {
+		switch (dwc->max_ssp_rate) {
+		case USB_SSP_GEN_2x1:
+			if (hwparam_gen == DWC3_GHWPARAMS3_SSPHY_IFC_GEN1)
+				dev_warn(dev, "UDC only supports Gen 1\n");
+			break;
+		case USB_SSP_GEN_1x2:
+		case USB_SSP_GEN_2x2:
+			if (DWC3_IP_IS(DWC31))
+				dev_warn(dev, "UDC only supports single lane\n");
+			break;
+		case USB_SSP_GEN_UNKNOWN:
+		default:
+			switch (hwparam_gen) {
+			case DWC3_GHWPARAMS3_SSPHY_IFC_GEN2:
+				if (DWC3_IP_IS(DWC32))
+					dwc->max_ssp_rate = USB_SSP_GEN_2x2;
+				else
+					dwc->max_ssp_rate = USB_SSP_GEN_2x1;
+				break;
+			case DWC3_GHWPARAMS3_SSPHY_IFC_GEN1:
+				if (DWC3_IP_IS(DWC32))
+					dwc->max_ssp_rate = USB_SSP_GEN_1x2;
+				break;
+			}
+			break;
+		}
+	}
 }
 
 static int dwc3_probe(struct platform_device *pdev)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index eec1cf4ba268..a482f4e954cb 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -964,6 +964,7 @@ struct dwc3_scratchpad_array {
  * @nr_scratch: number of scratch buffers
  * @u1u2: only used on revisions <1.83a for workaround
  * @maximum_speed: maximum speed requested (mainly for testing purposes)
+ * @max_ssp_rate: SuperSpeed Plus maximum signaling rate and lane count
  * @gadget_max_speed: maximum gadget speed requested
  * @ip: controller's ID
  * @revision: controller's version of an IP
@@ -1128,6 +1129,7 @@ struct dwc3 {
 	u32			u1u2;
 	u32			maximum_speed;
 	u32			gadget_max_speed;
+	enum usb_ssp_rate	max_ssp_rate;
 
 	u32			ip;
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 86f257f12d45..00ba8f11ca32 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3888,6 +3888,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 				dwc->revision);
 
 	dwc->gadget->max_speed		= dwc->maximum_speed;
+	dwc->gadget->max_ssp_rate	= dwc->max_ssp_rate;
 
 	/*
 	 * REVISIT: Here we should clear all pending IRQs to be
-- 
2.28.0


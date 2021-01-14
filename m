Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1574A2F58BC
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 04:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbhANCyg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 21:54:36 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:42094 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726903AbhANCye (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 21:54:34 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F1D1E402D8;
        Thu, 14 Jan 2021 02:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610592814; bh=fDfPQgabA7LNKJzzof1Q4IHo0YlwzjVayE/kTwDlxeg=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=RD99WqTig4SDsbngdJzydBbyWkvGx+bmj+PqEzyDQPndSi8RW3P1ZhQOgsTAfSig5
         3lg5GaCxy5jZzrsT+s06PZhU3sGY3GGf1Yx0ZNeBUbTLYZM3XDrwmWEqUwNiieIOp4
         EwXa7YmkkxJbTt0Dw1MjnaOzDORYAn6//03CnhwBNicUrPovFDdrI+s22Afv3LOFqk
         G4PlZ77AIirQ/IelyQ9hWAEWuxYBNMZBu+AqjZj40rEpAKs4TOOHP/SaOA900TkTGD
         Chu+TX0ys4DyfoPLXQ19qxafRcJrstqcUmC4cmePA8d++Xl7rJQPdqTQ/dGdVKKrRq
         kNttyDKQvqMUg==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id DD269A005E;
        Thu, 14 Jan 2021 02:53:32 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 13 Jan 2021 18:53:32 -0800
Date:   Wed, 13 Jan 2021 18:53:32 -0800
Message-Id: <c1062ff35994389a1376dbd8af27d2069a480943.1610592135.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v6 08/11] usb: dwc3: core: Check maximum_speed SSP genXxY
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
index ac290d896638..363c1b84f45f 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -964,6 +964,7 @@ struct dwc3_scratchpad_array {
  * @nr_scratch: number of scratch buffers
  * @u1u2: only used on revisions <1.83a for workaround
  * @maximum_speed: maximum speed requested (mainly for testing purposes)
+ * @max_ssp_rate: SuperSpeed Plus maximum signaling rate and lane count
  * @ip: controller's ID
  * @revision: controller's version of an IP
  * @version_type: VERSIONTYPE register contents, a sub release of a revision
@@ -1127,6 +1128,7 @@ struct dwc3 {
 	u32			u1u2;
 	u32			maximum_speed;
 	u32			gadget_max_speed;
+	enum usb_ssp_rate	max_ssp_rate;
 
 	u32			ip;
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index ff14e5bbd152..494e4eca5460 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3889,6 +3889,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 				dwc->revision);
 
 	dwc->gadget->max_speed		= dwc->maximum_speed;
+	dwc->gadget->max_ssp_rate	= dwc->max_ssp_rate;
 
 	/*
 	 * REVISIT: Here we should clear all pending IRQs to be
-- 
2.28.0


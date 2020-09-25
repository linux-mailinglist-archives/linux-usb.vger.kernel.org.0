Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 129FD277E19
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 04:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgIYCme (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 22:42:34 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50896 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726764AbgIYCme (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 22:42:34 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 936D3402B8;
        Fri, 25 Sep 2020 02:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601001753; bh=y4u84g/113wiag3sp+ax7YlPusCCWmtle61tl7AZIEM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=QD5glZFxEzd1H8Xzw3g3fDXAlUXou5DiCxN1k7Ew26qoIQma5Pbyvjni+b/bs/eML
         lcDmiy9asO5gGBGiWhllzlolHMWL7m6VCzl+98y2u6db3ozdodRvBPpUw4tuFONM1d
         9g91JLhkl+HHant5TIFoGSKmH6T+Q0kW7v8srAlJeHbGxwrPiPW/6GM2fqD6qP17cs
         OKFtdqy8cNffnB0/nfLT+m/R8BtVHbDXkXLjgobEo40CK6iB7psdr3odr4RPZDav1O
         nz5cWaqKCT6IFRaWNChKNwRpKhs/yDtrcNRMQOyfIQ95NwE0Dd7xmidelkNhxza9XW
         mRkVoCEBZ6oIA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 7D760A0072;
        Fri, 25 Sep 2020 02:42:32 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 19:42:32 -0700
Date:   Thu, 24 Sep 2020 19:42:32 -0700
Message-Id: <cec9439cfab7b85690a026be5f5269a04120e5c4.1601001199.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
References: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v5 08/12] usb: dwc3: Initialize lane count and sublink speed
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC_usb32 supports dual-lane operating at different sublink speeds.
Initialize and validate the maximum number of lanes and speed the
controller supports in the maximum_speed property.

Currently the controller has no visibility into the HW parameter to
determine the maximum number of lanes the HW supports. If the number of
lanes is not specified, then set the default to 2 for DWC_usb32 and 1
for DWC_usb31 for SSP.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
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

 drivers/usb/dwc3/core.c | 29 +++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  6 ++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 385262f6747d..ea8d57749ea7 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1267,6 +1267,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	hird_threshold = 12;
 
 	dwc->maximum_speed = usb_get_maximum_speed(dev);
+	dwc->maximum_phy_gen = usb_get_ssp_phy_gen(dev);
+	dwc->maximum_num_lanes = usb_get_ssp_num_lanes(dev);
 	dwc->dr_mode = usb_get_dr_mode(dev);
 	dwc->hsphy_mode = of_usb_get_phy_mode(dev->of_node);
 
@@ -1435,6 +1437,33 @@ static void dwc3_check_params(struct dwc3 *dwc)
 		}
 		break;
 	}
+
+	/*
+	 * Currently the controller does not have visibility into the HW
+	 * parameter to determine the maximum number of lanes the HW
+	 * supports. If the number of lanes is not specified in the
+	 * device property, then set the default to 2 for DWC_usb32 and
+	 * 1 for DWC_usb31 for super-speed-plus.
+	 */
+	if (dwc->maximum_speed == USB_SPEED_SUPER_PLUS) {
+		if (DWC3_IP_IS(DWC32)) {
+			if (dwc->maximum_phy_gen == USB_PHY_GEN_UNKNOWN)
+				dwc->maximum_phy_gen = USB_PHY_GEN_2;
+
+			if (!dwc->maximum_num_lanes)
+				dwc->maximum_num_lanes = 2;
+
+		} else if (DWC3_IP_IS(DWC31)) {
+			if (dwc->maximum_num_lanes > 1)
+				dev_warn(dev, "UDC doesn't support multi-lanes\n");
+
+			dwc->maximum_phy_gen = USB_PHY_GEN_2;
+			dwc->maximum_num_lanes = 1;
+		}
+	} else {
+		dwc->maximum_phy_gen = USB_PHY_GEN_UNKNOWN;
+		dwc->maximum_num_lanes = 0;
+	}
 }
 
 static int dwc3_probe(struct platform_device *pdev)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 83b6c871d58d..585a83ada270 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -959,6 +959,8 @@ struct dwc3_scratchpad_array {
  * @nr_scratch: number of scratch buffers
  * @u1u2: only used on revisions <1.83a for workaround
  * @maximum_speed: maximum speed requested (mainly for testing purposes)
+ * @maximum_phy_gen: maximum phy signaling rate
+ * @maximum_num_lanes: maximum number of lanes
  * @ip: controller's ID
  * @revision: controller's version of an IP
  * @version_type: VERSIONTYPE register contents, a sub release of a revision
@@ -989,6 +991,7 @@ struct dwc3_scratchpad_array {
  * @ep0state: state of endpoint zero
  * @link_state: link state
  * @speed: device speed (super, high, full, low)
+ * @num_lanes: number of connected lanes
  * @hwparams: copy of hwparams registers
  * @root: debugfs root folder pointer
  * @regset: debugfs pointer to regdump file
@@ -1120,6 +1123,8 @@ struct dwc3 {
 	u32			nr_scratch;
 	u32			u1u2;
 	u32			maximum_speed;
+	enum usb_phy_gen	maximum_phy_gen;
+	u8			maximum_num_lanes;
 
 	u32			ip;
 
@@ -1185,6 +1190,7 @@ struct dwc3 {
 	u8			u1pel;
 
 	u8			speed;
+	u8			num_lanes;
 
 	u8			num_eps;
 
-- 
2.28.0


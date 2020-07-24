Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D8522D250
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 01:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgGXXjT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 19:39:19 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:52836 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726666AbgGXXjT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 19:39:19 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9A6F940179;
        Fri, 24 Jul 2020 23:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595633958; bh=4o34mDWbUth8CMb+b4GntRQUbKlSHyVD6/b9tl+0Sik=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=kUvBoJyMR6zKaR0Xy7bTsLAfMSdW7ZqGFg9NFgLdrdndfwVHz7mAe4HpJjX4dvlzF
         dlUpxSqWBITvhwxKJJY6nNa9WOpASkDu+/xJBMGmXcOW3CEsk+bDRF3ZVrlX0gGqR4
         1vn0gmTo64KyQHRL3p4FqiLnDtTxvxEDjcgkLhIik4JK2oyPs2rzTmsLzLwgaSZtMH
         LSUGjYyqYsE9SC9T9he0xioriwAAlaBxKtU6xIy4ihLAuZpFpStelN0qtA9nztVerN
         oSg2PT7XGjoWXa0KOwEdpgvE+DwN1RM/1zYmIVtNNxvf3b594sYG5I/tE/JIIbhGIS
         KbjnmIZ8PgLdg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 85C0EA009A;
        Fri, 24 Jul 2020 23:39:17 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 24 Jul 2020 16:39:17 -0700
Date:   Fri, 24 Jul 2020 16:39:17 -0700
Message-Id: <3aa688cf0d9c8056d9c3a0ec5d90587263bba53c.1595631457.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595631457.git.thinhn@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 08/12] usb: dwc3: Initialize lane count and sublink speed
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
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

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v3:
- Use new common function to get maximum-speed
- Remove num_lanes and lsm validation since they are no longer separate
  properties
- Replace dwc->maxmum_lsm field with dwc->maximum_ssp_rate for gen1/gen2
Changes in v2:
- Use common functions to get num_lanes and lsm properties

 drivers/usb/dwc3/core.c | 31 ++++++++++++++++++++++++++++++-
 drivers/usb/dwc3/core.h |  6 ++++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 422aea24afcd..4c62337e8765 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1274,7 +1274,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	 */
 	hird_threshold = 12;
 
-	dwc->maximum_speed = usb_get_maximum_speed(dev);
+	usb_get_maximum_speed_and_num_lanes(dev, &dwc->maximum_speed,
+					    &dwc->maximum_phy_gen,
+					    &dwc->maximum_num_lanes);
 	dwc->dr_mode = usb_get_dr_mode(dev);
 	dwc->hsphy_mode = of_usb_get_phy_mode(dev->of_node);
 
@@ -1426,6 +1428,33 @@ static void dwc3_check_params(struct dwc3 *dwc)
 
 		break;
 	}
+
+	/*
+	 * Currently the controller does not have visibility into the HW
+	 * parameter to determine the maximum number of lanes the phy
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
index 2f04b3e42bf1..3bbfbeaa67d8 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -958,6 +958,8 @@ struct dwc3_scratchpad_array {
  * @nr_scratch: number of scratch buffers
  * @u1u2: only used on revisions <1.83a for workaround
  * @maximum_speed: maximum speed requested (mainly for testing purposes)
+ * @maximum_phy_gen: maximum phy signaling rate
+ * @maximum_num_lanes: maximum number of lanes
  * @ip: controller's ID
  * @revision: controller's version of an IP
  * @version_type: VERSIONTYPE register contents, a sub release of a revision
@@ -988,6 +990,7 @@ struct dwc3_scratchpad_array {
  * @ep0state: state of endpoint zero
  * @link_state: link state
  * @speed: device speed (super, high, full, low)
+ * @num_lanes: number of connected lanes
  * @hwparams: copy of hwparams registers
  * @root: debugfs root folder pointer
  * @regset: debugfs pointer to regdump file
@@ -1119,6 +1122,8 @@ struct dwc3 {
 	u32			nr_scratch;
 	u32			u1u2;
 	u32			maximum_speed;
+	enum usb_phy_gen	maximum_phy_gen;
+	u8			maximum_num_lanes;
 
 	u32			ip;
 
@@ -1184,6 +1189,7 @@ struct dwc3 {
 	u8			u1pel;
 
 	u8			speed;
+	u8			num_lanes;
 
 	u8			num_eps;
 
-- 
2.11.0


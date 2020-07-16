Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2994222E4A
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 23:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgGPV7Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 17:59:16 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:46094 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726189AbgGPV7P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 17:59:15 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6A8994010A;
        Thu, 16 Jul 2020 21:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594936755; bh=YpKeXV3yQFIhIfekl9+7l0TTx5FMBa/hJmOK3FLzkxo=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=bIQsmAwQibG+7Hyy4jw0UR/7vDF+Iu9L5JvbQqXm5SbEy8DgYZKIIgwJTYP+pCPLH
         7Mk1wIkAHYE2F8defXu6TFL203oBKlViuzNzQytmq8zjb+fXFGA2Rnthui1yoncQA5
         r5KGsqRTpBqkZ2qLVupdJJXnH5wac05uTEDFb1e6jalh0n91ymEK7K+HQP4qOizpU1
         vv5OheM9oPojHt+ACXH3X0hSNF16gbgPR3AVvRsTAMA/xPLxj8dxe8DKIyCA+FwPww
         lyWve+XSD76m16UngH7xhNc/nGpcLeI2Ef/4ZpUfSOy1yNI6t3hb9VQ/nLNexbESfE
         uiZQ491gNhsPA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 538CAA0258;
        Thu, 16 Jul 2020 21:59:14 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 16 Jul 2020 14:59:14 -0700
Date:   Thu, 16 Jul 2020 14:59:14 -0700
Message-Id: <bded41abb332b87c72b87a710d25d165b794dc7d.1594935978.git.thinhn@synopsys.com>
In-Reply-To: <cover.1594935978.git.thinhn@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 07/11] usb: dwc3: Initialize lane count and sublink speed
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
controller supports captured from the dwc3 device properties.

Currently the controller has no visibility into the HW parameter to
determine the maximum number of lanes the phy supports. If the number of
lanes is not specified, then set the default to 2 for DWC_usb32 and 1
for DWC_usb31 if operate in SSP.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h | 10 ++++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 25c686a752b0..dcc76705862f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1299,6 +1299,10 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				"snps,usb3_lpm_capable");
 	dwc->usb2_lpm_disable = device_property_read_bool(dev,
 				"snps,usb2-lpm-disable");
+	device_property_read_u8(dev, "snps,num-lanes",
+				&dwc->maximum_num_lanes);
+	device_property_read_u8(dev, "snps,lane-speed-mantissa-gbps",
+				&dwc->maximum_lsm);
 	device_property_read_u8(dev, "snps,rx-thr-num-pkt-prd",
 				&rx_thr_num_pkt_prd);
 	device_property_read_u8(dev, "snps,rx-max-burst-prd",
@@ -1426,6 +1430,66 @@ static void dwc3_check_params(struct dwc3 *dwc)
 
 		break;
 	}
+
+	/*
+	 * If it's not DWC_usb32 IP or speed is less than SSP, no need to
+	 * validate the number of lanes or lane speed mantissa.
+	 *
+	 * Currently the controller does not have visibility into the HW
+	 * parameter to determine the maximum number of lanes the phy supports.
+	 * If the number of lanes is not specified in the device property, then
+	 * set the default to 2 for DWC_usb32 and 1 for DWC_usb31 if the device
+	 * is capable of super-speed-plus.
+	 */
+	if (!DWC3_IP_IS(DWC32) ||
+	    dwc->maximum_speed < USB_SPEED_SUPER_PLUS) {
+		if (dwc->maximum_lsm || dwc->maximum_num_lanes)
+			dev_warn(dev, "Ignore num_lanes and LSM properties\n");
+
+		if (DWC3_IP_IS(DWC31) &&
+		    dwc->maximum_speed == USB_SPEED_SUPER_PLUS) {
+			dwc->maximum_lsm = DWC3_LSM_10_GBPS;
+			dwc->maximum_num_lanes = 1;
+		} else {
+			dwc->maximum_lsm = DWC3_LSM_UNSPECIFIED;
+			dwc->maximum_num_lanes = 0;
+		}
+
+		return;
+	}
+
+	switch (dwc->maximum_lsm) {
+	case DWC3_LSM_10_GBPS:
+	case DWC3_LSM_5_GBPS:
+		break;
+	default:
+		dev_err(dev, "Invalid LSM (%dGbps)\n", dwc->maximum_lsm);
+		fallthrough;
+	case DWC3_LSM_UNSPECIFIED:
+		dwc->maximum_lsm = DWC3_LSM_10_GBPS;
+		break;
+	}
+
+	switch (dwc->maximum_num_lanes) {
+	case 2:
+		break;
+	case 1:
+		if (dwc->maximum_lsm == DWC3_LSM_5_GBPS) {
+			dev_err(dev, "Invalid num_lanes (%d) and LSM (%dGbps) for %s\n",
+				dwc->maximum_num_lanes,
+				dwc->maximum_lsm,
+				usb_speed_string(dwc->maximum_speed));
+			dwc->maximum_lsm = DWC3_LSM_10_GBPS;
+		}
+		break;
+	default:
+		dev_err(dev, "Invalid number of lanes (%d)\n",
+			dwc->maximum_num_lanes);
+		fallthrough;
+	case 0:
+		dwc->maximum_num_lanes = 2;
+		break;
+	}
 }
 
 static int dwc3_probe(struct platform_device *pdev)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 013f42a2b5dc..33cfd7f4a7e0 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -40,6 +40,10 @@
 #define DWC3_XHCI_RESOURCES_NUM	2
 #define DWC3_ISOC_MAX_RETRIES	5
 
+#define DWC3_LSM_UNSPECIFIED	0
+#define DWC3_LSM_5_GBPS		5
+#define DWC3_LSM_10_GBPS	10
+
 #define DWC3_SCRATCHBUF_SIZE	4096	/* each buffer is assumed to be 4KiB */
 #define DWC3_EVENT_BUFFERS_SIZE	4096
 #define DWC3_EVENT_TYPE_MASK	0xfe
@@ -958,6 +962,8 @@ struct dwc3_scratchpad_array {
  * @nr_scratch: number of scratch buffers
  * @u1u2: only used on revisions <1.83a for workaround
  * @maximum_speed: maximum speed requested (mainly for testing purposes)
+ * @maximum_lsm: maximum lane speed mantissa in Gbps
+ * @maximum_num_lanes: maximum number of lanes
  * @ip: controller's ID
  * @revision: controller's version of an IP
  * @version_type: VERSIONTYPE register contents, a sub release of a revision
@@ -988,6 +994,7 @@ struct dwc3_scratchpad_array {
  * @ep0state: state of endpoint zero
  * @link_state: link state
  * @speed: device speed (super, high, full, low)
+ * @num_lanes: number of connected lanes
  * @hwparams: copy of hwparams registers
  * @root: debugfs root folder pointer
  * @regset: debugfs pointer to regdump file
@@ -1119,6 +1126,8 @@ struct dwc3 {
 	u32			nr_scratch;
 	u32			u1u2;
 	u32			maximum_speed;
+	u8			maximum_lsm;
+	u8			maximum_num_lanes;
 
 	u32			ip;
 
@@ -1184,6 +1193,7 @@ struct dwc3 {
 	u8			u1pel;
 
 	u8			speed;
+	u8			num_lanes;
 
 	u8			num_eps;
 
-- 
2.11.0


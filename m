Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6294811C399
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 03:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbfLLCuP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 21:50:15 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:41576 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727809AbfLLCuP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 21:50:15 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ECC15404D4;
        Thu, 12 Dec 2019 02:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576119015; bh=X9vD3XHKcSvWF5MIuozr7wRWoOPSp14j6Y6bhuzFI2o=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=A0dEROseaqtTPLyps/otmWXi6Yq0tS1RWG6yJ4S1IJVh2BSBgiNdLbY7eMxZe6a02
         nBLyBT78mXFGpIBFBFSIInEwg7LdTGjazYmDIf9HhdSb+WZShQLnbZq3g6Wq0o1WWd
         rzW/DItgusCUMM5/ktx0wPCpyY1TnKsNPO4skIHwRTY5dIYfvbBT4i1AZ5SxOMtPCG
         3t9gswKemkd95KVk0dqwK5J3jEHK1fWUfXJwwlZmZgx9iANASd/5UoxO+8G5tfhD0D
         7H+qByEIe7Vqui7renWDQTyQZFDcsMoEiH7DFxHLaOhKpqqvTSpO/7EvwJakMHCGsY
         jN7IkrDjif8Zg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id D81E7A006D;
        Thu, 12 Dec 2019 02:50:13 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:50:13 -0800
Date:   Wed, 11 Dec 2019 18:50:13 -0800
Message-Id: <f5204a903db258d3f9e6c44aef49adc3c2f98a86.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 12/14] usb: dwc3: gadget: Set number of TRB prefetch
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC_usb32 has new feature that allows the controller to cache multiple
TRBs for non-control endpoints. The number of TRB cache can be from 1 to
DWC_USB32_CACHE_TRBS_PER_TRANSFER. By default, if the property is not
set, then the controller will cache up to
DWC_USB32_CACHE_TRBS_PER_TRANSFER number of TRBs.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.c   | 2 ++
 drivers/usb/dwc3/core.h   | 5 +++++
 drivers/usb/dwc3/gadget.c | 9 +++++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index d09e968644c1..8de2928f47ac 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1309,6 +1309,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				&tx_thr_num_pkt_prd);
 	device_property_read_u8(dev, "snps,tx-max-burst-prd",
 				&tx_max_burst_prd);
+	device_property_read_u8(dev, "snps,num-trb-prefetch",
+				&dwc->num_trb_prefetch);
 
 	dwc->disable_scramble_quirk = device_property_read_bool(dev,
 				"snps,disable_scramble_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index bd446dca0869..6315c0fa28b5 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -154,6 +154,8 @@
 #define DWC3_DEPCMDPAR0		0x08
 #define DWC3_DEPCMD		0x0c
 
+#define DWC32_DEPCMDPAR2_TRB_PREFETCH(n)	(((n) & 0xff) << 24)
+
 #define DWC3_DEV_IMOD(n)	(0xca00 + ((n) * 0x4))
 
 /* OTG Registers */
@@ -353,6 +355,7 @@
 #define DWC3_GHWPARAMS3_FSPHY_IFC_ENA		1
 
 /* Global HWPARAMS4 Register */
+#define DWC32_GHWPARAMS4_CACHE_TRBS(n)		((n) & 0x3f) /* DWC_usb32 only */
 #define DWC3_GHWPARAMS4_HIBER_SCRATCHBUFS(n)	(((n) & (0x0f << 13)) >> 13)
 #define DWC3_MAX_HIBER_SCRATCHBUFS		15
 
@@ -993,6 +996,7 @@ struct dwc3_scratchpad_array {
  * @rx_max_burst_prd: max periodic ESS receive burst size
  * @tx_thr_num_pkt_prd: periodic ESS transmit packet count
  * @tx_max_burst_prd: max periodic ESS transmit burst size
+ * @num_trb_prefetch: number of TRBs to cache
  * @hsphy_interface: "utmi" or "ulpi"
  * @connected: true when we're connected to a host, false otherwise
  * @delayed_status: true when gadget driver asks for delayed status
@@ -1187,6 +1191,7 @@ struct dwc3 {
 	u8			rx_max_burst_prd;
 	u8			tx_thr_num_pkt_prd;
 	u8			tx_max_burst_prd;
+	u8			num_trb_prefetch;
 
 	const char		*hsphy_interface;
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 569be19c84d3..cd478de6c008 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -566,6 +566,15 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
 	if (action == DWC3_DEPCFG_ACTION_RESTORE)
 		params.param2 |= dep->saved_state;
 
+	if (dwc3_is_usb32(dwc) && dep->number > 1 && dwc->num_trb_prefetch) {
+		u32 hwparams4 = dwc->hwparams.hwparams4;
+		int trb_count_max = DWC32_GHWPARAMS4_CACHE_TRBS(hwparams4);
+		int trb_count;
+
+		trb_count = min_t(int, dwc->num_trb_prefetch, trb_count_max);
+		params.param2 |= DWC32_DEPCMDPAR2_TRB_PREFETCH(trb_count);
+	}
+
 	if (usb_endpoint_xfer_control(desc))
 		params.param1 = DWC3_DEPCFG_XFER_COMPLETE_EN;
 
-- 
2.11.0


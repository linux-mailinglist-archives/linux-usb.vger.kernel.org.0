Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2229911C39C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 03:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfLLCu1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 21:50:27 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:41602 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727599AbfLLCu1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 21:50:27 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 18AF9404D4;
        Thu, 12 Dec 2019 02:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576119027; bh=ZoiOszQQBZJKVZfJxgxs/ShXkC5IPKnq/bMOQwWHF4o=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=DvQiVOclrunKrZDFnXdpU39SUAZGhImkGo8ldBGkUQrAcEFPsNm9vMfBjkJucH3HK
         XAKR00evdf7oRrTbSuyd1fvakmifp2B8zeN0ZNJ9fxrWdksz3Q+z24fvJ9AuKIJ93t
         WX/dpjr2E8VcvJ+eS6TwDvVqVP/o9W283Lef4XG33+JBZmAc6Hzwji5I303u+cOQD8
         ETIgyM/PeVfBMLJvwlg3WykrFHXf5KiLhqgidhxQfsOuk5BXNxU3ZwwhiYceDJwx62
         QxWf3HVxNNj4apNjhP/cG0GaFYZj90DRFcKfTt6YIO9zbxmrMLrTHY1lxa3wg2h41y
         OdDsDE82m1qKg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 04D68A0096;
        Thu, 12 Dec 2019 02:50:26 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:50:25 -0800
Date:   Wed, 11 Dec 2019 18:50:25 -0800
Message-Id: <13d33d2a4f4425f85aae6aad545fdd3c06ec3a69.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 14/14] usb: dwc3: gadget: Implement disabling of mult TRB fetch
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC_usb32 controller allows the HW to send multiple TRB fetch requests.
If the second fetch to the same TRB complete before the previous
request, then the result of the second fetch is taken and the first to
drop. This feature improve the performance when the number of cache TRB
is greater than 2. DWC_usb32 also has the option to issue only single
TRB fetch, which this patch implements the "snps,dis-mult-trb-fetch"
property.

For optimal performance, the programming guide recommend to do only
single TRB fetch if num_trb_prefetch is 2 or lower.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.c   |  2 ++
 drivers/usb/dwc3/core.h   |  5 +++++
 drivers/usb/dwc3/gadget.c | 12 ++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 8de2928f47ac..713b5fdce38b 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1346,6 +1346,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				"snps,dis-del-phy-power-chg-quirk");
 	dwc->dis_tx_ipgap_linecheck_quirk = device_property_read_bool(dev,
 				"snps,dis-tx-ipgap-linecheck-quirk");
+	dwc->dis_mult_trb_fetch = device_property_read_bool(dev,
+				"snps,dis-mult-trb-fetch");
 
 	dwc->tx_de_emphasis_quirk = device_property_read_bool(dev,
 				"snps,tx_de_emphasis_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 6315c0fa28b5..49692d88f15b 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -146,6 +146,7 @@
 #define DWC3_DSTS		0xc70c
 #define DWC3_DGCMDPAR		0xc710
 #define DWC3_DGCMD		0xc714
+#define DWC32_DCTL1		0xc718 /* DWC_usb32 only */
 #define DWC3_DALEPENA		0xc720
 
 #define DWC3_DEP_BASE(n)	(0xc800 + ((n) * 0x10))
@@ -441,6 +442,8 @@
 #define DWC3_DCTL_ULSTCHNG_COMPLIANCE	(DWC3_DCTL_ULSTCHNGREQ(10))
 #define DWC3_DCTL_ULSTCHNG_LOOPBACK	(DWC3_DCTL_ULSTCHNGREQ(11))
 
+#define DWC32_DCTL1_SINGLE_TRB_FETCH	BIT(0)
+
 /* Device Event Enable Register */
 #define DWC3_DEVTEN_VNDRDEVTSTRCVEDEN	BIT(12)
 #define DWC3_DEVTEN_EVNTOVERFLOWEN	BIT(11)
@@ -1040,6 +1043,7 @@ struct dwc3_scratchpad_array {
  *			change quirk.
  * @dis_tx_ipgap_linecheck_quirk: set if we disable u2mac linestate
  *			check during HS transmit.
+ * @dis_mult_trb_fetch: set to disable multiple TRB cache
  * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
  * @tx_de_emphasis: Tx de-emphasis value
  * 	0	- -6dB de-emphasis
@@ -1229,6 +1233,7 @@ struct dwc3 {
 	unsigned		dis_u2_freeclk_exists_quirk:1;
 	unsigned		dis_del_phy_power_chg_quirk:1;
 	unsigned		dis_tx_ipgap_linecheck_quirk:1;
+	unsigned		dis_mult_trb_fetch:1;
 
 	unsigned		tx_de_emphasis_quirk:1;
 	unsigned		tx_de_emphasis:2;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index cd478de6c008..60bed79f0681 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3506,6 +3506,18 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 		goto err4;
 	}
 
+	if (dwc3_is_usb32(dwc) && dwc->dis_mult_trb_fetch) {
+		u32 reg;
+
+		/*
+		 * For optimal performance, set DCTL1.SINGLE_TRB_FETCH_EN
+		 * if the number of trb prefetch is 2 or less.
+		 */
+		reg = dwc3_readl(dwc->regs, DWC32_DCTL1);
+		reg |= DWC32_DCTL1_SINGLE_TRB_FETCH;
+		dwc3_writel(dwc->regs, DWC32_DCTL1, reg);
+	}
+
 	if (dwc3_is_usb32(dwc) && dwc->maximum_lsm)
 		dwc3_gadget_set_sublink_attr(&dwc->gadget,
 					     dwc->maximum_lanes,
-- 
2.11.0


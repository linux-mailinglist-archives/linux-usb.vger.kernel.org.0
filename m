Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7F826FDF6
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 15:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgIRNOd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 09:14:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:46076 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgIRNOc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Sep 2020 09:14:32 -0400
IronPort-SDR: hWV27ymzmFlZrqm+iklputjND8J8h/IOKfK7kQpKxJAnutwYbxlY+ESGiFmITnQAJdkuDYST3w
 ykXogkBlaPZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="160849954"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="160849954"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 06:14:32 -0700
IronPort-SDR: Ac1877wMp6CldLIZx4OdHc7f640o0x/8RECYZL/Dn4FQr5YwtYSa7MbpGsQFSfAj2mWcQTAapm
 K6LToGHY0DPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="508871177"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2020 06:14:31 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/10] usb: host: xhci-plat: add priv quirk for skip PHY initialization
Date:   Fri, 18 Sep 2020 16:17:46 +0300
Message-Id: <20200918131752.16488-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
References: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Some DRD controllers (eg, dwc3 & cdns3) have PHY management at
their own driver to cover both device and host mode, so add one
priv quirk for such users to skip PHY management from HCD core.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-plat.c | 8 ++++++--
 drivers/usb/host/xhci.h      | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 07ca000a0084..14ff65a387e8 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -183,6 +183,8 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	struct usb_hcd		*hcd;
 	int			ret;
 	int			irq;
+	struct xhci_plat_priv	*priv = NULL;
+
 
 	if (usb_disabled())
 		return -ENODEV;
@@ -280,8 +282,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		priv_match = dev_get_platdata(&pdev->dev);
 
 	if (priv_match) {
-		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
-
+		priv = hcd_to_xhci_priv(hcd);
 		/* Just copy data for now */
 		*priv = *priv_match;
 	}
@@ -329,6 +330,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 
 	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
 	xhci->shared_hcd->tpl_support = hcd->tpl_support;
+	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
+		hcd->skip_phy_initialization = 1;
+
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto disable_usb_phy;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ea1754f185a2..7658abdfca28 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1874,6 +1874,7 @@ struct xhci_hcd {
 #define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
 #define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
+#define XHCI_SKIP_PHY_INIT	BIT_ULL(37)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.17.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2492D27A0
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 10:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbgLHJ3s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 04:29:48 -0500
Received: from mga06.intel.com ([134.134.136.31]:9880 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbgLHJ3s (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Dec 2020 04:29:48 -0500
IronPort-SDR: hIKufqaBf61eXI1S68LZbO+GDfxnRwwH0Fl3fcUJIqzqr7vmdpy28sSPY1XeUqSZGEojM2ymjT
 Rn8zciwPACgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="235460676"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="235460676"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 01:28:00 -0800
IronPort-SDR: p+/JsKho2B+Y1GSO717BDW92gaBrq64HzZxu+SkoOpFYQMYpFRyy+jY2LiT/DmiWKwTCdhhAUX
 czHMHUr54s4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="552165887"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga005.jf.intel.com with ESMTP; 08 Dec 2020 01:27:58 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Tejas Joglekar <joglekar@synopsys.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/5] usb: xhci: Set quirk for XHCI_SG_TRB_CACHE_SIZE_QUIRK
Date:   Tue,  8 Dec 2020 11:29:08 +0200
Message-Id: <20201208092912.1773650-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208092912.1773650-1-mathias.nyman@linux.intel.com>
References: <20201208092912.1773650-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tejas Joglekar <Tejas.Joglekar@synopsys.com>

This commit uses the private data passed by parent device
to set the quirk for Synopsys xHC. This patch fixes the
SNPS xHC hang issue when the data is scattered across
small buffers which does not make atleast MPS size for
given TRB cache size of SNPS xHC.

Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 drivers/usb/host/xhci.h      | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index aa2d35f98200..4d34f6005381 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -333,6 +333,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
 		hcd->skip_phy_initialization = 1;
 
+	if (priv && (priv->quirks & XHCI_SG_TRB_CACHE_SIZE_QUIRK))
+		xhci->quirks |= XHCI_SG_TRB_CACHE_SIZE_QUIRK;
+
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto disable_usb_phy;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ebb359ebb261..d90c0d5df3b3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1878,6 +1878,7 @@ struct xhci_hcd {
 #define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
 #define XHCI_SKIP_PHY_INIT	BIT_ULL(37)
 #define XHCI_DISABLE_SPARSE	BIT_ULL(38)
+#define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(39)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.25.1


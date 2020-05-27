Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63731E3F4E
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 12:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729963AbgE0Kn1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 06:43:27 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35318 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729354AbgE0Kn1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 06:43:27 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8E5B44095E;
        Wed, 27 May 2020 10:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1590576206; bh=mhcwbkE2f7Vc6KcigKXQ2SD2KBjY2NCf0dZqTLcGO6k=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=lPwTUSjG9ns52grm0NCYzaQvmhsxw+n6hCo14gAkL8mTbQ/WWfop5iDoKMFs/VLFP
         WJBc0+d/TMCjDR4Rl1Irc1XinTrGNZZ+PIXoMbJhr19tQhmRMZHhH8/debhSbUZkcV
         GW703sShEcJhJfEyJKPvSkGLdlA2PC9ASdP+3z9wuE2ZfKfeXVjm4SVfefQ3BDVwx8
         9swPDO5c316PsLJsHBwev1bSa4QuFgMh+uFFDVDpIReCS9M3BW4mx7RAJzanPw9mEz
         ziCDe9CSy3Y54Jpj5+MTacirMKtpLkp70lkF3VHIXhW5xW+mMsUZkuMNbGxmX3ugRt
         Blk58fOURu1vQ==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.20.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id E438EA005B;
        Wed, 27 May 2020 10:43:22 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Wed, 27 May 2020 16:11:20 +0530
Date:   Wed, 27 May 2020 16:11:20 +0530
Message-Id: <b9343b4ad5d4b0d446c045652a78ea08ff3d801e.1590415123.git.joglekar@synopsys.com>
In-Reply-To: <cover.1590415123.git.joglekar@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [PATCH v3 2/4] usb: xhci: Set quirk for XHCI_SG_TRB_CACHE_SIZE_QUIRK
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit enables the sgl-trb-cache-size-quirk property is set
for the Synopsys xHC. This patch fixes the SNPS xHC hang issue
when the data is scattered across small buffers which does not make
atleast MPS size for given TRB cache size of SNPS xHC.

Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
---
 drivers/usb/host/xhci-pci.c  | 3 +++
 drivers/usb/host/xhci-plat.c | 4 ++++
 drivers/usb/host/xhci.h      | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 766b74723e64..05b743a819ac 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -268,6 +268,9 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	     pdev->device == 0x9026)
 		xhci->quirks |= XHCI_RESET_PLL_ON_DISCONNECT;
 
+	if (pdev->vendor == PCI_VENDOR_ID_SYNOPSYS)
+		xhci->quirks |= XHCI_SG_TRB_CACHE_SIZE_QUIRK;
+
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"QUIRK: Resetting on resume");
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 1d4f6f85f0fe..a8526fe50811 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -288,6 +288,10 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
 			xhci->quirks |= XHCI_BROKEN_PORT_PED;
 
+		if (device_property_read_bool(tmpdev,
+					      "sgl-trb-cache-size-quirk"))
+			xhci->quirks |= XHCI_SG_TRB_CACHE_SIZE_QUIRK;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 	}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 86cfefdd6632..69e3587e805c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1873,6 +1873,7 @@ struct xhci_hcd {
 #define XHCI_DEFAULT_PM_RUNTIME_ALLOW	BIT_ULL(33)
 #define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
+#define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(36)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.11.0


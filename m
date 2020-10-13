Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FC328CE91
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 14:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgJMMng (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Oct 2020 08:43:36 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46148 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727077AbgJMMng (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Oct 2020 08:43:36 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3F039C0347;
        Tue, 13 Oct 2020 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1602593015; bh=4Udne1lH1gThm+TGjds0gt6XwZADS/jIPmac14sXZlY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=F7MlkGaDHurSHOSLQknp8mvuJOy+Apbm2no+m004eCcmV92KXdRCJe3p4kJVMqlUy
         SUr9MKIyvwt28OI7pbZiBcMSWwxaiYkcYKjCEzcq+G/RZjdfDM4SLUVOmfApD41sgw
         mbdJRcZez78Okt5Xbi/3/qQo0BZ+sJ1fB2d3HvBYIPF+hJwVokz7BumViXciEJ4sCX
         cZqihPUhpqhlDRw5MVkuaDflrjzrEC35458TTbTE1FNcQtPBOdFfZN1BD0tAGaFJt+
         HYyv5949UfwDcRm+ytxNBolOdm1H+Sq1fxi41LV7QfHqnPquNrMOjGOsc2+mVe76n2
         cbRjzVb1R/7Tg==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.18.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id AC66BA005E;
        Tue, 13 Oct 2020 12:43:31 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Tue, 13 Oct 2020 18:13:29 +0530
Date:   Tue, 13 Oct 2020 18:13:29 +0530
Message-Id: <42caec038cda7cbf358404b86fb5b683f929e2c1.1602592488.git.joglekar@synopsys.com>
In-Reply-To: <cover.1602592488.git.joglekar@synopsys.com>
References: <cover.1602592488.git.joglekar@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [PATCH v4 1/3] usb: xhci: Set quirk for XHCI_SG_TRB_CACHE_SIZE_QUIRK
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit uses the private data passed by parent device
to set the quirk for Synopsys xHC. This patch fixes the
SNPS xHC hang issue when the data is scattered across
small buffers which does not make atleast MPS size for
given TRB cache size of SNPS xHC.

Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
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
index 8be88379c0fb..f8e453a2674d 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1877,6 +1877,7 @@ struct xhci_hcd {
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
 #define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
 #define XHCI_SKIP_PHY_INIT	BIT_ULL(37)
+#define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(38)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.28.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C072C10D1
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 17:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388649AbgKWQiS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 11:38:18 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54958 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732569AbgKWQiS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 11:38:18 -0500
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2D8DD40B20;
        Mon, 23 Nov 2020 16:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1606149497; bh=4NKZ7ABlYR79Aaz9WWn9+DAGQ8++dQmunbcA6dfD2ZM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=SbDrDncflNzTxF3BiKJeAtfM2v8I+/Tx0ozDgiecP/lNQ7S/yGz6O0KGl+r/cfNE5
         2ai4wliS1V69ZBN9lBWzy1Dh8Ib6AEhYiddkcM2HrBmDyyB6VfuQ3ovw2816T0sLXM
         E1qFK8l8Uo4LFbFQ5lNnyPCXqy7Zt3lc6ED+w2AvstQ6qSAgYykbrhJoxQE+fP79v4
         k99nPCQVkoY8X/eCGeYB9exSo1ha8zJaHh9N202q/qKoPdT1RHqsQnv0hiM7UtA8q3
         xdQbd+/LrPuGOyNLWvrS5H6eprWVdQWx+60PYpkm6cAuBVo+jCySWvKeQysRMte46c
         +pbXDN7WEinAA==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.24.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 4305EA005C;
        Mon, 23 Nov 2020 16:38:12 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Mon, 23 Nov 2020 22:08:11 +0530
Date:   Mon, 23 Nov 2020 22:08:11 +0530
Message-Id: <20e54d9301d9ff5f8485f5da381605d5d00640bc.1606149078.git.joglekar@synopsys.com>
In-Reply-To: <cover.1606149078.git.joglekar@synopsys.com>
References: <cover.1606149078.git.joglekar@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [PATCH v6 1/3] usb: xhci: Set quirk for XHCI_SG_TRB_CACHE_SIZE_QUIRK
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
2.28.0


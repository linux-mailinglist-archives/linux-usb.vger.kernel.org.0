Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9852905AC
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 15:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408014AbgJPNFB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Oct 2020 09:05:01 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:60876 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2408012AbgJPNFA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Oct 2020 09:05:00 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 33A60C088A;
        Fri, 16 Oct 2020 13:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1602853500; bh=4Udne1lH1gThm+TGjds0gt6XwZADS/jIPmac14sXZlY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=O53Ru/fCAD+qd7AuIUqmJhO/f6yTWHMg1s+88IJsVbB5bLqJQm48QmyJPeh8bk/5K
         jF+8KQTMgaRw6NTf2kmcqa1I+JaR1swwzh4UxjM7i4jyFhlp/y4keWg5u4UGzKOfoC
         zn/2ikZ0iXtTCkQIbOm8+YBxUA4b8O4gY+IgYGw0sUpG80W6ozQXtqMJeiQXLEzove
         IqQieO7FWpOXh1tyshSjTVopO3hcydrfZpW4jl1DnWJSiTzE8WJkX4vYPBxW0hVb+g
         KHuNfQ6QfkE2lzQgHEL8Ct4vwJtLkVMYzCTUMALvxj7yQ16HKiUjcd2ZaRgbWuAUSm
         yg4CkapPs20ww==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.27.183])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id D36DEA005C;
        Fri, 16 Oct 2020 13:04:56 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Fri, 16 Oct 2020 18:34:54 +0530
Date:   Fri, 16 Oct 2020 18:34:54 +0530
Message-Id: <42caec038cda7cbf358404b86fb5b683f929e2c1.1602853270.git.joglekar@synopsys.com>
In-Reply-To: <cover.1602853270.git.joglekar@synopsys.com>
References: <cover.1602853270.git.joglekar@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [PATCH v5 1/3] usb: xhci: Set quirk for XHCI_SG_TRB_CACHE_SIZE_QUIRK
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


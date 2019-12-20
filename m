Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDAEC127BD8
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 14:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfLTNkG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Dec 2019 08:40:06 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:44086 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727344AbfLTNkG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Dec 2019 08:40:06 -0500
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A205440623;
        Fri, 20 Dec 2019 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576849205; bh=uJiZRqMwhGw7kQiiZQdtYhs/3k8oGogSFL7VS9u4WPE=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=E0XvKdLMYzelBGWe54SHDnJugvD36j/0eJS8iUn64DVHL7kMTYHwftWkX4FyYmEXd
         bSrzNNbpeqDmBm9syNe2RS9dPSM/SQBs86M4qoVHyt9ReWuBB8s0MeaSku5Q0tELBB
         mwyX1bGoTpTIs4expwxkjb5SwKfUb0DrWDX3yJgEALxla2XKXCAnMkidRelwJtPZPg
         kuujvIMhVVrtEw4M5AGrPqH6Ue8CJsC0UvpdOC9R5yl/jpZ6jBcjLblhRIjnR2kRol
         s4+PXbH6dr+iTtaM1KtklcNZBBTY/vuY3kSqdJPL8tXbIqM5gMIsqeRxbSpzCewzl2
         +6/zGy02J1IXw==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.144.133.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 8FBE8A0063;
        Fri, 20 Dec 2019 13:40:02 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Fri, 20 Dec 2019 19:10:00 +0530
Date:   Fri, 20 Dec 2019 19:10:00 +0530
Message-Id: <a391fb1bab2ac3abea664d11570ff3feefb4c934.1576848504.git.joglekar@synopsys.com>
In-Reply-To: <cover.1576848504.git.joglekar@synopsys.com>
References: <cover.1576848504.git.joglekar@synopsys.com>
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [RFC PATCH 3/4] usb: xhci: Set quirk for XHCI_CONSOLIDATE_TRBS
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit enables the quirk when the consolidate_trbs property is set
for the Synopsys xHC. TRB cache errata fixes the SNPS xHC hang issue
when the data is scattered across small buffers which does not make
atleast MPS size for given TRB cache size of SNPS xHC.

Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
---
 drivers/usb/host/xhci-pci.c  | 3 +++
 drivers/usb/host/xhci-plat.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 2907fe4d78dd..74f82e67499a 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -260,6 +260,9 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	     pdev->device == 0x9026)
 		xhci->quirks |= XHCI_RESET_PLL_ON_DISCONNECT;
 
+	if (pdev->vendor == PCI_VENDOR_ID_SYNOPSYS)
+		xhci->quirks |= XHCI_CONSOLIDATE_TRBS;
+
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"QUIRK: Resetting on resume");
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index d90cd5ec09cf..a6f0e7e3d660 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -289,6 +289,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
 			xhci->quirks |= XHCI_BROKEN_PORT_PED;
 
+		if (device_property_read_bool(tmpdev, "consolidate-trbs"))
+			xhci->quirks |= XHCI_CONSOLIDATE_TRBS;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 	}
-- 
2.11.0


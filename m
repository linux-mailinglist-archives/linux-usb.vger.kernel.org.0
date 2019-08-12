Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73ABA897B6
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 09:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbfHLHZD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 03:25:03 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:3627 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfHLHZC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Aug 2019 03:25:02 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d5114500000>; Mon, 12 Aug 2019 00:25:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 12 Aug 2019 00:25:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 12 Aug 2019 00:25:02 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 12 Aug
 2019 07:25:01 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 12 Aug
 2019 07:25:01 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 12 Aug 2019 07:25:01 +0000
Received: from ubuntu.localdomain (Not Verified[10.19.108.201]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d51144c0000>; Mon, 12 Aug 2019 00:25:01 -0700
From:   Rick Tseng <rtseng@nvidia.com>
To:     <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Rick <rtseng@nvidia.com>
Subject: [PATCH] xhci: wait CNR when doing xhci resume
Date:   Mon, 12 Aug 2019 15:24:52 +0800
Message-ID: <1565594692-23683-1-git-send-email-rtseng@nvidia.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1565594704; bh=0LoRbonWYPQwQZ59xAyQGmB7PIxkomR5YIy3rnbO1Pg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=P6N6QItJ3RqhGM8Tr94wylIlDYXaeL2xoLHCFbTRVYXxZC+qlqkVv9oVu9rCRABuc
         GdM+jr4n9AuTKyFnB3JPfwjgFgV12HW0yJhgMFXsR1ExLO966wAGv/iD95NIDobVCf
         HrskqsP3bzy/IEdD1OoUGFef8kpLiIZfdib5mcfSaUMsi0CeKrgWamoCz/GM+/PVuw
         xrloCGRQxrvZILkaxcZfc533goK1bbL8wmYRPq1TcrUSEkjhf2cCjuJhTIfENfBwwL
         1HLo9hD1/j7xjDtYYjmN3H2brObieDYXGOPvNv02HAQkRZINl2mhc+JLSOddMVg8xE
         Gv+M8jwShG9cw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Rick <rtseng@nvidia.com>

NVIDIA 3.1 xHCI card would lose power when moving power state into D3Cold.
Thus we need to wait CNR bit to clear when xhci resmue as xhci init.

Signed-off-by: Rick <rtseng@nvidia.com>
---
 drivers/usb/host/xhci-pci.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 1e0236e..857ad8a 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/iopoll.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -455,6 +456,19 @@ static void xhci_pme_quirk(struct usb_hcd *hcd)
 	readl(reg);
 }
 
+static int xhci_poll_cnr(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	void __iomem *reg = &xhci->op_regs->status;
+	u32 result;
+	int ret;
+
+	ret = readl_poll_timeout_atomic(reg, result,
+					(result & STS_CNR) == 0,
+					1, 100 * 1000);
+	return ret;
+}
+
 static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 {
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
@@ -508,6 +522,12 @@ static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL)
 		usb_enable_intel_xhci_ports(pdev);
 
+	if (pdev->vendor == PCI_VENDOR_ID_NVIDIA) {
+		retval = xhci_poll_cnr(hcd);
+		if (retval != 0)
+			return retval;
+	}
+
 	if (xhci->quirks & XHCI_SSIC_PORT_UNUSED)
 		xhci_ssic_port_unused_quirk(hcd, false);
 
-- 
2.1.4


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------

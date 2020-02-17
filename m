Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD8B161893
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 18:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729084AbgBQRMJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 12:12:09 -0500
Received: from 6.mo179.mail-out.ovh.net ([46.105.56.76]:50777 "EHLO
        6.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgBQRMI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 12:12:08 -0500
Received: from player789.ha.ovh.net (unknown [10.110.115.195])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id 3B8E3159615
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 17:54:22 +0100 (CET)
Received: from mattea.info (host221-23-dynamic.248-95-r.retail.telecomitalia.it [95.248.23.221])
        (Authenticated sender: relay@mattea.info)
        by player789.ha.ovh.net (Postfix) with ESMTPSA id D6B92F7F5593;
        Mon, 17 Feb 2020 16:54:20 +0000 (UTC)
Received: from alby.localnet (unknown [IPv6:fc00::9dc0:b1ba:2995:58a5])
        by i-m-services.net (Postfix) with ESMTP id 27D192CE3EF;
        Mon, 17 Feb 2020 17:54:20 +0100 (CET)
From:   Alberto Mattea <alberto@mattea.info>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH resend] usb: xhci: apply XHCI_SUSPEND_DELAY to AMD XHCI controller 1022:145c
Date:   Mon, 17 Feb 2020 17:54:19 +0100
Message-ID: <5338586.DvuYhMxLoT@alby>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Ovh-Tracer-Id: 14212797477772918645
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrjeeigdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkfgggfgtsehtufertddttddvnecuhfhrohhmpeetlhgsvghrthhoucforghtthgvrgcuoegrlhgsvghrthhosehmrghtthgvrgdrihhnfhhoqeenucfkpheptddrtddrtddrtddpfhgttddtmeemlegutgdtmegsudgsrgemvdelleehmeehkegrheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejkeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprghlsggvrhhtohesmhgrthhtvggrrdhinhhfohdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This controller timeouts during suspend (S3) with
[  240.521724] xhci_hcd 0000:30:00.3: WARN: xHC save state timeout
[  240.521729] xhci_hcd 0000:30:00.3: ERROR mismatched command completion event
thus preventing the system from entering S3.
Moreover it remains in an undefined state where some connected devices stop
working until a reboot.
Apply the XHCI_SUSPEND_DELAY quirk to make it suspend properly.

Signed-off-by: Alberto Mattea <alberto@mattea.info>
---
 drivers/usb/host/xhci-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 4917c5b033fa..1533310b3d6b 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -135,7 +135,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		xhci->quirks |= XHCI_AMD_PLL_FIX;
 
 	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
-		(pdev->device == 0x15e0 ||
+		(pdev->device == 0x145c ||
+		 pdev->device == 0x15e0 ||
 		 pdev->device == 0x15e1 ||
 		 pdev->device == 0x43bb))
 		xhci->quirks |= XHCI_SUSPEND_DELAY;
-- 
2.17.1



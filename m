Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1DE61616DE
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 17:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbgBQQAZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 11:00:25 -0500
Received: from 5.mo69.mail-out.ovh.net ([46.105.43.105]:34116 "EHLO
        5.mo69.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727277AbgBQQAY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 11:00:24 -0500
Received: from player794.ha.ovh.net (unknown [10.110.103.76])
        by mo69.mail-out.ovh.net (Postfix) with ESMTP id 556D382FE7
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 16:21:54 +0100 (CET)
Received: from mattea.info (host221-23-dynamic.248-95-r.retail.telecomitalia.it [95.248.23.221])
        (Authenticated sender: relay@mattea.info)
        by player794.ha.ovh.net (Postfix) with ESMTPSA id DEB5BC73F1A2;
        Mon, 17 Feb 2020 15:21:52 +0000 (UTC)
Received: from alby.localnet (unknown [IPv6:fc00::fd04:4cb0:8b91:50])
        by i-m-services.net (Postfix) with ESMTP id D033A2CE3EF;
        Mon, 17 Feb 2020 16:21:50 +0100 (CET)
From:   Alberto Mattea <alberto@mattea.info>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: xhci: apply XHCI_SUSPEND_DELAY to AMD XHCI controller 1022:145c
Date:   Mon, 17 Feb 2020 16:21:50 +0100
Message-ID: <5340061.DvuYhMxLoT@alby>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Ovh-Tracer-Id: 12651174307050553205
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrjeeigdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkggfgtgesthfuredttddtvdenucfhrhhomheptehlsggvrhhtohcuofgrthhtvggruceorghlsggvrhhtohesmhgrthhtvggrrdhinhhfoheqnecukfhppedtrddtrddtrddtpdhftgdttdemmehfugdtgeemgegtsgdtmeeksgeludemhedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrlhgsvghrthhosehmrghtthgvrgdrihhnfhhopdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes suspend/resume

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



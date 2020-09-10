Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0949B2652E9
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 23:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgIJV0D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 17:26:03 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:49516 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgIJVZ0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Sep 2020 17:25:26 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 744F084487;
        Fri, 11 Sep 2020 09:25:23 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599773123;
        bh=v6J8elKSG/pZnMDANq/wlrJBwqjPYhwoxacNowboLko=;
        h=From:To:Cc:Subject:Date;
        b=oekX5nSj3IDBsfUVB1G9ANL++TLwXsrqfzTT/AUqJXqY9cm1/qmH7ZwAlBhvrhRns
         tDudCy48H5JTWxTCUl0IE0MDbuZeKwyrsPnzaRlXo1Iiyi69bdB7L3uJ8xHfdNyo2G
         8bHxc3PDbFqYTbzVL1rKwzRo/PRzvcBvYIt73ZmDAvss8TcxgR+vhTCFPfbUFGCO/7
         vAGob2+gr8oqCz6hHOFGpWOCLEpEYNO46K1qkW+EoCbzT3DFCExoOqSFqMBSXoS72s
         FSWrJpmQ9A6wQ+zVxGzcBzfBVMK4+t61/HST/LwF2QL/bMfPG3Va67szdLekPOQtoN
         PZkD2z4EyazZw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f5a99c10000>; Fri, 11 Sep 2020 09:25:21 +1200
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.30])
        by smtp (Postfix) with ESMTP id DC66813EEB7;
        Fri, 11 Sep 2020 09:25:21 +1200 (NZST)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id 37F472A2AB9; Fri, 11 Sep 2020 09:25:23 +1200 (NZST)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH v2 1/2] usb: ohci: Default to per-port over-current protection
Date:   Fri, 11 Sep 2020 09:25:11 +1200
Message-Id: <20200910212512.16670-1-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some integrated OHCI controller hubs do not expose all ports of the hub
to pins on the SoC. In some cases the unconnected ports generate
spurious over-current events. For example the Broadcom 56060/Ranger 2 SoC
contains a nominally 3 port hub but only the first port is wired.

Default behaviour for ohci-platform driver is to use global over-current
protection mode (AKA "ganged"). This leads to the spurious over-current
events affecting all ports in the hub.

We now alter the default to use per-port over-current protection.

This patch results in the following configuration changes depending
on quirks:
- For quirk OHCI_QUIRK_SUPERIO no changes. These systems remain set up
  for ganged power switching and no over-current protection.
- For quirk OHCI_QUIRK_AMD756 or OHCI_QUIRK_HUB_POWER power switching
  remains at none, while over-current protection is now guaranteed to be
  set to per-port rather than the previous behaviour where it was either
  none or global over-current protection depending on the value at
  function entry.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - remove clearing of RH_A_PSM in OHCI_QUIRK_HUB_POWER block.

 drivers/usb/host/ohci-hcd.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index dd37e77dae00..2845ea328a06 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -673,20 +673,24 @@ static int ohci_run (struct ohci_hcd *ohci)
=20
 	/* handle root hub init quirks ... */
 	val =3D roothub_a (ohci);
-	val &=3D ~(RH_A_PSM | RH_A_OCPM);
+	/* Configure for per-port over-current protection by default */
+	val &=3D ~RH_A_NOCP;
+	val |=3D RH_A_OCPM;
 	if (ohci->flags & OHCI_QUIRK_SUPERIO) {
-		/* NSC 87560 and maybe others */
+		/* NSC 87560 and maybe others.
+		 * Ganged power switching, no over-current protection.
+		 */
 		val |=3D RH_A_NOCP;
-		val &=3D ~(RH_A_POTPGT | RH_A_NPS);
-		ohci_writel (ohci, val, &ohci->regs->roothub.a);
+		val &=3D ~(RH_A_POTPGT | RH_A_NPS | RH_A_PSM | RH_A_OCPM);
 	} else if ((ohci->flags & OHCI_QUIRK_AMD756) ||
 			(ohci->flags & OHCI_QUIRK_HUB_POWER)) {
 		/* hub power always on; required for AMD-756 and some
-		 * Mac platforms.  ganged overcurrent reporting, if any.
+		 * Mac platforms.
 		 */
 		val |=3D RH_A_NPS;
-		ohci_writel (ohci, val, &ohci->regs->roothub.a);
 	}
+	ohci_writel(ohci, val, &ohci->regs->roothub.a);
+
 	ohci_writel (ohci, RH_HS_LPSC, &ohci->regs->roothub.status);
 	ohci_writel (ohci, (val & RH_A_NPS) ? 0 : RH_B_PPCM,
 						&ohci->regs->roothub.b);
--=20
2.28.0


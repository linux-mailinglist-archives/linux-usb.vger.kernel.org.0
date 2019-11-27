Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50F1710B27C
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2019 16:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfK0Pec (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Nov 2019 10:34:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:48964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726634AbfK0Pec (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 Nov 2019 10:34:32 -0500
Received: from localhost.localdomain (laubervilliers-657-1-83-120.w92-154.abo.wanadoo.fr [92.154.90.120])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C718120674;
        Wed, 27 Nov 2019 15:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574868871;
        bh=FfbdKllQDnkZD4QyuZi0M3fsdqc7yCEQncfHcxcQzik=;
        h=From:To:Cc:Subject:Date:From;
        b=F7UYeNp5wF0QL4Spk/psqMHKRX+3VN2RIXRUrQcPXbPVsJJyUG5m9sMPaIeGRAf91
         jMuhzSIOP6N+/lOySV0W1a0biwZSiQxQC3cJvraCZJKoHzJvHIEAmzyGo3ofVucSB/
         gyDFMIybnjxsagJMBJuEQmdsT+Ivm3imwlInpz2Y=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] xhci: enable XHCI_TRUST_TX_LENGTH quirk for ThunderX2 builtin hosts
Date:   Wed, 27 Nov 2019 16:30:15 +0100
Message-Id: <20191127153015.58171-1-ardb@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When using a USB webcam on a ThunderX2 workstation, the kernel log
gets flooded with messages like

  xhci_hcd 0000:00:0f.0:
  WARN Successful completion on short TX for slot 7 ep 2: needs XHCI_TRUST_TX_LENGTH quirk?

Enabling the quirk manually makes the issue go away, so let's enable
it unconditionally for this hardware.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/usb/host/xhci-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 1e0236e90687..331b5900dd72 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -256,7 +256,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if ((pdev->vendor == PCI_VENDOR_ID_BROADCOM ||
 	     pdev->vendor == PCI_VENDOR_ID_CAVIUM) &&
 	     pdev->device == 0x9026)
-		xhci->quirks |= XHCI_RESET_PLL_ON_DISCONNECT;
+		xhci->quirks |= XHCI_RESET_PLL_ON_DISCONNECT |
+				XHCI_TRUST_TX_LENGTH;
 
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
-- 
2.20.1


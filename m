Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5013160B9
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 09:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233766AbhBJIOR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 03:14:17 -0500
Received: from mx3.wp.pl ([212.77.101.9]:34171 "EHLO mx3.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233896AbhBJIN6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Feb 2021 03:13:58 -0500
Received: (wp-smtpd smtp.wp.pl 7948 invoked from network); 10 Feb 2021 09:12:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1612944775; bh=x3BaN4Vk8cQL5WLocGqZkkvllFU8btuOwXAIpAL9bYE=;
          h=From:To:Cc:Subject;
          b=P+JpvJ2xG932+ZxVFEsKcJD7ZmopdOO+gwrKXmvC36GuwG+n5Fm2Z9h8L9Ua48y6n
           KqNIyzsyGW2XxZtFc5o3VJI+F4HcNBY5uVvqtWSqrOTBKo/meWaj89mgUDJ+NgZpOE
           3e4H9gk1jzwX///LF1j62eNzc6+yZ8rcChKroNYA=
Received: from ip4-46-39-164-204.cust.nbox.cz (HELO localhost) (stf_xl@wp.pl@[46.39.164.204])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linux-usb@vger.kernel.org>; 10 Feb 2021 09:12:55 +0100
From:   stf_xl@wp.pl
To:     linux-usb@vger.kernel.org
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Bernhard <bernhard.gebetsberger@gmx.at>,
        Michael <ZeroBeat@gmx.de>, Greg KH <greg@kroah.com>
Subject: [PATCH v2] usb: xhci: do not perform Soft Retry for some xHCI hosts
Date:   Wed, 10 Feb 2021 09:12:54 +0100
Message-Id: <20210210081254.33734-1-stf_xl@wp.pl>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: f9e00bef36f4d0a47de257e2de8a9f24
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000002 [AYHA]                               
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Stanislaw Gruszka <stf_xl@wp.pl>

Since f8f80be501aa ("xhci: Use soft retry to recover faster from
transaction errors") on some systems rt2800usb and mt7601u devices
are unable to operate. Possible reason is that some xHCI hardware
can not perform Soft Retry for those devices correctly.

To avoid the problem add xhci->quirks flag that restore pre f8f80be501aa
xhci behaviour for affected xHCI controllers. Currently those are
AMD_PROMONTORYA_4 and AMD_PROMONTORYA_2, since it was confirmed
by the users: on those xHCI hosts issue happen and is gone after
disabling Soft Retry.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=202541
Fixes: f8f80be501aa ("xhci: Use soft retry to recover faster from transaction errors")
Reported-and-tested-by: Bernhard <bernhard.gebetsberger@gmx.at>
Bisected-by: Bernhard <bernhard.gebetsberger@gmx.at>
Signed-off-by: Stanislaw Gruszka <stf_xl@wp.pl>
---
v1 -> v2:
compared to previous patch:
https://lore.kernel.org/linux-usb/20210122104342.12451-1-stf_xl@wp.pl/t/#u
now we use xhci->quirks to disable Soft Retry (I also changed topic
to reflect the change).

 drivers/usb/host/xhci-pci.c  | 5 +++++
 drivers/usb/host/xhci-ring.c | 3 ++-
 drivers/usb/host/xhci.h      | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 84da8406d5b4..1f989a49c8c6 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -295,6 +295,11 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	     pdev->device == 0x9026)
 		xhci->quirks |= XHCI_RESET_PLL_ON_DISCONNECT;
 
+	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
+	    (pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_2 ||
+	     pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_4))
+		xhci->quirks |= XHCI_NO_SOFT_RETRY;
+
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"QUIRK: Resetting on resume");
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5677b81c0915..12d2ff2550b2 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2302,7 +2302,8 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_td *td,
 		remaining	= 0;
 		break;
 	case COMP_USB_TRANSACTION_ERROR:
-		if ((ep_ring->err_count++ > MAX_SOFT_RETRY) ||
+		if (xhci->quirks & XHCI_NO_SOFT_RETRY ||
+		    (ep_ring->err_count++ > MAX_SOFT_RETRY) ||
 		    le32_to_cpu(slot_ctx->tt_info) & TT_SLOT)
 			break;
 		*status = 0;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 25e57bc9c3cc..0ddfde2780c9 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1883,6 +1883,7 @@ struct xhci_hcd {
 #define XHCI_SKIP_PHY_INIT	BIT_ULL(37)
 #define XHCI_DISABLE_SPARSE	BIT_ULL(38)
 #define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(39)
+#define XHCI_NO_SOFT_RETRY	BIT_ULL(40)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.25.4


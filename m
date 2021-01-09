Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C36C2F0091
	for <lists+linux-usb@lfdr.de>; Sat,  9 Jan 2021 15:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbhAIOsb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Jan 2021 09:48:31 -0500
Received: from mail.astralinux.ru ([217.74.38.120]:50485 "EHLO
        mail.astralinux.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbhAIOsa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Jan 2021 09:48:30 -0500
Received: from [95.24.186.126] (account ekorenevsky@astralinux.ru HELO himera.home)
  by astralinux.ru (CommuniGate Pro SMTP 6.3.4)
  with ESMTPSA id 2776747; Sat, 09 Jan 2021 17:46:21 +0300
Date:   Sat, 9 Jan 2021 17:47:36 +0300
From:   Eugene Korenevsky <ekorenevsky@astralinux.ru>
To:     linux-usb@vger.kernel.org
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] ehci: fix EHCI host controller initialization sequence
Message-ID: <20210109144736.GA4829@himera.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

According to EHCI spec, EHCI HC clears USBSTS.HCHalted whenever USBCMD.RS=1.
However, it is a good practice to wait some time after setting USBCMD.RS
(approximately 100ms) until USBSTS.HCHalted become zero.

Instead, previous version of ehci_run() wrote 1 to USBCMD.RS, issued read to
USBCMD and waited for 5 ms.
That worked incorrectly at least for VirtualBox's EHCI virtual HC and caused
accidental hangs.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=211095 
Signed-off-by: Eugene Korenevsky <ekorenevsky@astralinux.ru>
---
 drivers/usb/host/ehci-hcd.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index e358ae17d51e..490473af4906 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -574,6 +574,7 @@ static int ehci_run (struct usb_hcd *hcd)
 	struct ehci_hcd		*ehci = hcd_to_ehci (hcd);
 	u32			temp;
 	u32			hcc_params;
+	int			rc;
 
 	hcd->uses_new_polling = 1;
 
@@ -629,9 +630,18 @@ static int ehci_run (struct usb_hcd *hcd)
 	down_write(&ehci_cf_port_reset_rwsem);
 	ehci->rh_state = EHCI_RH_RUNNING;
 	ehci_writel(ehci, FLAG_CF, &ehci->regs->configured_flag);
-	ehci_readl(ehci, &ehci->regs->command);	/* unblock posted writes */
-	msleep(5);
+
+	/* Wait until HCD become operational */
+	rc = ehci_handshake(ehci, &ehci->regs->status, STS_HALT, 0, 100 * 1000);
+
 	up_write(&ehci_cf_port_reset_rwsem);
+
+	if (rc) {
+		ehci_err(ehci, "USB %x.%x, handshake error: %d\n",
+			 ((ehci->sbrn & 0xf0)>>4), (ehci->sbrn & 0x0f), rc);
+		return rc;
+	}
+
 	ehci->last_periodic_enable = ktime_get_real();
 
 	temp = HC_VERSION(ehci, ehci_readl(ehci, &ehci->caps->hc_capbase));
-- 
2.20.1


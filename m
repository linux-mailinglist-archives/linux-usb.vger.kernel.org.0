Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D803CAEAC
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jul 2021 23:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhGOVkr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jul 2021 17:40:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51468 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229794AbhGOVkr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jul 2021 17:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626385073;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=PTyNWG0uQbbHid6i64F1/HWwaOj8Onjm1wxDQwjCd0o=;
        b=QjJHRuwOntchbQFn3Eb2yYrUoHaP0iSFKlgt4N29ef6sxamLb433eIEDuT+wW0Nqcs5QTw
        sbaDeEXgSSI0dH7liC1woKJ6LZ9HprLd/Ez0Wd6EMDE5N8lQqNOVzmzT94kA4mj3/xEz8I
        q/wWw0+XedBGoT1a+/NbImCVUrI/XiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-268RSyLrOg-YxYr9H9OUZg-1; Thu, 15 Jul 2021 17:37:51 -0400
X-MC-Unique: 268RSyLrOg-YxYr9H9OUZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3330101F000;
        Thu, 15 Jul 2021 21:37:50 +0000 (UTC)
Received: from redhat (ovpn-116-53.rdu2.redhat.com [10.10.116.53])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 120E65D6AB;
        Thu, 15 Jul 2021 21:37:46 +0000 (UTC)
Date:   Thu, 15 Jul 2021 17:37:44 -0400
From:   David Jeffery <djeffery@redhat.com>
To:     linux-usb@vger.kernel.org
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurence Oberman <loberman@redhat.com>,
        Ewan Milne <emilne@redhat.com>, apanagio@redhat.com,
        torez@redhat.com
Subject: [PATCH V2] usb: ehci: Prevent missed ehci interrupts with
 edge-triggered MSI
Message-ID: <20210715213744.GA44506@redhat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When MSI is used by the ehci-hcd driver, it can cause lost interrupts which
results in EHCI only continuing to work due to a polling fallback. But the
reliance of polling drastically reduces performance of any I/O through EHCI.

Interrupts are lost as the EHCI interrupt handler does not safely handle
edge-triggered interrupts. It fails to ensure all interrupt status bits are
cleared, which works with level-triggered interrupts but not the
edge-triggered interrupts typical from using MSI.

To fix this problem, check if the driver may have raced with the hardware
setting additional interrupt status bits and clear status until it is in a
stable state.

Signed-off-by: David Jeffery <djeffery@redhat.com>
Tested-by: Laurence Oberman <loberman@redhat.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 306c54d0edb6 usb: hcd: Try MSI interrupts on PCI devices
---

 ehci-hcd.c |   18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

This is an alternative to reverting 306c54d0edb6ba94d39877524dddebaad7770cf2
which is the patch which allowed MSI to be used with EHCI and was tested
against latest 5.14. It should have all the requested cleanups from v1.

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 36f5bf6a0752..10b0365f3439 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -703,24 +703,28 @@ EXPORT_SYMBOL_GPL(ehci_setup);
 static irqreturn_t ehci_irq (struct usb_hcd *hcd)
 {
 	struct ehci_hcd		*ehci = hcd_to_ehci (hcd);
-	u32			status, masked_status, pcd_status = 0, cmd;
+	u32			status, current_status, masked_status, pcd_status = 0;
+	u32			cmd;
 	int			bh;
 
 	spin_lock(&ehci->lock);
 
-	status = ehci_readl(ehci, &ehci->regs->status);
+	status = 0;
+	current_status = ehci_readl(ehci, &ehci->regs->status);
+restart:
 
 	/* e.g. cardbus physical eject */
-	if (status == ~(u32) 0) {
+	if (current_status == ~(u32) 0) {
 		ehci_dbg (ehci, "device removed\n");
 		goto dead;
 	}
+	status |= current_status;
 
 	/*
 	 * We don't use STS_FLR, but some controllers don't like it to
 	 * remain on, so mask it out along with the other status bits.
 	 */
-	masked_status = status & (INTR_MASK | STS_FLR);
+	masked_status = current_status & (INTR_MASK | STS_FLR);
 
 	/* Shared IRQ? */
 	if (!masked_status || unlikely(ehci->rh_state == EHCI_RH_HALTED)) {
@@ -730,6 +734,12 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
 
 	/* clear (just) interrupts */
 	ehci_writel(ehci, masked_status, &ehci->regs->status);
+
+	/* For edge interrupts, don't race with an interrupt bit being raised */
+	current_status = ehci_readl(ehci, &ehci->regs->status);
+	if (current_status & INTR_MASK)
+		goto restart;
+
 	cmd = ehci_readl(ehci, &ehci->regs->command);
 	bh = 0;
 


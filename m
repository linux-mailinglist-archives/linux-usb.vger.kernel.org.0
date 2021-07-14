Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C783C85BC
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 16:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhGNOGS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 10:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30471 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231543AbhGNOGS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 10:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626271406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=94l++cA0QAIKvFrC85DXutzxOS74XAe2G7f/YPwRZQE=;
        b=eV2vnHZ7IPPkqHurKAMivleNIGawoNH5WAR0Hivz8H9ngrL+OziQp4KcJiP2UmYyGB/mA4
        YweOrGUehjNZw3iu2Z5+n/zw0nJ+hDRTGWHaPB/afmnhhdw1skFmspyfGNzQwvNRYa85y7
        bXH8ajT0+T1uA2dvbyjcNqX6Ow6j4ZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372--4tpSbiEPkOU2VoLAEg0Cw-1; Wed, 14 Jul 2021 10:03:23 -0400
X-MC-Unique: -4tpSbiEPkOU2VoLAEg0Cw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBA2F1023F4C;
        Wed, 14 Jul 2021 14:03:20 +0000 (UTC)
Received: from redhat (ovpn-117-33.rdu2.redhat.com [10.10.117.33])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D94F2C00F;
        Wed, 14 Jul 2021 14:03:11 +0000 (UTC)
Date:   Wed, 14 Jul 2021 10:03:09 -0400
From:   David Jeffery <djeffery@redhat.com>
To:     linux-usb@vger.kernel.org
Cc:     loberman@redhat.com, andriy.shevchenko@linux.intel.com,
        emilne@redhat.com, apanagio@redhat.com, torez@redhat.com
Subject: [PATCH] usb: ehci: Prevent missed ehci interrupts with
 edge-triggered MSI
Message-ID: <20210714140309.GA27799@redhat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When MSI is used by the ehci driver, it can cause interrupts to be lost which
results in ehci only continuing to work due to its polling fallback.  But the
reliance of polling drasticly reduces performance of any I/O through ehci.

Interrupts are lost as ehci's interrupt handler does not safely handle
edge-triggered interrupts.  It fails to ensure all interrupt status bits are
cleared, which works with level-triggered interrupts but not the 
edge-triggered interrupts typical from using MSI.

To fix this problem, check if the driver may have raced with the hardware
setting additional interrupt status bits and clear status until it is in a
stable state.

Signed-off-by: David Jeffery <djeffery@redhat.com>
Tested-by: Laurence Oberman <loberman@redhat.com>
---

This is an alternative to reverting 306c54d0edb6ba94d39877524dddebaad7770cf2
which is the patch that allowed MSI to be used with ehci.

 ehci-hcd.c |   16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 36f5bf6a0752..2283205d4b40 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -704,14 +704,18 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
 {
 	struct ehci_hcd		*ehci = hcd_to_ehci (hcd);
 	u32			status, masked_status, pcd_status = 0, cmd;
+	u32			current_status;
 	int			bh;
 
 	spin_lock(&ehci->lock);
 
-	status = ehci_readl(ehci, &ehci->regs->status);
+	status = 0;
 
+	current_status = ehci_readl(ehci, &ehci->regs->status);
+restart:
+	status |= current_status;
 	/* e.g. cardbus physical eject */
-	if (status == ~(u32) 0) {
+	if (current_status == ~(u32) 0) {
 		ehci_dbg (ehci, "device removed\n");
 		goto dead;
 	}
@@ -720,7 +724,7 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
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
+	/* for edge interrupts, don't race with an interrupt bit being raised */
+	current_status = ehci_readl(ehci, &ehci->regs->status);
+	if (current_status & INTR_MASK)
+		goto restart;
+
 	cmd = ehci_readl(ehci, &ehci->regs->command);
 	bh = 0;
 


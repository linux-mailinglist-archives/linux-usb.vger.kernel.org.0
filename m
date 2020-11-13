Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D182B26B2
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 22:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgKMV2F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 16:28:05 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:55278 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgKMV2D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 16:28:03 -0500
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1605302878;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=P4RP441BOauOir2Oa3cFxCUL2HeYPqIvw79teAEl2IE=;
        b=RLTez745BUb554hoMEOpms0BwRb5TUG79OAOKkkHkIfpU4h1CeEm0vRxsJM6frqAfIckFz
        xnYxoWLjxls2z3H86g4p85tS5wxwCmWXKpxsiIVlBR/Hc80zXkzj8spCBwHrL4ozcrxlxS
        TkHjcUReWYN8LJyOTm1KsFyoQz+PMiYQ8KbdrAJZuPNjO05bu7HeeIR+bz1sF7ncRmgfLN
        EWlHw8YkfkVN6/DRbDmRJYD4QIUg6RENF+iyxQfABDyUDYdM9zDoU0circFQe+R33B2/fB
        qeIveBlFj+X7Xp2EW6eVcC7fkjAzAm9OM4EmR+bHcJi5Y49bQnNLVkh0SV5vBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1605302878;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=P4RP441BOauOir2Oa3cFxCUL2HeYPqIvw79teAEl2IE=;
        b=2U6qppHWrxw/IGFK2bbnL4ZBhTyFfsTtigoKs0FMOLSzrBGWiJ/Am6bBradTbTJ6SDo67v
        wX94LOgDmYJ4DPCw==
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH] usb: Remove RUN_CONTEXT
Date:   Fri, 13 Nov 2020 22:27:04 +0100
Message-Id: <20201113212704.2243807-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The last user of RUN_CONTEXT was removed in commit
   97c17beb3b668 ("[PATCH] ehci-hcd (1/2):  portability (2.4), tasklet,")

There are no users of RUN_CONTEXT, remove it.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/usb/hcd.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 3dbb42c637c14..96281cd50ff66 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -734,10 +734,6 @@ static inline void usbmon_urb_complete(struct usb_bus =
*bus, struct urb *urb,
=20
 /* random stuff */
=20
-#define	RUN_CONTEXT (in_irq() ? "in_irq" \
-		: (in_interrupt() ? "in_interrupt" : "can sleep"))
-
-
 /* This rwsem is for use only by the hub driver and ehci-hcd.
  * Nobody else should touch it.
  */
--=20
2.29.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2179629DF72
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 02:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731523AbgJ2BBZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 21:01:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:60512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731518AbgJ1WR1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:27 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95329246C2;
        Wed, 28 Oct 2020 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603884621;
        bh=pAXgAGuha2+xKcRRbHLg1pp4yYs653DUA9/8tvcyqJM=;
        h=From:To:Cc:Subject:Date:From;
        b=pbO/aKwvINygU21CbJM27RRUr2nqjYlnmp0tIdNGuK8Ub6uKyG8oV/qYFIgzxR6vF
         Ejlw6u6iGu5EVhsjV4CTOdgvAP8OwamW5kshmWzeCH/zMFYm6/erH3Q6f/Lh4of5zg
         Np/LAf9d0d1xxKA65MxsR5B0I5Z3mbvz7gectOdM=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "Ahmed S . Darwish" <a.darwish@linutronix.de>
Subject: [PATCH] USB: host: isp1362: delete isp1362_show_regs()
Date:   Wed, 28 Oct 2020 12:31:07 +0100
Message-Id: <20201028113107.2007742-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No one is calling this function, so it's pointless to keep around as it
is triggering automated scanning tools to try to fix up the problems
with it using in_interrupt().

So delete the thing.

Reported-by: Thomas Gleixner <tglx@linutronix.de>
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reported-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/host/isp1362.h | 54 --------------------------------------
 1 file changed, 54 deletions(-)

diff --git a/drivers/usb/host/isp1362.h b/drivers/usb/host/isp1362.h
index 9bbfcc3fdd3c..208705b08d37 100644
--- a/drivers/usb/host/isp1362.h
+++ b/drivers/usb/host/isp1362.h
@@ -793,60 +793,6 @@ static void isp1362_write_fifo(struct isp1362_hcd *isp1362_hcd, void *buf, u16 l
 			ISP1362_REG_NO(ISP1362_REG_##r), isp1362_read_reg16(d, r));	\
 }
 
-static void __attribute__((__unused__)) isp1362_show_regs(struct isp1362_hcd *isp1362_hcd)
-{
-	isp1362_show_reg(isp1362_hcd, HCREVISION);
-	isp1362_show_reg(isp1362_hcd, HCCONTROL);
-	isp1362_show_reg(isp1362_hcd, HCCMDSTAT);
-	isp1362_show_reg(isp1362_hcd, HCINTSTAT);
-	isp1362_show_reg(isp1362_hcd, HCINTENB);
-	isp1362_show_reg(isp1362_hcd, HCFMINTVL);
-	isp1362_show_reg(isp1362_hcd, HCFMREM);
-	isp1362_show_reg(isp1362_hcd, HCFMNUM);
-	isp1362_show_reg(isp1362_hcd, HCLSTHRESH);
-	isp1362_show_reg(isp1362_hcd, HCRHDESCA);
-	isp1362_show_reg(isp1362_hcd, HCRHDESCB);
-	isp1362_show_reg(isp1362_hcd, HCRHSTATUS);
-	isp1362_show_reg(isp1362_hcd, HCRHPORT1);
-	isp1362_show_reg(isp1362_hcd, HCRHPORT2);
-
-	isp1362_show_reg(isp1362_hcd, HCHWCFG);
-	isp1362_show_reg(isp1362_hcd, HCDMACFG);
-	isp1362_show_reg(isp1362_hcd, HCXFERCTR);
-	isp1362_show_reg(isp1362_hcd, HCuPINT);
-
-	if (in_interrupt())
-		DBG(0, "%-12s[%02x]:     %04x\n", "HCuPINTENB",
-			 ISP1362_REG_NO(ISP1362_REG_HCuPINTENB), isp1362_hcd->irqenb);
-	else
-		isp1362_show_reg(isp1362_hcd, HCuPINTENB);
-	isp1362_show_reg(isp1362_hcd, HCCHIPID);
-	isp1362_show_reg(isp1362_hcd, HCSCRATCH);
-	isp1362_show_reg(isp1362_hcd, HCBUFSTAT);
-	isp1362_show_reg(isp1362_hcd, HCDIRADDR);
-	/* Access would advance fifo
-	 * isp1362_show_reg(isp1362_hcd, HCDIRDATA);
-	 */
-	isp1362_show_reg(isp1362_hcd, HCISTLBUFSZ);
-	isp1362_show_reg(isp1362_hcd, HCISTLRATE);
-	isp1362_show_reg(isp1362_hcd, HCINTLBUFSZ);
-	isp1362_show_reg(isp1362_hcd, HCINTLBLKSZ);
-	isp1362_show_reg(isp1362_hcd, HCINTLDONE);
-	isp1362_show_reg(isp1362_hcd, HCINTLSKIP);
-	isp1362_show_reg(isp1362_hcd, HCINTLLAST);
-	isp1362_show_reg(isp1362_hcd, HCINTLCURR);
-	isp1362_show_reg(isp1362_hcd, HCATLBUFSZ);
-	isp1362_show_reg(isp1362_hcd, HCATLBLKSZ);
-	/* only valid after ATL_DONE interrupt
-	 * isp1362_show_reg(isp1362_hcd, HCATLDONE);
-	 */
-	isp1362_show_reg(isp1362_hcd, HCATLSKIP);
-	isp1362_show_reg(isp1362_hcd, HCATLLAST);
-	isp1362_show_reg(isp1362_hcd, HCATLCURR);
-	isp1362_show_reg(isp1362_hcd, HCATLDTC);
-	isp1362_show_reg(isp1362_hcd, HCATLDTCTO);
-}
-
 static void isp1362_write_diraddr(struct isp1362_hcd *isp1362_hcd, u16 offset, u16 len)
 {
 	len = (len + 1) & ~1;
-- 
2.29.1


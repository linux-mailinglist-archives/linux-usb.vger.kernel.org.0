Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D0D3C69BD
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 07:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbhGMFfu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 01:35:50 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:54324 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231998AbhGMFft (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 01:35:49 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F02A8C06C4;
        Tue, 13 Jul 2021 05:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1626154380; bh=BcDTSCmIof6ULEzv2PG1WT0i1kmSYFFKt7S8F8AqXJA=;
        h=Date:From:Subject:To:Cc:From;
        b=DshZpaFjVE/lTkTb+KWHlIqy00jNDs7sRI9sef1krTlSHyyQpNOZJn6/Tf9flPxlu
         LSLdNrAxmIqVcZ70nMXqeoBrXa19dY61OTX4y0MKIIF6LdfJTgPrizCnb1UgNcVZcX
         EwrzLmWWOmvaF989Pi5PbyMpzI/kOKy9yPU31VUudqO+Smjyf5CNSwG2IFFQZ0nj6t
         o6OEl29+8ytiNnJiZZWed4i+qS8ao8y4zArzkR1aDavmrA+sCmRqwxTY8yzwGyrH0Z
         gXymV5hwQ/rKiffFDOkUs34RAwYgapWZieRlE7/LQ7TpdfBWjZ/S1B2QDHTiVCvXdz
         WvvaLj9EcGkqA==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.75.77])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 8A639A005C;
        Tue, 13 Jul 2021 05:32:56 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Tue, 13 Jul 2021 09:32:55 +0400
Date:   Tue, 13 Jul 2021 09:32:55 +0400
Message-Id: <e17fad802bbcaf879e1ed6745030993abb93baf8.1626152924.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v2] usb: dwc2: gadget: Fix GOUTNAK flow for Slave mode.
To:     John Youn <John.Youn@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Vahram Aharonyan <Vahram.Aharonyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Because of dwc2_hsotg_ep_stop_xfr() function uses poll
mode, first need to mask GINTSTS_GOUTNAKEFF interrupt.
In Slave mode GINTSTS_GOUTNAKEFF interrupt will be
aserted only after pop OUT NAK status packet from RxFIFO.

In dwc2_hsotg_ep_sethalt() function before setting
DCTL_SGOUTNAK need to unmask GOUTNAKEFF interrupt.

Tested by USBCV CH9 and MSC tests set in Slave, BDMA and DDMA.
All tests are passed.

Fixes: a4f827714539a ("usb: dwc2: gadget: Disable enabled HW endpoint in dwc2_hsotg_ep_disable")
Fixes: 6070636c4918c ("usb: dwc2: Fix Stalling a Non-Isochronous OUT EP")
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 Changes in v2:
 - Fix commit message formating

 drivers/usb/dwc2/gadget.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 7352f2720963..77d595738bdd 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3903,9 +3903,27 @@ static void dwc2_hsotg_ep_stop_xfr(struct dwc2_hsotg *hsotg,
 					 __func__);
 		}
 	} else {
+		/* Mask GINTSTS_GOUTNAKEFF interrupt */
+		dwc2_hsotg_disable_gsint(hsotg, GINTSTS_GOUTNAKEFF);
+
 		if (!(dwc2_readl(hsotg, GINTSTS) & GINTSTS_GOUTNAKEFF))
 			dwc2_set_bit(hsotg, DCTL, DCTL_SGOUTNAK);
 
+		if (!using_dma(hsotg)) {
+			/* Wait for GINTSTS_RXFLVL interrupt */
+			if (dwc2_hsotg_wait_bit_set(hsotg, GINTSTS,
+						    GINTSTS_RXFLVL, 100)) {
+				dev_warn(hsotg->dev, "%s: timeout GINTSTS.RXFLVL\n",
+					 __func__);
+			} else {
+				/*
+				 * Pop GLOBAL OUT NAK status packet from RxFIFO
+				 * to assert GOUTNAKEFF interrupt
+				 */
+				dwc2_readl(hsotg, GRXSTSP);
+			}
+		}
+
 		/* Wait for global nak to take effect */
 		if (dwc2_hsotg_wait_bit_set(hsotg, GINTSTS,
 					    GINTSTS_GOUTNAKEFF, 100))
@@ -4374,6 +4392,9 @@ static int dwc2_hsotg_ep_sethalt(struct usb_ep *ep, int value, bool now)
 		epctl = dwc2_readl(hs, epreg);
 
 		if (value) {
+			/* Unmask GOUTNAKEFF interrupt */
+			dwc2_hsotg_en_gsint(hs, GINTSTS_GOUTNAKEFF);
+
 			if (!(dwc2_readl(hs, GINTSTS) & GINTSTS_GOUTNAKEFF))
 				dwc2_set_bit(hs, DCTL, DCTL_SGOUTNAK);
 			// STALL bit will be set in GOUTNAKEFF interrupt handler

base-commit: 3143ea6b8eee08761709a6c2788216292be46a34
-- 
2.11.0


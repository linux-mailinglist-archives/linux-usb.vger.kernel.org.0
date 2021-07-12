Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4803C5ACD
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 13:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbhGLKZD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 06:25:03 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:35540 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229725AbhGLKZD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jul 2021 06:25:03 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BC2CEC0548;
        Mon, 12 Jul 2021 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1626085335; bh=63HWhz7yp1Apkvfd/m54ZpB/UFXx7XXYZZz0oItcbyw=;
        h=Date:From:Subject:To:Cc:From;
        b=jCC+N+dH3x5rPjUQ72C/iAGHDmoGQCWL29Awrxk26GrVLK4zsvQHuPpBeiwxhyji9
         WFpmtRrWpwCOBKsgEIPJHAM31R2qtYC0ejQ7yyAdWhufRZIsRtJBPPZ4qL7hl4mTLp
         0kj/mEEAm4BAd8FBgayGmeKYVBBgvJA5Npa3lTzddHVa/1VGaSlPuNZd7R76/G8LsN
         NYnPWHL7upleCP5Bm1aInteKvjpukS3Vd1zVPCS0zVmjNecy3Zbw50C2msDGPCkRhI
         b/gEexo1t4I+7v54VzHFmhgYgaukxdfdonXu/b/K0JVmCJZI8Vk8H66eQL63v8ya0e
         VPtlwUK+h2T4A==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.75.77])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id B8CBBA005F;
        Mon, 12 Jul 2021 10:22:10 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Mon, 12 Jul 2021 14:22:09 +0400
Date:   Mon, 12 Jul 2021 14:22:09 +0400
Message-Id: <75f383c94960b2c1305304bb380e6b6504c67262.1626085155.git.Minas.Harutyunyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH] usb: dwc2: gadget: Fix GOUTNAK flow for Slave mode.
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

Fixes: a4f827714539a ("usb: dwc2: gadget: Disable enabled HW endpoint in
dwc2_hsotg_ep_disable")
Fixes: 6070636c4918c ("usb: dwc2: Fix Stalling a Non-Isochronous OUT EP")

Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
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


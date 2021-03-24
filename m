Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E475E347A51
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 15:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236090AbhCXOLv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 10:11:51 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:42163 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236071AbhCXOLg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 10:11:36 -0400
Received: from rpi3.fritz.box ([46.90.46.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.113]) with ESMTPA (Nemesis) id
 1M7auJ-1lJJ4G1LFl-00859F; Wed, 24 Mar 2021 15:11:29 +0100
From:   Fabian Vogt <fabian@ritter-vogt.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Fabian Vogt <fabian@ritter-vogt.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 4/7] fotg210-udc: Mask GRP2 interrupts we don't handle
Date:   Wed, 24 Mar 2021 15:11:12 +0100
Message-Id: <20210324141115.9384-5-fabian@ritter-vogt.de>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20210324141115.9384-1-fabian@ritter-vogt.de>
References: <20210324141115.9384-1-fabian@ritter-vogt.de>
X-Provags-ID: V03:K1:At2rKk6Qhs3J9dB/i0kLA9Eh+Ogt4LQPaIQHzrLM1U02LgENaf1
 c75ikwG+p+6E4D+h9trPHgJpG1dR+9R0UqV6tV8E4CIzaw4GcgGE3bQ3m/fUiW4QbYQ9D1w
 /JFZZI5ekRg/dBYHWqbQH9oGA2+MRr21ULgzOM0hYcYCRoAuFKLFJn+FbcJUaWcrREMDBSr
 I5G6IDk4R+epJqfjuoK+w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rsCL3QtHaWA=:r9CvhJJy+2xMWYS4G7o/yc
 OUhaEent2Fu6K/SuUAvY6WOAHgrsr5k+iKuB4W8G80WsL866pS8CrA7c9I7uvLhrt5zbBNsLY
 N0HOUSlZZBhgbfjpJW2pKk6rdCvqhm8DtPKbYNc5mv+O3+qNeRO+/6q9xZIdW0CrtPX7fBb4s
 kta96nD8siofeBRh0ZQoJ3H1w0cPN+sZ67YQX+D6kAemxrBv2OlVNzuTW0H8tkI4G45cDrSqj
 hKGxFvUIQrHzNvmHhWK1sjUkHta5ww/9RcoAY7ktInko0SUAPbxHXoB3mlfx6jD5MyT4LuXtO
 wHEzuBCciFHyw5Qc75V6XcnLOBmdlsOI0mKMRXAgX3vZlMwCFjYIYgNWgro6+oBehAAgLOy+l
 tRWp2AERaJZNY2PWnZi/pUgBS9uVtsKw7CClZYhUW2Ai1sC7sm+s+rj2xg1B+nzdB9Pp1ceZR
 o48JebJhSQ==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently it leaves unhandled interrupts unmasked, but those are never
acked. In the case of a "device idle" interrupt, this leads to an
effectively frozen system until plugging it in.

Fixes: b84a8dee23fd ("usb: gadget: add Faraday fotg210_udc driver")
Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
---
 drivers/usb/gadget/udc/fotg210-udc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/gadget/udc/fotg210-udc.c
index 911f1a5cd1f4..d7693b8d7c54 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/gadget/udc/fotg210-udc.c
@@ -1040,6 +1040,12 @@ static void fotg210_init(struct fotg210_udc *fotg210)
 	value &= ~DMCR_GLINT_EN;
 	iowrite32(value, fotg210->reg + FOTG210_DMCR);
 
+	/* enable only grp2 irqs we handle */
+	iowrite32(~(DISGR2_DMA_ERROR | DISGR2_RX0BYTE_INT | DISGR2_TX0BYTE_INT
+		    | DISGR2_ISO_SEQ_ABORT_INT | DISGR2_ISO_SEQ_ERR_INT
+		    | DISGR2_RESM_INT | DISGR2_SUSP_INT | DISGR2_USBRST_INT),
+		  fotg210->reg + FOTG210_DMISGR2);
+
 	/* disable all fifo interrupt */
 	iowrite32(~(u32)0, fotg210->reg + FOTG210_DMISGR1);
 
-- 
2.25.1


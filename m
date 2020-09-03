Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85DF25C4B9
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 17:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728629AbgICPO7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 11:14:59 -0400
Received: from crapouillou.net ([89.234.176.41]:52000 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728654AbgICLhg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Sep 2020 07:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599132411; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RNukebu5FJc21AaatW8pIDM/jN+mPnsQcQWuh8bpr7A=;
        b=htUjP8MOznKj63TiyERDMqJINFETb7XOkyxP8ClwaFkoSfOGrFLr+VLzUvyD3xNeQSswbg
        p7LZQ5cWe25wPNMfmzaec40O/ElUOkQRnNQGhJbuEk9+6OaARXOMTpUdcXLUSy2DnephH1
        XwmA8yVt8pDGFouQrnH2pvmVwN+h2mo=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Tony Prisk <linux@prisktech.co.nz>, Bin Liu <b-liu@ti.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 18/20] usb/gadget/udc: pch: Use pm_ptr() macro
Date:   Thu,  3 Sep 2020 13:25:52 +0200
Message-Id: <20200903112554.34263-19-paul@crapouillou.net>
In-Reply-To: <20200903112554.34263-1-paul@crapouillou.net>
References: <20200903112554.34263-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the newly introduced pm_ptr() macro, and mark the suspend/resume
functions __maybe_unused. These functions can then be moved outside the
CONFIG_PM_SUSPEND block, and the compiler can then process them and
detect build failures independently of the config. If unused, they will
simply be discarded by the compiler.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/gadget/udc/pch_udc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 8afc31d94b0e..9e26b5ab3058 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -3042,8 +3042,7 @@ static void pch_udc_remove(struct pci_dev *pdev)
 	pch_udc_exit(dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int pch_udc_suspend(struct device *d)
+static int __maybe_unused pch_udc_suspend(struct device *d)
 {
 	struct pch_udc_dev *dev = dev_get_drvdata(d);
 
@@ -3053,16 +3052,12 @@ static int pch_udc_suspend(struct device *d)
 	return 0;
 }
 
-static int pch_udc_resume(struct device *d)
+static int __maybe_unused pch_udc_resume(struct device *d)
 {
 	return 0;
 }
 
 static SIMPLE_DEV_PM_OPS(pch_udc_pm, pch_udc_suspend, pch_udc_resume);
-#define PCH_UDC_PM_OPS		(&pch_udc_pm)
-#else
-#define PCH_UDC_PM_OPS		NULL
-#endif /* CONFIG_PM_SLEEP */
 
 static int pch_udc_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *id)
@@ -3171,7 +3166,7 @@ static struct pci_driver pch_udc_driver = {
 	.remove =	pch_udc_remove,
 	.shutdown =	pch_udc_shutdown,
 	.driver = {
-		.pm = PCH_UDC_PM_OPS,
+		.pm = pm_ptr(&pch_udc_pm),
 	},
 };
 
-- 
2.28.0


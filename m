Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB16A25C04B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 13:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbgICL07 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 07:26:59 -0400
Received: from crapouillou.net ([89.234.176.41]:50376 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728422AbgICL0T (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Sep 2020 07:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599132365; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nylEOZ/ud9dJuiCng3IS9pJVAuTv7JQFJCJlDdh38kA=;
        b=JuRU33REs724J6eVnbhIDjfeUMWW9tOA78MdFBc3i95nB9cktLPxKK2ChHPcQK628+jfXp
        i3+e9cDmuhgUwtVBolHIKO9sH8/eX+Ybb3YnUm1v+0udsj1vdEp3baEUPowH0LfsUOS6V5
        R9po9WQ1ueOAKCWhmtjbsOVyV8m+OMk=
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
Subject: [PATCH 01/20] usb/host: ohci-platform: Use pm_ptr() macro
Date:   Thu,  3 Sep 2020 13:25:35 +0200
Message-Id: <20200903112554.34263-2-paul@crapouillou.net>
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
 drivers/usb/host/ohci-platform.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index 4a8456f12a73..21400d7d8b0a 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -176,22 +176,21 @@ static int ohci_platform_probe(struct platform_device *dev)
 	if (pdata->num_ports)
 		ohci->num_ports = pdata->num_ports;
 
-#ifndef CONFIG_USB_OHCI_BIG_ENDIAN_MMIO
-	if (ohci->flags & OHCI_QUIRK_BE_MMIO) {
+	if (!IS_ENABLED(CONFIG_USB_OHCI_BIG_ENDIAN_MMIO) &&
+	    ohci->flags & OHCI_QUIRK_BE_MMIO) {
 		dev_err(&dev->dev,
 			"Error: CONFIG_USB_OHCI_BIG_ENDIAN_MMIO not set\n");
 		err = -EINVAL;
 		goto err_reset;
 	}
-#endif
-#ifndef CONFIG_USB_OHCI_BIG_ENDIAN_DESC
-	if (ohci->flags & OHCI_QUIRK_BE_DESC) {
+
+	if (!IS_ENABLED(CONFIG_USB_OHCI_BIG_ENDIAN_DESC) &&
+	    ohci->flags & OHCI_QUIRK_BE_DESC) {
 		dev_err(&dev->dev,
 			"Error: CONFIG_USB_OHCI_BIG_ENDIAN_DESC not set\n");
 		err = -EINVAL;
 		goto err_reset;
 	}
-#endif
 
 	pm_runtime_set_active(&dev->dev);
 	pm_runtime_enable(&dev->dev);
@@ -267,8 +266,7 @@ static int ohci_platform_remove(struct platform_device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int ohci_platform_suspend(struct device *dev)
+static int __maybe_unused ohci_platform_suspend(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct usb_ohci_pdata *pdata = dev->platform_data;
@@ -286,7 +284,7 @@ static int ohci_platform_suspend(struct device *dev)
 	return ret;
 }
 
-static int ohci_platform_resume(struct device *dev)
+static int __maybe_unused ohci_platform_resume(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct usb_ohci_pdata *pdata = dev_get_platdata(dev);
@@ -306,7 +304,6 @@ static int ohci_platform_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct of_device_id ohci_platform_ids[] = {
 	{ .compatible = "generic-ohci", },
@@ -332,7 +329,7 @@ static struct platform_driver ohci_platform_driver = {
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "ohci-platform",
-		.pm	= &ohci_platform_pm_ops,
+		.pm	= pm_ptr(&ohci_platform_pm_ops),
 		.of_match_table = ohci_platform_ids,
 	}
 };
-- 
2.28.0


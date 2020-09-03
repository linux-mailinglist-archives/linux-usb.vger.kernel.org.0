Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB94625C06E
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 13:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728705AbgICLft (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 07:35:49 -0400
Received: from crapouillou.net ([89.234.176.41]:51944 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728646AbgICLfK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Sep 2020 07:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599132402; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hcIYdvuHgCnX105VYCMzaNdLpnwL2oejz7eq3kv/QCg=;
        b=l7TbgxzpKLSy0f6XLh5qi4mNX+GQCUAKmtU+E1nWIeS96sZKn1LB6jiycJjFMuiwsFy0TA
        2zCaaa2m6gE/ximHchPnzqKmlRw6nu45OsdT97mINoU/Tc4nlNTa9NBZg0Qq7wHf0VUs87
        vUj9NR0sMCrRUu/irsY+vlaud1PF1Ls=
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
Subject: [PATCH 15/20] usb/gadget/udc: atmel: Use pm_ptr() macro
Date:   Thu,  3 Sep 2020 13:25:49 +0200
Message-Id: <20200903112554.34263-16-paul@crapouillou.net>
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
 drivers/usb/gadget/udc/atmel_usba_udc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index a6426dd1cfef..38da3f3ebde7 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -2359,8 +2359,7 @@ static int usba_udc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int usba_udc_suspend(struct device *dev)
+static int __maybe_unused usba_udc_suspend(struct device *dev)
 {
 	struct usba_udc *udc = dev_get_drvdata(dev);
 
@@ -2393,7 +2392,7 @@ static int usba_udc_suspend(struct device *dev)
 	return 0;
 }
 
-static int usba_udc_resume(struct device *dev)
+static int __maybe_unused usba_udc_resume(struct device *dev)
 {
 	struct usba_udc *udc = dev_get_drvdata(dev);
 
@@ -2417,7 +2416,6 @@ static int usba_udc_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static SIMPLE_DEV_PM_OPS(usba_udc_pm_ops, usba_udc_suspend, usba_udc_resume);
 
@@ -2425,7 +2423,7 @@ static struct platform_driver udc_driver = {
 	.remove		= usba_udc_remove,
 	.driver		= {
 		.name		= "atmel_usba_udc",
-		.pm		= &usba_udc_pm_ops,
+		.pm		= pm_ptr(&usba_udc_pm_ops),
 		.of_match_table	= atmel_udc_dt_ids,
 	},
 };
-- 
2.28.0


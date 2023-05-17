Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1885C707607
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbjEQXDe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjEQXDO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9333265B9
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAd-0008Lo-0D; Thu, 18 May 2023 01:02:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAb-000wt2-3w; Thu, 18 May 2023 01:02:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-005UZi-1M; Thu, 18 May 2023 01:02:56 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 70/97] usb: ohci-ppc-of: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:12 +0200
Message-Id: <20230517230239.187727-71-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=TCEDVRSyKqg49+fXVj1poxXpV+cUt8CDx2s19eEXu0c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVyZwZuOlWqUZSoRUYws+MhRsIQW/mTwrzkE0 bUAvzD8XhCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcmQAKCRCPgPtYfRL+ TkVUCAC1rHH9ZeaE7ryTNy7Zw0FmfFgs/T9wO8EgXA+qeaBxMig5DueFZFSIyILW/78G90GeK/H gYwBydPMsLjeA6qHyFZJaJdSFsuOgvtWuq5cAPhb8/EjZ12l272NsmoRWtjQ52VDEdXNDH//KCS 4o0r3mq2b1M174G/aTDX7iY1U4FhNAVtXx48qEdRaH9M8+QJnWk9nNy5+mtwY4mdm4nHo8CpTpR rtyQUuIg+q25S40+MbgpeN9EfBlBRHNs7qu1HdjzZPRzPHjb8Xe+t8Q+Un+i6sPcNTuz7GnsDBv u/L9XODVB0JMBAOJ23S7WbQ6eszntbMYN8FKlssXsrOE+9fJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart from
emitting a warning) and this typically results in resource leaks. To improve
here there is a quest to make the remove callback return void. In the first
step of this quest all drivers are converted to .remove_new() which already
returns void. Eventually after all drivers are converted, .remove_new() is
renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/host/ohci-ppc-of.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ohci-ppc-of.c b/drivers/usb/host/ohci-ppc-of.c
index f2f6c832ec98..35a7ad7e2569 100644
--- a/drivers/usb/host/ohci-ppc-of.c
+++ b/drivers/usb/host/ohci-ppc-of.c
@@ -176,7 +176,7 @@ static int ohci_hcd_ppc_of_probe(struct platform_device *op)
 	return rv;
 }
 
-static int ohci_hcd_ppc_of_remove(struct platform_device *op)
+static void ohci_hcd_ppc_of_remove(struct platform_device *op)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(op);
 
@@ -187,8 +187,6 @@ static int ohci_hcd_ppc_of_remove(struct platform_device *op)
 	irq_dispose_mapping(hcd->irq);
 
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 static const struct of_device_id ohci_hcd_ppc_of_match[] = {
@@ -224,7 +222,7 @@ MODULE_DEVICE_TABLE(of, ohci_hcd_ppc_of_match);
 
 static struct platform_driver ohci_hcd_ppc_of_driver = {
 	.probe		= ohci_hcd_ppc_of_probe,
-	.remove		= ohci_hcd_ppc_of_remove,
+	.remove_new	= ohci_hcd_ppc_of_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver = {
 		.name = "ppc-of-ohci",
-- 
2.39.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9FEC70763A
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjEQXEN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjEQXEG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:04:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6D661B2
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:38 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAk-0000Ns-L0; Thu, 18 May 2023 01:03:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAj-000wvN-Ta; Thu, 18 May 2023 01:03:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAi-005UbW-Ff; Thu, 18 May 2023 01:03:04 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 97/97] usbip: vhci_hcd: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:39 +0200
Message-Id: <20230517230239.187727-98-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=0LgWXFceXNFs2eq7jVPvidHwyCZD4crjmLMr3H/BMtY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZV0HPI0bCahkP3LFOX8d3fyDXrF2G6/cdF/pr 3+WPab/pJeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVdBwAKCRCPgPtYfRL+ TlfpB/9oI9Xi+sCVVmeUyY6J7AS6iJaKWITYMBdBakvmNAo4fHxrIVESA59RnnWQSgz9R8Tri64 lcPZqFHjZHlpY1GZR6jp3WTp/omuCp1L3dcCsSCVI+UliH1YVmqDmDLRvzey+VRFrU1VFbFfmgO cTi0noTEentvmA1bUbTgXIO61Vu4+kfbH4zRww/+NLvFlfTwwA204cQej1EtYCFO9TiRSF/7qrl C0fSCCVN6Z/iWMWhlL69AMWnr4qMvSJNBllvU5zsfVa3NScG16J+6LcH6K6ywa0uBvxR/xkrd1F SCt6ii7bxXDmii4iqqqlw7xq+80LkGPXO+SzvJHAJ3ZLkYkW
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
 drivers/usb/usbip/vhci_hcd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 233265550fc6..37d1fc34e8a5 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -1393,7 +1393,7 @@ static int vhci_hcd_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int vhci_hcd_remove(struct platform_device *pdev)
+static void vhci_hcd_remove(struct platform_device *pdev)
 {
 	struct vhci *vhci = *((void **)dev_get_platdata(&pdev->dev));
 
@@ -1410,8 +1410,6 @@ static int vhci_hcd_remove(struct platform_device *pdev)
 
 	vhci->vhci_hcd_hs = NULL;
 	vhci->vhci_hcd_ss = NULL;
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -1485,7 +1483,7 @@ static int vhci_hcd_resume(struct platform_device *pdev)
 
 static struct platform_driver vhci_driver = {
 	.probe	= vhci_hcd_probe,
-	.remove	= vhci_hcd_remove,
+	.remove_new = vhci_hcd_remove,
 	.suspend = vhci_hcd_suspend,
 	.resume	= vhci_hcd_resume,
 	.driver	= {
-- 
2.39.2


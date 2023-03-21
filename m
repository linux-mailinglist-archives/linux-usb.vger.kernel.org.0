Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48B876C2E8D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 11:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjCUKTY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 06:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbjCUKTV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 06:19:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353C07ED7
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 03:19:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1peZ5I-0000r6-NJ; Tue, 21 Mar 2023 11:19:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peZ5I-005fIj-3Z; Tue, 21 Mar 2023 11:19:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peZ5H-006ioh-3G; Tue, 21 Mar 2023 11:19:15 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/2] usb: host: u132-hcd: Drop if with an always true condition
Date:   Tue, 21 Mar 2023 11:19:11 +0100
Message-Id: <20230321101911.342538-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321101911.342538-1-u.kleine-koenig@pengutronix.de>
References: <20230321101911.342538-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3049; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7qc3VDEO4Jzhf9onKN8ybTV6D94vBFW/7aXSX8rS6fE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGYSYbc+DxRAw6jaLMa9J8FyWvQmHXoAr3SGJK y1pIy4JMZOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBmEmAAKCRCPgPtYfRL+ TmwZCACAN2P5d07wbuXjFhe3bTpscqFbsbOI6qe9PqwQFJOe/10Wpy7qnaeLB3xUZEHoj0RhjTU WcQqfLEJdLeziW884aFdGSE6Qmgh7haWVQBL6h/cqjMrqsiRuLZRgZTu7Xz0EthaOCYNg5oJAJS WfqtS25/3eRXE039KU/4Hml9146fBJqMYmUN/EbL3YCqMmSI/D5z6CYVEhId/ajinUkD/Meheii 2Y5Vx4JhEPuKhkjLWjaQX3JraDQlox4W6RD9WzLGS40q2cjln9XZRGbDH6BrKGDqvYluSrsqHzq 1SmkJf1BZRrb3sjTaET2ogGbV24CCtKfHQu0nSe4q+tN17NN
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A platform device's .remove() callback is only ever called after
.probe() successfully completed. After such a successful call,
platform_get_drvdata() doesn't return NULL. Simplify accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/host/u132-hcd.c | 66 +++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/host/u132-hcd.c b/drivers/usb/host/u132-hcd.c
index f5433993c76e..45244c791bcb 100644
--- a/drivers/usb/host/u132-hcd.c
+++ b/drivers/usb/host/u132-hcd.c
@@ -2977,39 +2977,36 @@ static const struct hc_driver u132_hc_driver = {
 static int u132_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
-	if (hcd) {
-		struct u132 *u132 = hcd_to_u132(hcd);
-		if (u132->going++ > 1) {
-			dev_err(&u132->platform_dev->dev,
-				"already being removed\n");
-			return -ENODEV;
-		} else {
-			int rings = MAX_U132_RINGS;
-			int endps = MAX_U132_ENDPS;
-			dev_err(&u132->platform_dev->dev,
-				"removing device u132.%d\n",
-				u132->sequence_num);
-			msleep(100);
-			mutex_lock(&u132->sw_lock);
-			u132_monitor_cancel_work(u132);
-			while (rings-- > 0) {
-				struct u132_ring *ring = &u132->ring[rings];
-				u132_ring_cancel_work(u132, ring);
-			}
-			while (endps-- > 0) {
-				struct u132_endp *endp = u132->endp[endps];
-				if (endp)
-					u132_endp_cancel_work(u132, endp);
-			}
-			u132->going += 1;
-			printk(KERN_INFO "removing device u132.%d\n",
-				u132->sequence_num);
-			mutex_unlock(&u132->sw_lock);
-			usb_remove_hcd(hcd);
-			u132_u132_put_kref(u132);
-			return 0;
-		}
+	struct u132 *u132 = hcd_to_u132(hcd);
+
+	if (u132->going++ > 1) {
+		dev_err(&u132->platform_dev->dev,
+			"already being removed\n");
+		return -ENODEV;
 	} else {
+		int rings = MAX_U132_RINGS;
+		int endps = MAX_U132_ENDPS;
+		dev_err(&u132->platform_dev->dev,
+			"removing device u132.%d\n",
+			u132->sequence_num);
+		msleep(100);
+		mutex_lock(&u132->sw_lock);
+		u132_monitor_cancel_work(u132);
+		while (rings-- > 0) {
+			struct u132_ring *ring = &u132->ring[rings];
+			u132_ring_cancel_work(u132, ring);
+		}
+		while (endps-- > 0) {
+			struct u132_endp *endp = u132->endp[endps];
+			if (endp)
+				u132_endp_cancel_work(u132, endp);
+		}
+		u132->going += 1;
+		printk(KERN_INFO "removing device u132.%d\n",
+			u132->sequence_num);
+		mutex_unlock(&u132->sw_lock);
+		usb_remove_hcd(hcd);
+		u132_u132_put_kref(u132);
 		return 0;
 	}
 }
@@ -3092,6 +3089,11 @@ static int u132_probe(struct platform_device *pdev)
 	if (retval)
 		return retval;
 
+	/*
+	 * Note that after a successful call of usb_create_hcd(),
+	 * dev_set_drvdata() was called such that platform_get_drvdata(pdev)
+	 * returns hcd later on.
+	 */
 	hcd = usb_create_hcd(&u132_hc_driver, &pdev->dev, dev_name(&pdev->dev));
 	if (!hcd) {
 		printk(KERN_ERR "failed to create the usb hcd struct for U132\n");
-- 
2.39.2


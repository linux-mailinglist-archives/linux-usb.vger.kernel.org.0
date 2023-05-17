Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8715470760A
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjEQXDg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbjEQXDQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9236A67
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAd-0008Ob-V5; Thu, 18 May 2023 01:02:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-000wtU-Dr; Thu, 18 May 2023 01:02:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAb-005UaC-Bb; Thu, 18 May 2023 01:02:57 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 77/97] usb: r8a66597-hcd: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:19 +0200
Message-Id: <20230517230239.187727-78-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=WmmbxC2pOqaIXZnzitzClzwAtl2gelBh1b7eRSfQjsk=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTUmNVej+fk5XP7f3Rjq9nVUt2jsunHr2DD/4L9vHcYG Xx3vdzVyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBFVrD/dzn9lUXAQTpYnNvG 533P023LdyqI75w7c8vHii9lG6+/TetgLDg0t8grhffswv3sIW/Mb/ukOU417FTM82Va13t2gpb 5fN9oW601H80Et7UUXp0eeNxR63llp/zeWsPou1OkT8VEuNgzCMTFfGiw59jTJ36k1HSKToPHyQ aO5YfcxNP/JvOcn/j6I+dMHoHL/J8eLnpSP8eqPTW5OD7Be19gcPHauFlTr0wvU3SdURtlMDf0s hLrpsibUx2eVyQz+cVxqXJ9XnLk7oU7klkqd/Naqi2fz0j/YPds4eqvP+T36Xv9enIpeo9/gds2 nr13XZ9e3/zJcOUq+/undtcFHa9JtUvWvXons2Cb4qRCAA==
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
 drivers/usb/host/r8a66597-hcd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index abb88dd40d4e..9f4bf8c5f8a5 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -2379,7 +2379,7 @@ static const struct dev_pm_ops r8a66597_dev_pm_ops = {
 #define R8A66597_DEV_PM_OPS	NULL
 #endif
 
-static int r8a66597_remove(struct platform_device *pdev)
+static void r8a66597_remove(struct platform_device *pdev)
 {
 	struct r8a66597		*r8a66597 = platform_get_drvdata(pdev);
 	struct usb_hcd		*hcd = r8a66597_to_hcd(r8a66597);
@@ -2390,7 +2390,6 @@ static int r8a66597_remove(struct platform_device *pdev)
 	if (r8a66597->pdata->on_chip)
 		clk_put(r8a66597->clk);
 	usb_put_hcd(hcd);
-	return 0;
 }
 
 static int r8a66597_probe(struct platform_device *pdev)
@@ -2511,7 +2510,7 @@ static int r8a66597_probe(struct platform_device *pdev)
 
 static struct platform_driver r8a66597_driver = {
 	.probe =	r8a66597_probe,
-	.remove =	r8a66597_remove,
+	.remove_new =	r8a66597_remove,
 	.driver		= {
 		.name = hcd_name,
 		.pm	= R8A66597_DEV_PM_OPS,
-- 
2.39.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC7C707629
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjEQXEE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjEQXED (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:04:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA755FD1
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:30 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAg-0000AF-Cp; Thu, 18 May 2023 01:03:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAf-000wup-FX; Thu, 18 May 2023 01:03:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-005Ub5-AH; Thu, 18 May 2023 01:03:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 90/97] usb: typec: mux: gpio-sbu: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:32 +0200
Message-Id: <20230517230239.187727-91-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=qjAzdgMwqEwupxRubXSTpAyidjKfJ+8kW4+IpN4xQt0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVzvlZrki88pByhT+NB+qsOry1koP/h1cyjcq qTnquxbT0WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVc7wAKCRCPgPtYfRL+ TlsvB/9KpjhgWNmHNL6NRUGdFO6A0vfecADkswWLpwS32QMkXRmoHEqDjhUxtYoJe0D1VgMmoK4 CXvWlwmyKOvmcuKBQMH0674NXOiO0I179JLFG89iWCU3BrAvHbJQgWx9QkqdKxx6/cXYuD/lVfk RpULl+kYXms6ZhVP5LxKfMgH9hi4HHCUCUopdcwruBTvQvjCSAmMuEtxN+g06/d2/vslYboVoWd LUmcB1jPHdUeyvWpx2Vm/XOz6/KUxl0lj6fIMcmuHGntyna+PVDro6X+JxiFAH8jETKSwWrLbUP aSUqmhSlHB7eaw5RgBqnfnR+D0L5KuI4Ct1NqRHGcu4EBhNK
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
 drivers/usb/typec/mux/gpio-sbu-mux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
index f62516dafe8f..94c5bc0f467d 100644
--- a/drivers/usb/typec/mux/gpio-sbu-mux.c
+++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
@@ -140,7 +140,7 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int gpio_sbu_mux_remove(struct platform_device *pdev)
+static void gpio_sbu_mux_remove(struct platform_device *pdev)
 {
 	struct gpio_sbu_mux *sbu_mux = platform_get_drvdata(pdev);
 
@@ -148,8 +148,6 @@ static int gpio_sbu_mux_remove(struct platform_device *pdev)
 
 	typec_mux_unregister(sbu_mux->mux);
 	typec_switch_unregister(sbu_mux->sw);
-
-	return 0;
 }
 
 static const struct of_device_id gpio_sbu_mux_match[] = {
@@ -160,7 +158,7 @@ MODULE_DEVICE_TABLE(of, gpio_sbu_mux_match);
 
 static struct platform_driver gpio_sbu_mux_driver = {
 	.probe = gpio_sbu_mux_probe,
-	.remove = gpio_sbu_mux_remove,
+	.remove_new = gpio_sbu_mux_remove,
 	.driver = {
 		.name = "gpio_sbu_mux",
 		.of_match_table = gpio_sbu_mux_match,
-- 
2.39.2


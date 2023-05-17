Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2C9E707625
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjEQXEB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjEQXD7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7BE6EB7
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:26 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAf-0008Up-FQ; Thu, 18 May 2023 01:03:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAd-000wuD-Uf; Thu, 18 May 2023 01:02:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAd-005Uag-1p; Thu, 18 May 2023 01:02:59 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 84/97] usb: xhci-tegra: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:26 +0200
Message-Id: <20230517230239.187727-85-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1988; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=21KhsgD79jCY/jj4wlw9t+6lKXxL2xNLqCJlfvOuhEI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVzf3fyOgAHyIiUkoVyf5oQAUoiZxPo7rnZjQ duiQ8Qyy1qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVc3wAKCRCPgPtYfRL+ TvqBCACV3RZ7ISD5f1hbO6jT9lClUbaAOrXoY6D4P+jRUeTYSlV1QoLYrXBpMscAbjQ3t3KOUqD 9lWugroRNb4tjehvqlDz7kOysJ5CT0cMQIoUn6TVplsT6oJ1dgCTD3YEHq8Kyb6E3oL/I9OwECa amv23RG0IgMCr5EjFvFNTD6qz+XS/Ql7EWVJ38tKlb4C4J3BdtRyuU5Hl6FWevnhxQ5nmgOZv0j glg9RLKDUZO7e5acAtHLVW6imeDfHHP5szFLE0YMGRfgsLYRPUXkTV+lbndIpMa1050/5zXdajQ JuaIaPLQHyPsEGZNAAiay0ICKkL08JnJ+n04rwSPP+nitugv
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
 drivers/usb/host/xhci-tegra.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index c75d93244143..a36df04b9513 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1909,7 +1909,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_xusb_remove(struct platform_device *pdev)
+static void tegra_xusb_remove(struct platform_device *pdev)
 {
 	struct tegra_xusb *tegra = platform_get_drvdata(pdev);
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
@@ -1939,8 +1939,6 @@ static int tegra_xusb_remove(struct platform_device *pdev)
 	tegra_xusb_clk_disable(tegra);
 	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
 	tegra_xusb_padctl_put(tegra->padctl);
-
-	return 0;
 }
 
 static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
@@ -2650,7 +2648,7 @@ MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);
 
 static struct platform_driver tegra_xusb_driver = {
 	.probe = tegra_xusb_probe,
-	.remove = tegra_xusb_remove,
+	.remove_new = tegra_xusb_remove,
 	.driver = {
 		.name = "tegra-xusb",
 		.pm = &tegra_xusb_pm_ops,
-- 
2.39.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C95F70708A
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 20:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjEQSPj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 14:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbjEQSPh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 14:15:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBEA7EF0
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 11:15:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzLgS-00078s-3h; Wed, 17 May 2023 20:15:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzLgR-000uNf-E6; Wed, 17 May 2023 20:15:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzLgQ-005R5x-O5; Wed, 17 May 2023 20:15:30 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] usb: Switch i2c drivers back to use .probe()
Date:   Wed, 17 May 2023 20:15:28 +0200
Message-Id: <20230517181528.167115-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10697; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=enknM87/S95deMw4G3hwm34AZP6owXaovT0kYwYPG/4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZRm9c89dRhWQ9uFa4mZvS7kV3CjEzHEjSbOsi xcE2ySkFYeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGUZvQAKCRCPgPtYfRL+ TkCOB/wMPMB2Tlik+DT9/IrqH8ffbwJrg2ohuu8FpKF1l+HcvXbzX7KT58h2Ar60vsxdzn80lTo mAnL0pq7Oo4h/n2Is7xbVPpDdgHY/wkBMkVP1poU8ZuVILcyVk5038ojTUetHS2gqVRgKO9uPEU MypiDY6h7Iy4x7iuD0wi3VRziHR+5phEQvjqqE4wdEEcTctC70uZg3shXzR/v93/qPq9wtfjehE O6lLhdAXoey4CoetIvU4JWzMO9EL8pgLiHIUPhZulvfAii/q7Q1fWWruv+wbFhgEljCe8DrxXOX y65blJvl3zhYSO9k02sNMcOePteeXx7UfK7kj4lSEaPrJELS
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

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

While touching hd3ss3220.c fix a minor white space issue in the
definition of struct hd3ss3220_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I used v6.4-rc1 as base for this patch, but it also fits on top of
today's next master. If there are some conflicts when you apply it, feel
free to just drop all conflicting hunks, I'll care about the fallout
later.

I chose to do this in a single patch for all drivers below drivers/usb.
If you want me to split it, just tell me.

Also note I didn't Cc: all the individual maintainers to not exceed the
allowed length of To: and Cc:. If this patch will be split I can extend
the audience accordingly.

Best regards
Uwe

 drivers/usb/misc/usb251xb.c               | 2 +-
 drivers/usb/misc/usb3503.c                | 2 +-
 drivers/usb/misc/usb4604.c                | 2 +-
 drivers/usb/phy/phy-isp1301.c             | 2 +-
 drivers/usb/typec/anx7411.c               | 2 +-
 drivers/usb/typec/hd3ss3220.c             | 4 ++--
 drivers/usb/typec/mux/fsa4480.c           | 2 +-
 drivers/usb/typec/mux/pi3usb30532.c       | 2 +-
 drivers/usb/typec/rt1719.c                | 2 +-
 drivers/usb/typec/stusb160x.c             | 2 +-
 drivers/usb/typec/tcpm/fusb302.c          | 2 +-
 drivers/usb/typec/tcpm/tcpci.c            | 2 +-
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 2 +-
 drivers/usb/typec/tcpm/tcpci_rt1711h.c    | 2 +-
 drivers/usb/typec/tipd/core.c             | 2 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c         | 2 +-
 drivers/usb/typec/ucsi/ucsi_stm32g0.c     | 2 +-
 drivers/usb/typec/wusb3801.c              | 2 +-
 18 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index ce1da80d3365..1f3329ef5c7a 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -746,7 +746,7 @@ static struct i2c_driver usb251xb_i2c_driver = {
 		.of_match_table = usb251xb_of_match,
 		.pm = &usb251xb_pm_ops,
 	},
-	.probe_new = usb251xb_i2c_probe,
+	.probe = usb251xb_i2c_probe,
 	.id_table = usb251xb_id,
 };
 
diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index c6cfd1edaf76..2781d5408e5a 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -413,7 +413,7 @@ static struct i2c_driver usb3503_i2c_driver = {
 		.pm = pm_ptr(&usb3503_i2c_pm_ops),
 		.of_match_table = of_match_ptr(usb3503_of_match),
 	},
-	.probe_new	= usb3503_i2c_probe,
+	.probe		= usb3503_i2c_probe,
 	.remove		= usb3503_i2c_remove,
 	.id_table	= usb3503_id,
 };
diff --git a/drivers/usb/misc/usb4604.c b/drivers/usb/misc/usb4604.c
index 6b5e77231efa..065e269ba4e3 100644
--- a/drivers/usb/misc/usb4604.c
+++ b/drivers/usb/misc/usb4604.c
@@ -154,7 +154,7 @@ static struct i2c_driver usb4604_i2c_driver = {
 		.pm = pm_ptr(&usb4604_i2c_pm_ops),
 		.of_match_table = of_match_ptr(usb4604_of_match),
 	},
-	.probe_new	= usb4604_i2c_probe,
+	.probe		= usb4604_i2c_probe,
 	.id_table	= usb4604_id,
 };
 module_i2c_driver(usb4604_i2c_driver);
diff --git a/drivers/usb/phy/phy-isp1301.c b/drivers/usb/phy/phy-isp1301.c
index f4ee14d98585..993d7525a102 100644
--- a/drivers/usb/phy/phy-isp1301.c
+++ b/drivers/usb/phy/phy-isp1301.c
@@ -132,7 +132,7 @@ static struct i2c_driver isp1301_driver = {
 		.name = DRV_NAME,
 		.of_match_table = isp1301_of_match,
 	},
-	.probe_new = isp1301_probe,
+	.probe = isp1301_probe,
 	.remove = isp1301_remove,
 	.id_table = isp1301_id,
 };
diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index 3d5edce270a4..221604f933a4 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1584,7 +1584,7 @@ static struct i2c_driver anx7411_driver = {
 		.of_match_table = anx_match_table,
 		.pm = &anx7411_pm_ops,
 	},
-	.probe_new = anx7411_i2c_probe,
+	.probe = anx7411_i2c_probe,
 	.remove = anx7411_i2c_remove,
 
 	.id_table = anx7411_id,
diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 8bbeb9b1e439..fb1242e82ffd 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -292,8 +292,8 @@ static struct i2c_driver hd3ss3220_driver = {
 		.name = "hd3ss3220",
 		.of_match_table = dev_ids,
 	},
-	.probe_new = hd3ss3220_probe,
-	.remove =  hd3ss3220_remove,
+	.probe = hd3ss3220_probe,
+	.remove = hd3ss3220_remove,
 };
 
 module_i2c_driver(hd3ss3220_driver);
diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
index d6495e533e58..b201dda63d77 100644
--- a/drivers/usb/typec/mux/fsa4480.c
+++ b/drivers/usb/typec/mux/fsa4480.c
@@ -206,7 +206,7 @@ static struct i2c_driver fsa4480_driver = {
 		.name = "fsa4480",
 		.of_match_table = fsa4480_of_table,
 	},
-	.probe_new	= fsa4480_probe,
+	.probe		= fsa4480_probe,
 	.remove		= fsa4480_remove,
 	.id_table	= fsa4480_table,
 };
diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/pi3usb30532.c
index 1cd388b55c30..8eeec135dcdb 100644
--- a/drivers/usb/typec/mux/pi3usb30532.c
+++ b/drivers/usb/typec/mux/pi3usb30532.c
@@ -178,7 +178,7 @@ static struct i2c_driver pi3usb30532_driver = {
 	.driver = {
 		.name = "pi3usb30532",
 	},
-	.probe_new	= pi3usb30532_probe,
+	.probe		= pi3usb30532_probe,
 	.remove		= pi3usb30532_remove,
 	.id_table	= pi3usb30532_table,
 };
diff --git a/drivers/usb/typec/rt1719.c b/drivers/usb/typec/rt1719.c
index ea8b700b0ceb..be02d420920e 100644
--- a/drivers/usb/typec/rt1719.c
+++ b/drivers/usb/typec/rt1719.c
@@ -949,7 +949,7 @@ static struct i2c_driver rt1719_driver = {
 		.name = "rt1719",
 		.of_match_table = rt1719_device_table,
 	},
-	.probe_new = rt1719_probe,
+	.probe = rt1719_probe,
 	.remove = rt1719_remove,
 };
 module_i2c_driver(rt1719_driver);
diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index 494b371151e0..3ab118df1bd4 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -870,7 +870,7 @@ static struct i2c_driver stusb160x_driver = {
 		.pm = &stusb160x_pm_ops,
 		.of_match_table = stusb160x_of_match,
 	},
-	.probe_new = stusb160x_probe,
+	.probe = stusb160x_probe,
 	.remove = stusb160x_remove,
 };
 module_i2c_driver(stusb160x_driver);
diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 62ba53357612..7fc1ffa14f76 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1836,7 +1836,7 @@ static struct i2c_driver fusb302_driver = {
 		   .pm = &fusb302_pm_ops,
 		   .of_match_table = of_match_ptr(fusb302_dt_match),
 		   },
-	.probe_new = fusb302_probe,
+	.probe = fusb302_probe,
 	.remove = fusb302_remove,
 	.id_table = fusb302_i2c_device_id,
 };
diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 8da23240afbe..fc708c289a73 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -895,7 +895,7 @@ static struct i2c_driver tcpci_i2c_driver = {
 		.name = "tcpci",
 		.of_match_table = of_match_ptr(tcpci_of_match),
 	},
-	.probe_new = tcpci_probe,
+	.probe = tcpci_probe,
 	.remove = tcpci_remove,
 	.id_table = tcpci_id,
 };
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index f32cda2a5e3a..9454b12a073c 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -508,7 +508,7 @@ static struct i2c_driver max_tcpci_i2c_driver = {
 		.name = "maxtcpc",
 		.of_match_table = of_match_ptr(max_tcpci_of_match),
 	},
-	.probe_new = max_tcpci_probe,
+	.probe = max_tcpci_probe,
 	.remove = max_tcpci_remove,
 	.id_table = max_tcpci_id,
 };
diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index a0e9e3fe8564..17ebc5fb684f 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -412,7 +412,7 @@ static struct i2c_driver rt1711h_i2c_driver = {
 		.name = "rt1711h",
 		.of_match_table = of_match_ptr(rt1711h_of_match),
 	},
-	.probe_new = rt1711h_probe,
+	.probe = rt1711h_probe,
 	.remove = rt1711h_remove,
 	.id_table = rt1711h_id,
 };
diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 8b075ca82ef6..aac8b57d39d8 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -947,7 +947,7 @@ static struct i2c_driver tps6598x_i2c_driver = {
 		.pm = &tps6598x_pm_ops,
 		.of_match_table = tps6598x_of_match,
 	},
-	.probe_new = tps6598x_probe,
+	.probe = tps6598x_probe,
 	.remove = tps6598x_remove,
 	.id_table = tps6598x_id,
 };
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index e0ed465bd518..607061a37eca 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1495,7 +1495,7 @@ static struct i2c_driver ucsi_ccg_driver = {
 		.acpi_match_table = amd_i2c_ucsi_match,
 		.of_match_table = ucsi_ccg_of_match_table,
 	},
-	.probe_new = ucsi_ccg_probe,
+	.probe = ucsi_ccg_probe,
 	.remove = ucsi_ccg_remove,
 	.id_table = ucsi_ccg_device_id,
 };
diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index 93fead0096b7..93d7806681cf 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -763,7 +763,7 @@ static struct i2c_driver ucsi_stm32g0_i2c_driver = {
 		.of_match_table = of_match_ptr(ucsi_stm32g0_typec_of_match),
 		.pm = pm_sleep_ptr(&ucsi_stm32g0_pm_ops),
 	},
-	.probe_new = ucsi_stm32g0_probe,
+	.probe = ucsi_stm32g0_probe,
 	.remove = ucsi_stm32g0_remove,
 	.id_table = ucsi_stm32g0_typec_i2c_devid
 };
diff --git a/drivers/usb/typec/wusb3801.c b/drivers/usb/typec/wusb3801.c
index a43a18d4b02e..6062875fb04a 100644
--- a/drivers/usb/typec/wusb3801.c
+++ b/drivers/usb/typec/wusb3801.c
@@ -420,7 +420,7 @@ static const struct of_device_id wusb3801_of_match[] = {
 MODULE_DEVICE_TABLE(of, wusb3801_of_match);
 
 static struct i2c_driver wusb3801_driver = {
-	.probe_new	= wusb3801_probe,
+	.probe		= wusb3801_probe,
 	.remove		= wusb3801_remove,
 	.driver		= {
 		.name		= "wusb3801",

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2


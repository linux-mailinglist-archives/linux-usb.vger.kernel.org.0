Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1952F707617
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjEQXDq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjEQXDW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4054EF3
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAf-00007p-QZ; Thu, 18 May 2023 01:03:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-000wuf-VC; Thu, 18 May 2023 01:03:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-005Ub1-4e; Thu, 18 May 2023 01:03:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 89/97] usb: roles: intel_xhci: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:31 +0200
Message-Id: <20230517230239.187727-90-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=n4nGPWtvqUb1gdJxB+XAECFUCtiRK4+aQDiSJkU1qaE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVzu8xta3Vpo1vyB2nknmrbxdy0SElHFvAryK 0M9T4NjyKWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVc7gAKCRCPgPtYfRL+ TvLbB/92yuIgV43in4FXkzoQCcJT/MNfFx561VsKf2KaeoQit/LnmtxLgJZwYjsRtotUWjeHbtl rvZ5rj1pG7DMwF4lDOXvmBqa+NUGYE1Ihtqyxna5ioWjZepANU/KvmqDgb6PoZ7vMLrHUq+aMZ2 1mxaHnn+rdwHSBunu7t+kQCsezsaxtcOZrf2RQCtVXjXS61owVskqt5v7UMyLU7SnvYJsi03+I5 Fi8zLuWm3Si/gNm6I6KFRwHnfr+Kqhrt1zCmp6CjyuKxqggznLOtTgjFF7o5q6NSm1IvgnukOod 9KXBlrtZV13dlS6DzTDIypq9NFAb2rTnQDOdOmXkhNCaYwqr
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
 drivers/usb/roles/intel-xhci-usb-role-switch.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/roles/intel-xhci-usb-role-switch.c b/drivers/usb/roles/intel-xhci-usb-role-switch.c
index 5c96e929acea..e5c6c413a075 100644
--- a/drivers/usb/roles/intel-xhci-usb-role-switch.c
+++ b/drivers/usb/roles/intel-xhci-usb-role-switch.c
@@ -195,7 +195,7 @@ static int intel_xhci_usb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int intel_xhci_usb_remove(struct platform_device *pdev)
+static void intel_xhci_usb_remove(struct platform_device *pdev)
 {
 	struct intel_xhci_usb_data *data = platform_get_drvdata(pdev);
 
@@ -203,8 +203,6 @@ static int intel_xhci_usb_remove(struct platform_device *pdev)
 
 	usb_role_switch_unregister(data->role_sw);
 	fwnode_handle_put(software_node_fwnode(&intel_xhci_usb_node));
-
-	return 0;
 }
 
 static const struct platform_device_id intel_xhci_usb_table[] = {
@@ -219,7 +217,7 @@ static struct platform_driver intel_xhci_usb_driver = {
 	},
 	.id_table = intel_xhci_usb_table,
 	.probe = intel_xhci_usb_probe,
-	.remove = intel_xhci_usb_remove,
+	.remove_new = intel_xhci_usb_remove,
 };
 
 module_platform_driver(intel_xhci_usb_driver);
-- 
2.39.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB01A64A980
	for <lists+linux-usb@lfdr.de>; Mon, 12 Dec 2022 22:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232955AbiLLV1b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Dec 2022 16:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiLLV1a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Dec 2022 16:27:30 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB5071836D
        for <linux-usb@vger.kernel.org>; Mon, 12 Dec 2022 13:27:29 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p4qKZ-0006kd-AS; Mon, 12 Dec 2022 22:27:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p4qKW-0046YO-Qf; Mon, 12 Dec 2022 22:27:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p4qKW-004bF8-Pb; Mon, 12 Dec 2022 22:27:20 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] usb: chipidea: imx: Drop empty platform remove function
Date:   Mon, 12 Dec 2022 22:27:17 +0100
Message-Id: <20221212212717.3774606-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=941; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=2kYDKlPGuARAbHrfBQRS5FpDZ3D9CdFwmP0TiURMx9U=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5yyQXfkQFCadHn/h2R7ZLshTrqTWWmyCnMGf6yP ztLLsRCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5ecsgAKCRDB/BR4rcrsCbMhB/ 4x8UZzpeBN3TrfNbcaTXnOujkORTxhMlGMNkb/792JRPxjz2MFP/pJ7y8fCxXActAfBIyaVT5Nm/rf EkabQxQurGlbBLdI7kgrf33e27wRKiAvd/BmOCkSl5b4Ceo/aUD3TJiOiBIGqqfETyor6iX5I5Aw6D xPcrZgI9J7RQZiD3iI3eSbxTHXRWix8fsHYPTmBfAlx/oQhJw2lAh+08fMXnCgLVcRSJkOoCQbU6Au k1b9wC08H/CwPaR0JRXIK2mdqiS8KSBQ0JejKEHF+SH4dh+GKnK9blf1unmsOASQtZgOwZkqg0f+aX OCFlJXh3vsc859AMnDCnBIlAmbDpkc
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/chipidea/usbmisc_imx.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index bac0f5458cab..d09473a39424 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1163,14 +1163,8 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int usbmisc_imx_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver usbmisc_imx_driver = {
 	.probe = usbmisc_imx_probe,
-	.remove = usbmisc_imx_remove,
 	.driver = {
 		.name = "usbmisc_imx",
 		.of_match_table = usbmisc_imx_dt_ids,

base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
-- 
2.38.1


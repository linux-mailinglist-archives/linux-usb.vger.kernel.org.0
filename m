Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB9D573DB0E
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jun 2023 11:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjFZJOx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jun 2023 05:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjFZJN4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jun 2023 05:13:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CAE2173E
        for <linux-usb@vger.kernel.org>; Mon, 26 Jun 2023 02:13:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDiHd-0000fV-My; Mon, 26 Jun 2023 11:13:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDiHc-00AAZh-Ci; Mon, 26 Jun 2023 11:13:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDiHb-00HVI1-ON; Mon, 26 Jun 2023 11:13:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] usb: typec: nb7vpq904m: Switch back to use struct i2c_driver::probe
Date:   Mon, 26 Jun 2023 11:13:14 +0200
Message-Id: <20230626091314.557122-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=849; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=j+Q4mHezGnTcL2gMKbfV3ytEnmzIMYEP5gKka71YWRk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkmVapFfRwQBOkzTjZyAMnDuHtye1ygYHGfN2qL n6x0POabseJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZJlWqQAKCRCPgPtYfRL+ ToaaB/9bedeSjxXapKTgBbtYW1O/6PXOuhmfUcH6J4yKKFZb2LqQ5klSK15YpCeu/ZKXEYZy8C4 6flHYSvA+sgxY7vvd4hxhHlEE6iSQ+GJeJphofrTd8LhTDBrtUWBjJDvk4xAfAGtYcxnhVf1tKG LDmyABilXCBYa9nudSqMJ/Hgl47iva8X3yeO1UD8DPe9NdQ7AHnLe03eCubiz61cLXW7OxFZCYR N9Sy5KsNeIjDHB/njbHAoH7ydLWBJmAqRNgIWSH+nVDVftjM6M+EyLUrpGR8dm1DqSHa4pbHs37 DfR4J0vv9B8NMl3VG2HvIsJ2yyWbjqGnlLyi2ykiLn3vhwec
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

struct i2c_driver::probe_new is about to go away. Switch the driver to
use the probe callback with the same prototype.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/typec/mux/nb7vpq904m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
index 80e580d50129..9360b65e8b06 100644
--- a/drivers/usb/typec/mux/nb7vpq904m.c
+++ b/drivers/usb/typec/mux/nb7vpq904m.c
@@ -517,7 +517,7 @@ static struct i2c_driver nb7vpq904m_driver = {
 		.name = "nb7vpq904m",
 		.of_match_table = nb7vpq904m_of_table,
 	},
-	.probe_new	= nb7vpq904m_probe,
+	.probe		= nb7vpq904m_probe,
 	.remove		= nb7vpq904m_remove,
 	.id_table	= nb7vpq904m_table,
 };

base-commit: 88d8f3ac9c67e2d00db671dbb0af50efb7c358cb
-- 
2.39.2


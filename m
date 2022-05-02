Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEB1516BAD
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 10:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383630AbiEBIJl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 04:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383669AbiEBIJL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 04:09:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A259538BD2
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 01:05:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nlR3m-0003jl-1R; Mon, 02 May 2022 10:05:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nlR3l-006UqM-Jj; Mon, 02 May 2022 10:05:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nlR3j-0071Td-Ee; Mon, 02 May 2022 10:05:31 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Jun Li <jun.li@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] usb: typec: tcpci: Don't skip cleanup in .remove() on error
Date:   Mon,  2 May 2022 10:04:56 +0200
Message-Id: <20220502080456.21568-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; h=from:subject; bh=uDYqdZ2OtkjakPB5cPgF980lQTyNVMaqkLyWNK4L9jE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBib5ClJZ45LzYtkGm1sDiHiZp/yOKj57h3dokLgecK TdO2n2eJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYm+QpQAKCRDB/BR4rcrsCf71B/ 9gNbAl1pnkLY4b0czHM68MUN9FiWX4JBFJJKB1EDznQzDpzsQsjMbM3Q292lkbr9CpXJkKB9mOY3tc 7e5xilYrDsSqwUiUh3x6TIOBHkITXJadVzovU/svDfj54YYXLFvq3D50Qpf/0YHqXICp8JmyRq9ouS TT4PNjAjhrc01BDOlESDVMLxNngrGgLwojQD+wisPBcc0YgUfNt0PZatbtHA0T/cQA4NckvgG37Fbu 5xHD/JoCnM96CDK+zBGK1V4eyoOMQxlvwUW/gL1t09lUTGXHXa55gDEJHwENQS38VDgUOekFPcLUE1 tuNT1Tn4YF25NlPBpOqIReutVEN5+B
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

Returning an error value in an i2c remove callback results in an error
message being emitted by the i2c core, but otherwise it doesn't make a
difference. The device goes away anyhow and the devm cleanups are
called.

In this case the remove callback even returns early without stopping the
tcpm worker thread and various timers. A work scheduled on the work
queue, or a firing timer after tcpci_remove() returned probably results
in a use-after-free situation because the regmap and driver data were
freed. So better make sure that tcpci_unregister_port() is called even
if disabling the irq failed.

Also emit a more specific error message instead of the i2c core's
"remove failed (EIO), will be ignored" and return 0 to suppress the
core's warning.

This patch is (also) a preparation for making i2c remove callbacks
return void.

Fixes: 3ba76256fc4e ("usb: typec: tcpci: mask event interrupts when remove driver")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/typec/tcpm/tcpci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index e07d26a3cd8e..f33e08eb7670 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -877,7 +877,7 @@ static int tcpci_remove(struct i2c_client *client)
 	/* Disable chip interrupts before unregistering port */
 	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
 	if (err < 0)
-		return err;
+		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
 
 	tcpci_unregister_port(chip->tcpci);
 

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.35.1


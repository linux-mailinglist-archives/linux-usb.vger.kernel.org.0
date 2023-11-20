Return-Path: <linux-usb+bounces-3051-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FA47F1FDB
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 23:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 821A028107F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 22:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7367D39849;
	Mon, 20 Nov 2023 22:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0A0C7
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 14:00:02 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ6-0003rX-Bl; Mon, 20 Nov 2023 22:59:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ3-00ARFE-R1; Mon, 20 Nov 2023 22:59:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ3-004fD5-Hj; Mon, 20 Nov 2023 22:59:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Zhu Wang <wangzhu9@huawei.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Rob Herring <robh@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	linux-usb@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 3/5] usb: gadget: gr_udc: Convert to platform remove callback returning void
Date: Mon, 20 Nov 2023 22:58:34 +0100
Message-ID: <20231120215830.71071-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231120215830.71071-1-u.kleine-koenig@pengutronix.de>
References: <20231120215830.71071-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ftMlyUtr6zgZJuLCO/veo5mwoDMq9HpA6TkImWNWmNY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlW9aJxXkWXoen8HEv8MCuh6E6DKvOVYWwrd49C AWL7ewpjNuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVvWiQAKCRCPgPtYfRL+ TgAoB/9MROttK/NmYOg6gLins1O1IwZ9aLoF5QEYyftp5cUm8C/Bj/MG2IHsQ9Zk79mWkxYdUYC boFIQKkfx3QASASbzAG6OO3Fny/cRt/4VHbhxgBAq5V0s+5rIQ5mJcZDtnw4OKhkNg8N15rGUwL g8tYPFGVR0jNZEgHZm3wehmyD1QoAQ9xVqdldvRfT5SNvsyoymA8hsjjyEIGtubvEbpG9XdCxF4 dskxaAiBm5b0B374zmy1xk78N8PTUb6prFCuyxgXI/HE2RnzpaqxoZhCkowQnDwG1jk+/lCZUsk vBShlG5m++k+zJWRNqlAgwWQgR8PbfFvbkpTbXr5bxwp+FXS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

In the error path emit an error message replacing the (less useful)
message by the core. Apart from the improved error message there is no
change in behaviour.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/gadget/udc/gr_udc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
index c6dfa7cccc11..fb901be5dac1 100644
--- a/drivers/usb/gadget/udc/gr_udc.c
+++ b/drivers/usb/gadget/udc/gr_udc.c
@@ -2089,15 +2089,18 @@ static void gr_ep_remove(struct gr_udc *dev, int num, int is_in)
 				  ep->tailbuf, ep->tailbuf_paddr);
 }
 
-static int gr_remove(struct platform_device *pdev)
+static void gr_remove(struct platform_device *pdev)
 {
 	struct gr_udc *dev = platform_get_drvdata(pdev);
 	int i;
 
 	if (dev->added)
 		usb_del_gadget_udc(&dev->gadget); /* Shuts everything down */
-	if (dev->driver)
-		return -EBUSY;
+	if (dev->driver) {
+		dev_err(&pdev->dev,
+			"Driver still in use but removing anyhow\n");
+		return;
+	}
 
 	gr_dfs_delete(dev);
 	dma_pool_destroy(dev->desc_pool);
@@ -2110,8 +2113,6 @@ static int gr_remove(struct platform_device *pdev)
 		gr_ep_remove(dev, i, 0);
 	for (i = 0; i < dev->nepi; i++)
 		gr_ep_remove(dev, i, 1);
-
-	return 0;
 }
 static int gr_request_irq(struct gr_udc *dev, int irq)
 {
@@ -2248,7 +2249,7 @@ static struct platform_driver gr_driver = {
 		.of_match_table = gr_match,
 	},
 	.probe = gr_probe,
-	.remove = gr_remove,
+	.remove_new = gr_remove,
 };
 module_platform_driver(gr_driver);
 
-- 
2.42.0



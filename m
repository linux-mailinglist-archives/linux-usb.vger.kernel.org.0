Return-Path: <linux-usb+bounces-1808-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9935A7CCE87
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 22:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DD601F235BF
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 20:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A861D2E3E5;
	Tue, 17 Oct 2023 20:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A22E3EA
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 20:47:11 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D903FE
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 13:47:10 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsqxz-0001ng-TJ; Tue, 17 Oct 2023 22:47:03 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsqxz-002Ol1-5p; Tue, 17 Oct 2023 22:47:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsqxy-000U0T-Sk; Tue, 17 Oct 2023 22:47:02 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 1/6] usb: gadget: at91-udc: Convert to use module_platform_driver()
Date: Tue, 17 Oct 2023 22:44:44 +0200
Message-ID: <20231017204442.1625925-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017204442.1625925-8-u.kleine-koenig@pengutronix.de>
References: <20231017204442.1625925-8-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=mpvgj1llyBVWOOzIBF8fKXJk/Vs2sDy0eEPp/iHWodA=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlS9T/ZsObv4xOUSV85bdf1qhKrY71L3/K98Gk12QsrOO Xs1HzzoZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiJ7rY/+e9reP1aeZVNzea c0PGdLM/iy1ngVXHHVtXTTXl1DmhL1cvrZl8Yd/OJTHJF89tnNZbYmjSzd/u4XdsRsJBWzkf4SK 2KxLXnGNudh3JWH6rQS6bzVrjWcbLXQocgbN7hdf9y2I7Jnp557ktrellj+Yef9bgLss197P8mq QspS9PZ9SXf3z+K6pl/jP5AB32ujvljXN9K053sqbHHOp/unzxPbu7v4ra3SX6nb/2SGf8883QO 3tn9U/56zcs2h9Ny2tYJVNZUBrnpmrbwfwirMW0d9qWPTVGeXL/eL8vLznAyBrD1bCnJ2XPXu6d gWb+8y8rLL4zLVClT1Jso+RlpT8CqiY130NkfmpydzIDAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

module_platform_driver_probe() has the advantage that the .probe() and
.remove() calls can live in .init.text and .exit.text respectively and
so some memory is saved. The downside is that dynamic bind and unbind
are impossible. As the driver doesn't benefit from the advantages (both
.probe and .remove are defined in plain .text), stop suffering from the
downsides and use module_platform_driver() instead of
module_platform_driver_probe().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/gadget/udc/at91_udc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index 922b4187004b..30ea4a9d5301 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -2000,6 +2000,7 @@ static int at91udc_resume(struct platform_device *pdev)
 #endif
 
 static struct platform_driver at91_udc_driver = {
+	.probe		= at91udc_probe,
 	.remove		= at91udc_remove,
 	.shutdown	= at91udc_shutdown,
 	.suspend	= at91udc_suspend,
@@ -2010,7 +2011,7 @@ static struct platform_driver at91_udc_driver = {
 	},
 };
 
-module_platform_driver_probe(at91_udc_driver, at91udc_probe);
+module_platform_driver(at91_udc_driver);
 
 MODULE_DESCRIPTION("AT91 udc driver");
 MODULE_AUTHOR("Thomas Rathbone, David Brownell");
-- 
2.42.0



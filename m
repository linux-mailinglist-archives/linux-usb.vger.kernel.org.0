Return-Path: <linux-usb+bounces-3050-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 479F37F1FDA
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 23:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFEE1B218E1
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 22:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CB639846;
	Mon, 20 Nov 2023 21:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F67D9
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 13:59:55 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ6-0003rU-C0; Mon, 20 Nov 2023 22:59:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ3-00ARF5-6m; Mon, 20 Nov 2023 22:59:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ2-004fCu-TE; Mon, 20 Nov 2023 22:59:48 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Li Yang <leoyang.li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	Herve Codina <herve.codina@bootlin.com>,
	Zhu Wang <wangzhu9@huawei.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Rob Herring <robh@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 0/5] usb: gadget: udc: Convert to platform remove callback returning void
Date: Mon, 20 Nov 2023 22:58:31 +0100
Message-ID: <20231120215830.71071-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=NGgnAsKRDJtchth2h1V+09ayIfLrr5Gjju5DvvEEWTI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlW9aGVsV1Zt4tqEhTjh663ROQpcHCNjJXv/7H8 QoQQZjNnr+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVvWhgAKCRCPgPtYfRL+ TliRCACFeRhxOA9KHcUabcEOYqtrCN+0aV6zr50I74bzXPfYE4EwFwgP2lVQjCWXDprj5F2hTCv Ioi2mzz5KHge3cjF1zetPS3NmH3NHVdmT7z1VUujla/DkbvaaNXWhV27pnqpcNdQh4e8dXbH9Zw /K3r+g/GG7db8QwgUs1P6ZTMwkbbDWAyLny2XQpjwEWCm9UznEn1YGoVoaBSsHrWym5+Atf6R7v NRxx+N1JJLMX5rzyfwnbovF57T6m55pBkhqNeevKsJomDu1BEt13UoULLTBZ4/umOKGMVAem3fw k4yEm3N8bjsXBS4A4Ft1yQhEZjsJ/+9hDhGr/QENlqbI/jP2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hello,

this patch set converts the platform drivers below drivers/usb/gadget to
use .remove_new. These drivers all have an error path if the driver is
still in use. Returning there early leaks resources, but fixing this
isn't trivial, so I just added an error message. The patches don't make
a difference to the drivers apart from the improved error message.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal of
.remove_new().

Best regards
Uwe

Uwe Kleine-König (5):
  usb: gadget: at91_udc: Convert to platform remove callback returning void
  usb: gadget: fsl_udc: Convert to platform remove callback returning void
  usb: gadget: gr_udc: Convert to platform remove callback returning void
  usb: gadget: lpc32xx_udc: Convert to platform remove callback returning void
  usb: gadget: pxa25x_udc: Convert to platform remove callback returning void

 drivers/usb/gadget/udc/at91_udc.c     | 13 +++++++------
 drivers/usb/gadget/udc/fsl_udc_core.c | 13 +++++++------
 drivers/usb/gadget/udc/gr_udc.c       | 13 +++++++------
 drivers/usb/gadget/udc/lpc32xx_udc.c  | 13 +++++++------
 drivers/usb/gadget/udc/pxa25x_udc.c   | 12 +++++++-----
 5 files changed, 35 insertions(+), 29 deletions(-)

base-commit: 5a82d69d48c82e89aef44483d2a129f869f3506a
-- 
2.42.0



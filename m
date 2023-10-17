Return-Path: <linux-usb+bounces-1811-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9213E7CCE8B
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 22:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C25611C20CC9
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 20:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E204B2E405;
	Tue, 17 Oct 2023 20:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1237D430E9
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 20:47:34 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710F0C4
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 13:47:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsqy2-0001nf-7N; Tue, 17 Oct 2023 22:47:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsqxy-002Oky-V0; Tue, 17 Oct 2023 22:47:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsqxy-000U0Q-LC; Tue, 17 Oct 2023 22:47:02 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Li Yang <leoyang.li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Alan Stern <stern@rowland.harvard.edu>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Pavel Machek <pavel@ucw.cz>,
	Paolo Abeni <pabeni@redhat.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 0/6] usb: gadget: Convert to use module_platform_driver()
Date: Tue, 17 Oct 2023 22:44:43 +0200
Message-ID: <20231017204442.1625925-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Z/Vn1N315f7fZHcxDG81QUWg0Chp5jm5OkmHHEOJRVE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlLvI7mPi3t5lSt18AODt6voX5wl6HZGEZUuiLE DhImsw17AuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZS7yOwAKCRCPgPtYfRL+ ThJEB/9+jgGO1Osx1rWXHL+Yx4I4Ef0vXz+VHQMVy9A2tCCjNre5tivU2+SxAlVa6kI4TZjRtCQ FyAOQnHfLBiNaj8mx5ozuYig8xHBmH//k/z4GzYYiU2HYzP6izmdCC848LHCRcHuqeMwOzLhcyy M28c1WL43/YowvzK/7lpDT9hgjF1n5Ar0s2fyB2dLLvzH8+VPo/933uyq0y+C3IKNKe+tvU8Oth OiDqUV82qBcsLJ+aFXsrweNqjNxZDBZeyL1zdUDYu1dB4YpYjf3ftUbNHhaedzernUoazFkw9m+ +DpbUhtUY7ntNY0dfx4SKZ3KdK3yIE63VeCBUdEqLJHgUjCa
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

Hello,

module_platform_driver_probe() is an alternative to
module_platform_driver(). Comparing the two the former has the advantage
that the probe and remove callbacks can live in .init.text and
.exit.text respectively. The latter has the advantage that it's a bit
easier to use correctly and you can bind/unbind via sysfs and/or
hotplug.

There are considerations about deprecating
module_platform_driver_probe()[1] as very few drivers use it, still less
make actually use of the advantages and saving a few bytes isn't as
important any more as it was (say) 10 years ago.

Given that the drivers below drivers/usb/gadget making use of
module_platform_driver_probe() doesn't benefit from the advantages
at all (probe and remove are all defined in .text), convert these
drivers to module_platform_driver().

Best regards
Uwe

[1] https://lore.kernel.org/linux-kbuild/20231017132045.afswdgcv4axjf6jj@pengutronix.de

Uwe Kleine-König (6):
  usb: gadget: at91-udc: Convert to use module_platform_driver()
  usb: gadget: fsl-udc: Convert to use module_platform_driver()
  usb: gadget: fusb300-udc: Convert to use module_platform_driver()
  usb: gadget: lpc32xx-udc: Convert to use module_platform_driver()
  usb: gadget: m66592-udc: Convert to use module_platform_driver()
  usb: gadget: r8a66597-udc: Convert to use module_platform_driver()

 drivers/usb/gadget/udc/at91_udc.c     | 3 ++-
 drivers/usb/gadget/udc/fsl_udc_core.c | 3 ++-
 drivers/usb/gadget/udc/fusb300_udc.c  | 7 ++++---
 drivers/usb/gadget/udc/lpc32xx_udc.c  | 3 ++-
 drivers/usb/gadget/udc/m66592-udc.c   | 3 ++-
 drivers/usb/gadget/udc/r8a66597-udc.c | 3 ++-
 6 files changed, 14 insertions(+), 8 deletions(-)

base-commit: 4d5ab2376ec576af173e5eac3887ed0b51bd8566
-- 
2.42.0



Return-Path: <linux-usb+bounces-6014-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC8E84D18F
	for <lists+linux-usb@lfdr.de>; Wed,  7 Feb 2024 19:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B81D1C22723
	for <lists+linux-usb@lfdr.de>; Wed,  7 Feb 2024 18:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC64312C545;
	Wed,  7 Feb 2024 18:43:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167748593B
	for <linux-usb@vger.kernel.org>; Wed,  7 Feb 2024 18:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707331408; cv=none; b=Bl5nM4xDfas6Q2rvjBw2Hg1OjeMUsRDAUtdns/2ckgLpwmPkXxplgQMPzA7qqTkVk1AfI6OYxFaTv3qUWqmsDjU8gRgOG/mqLuKCDcrHzJjoLa3M3IaUzpcV/2g8ph++nDYWFYMoYIIDTf7q2fqtluU+UKY+lZAKU9+alAobvFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707331408; c=relaxed/simple;
	bh=99DDKinv2mNpVy8WsuExRMgppG6Feg6EIY4nGansGMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nT4/3u5wt2cGDcOQpvxYNFbr2llnyvD/b+nrGiM5F2lzuQBaXHUFa/DilouNltrZ+E4o5fKY2G+V+6giFDLagZ4HNu9ILMu/G8BU2WZyt5RKgew8elYoO3/RUpKPog57yUQmvUp6lwVWPcrh1ZYNA9lyLE0xcO0S/WIu9lFIoss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmtD-00080z-6a; Wed, 07 Feb 2024 19:43:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmtC-0054YX-Er; Wed, 07 Feb 2024 19:43:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmtC-00HRtd-1C;
	Wed, 07 Feb 2024 19:43:18 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v3 27/32] usb: gadget: max3420_udc: Follow renaming of SPI "master" to "controller"
Date: Wed,  7 Feb 2024 19:40:41 +0100
Message-ID:  <5caf03b6f321a9870aabb9282f1f22211d052740.1707324794.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=99DDKinv2mNpVy8WsuExRMgppG6Feg6EIY4nGansGMc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlw87X8CKBfJjQGw7enWV1NiZW9ae6aJm5SZX0A 6IU4fm3qOeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcPO1wAKCRCPgPtYfRL+ ThjrCAC5mKskhxvokh2bDTPbrEWwQHQL2udrv2F2tbNGDRfK3H5Sg0fbxkkUQiCl7qgmwjWnRfk 8hdp9ewzr1WSo4I8H+BE6rr95JoAyNZG23RZ75FbHqYVyKibyWsI6yNbUrL9dEydkHiHtEylUYP H+DbVe5GsDtp+ZTuphAXnnTb8CK0oRIFOoYaDZFb2IBHIR0anc7twBDsVSXkFa0CR2w1znTUIdi 33fOIuG5sGHoKLoMpKnEoBEnX7Df36NpPKFtkN1ZrihwzCWxvMLCkPTuZEoPmdVbzjWkRSVePHM MHb5LZGnhaO6+g/N+wOTqPtrvEFuwKMXk+huED+ENkKNbvIT
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
some functions and struct members were renamed. To not break all drivers
compatibility macros were provided.

To be able to remove these compatibility macros push the renaming into
this driver.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/gadget/udc/max3420_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/udc/max3420_udc.c
index 89e8cf2a2a7d..7349ea774adf 100644
--- a/drivers/usb/gadget/udc/max3420_udc.c
+++ b/drivers/usb/gadget/udc/max3420_udc.c
@@ -1201,7 +1201,7 @@ static int max3420_probe(struct spi_device *spi)
 	int err, irq;
 	u8 reg[8];
 
-	if (spi->master->flags & SPI_CONTROLLER_HALF_DUPLEX) {
+	if (spi->controller->flags & SPI_CONTROLLER_HALF_DUPLEX) {
 		dev_err(&spi->dev, "UDC needs full duplex to work\n");
 		return -EINVAL;
 	}
-- 
2.43.0



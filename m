Return-Path: <linux-usb+bounces-3345-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1EF7F9E51
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 12:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC57AB20E5D
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 11:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75260199A3;
	Mon, 27 Nov 2023 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="jB5NtgEQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B428C136;
	Mon, 27 Nov 2023 03:14:49 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1D53C00A1;
	Mon, 27 Nov 2023 12:14:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1701083687; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=n4MWxKLJ2mEngVhhcucO0tz7IR393NcgZWJ1yY5pvlM=;
	b=jB5NtgEQ4dRybbSOrm2OELM7oJ9wR7dw9UlbJ74nBPs7qULp0yj5TbyvNl3aoYhzhsMTZn
	U7M6CjKocJnfHdpM5DYRd3n6AY70/xn9xsyyL6r1bXwh1gMadELCxB0TkYTIrZAi/3HyZw
	C9z0Y2biKEGz1mEIReY2qyqAByL/oK7FaP0rPw6ItV2R7AY6lPhUR7iDMrXqOY3jr9l8JS
	4+sb4Jzra0LdrMaZAy7COXlmwTKVaKQyoJ/tuZF5edYbLAij1lg/XuvaIsf3u9t3MuetVS
	/0SjAJpcOP3aEqnUdIEn6mSNSeQDRJdBNTKfLSHk0Vd8fTxCzMmqrofEfJ9Q5Q==
From: Frieder Schrempf <frieder@fris.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Anand Moon <linux.amoon@gmail.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 3/3] usb: misc: onboard_usb_hub: Add support for Cypress CY7C6563x
Date: Mon, 27 Nov 2023 12:13:24 +0100
Message-ID: <20231127111332.107640-3-frieder@fris.de>
In-Reply-To: <20231127111332.107640-1-frieder@fris.de>
References: <20231127111332.107640-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The Cypress CY7C6563x is a 2/4-port USB 2.0 hub. Add support for
this hub in the driver in order to bring up reset, supply or clock
dependencies.

There is no reset pulse width given in the datasheet so we expect
a minimal value of 1us to be enough. This hasn't been tested though
due to lack of hardware which has the reset connected to a GPIO.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes in v2:
* none
---
 drivers/usb/misc/onboard_usb_hub.c | 1 +
 drivers/usb/misc/onboard_usb_hub.h | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 0d84b16deab50..0c0b698f008b9 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -441,6 +441,7 @@ static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
 static const struct usb_device_id onboard_hub_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6504) }, /* CYUSB33{0,1,2}x/CYUSB230x 3.0 */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6506) }, /* CYUSB33{0,1,2}x/CYUSB230x 2.0 */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6570) }, /* CY7C6563x 2.0 */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 */
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index c4e24a7b92904..67b2cc1e15e67 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -31,6 +31,11 @@ static const struct onboard_hub_pdata cypress_hx3_data = {
 	.num_supplies = 2,
 };
 
+static const struct onboard_hub_pdata cypress_hx2vl_data = {
+	.reset_us = 1,
+	.num_supplies = 1,
+};
+
 static const struct onboard_hub_pdata genesys_gl850g_data = {
 	.reset_us = 3,
 	.num_supplies = 1,
@@ -54,6 +59,7 @@ static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
 	{ .compatible = "usb4b4,6504", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6506", .data = &cypress_hx3_data, },
+	{ .compatible = "usb4b4,6570", .data = &cypress_hx2vl_data, },
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
-- 
2.42.1



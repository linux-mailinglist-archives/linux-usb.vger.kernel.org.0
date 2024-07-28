Return-Path: <linux-usb+bounces-12518-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AC993E554
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jul 2024 15:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF8C51C21251
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jul 2024 13:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498C84D8A7;
	Sun, 28 Jul 2024 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="QDu0TYVG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D754765;
	Sun, 28 Jul 2024 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722172051; cv=none; b=BNJeS0p7ZNpUG/YJzby1SpgkEY5IgqCjfhk9AImBs9DRRo1ZDFq2NnAzo2mK+pZ8fZ4C1isH0mDP1Otqce0JvTU46rYROIoKE+Q96yyUTQsCBCBLbYWyvje7SNuC/7tLaEbhjrEBS2+WJN8R9cts2kr0BAKXM3h4Gg/XXVJw3K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722172051; c=relaxed/simple;
	bh=pVXHlnRu0F/n3FhLK5MBcvB0BkcNyDZOXRztm2fZhkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sgl50Tyc8HqA+tdI9sr+FmkcR5J/k98UfsW55EfSQsInosOyMS4ihcZ7OMeYS6jN+xVdgvXAu/JT0ReANOfFjskrwBaDev2/yUNPYCpU+JNm8nPQt2RWwfhn66LuWZHUJ53Pez9o238rwKkSLeYOXg/telpecnGzRofOjxdX18U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=QDu0TYVG; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722172024; x=1722776824; i=wahrenst@gmx.net;
	bh=Gj8I0V69M7z41gMXYM9ztoJQUMFw0S4Baat58tz4C0E=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QDu0TYVGIrPPyHtkJcQPWt73BzzQw/56JyxEUV3i8Y2b0XaWlB4ELwwR4ReERlUQ
	 J9CiHgKyRAHg/VzyFwOnPR5HSPd09O16rDNaYHGgfS3dl79Us+RPi/+D3LdgT9Jkz
	 9NKtQbS2w+LST9mJ455A1rJo2k6gWRf6faRSBYkVFmAgjexMqzlaQNyvDCmMiPggI
	 3GByP4Qdmg/N9hw5o8D0t+QYvOD0+6qXiA5MepPuLFc/xkdoGd/k4x3LTO3kW2i1c
	 rAwSQTPQ89zHPLPX8T7I9J1SD2A3ain0Z2e1f9PaCpRuvkt5SN2KnVDAbr2RdYjvJ
	 2x+7iu8Pm8yKSMrgvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdefD-1rzH1l2kef-00m7eG; Sun, 28
 Jul 2024 15:07:04 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Maxime Ripard <mripard@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Lukas Wunner <lukas@wunner.de>,
	Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	dri-devel@lists.freedesktop.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 15/16] serial: 8250_bcm2835aux: add PM suspend/resume support
Date: Sun, 28 Jul 2024 15:00:28 +0200
Message-Id: <20240728130029.78279-7-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728130029.78279-1-wahrenst@gmx.net>
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LKpSEPBrxgSGKl6p0VVGDEip1oTMqhxgsWGVipZOkXwOdbvhctH
 6hEsO2jq8rWwq+RqQ630dUH3ZPlgcT9Uu47UQTvOeCIZKQz+iXuZx4UTP0bTmx73wwiGAfG
 d1SHscW4D2Rpb9HtCqCZZRlWNxjyPNpPOdQXT5zBx4FvWCmABwh1z7UX0CGyizy9SS49CiX
 XFcEdtxmXcwvvDrEL2yLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JDg6C/dfUsw=;t/v0ogfId+qldYXoGuQjDQ9jqLV
 RfHJ/ghd4m4Axjtezz6w/Eg2GjBGrYjzWQfJa2ENJqK28/akFew3t80Nn24Roo3hU10VETT6t
 Y5+XtfO9+XEaJVEnBSx+iFOJ5SBmX1KJ42j6L18719CqrqwgJdZYmORLs+P12B+uEZGSFR2Wg
 swaqQinhsvxQGSeuEFJuQFfkOesC0jg8nHiO4D5HVUgPrthiRwe3lHfXMO1spiagZTU20/jC0
 lhgWieXMQrcuTVyWnhNUXxY21uNTxqpB5YoT7hWCZQSoknkZGlyFKYmKYfThQmkc9KXKqafAG
 Wn/xPh5mhKMSOUbjUNa1FAgSNfuxuUmpw5OjzbleppitCkoXt+bgVxAP2RcyK9BcZsqQJGi6H
 v9O2HIE0Naeu+J/v+wTO4DhJKy97QdhdYeGwkfuzXxqcIXt0FfKt/ZhUWK1rk7Pb6hTGLYSUB
 cjpZ9+ytf/Hw3+fKBKVIB0nU6VB1YVRH7BdCHln94DGX6ehgvnxJRRGZzZUEtyndQN7N3GaGC
 vKsrEQus5zi4Ha06BMgnOboN2jlZzdgfMdmZXSlEZiFdcAkS++sFR+gQK0FfjE2c7vcxpGiU2
 CKdzSDG9d4PX87a/VVPbdBo35awLp0DB8u8jMTezh4vxnH1st7Tn5MIok6Cr3PZ7fgXE6ceLB
 W5BLEvz6LtKyW4+hd7oBZyPuPrM8YInft7dLqIwK+/vqnQiT5mVUo9ld2WhdCWPUeWa5cL36z
 euGQ8GoWOTBh8ihZpJEy5gA2s1bcFvJb3pQXrF4NujsQdtprvtHl4xoL9mUXtVOjSgsoiXoLT
 6V54Vu+9kOZJZQkWysyuTnOw==

This adds suspend/resume support for the 8250_bcm2835aux
driver to provide power management support on attached
devices.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/tty/serial/8250/8250_bcm2835aux.c | 37 +++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_bcm2835aux.c b/drivers/tty/seria=
l/8250/8250_bcm2835aux.c
index 121a5ce86050..36e2bb34d82b 100644
=2D-- a/drivers/tty/serial/8250/8250_bcm2835aux.c
+++ b/drivers/tty/serial/8250/8250_bcm2835aux.c
@@ -13,6 +13,7 @@
  */

 #include <linux/clk.h>
+#include <linux/console.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -213,11 +214,47 @@ static const struct acpi_device_id bcm2835aux_serial=
_acpi_match[] =3D {
 };
 MODULE_DEVICE_TABLE(acpi, bcm2835aux_serial_acpi_match);

+static int bcm2835aux_suspend(struct device *dev)
+{
+	struct bcm2835aux_data *data =3D dev_get_drvdata(dev);
+	struct uart_8250_port *up =3D serial8250_get_port(data->line);
+
+	serial8250_suspend_port(data->line);
+
+	if (device_may_wakeup(dev))
+		return 0;
+
+	if (uart_console(&up->port) && !console_suspend_enabled)
+		return 0;
+
+	clk_disable_unprepare(data->clk);
+	return 0;
+}
+
+static int bcm2835aux_resume(struct device *dev)
+{
+	struct bcm2835aux_data *data =3D dev_get_drvdata(dev);
+	int ret;
+
+	ret =3D clk_prepare_enable(data->clk);
+	if (ret)
+		return ret;
+
+	serial8250_resume_port(data->line);
+
+	return 0;
+}
+
+static const struct dev_pm_ops bcm2835aux_dev_pm_ops =3D {
+	SYSTEM_SLEEP_PM_OPS(bcm2835aux_suspend, bcm2835aux_resume)
+};
+
 static struct platform_driver bcm2835aux_serial_driver =3D {
 	.driver =3D {
 		.name =3D "bcm2835-aux-uart",
 		.of_match_table =3D bcm2835aux_serial_match,
 		.acpi_match_table =3D bcm2835aux_serial_acpi_match,
+		.pm =3D pm_ptr(&bcm2835aux_dev_pm_ops),
 	},
 	.probe  =3D bcm2835aux_serial_probe,
 	.remove_new =3D bcm2835aux_serial_remove,
=2D-
2.34.1



Return-Path: <linux-usb+bounces-28018-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EACDEB54766
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 11:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81BF77B6933
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 09:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8659D2E0412;
	Fri, 12 Sep 2025 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOHOzuUb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530872DEA84
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757668846; cv=none; b=n366W9zs9SsvQXK2PI3+aMTrplaTUQRxCIs+GaJM7D3B2Cbj6zbPRTzKIutzcyg8kbutdfHKXLA9fI58HCHOexVgBqPV2flHQrAv+nrqYD1bzQjGdxSySYNfXXOOToXnBUTnq1f21YY+aBF1wgiv7nYAgHIN35R2RjfxypGmDW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757668846; c=relaxed/simple;
	bh=490XaeJOSXOPOipAwlaja6D50/cNV+4mssGhLZMnMJo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TNZrE/ylNGdMVd1QPoKzKp/keM/fbvOxFY9DEMg87eOCUl5mi271IwDGqNW7udPbMYXG+csyy/YftX0Xp0gQio+RZAVOySWxNyrnUGqhsZJwOWj7cSrk38wnPPoEPoynNYJ9F5OJML5viLhZMTp2Bz8fUvudqSpgm0A32HvsnOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOHOzuUb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32de2189729so998337a91.3
        for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757668843; x=1758273643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgDT8yas3IcACX8dpF1Z+jTHl5S85Xg0OLjTZ81TkYA=;
        b=UOHOzuUb45N4osHau19ITbQhlJ5LHhfyenMkBxeFC25t5i2kVamZ2Qb4JcYIxCyPhv
         dGebg6l+Hm6h6+5HqKuVvVpcc/1mpsNLPQzs//xh+yjbg40bCui2LLsZO5M7kXXstEd1
         LgusTq4e+TvagY27d26bi5V7y3jdYPW1QJ26+ZOrAnLI9Jvdupgdir+DiZzLYw+rvSml
         bHe7sHly3uti++I+SGw7mous5xla/OmGiOtXlhl0AtumVvuTA4RBZhgToCXyfpFB0YWc
         14LpcBX+2H9yYSu939PY3IZpHURkPphtbfbVG+Z8Z5BCJX6lcZlr9+7154KE48p+TEhT
         xoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668843; x=1758273643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgDT8yas3IcACX8dpF1Z+jTHl5S85Xg0OLjTZ81TkYA=;
        b=LcnHx8a/bQwCj0ZHrt8YS9XyM5xv2bTAahviXU4kTVA+GGlUBDpOKS2wqgpNqQn09C
         PhO7TRVtrcWIktEv5DPru5fQqPBVT0bVK69Dc2Y4mdgvZHGDCO1qFoUwhBfxFYK1+3cP
         +v8aUYtZFHnkz1j3gFsFWWTR54iG9Cj/v1nerjM1WJJpjy2LJ8HgmO34fxlit+wOi/d7
         UqnKRbjUfs4rCB4tE1U3BVYKCRDDBclJWf3VgHuinMPyiNDz0zHKYIN95OdvbM7WIkV9
         nrCegXsLtdNo+xBR81iOE2JjZw21QxgcBgcpn6ofdidCDraHAUSHcEBuLgRJGMAtHHHX
         cavA==
X-Forwarded-Encrypted: i=1; AJvYcCUu6RhHnxa+zCydZ9UQCQFxGYPdDNnf16gs9NhevFAHEuCjwP0VgUXgzqIaj7WoZaRykxjhW74uTnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz0fr3DqOYIlkQwbKsSiIwcMlI7xDx5YRiGrlP83wgLNmF0Cey
	lVZF8r33SC1qTF0+N6cRsx5Sc3MGGzdQyrZKGgBU8bjtigNm8+OXQxFE
X-Gm-Gg: ASbGncvQYa2dUy/kZ1N6aQK0JCbrlPbV9q0hInTxIEFjSyzbTAT6dZgLv9smgeOdq66
	UenyYJ/M+l1mZbbHwanMos8iPqlV7CaLa/GAmr2WO4jxKa4dLU8PzI7yt1+CTwlwPBmt9tto6PD
	M5hYdKpRMUDl9ddKBBOSHrPRBXyPOeIVDJiP8Id5B3kQwNKU5vJyP3Ls332LivGvtdb3hoNJcxP
	F+POMiAylAUC+vbJASOSBk0tytmx9B8+E1tilUJKtXw4++Fk1zbOs+/MA9VFVQzdo6+Ai5wnmyH
	8feprSWJVYvEgyhTAiu8dApjGMnJib1kd/nFJZwukm32ih9oQG8Y8HbSMkKmZEurJgN/ieky0Ln
	EisciwJxSkEI8Fl8l9VMdVosbeftOI0ggERKFH3MPFbZVJ2gw64CmTgd53WG7SMJScA==
X-Google-Smtp-Source: AGHT+IExdBehpPUbHsaoXn2hWCJuv0LpOESNjTgw/5wU/Er5DJI4ga/ArIntuYfQJ3gORg8zNqnSQw==
X-Received: by 2002:a17:90b:5110:b0:325:7845:fc52 with SMTP id 98e67ed59e1d1-32de5144bafmr2400546a91.25.1757668842632;
        Fri, 12 Sep 2025 02:20:42 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a36dc461sm4066564a12.23.2025.09.12.02.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:20:42 -0700 (PDT)
From: a0282524688@gmail.com
To: tmyu0@nuvoton.com,
	lee@kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andi.shyti@kernel.org,
	mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH RESEND v14 7/7] rtc: Add Nuvoton NCT6694 RTC support
Date: Fri, 12 Sep 2025 17:19:52 +0800
Message-Id: <20250912091952.1169369-8-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912091952.1169369-1-a0282524688@gmail.com>
References: <20250912091952.1169369-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

This driver supports RTC functionality for NCT6694 MFD device
based on USB interface.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes since version 13:

Changes since version 12:
- Use same email address in the signature

Changes since version 11:

Changes since version 10:

Changes since version 9:
- Add devm_add_action_or_reset() to dispose irq mapping

Changes since version 8:
- Modify the signed-off-by with my work address
- Add irq_dispose_mapping() in the error handling path and in the remove
  function

Changes since version 7:

Changes since version 6:

Changes since version 5:
- Modify the module name and the driver name consistently

Changes since version 4:
- Modify arguments in read/write function to a pointer to cmd_header
- Modify all callers that call the read/write function

Changes since version 3:
- Modify array buffer to structure
- Fix defines and comments
- Drop private mutex and use rtc core lock
- Modify device_set_wakeup_capable() to device_init_wakeup()

Changes since version 2:
- Add MODULE_ALIAS()

Changes since version 1:
- Add each driver's command structure
- Fix platform driver registration
- Drop unnecessary logs
- Fix overwrite error return values
- Modify to use dev_err_probe API

 MAINTAINERS               |   1 +
 drivers/rtc/Kconfig       |  10 ++
 drivers/rtc/Makefile      |   1 +
 drivers/rtc/rtc-nct6694.c | 297 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 309 insertions(+)
 create mode 100644 drivers/rtc/rtc-nct6694.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bbacc9d48a83..442f24a408a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18090,6 +18090,7 @@ F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
 F:	drivers/net/can/usb/nct6694_canfd.c
+F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
 F:	include/linux/mfd/nct6694.h
 
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 64f6e9756aff..4a8dc8d0a4b7 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -416,6 +416,16 @@ config RTC_DRV_NCT3018Y
 	   This driver can also be built as a module, if so, the module will be
 	   called "rtc-nct3018y".
 
+config RTC_DRV_NCT6694
+	tristate "Nuvoton NCT6694 RTC support"
+	depends on MFD_NCT6694
+	help
+	  If you say yes to this option, support will be included for Nuvoton
+	  NCT6694, a USB device to RTC.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called rtc-nct6694.
+
 config RTC_DRV_RK808
 	tristate "Rockchip RK805/RK808/RK809/RK817/RK818 RTC"
 	depends on MFD_RK8XX
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 789bddfea99d..610a9ee5fd33 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -119,6 +119,7 @@ obj-$(CONFIG_RTC_DRV_MXC)	+= rtc-mxc.o
 obj-$(CONFIG_RTC_DRV_MXC_V2)	+= rtc-mxc_v2.o
 obj-$(CONFIG_RTC_DRV_GAMECUBE)	+= rtc-gamecube.o
 obj-$(CONFIG_RTC_DRV_NCT3018Y)	+= rtc-nct3018y.o
+obj-$(CONFIG_RTC_DRV_NCT6694)	+= rtc-nct6694.o
 obj-$(CONFIG_RTC_DRV_NTXEC)	+= rtc-ntxec.o
 obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
 obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
diff --git a/drivers/rtc/rtc-nct6694.c b/drivers/rtc/rtc-nct6694.c
new file mode 100644
index 000000000000..35401a0d9cf5
--- /dev/null
+++ b/drivers/rtc/rtc-nct6694.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 RTC driver based on USB interface.
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ */
+
+#include <linux/bcd.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+
+/*
+ * USB command module type for NCT6694 RTC controller.
+ * This defines the module type used for communication with the NCT6694
+ * RTC controller over the USB interface.
+ */
+#define NCT6694_RTC_MOD		0x08
+
+/* Command 00h - RTC Time */
+#define NCT6694_RTC_TIME	0x0000
+#define NCT6694_RTC_TIME_SEL	0x00
+
+/* Command 01h - RTC Alarm */
+#define NCT6694_RTC_ALARM	0x01
+#define NCT6694_RTC_ALARM_SEL	0x00
+
+/* Command 02h - RTC Status */
+#define NCT6694_RTC_STATUS	0x02
+#define NCT6694_RTC_STATUS_SEL	0x00
+
+#define NCT6694_RTC_IRQ_INT_EN	BIT(0)	/* Transmit a USB INT-in when RTC alarm */
+#define NCT6694_RTC_IRQ_GPO_EN	BIT(5)	/* Trigger a GPO Low Pulse when RTC alarm */
+
+#define NCT6694_RTC_IRQ_EN	(NCT6694_RTC_IRQ_INT_EN | NCT6694_RTC_IRQ_GPO_EN)
+#define NCT6694_RTC_IRQ_STS	BIT(0)	/* Write 1 clear IRQ status */
+
+struct __packed nct6694_rtc_time {
+	u8 sec;
+	u8 min;
+	u8 hour;
+	u8 week;
+	u8 day;
+	u8 month;
+	u8 year;
+};
+
+struct __packed nct6694_rtc_alarm {
+	u8 sec;
+	u8 min;
+	u8 hour;
+	u8 alarm_en;
+	u8 alarm_pend;
+};
+
+struct __packed nct6694_rtc_status {
+	u8 irq_en;
+	u8 irq_pend;
+};
+
+union __packed nct6694_rtc_msg {
+	struct nct6694_rtc_time time;
+	struct nct6694_rtc_alarm alarm;
+	struct nct6694_rtc_status sts;
+};
+
+struct nct6694_rtc_data {
+	struct nct6694 *nct6694;
+	struct rtc_device *rtc;
+	union nct6694_rtc_msg *msg;
+	int irq;
+};
+
+static int nct6694_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_time *time = &data->msg->time;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_RTC_MOD,
+		.cmd = NCT6694_RTC_TIME,
+		.sel = NCT6694_RTC_TIME_SEL,
+		.len = cpu_to_le16(sizeof(*time))
+	};
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, time);
+	if (ret)
+		return ret;
+
+	tm->tm_sec = bcd2bin(time->sec);		/* tm_sec expect 0 ~ 59 */
+	tm->tm_min = bcd2bin(time->min);		/* tm_min expect 0 ~ 59 */
+	tm->tm_hour = bcd2bin(time->hour);		/* tm_hour expect 0 ~ 23 */
+	tm->tm_wday = bcd2bin(time->week) - 1;		/* tm_wday expect 0 ~ 6 */
+	tm->tm_mday = bcd2bin(time->day);		/* tm_mday expect 1 ~ 31 */
+	tm->tm_mon = bcd2bin(time->month) - 1;		/* tm_month expect 0 ~ 11 */
+	tm->tm_year = bcd2bin(time->year) + 100;	/* tm_year expect since 1900 */
+
+	return ret;
+}
+
+static int nct6694_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_time *time = &data->msg->time;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_RTC_MOD,
+		.cmd = NCT6694_RTC_TIME,
+		.sel = NCT6694_RTC_TIME_SEL,
+		.len = cpu_to_le16(sizeof(*time))
+	};
+
+	time->sec = bin2bcd(tm->tm_sec);
+	time->min = bin2bcd(tm->tm_min);
+	time->hour = bin2bcd(tm->tm_hour);
+	time->week = bin2bcd(tm->tm_wday + 1);
+	time->day = bin2bcd(tm->tm_mday);
+	time->month = bin2bcd(tm->tm_mon + 1);
+	time->year = bin2bcd(tm->tm_year - 100);
+
+	return nct6694_write_msg(data->nct6694, &cmd_hd, time);
+}
+
+static int nct6694_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_alarm *alarm = &data->msg->alarm;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_RTC_MOD,
+		.cmd = NCT6694_RTC_ALARM,
+		.sel = NCT6694_RTC_ALARM_SEL,
+		.len = cpu_to_le16(sizeof(*alarm))
+	};
+	int ret;
+
+	ret = nct6694_read_msg(data->nct6694, &cmd_hd, alarm);
+	if (ret)
+		return ret;
+
+	alrm->time.tm_sec = bcd2bin(alarm->sec);
+	alrm->time.tm_min = bcd2bin(alarm->min);
+	alrm->time.tm_hour = bcd2bin(alarm->hour);
+	alrm->enabled = alarm->alarm_en;
+	alrm->pending = alarm->alarm_pend;
+
+	return ret;
+}
+
+static int nct6694_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_alarm *alarm = &data->msg->alarm;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_RTC_MOD,
+		.cmd = NCT6694_RTC_ALARM,
+		.sel = NCT6694_RTC_ALARM_SEL,
+		.len = cpu_to_le16(sizeof(*alarm))
+	};
+
+	alarm->sec = bin2bcd(alrm->time.tm_sec);
+	alarm->min = bin2bcd(alrm->time.tm_min);
+	alarm->hour = bin2bcd(alrm->time.tm_hour);
+	alarm->alarm_en = alrm->enabled ? NCT6694_RTC_IRQ_EN : 0;
+	alarm->alarm_pend = 0;
+
+	return nct6694_write_msg(data->nct6694, &cmd_hd, alarm);
+}
+
+static int nct6694_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct nct6694_rtc_data *data = dev_get_drvdata(dev);
+	struct nct6694_rtc_status *sts = &data->msg->sts;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_RTC_MOD,
+		.cmd = NCT6694_RTC_STATUS,
+		.sel = NCT6694_RTC_STATUS_SEL,
+		.len = cpu_to_le16(sizeof(*sts))
+	};
+
+	if (enabled)
+		sts->irq_en |= NCT6694_RTC_IRQ_EN;
+	else
+		sts->irq_en &= ~NCT6694_RTC_IRQ_EN;
+
+	sts->irq_pend = 0;
+
+	return nct6694_write_msg(data->nct6694, &cmd_hd, sts);
+}
+
+static const struct rtc_class_ops nct6694_rtc_ops = {
+	.read_time = nct6694_rtc_read_time,
+	.set_time = nct6694_rtc_set_time,
+	.read_alarm = nct6694_rtc_read_alarm,
+	.set_alarm = nct6694_rtc_set_alarm,
+	.alarm_irq_enable = nct6694_rtc_alarm_irq_enable,
+};
+
+static irqreturn_t nct6694_irq(int irq, void *dev_id)
+{
+	struct nct6694_rtc_data *data = dev_id;
+	struct nct6694_rtc_status *sts = &data->msg->sts;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_RTC_MOD,
+		.cmd = NCT6694_RTC_STATUS,
+		.sel = NCT6694_RTC_STATUS_SEL,
+		.len = cpu_to_le16(sizeof(*sts))
+	};
+	int ret;
+
+	rtc_lock(data->rtc);
+
+	sts->irq_en = NCT6694_RTC_IRQ_EN;
+	sts->irq_pend = NCT6694_RTC_IRQ_STS;
+	ret = nct6694_write_msg(data->nct6694, &cmd_hd, sts);
+	if (ret) {
+		rtc_unlock(data->rtc);
+		return IRQ_NONE;
+	}
+
+	rtc_update_irq(data->rtc, 1, RTC_IRQF | RTC_AF);
+
+	rtc_unlock(data->rtc);
+
+	return IRQ_HANDLED;
+}
+
+static void nct6694_irq_dispose_mapping(void *d)
+{
+	struct nct6694_rtc_data *data = d;
+
+	irq_dispose_mapping(data->irq);
+}
+
+static int nct6694_rtc_probe(struct platform_device *pdev)
+{
+	struct nct6694_rtc_data *data;
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	int ret;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->msg = devm_kzalloc(&pdev->dev, sizeof(union nct6694_rtc_msg),
+				 GFP_KERNEL);
+	if (!data->msg)
+		return -ENOMEM;
+
+	data->irq = irq_create_mapping(nct6694->domain, NCT6694_IRQ_RTC);
+	if (!data->irq)
+		return -EINVAL;
+
+	ret = devm_add_action_or_reset(&pdev->dev, nct6694_irq_dispose_mapping,
+				       data);
+	if (ret)
+		return ret;
+
+	ret = devm_device_init_wakeup(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to init wakeup\n");
+
+	data->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(data->rtc))
+		return PTR_ERR(data->rtc);
+
+	data->nct6694 = nct6694;
+	data->rtc->ops = &nct6694_rtc_ops;
+	data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	data->rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	platform_set_drvdata(pdev, data);
+
+	ret = devm_request_threaded_irq(&pdev->dev, data->irq, NULL,
+					nct6694_irq, IRQF_ONESHOT,
+					"rtc-nct6694", data);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request irq\n");
+
+	return devm_rtc_register_device(data->rtc);
+}
+
+static struct platform_driver nct6694_rtc_driver = {
+	.driver = {
+		.name	= "nct6694-rtc",
+	},
+	.probe		= nct6694_rtc_probe,
+};
+
+module_platform_driver(nct6694_rtc_driver);
+
+MODULE_DESCRIPTION("USB-RTC driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:nct6694-rtc");
-- 
2.34.1



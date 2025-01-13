Return-Path: <linux-usb+bounces-19265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D389EA0BF43
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 18:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D60BF163206
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 17:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6681C1AB4;
	Mon, 13 Jan 2025 17:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mywoQopj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E20C24022F;
	Mon, 13 Jan 2025 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736790748; cv=none; b=XdspP20W1iY4SAaCuhpxa4lXsLf3qVtIukNU9PtIsBP89Z0+IigI51fWQ84gFkg0QWT0mKZDsLPljrERx6m0jFC4rrwA+OXshOnv3Fxo/zB/7LCeJbCOxRnc2rakPJLKyG5Om5Ic6nwMtgXLoiNOZxhNErZ5Czub+CLDEhWs8eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736790748; c=relaxed/simple;
	bh=8632s5sxj2XPiBeg+a+Ba0y8cFZJmBlr0tqXMcv/pdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OrYMZo3fO3PJXBhD1GKiilaxJJHqXcCqBNGacow3jUYdvgygNfnOXrKPb+fLP6Q95OqHrrdT/DNjDGlKE1+qgp3rN2y/c4Sg0u4ff3hCy3LNLGGAzKvv/8KwslFFkxRiNAiJ71JWCosu2p+GAWZEgMZlczvNHcfiaLa1Uo74cl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mywoQopj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21a7ed0155cso78894175ad.3;
        Mon, 13 Jan 2025 09:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736790746; x=1737395546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibTVDee6wvl4HVurpUAtKl3Uyh5IZMqzY00oHtMrOws=;
        b=mywoQopj0mRFOO0dgzlnTMSRPsngO8O5Lh74cerVjaIclnFb70EWg+Db0eA72x54gW
         e4VboHEDRLTrrh6ihV4fcu/Epe4XFDX29fSumXY5CyCf1VBA3bBXM282zI3pzMR7aEyT
         kaCCVKIsQlZ9ur+/TQk9+WgcvhDG7PwO6yVNZxgLvHU93GfTHesiVEOFr7Xl9K57cwbk
         HIBZxSZj/+kSpikglODQJb3ztWY690K6KEtik2p2EgfYHdo4S84EDbQqjkRcO8pcZC+S
         TC8woCqzodtwa5PVZI05BAfIA83fZ1bGtqwc/8WtyJ+nbbRMfTpBu8pyp3Q6XDsbnIjP
         kNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736790746; x=1737395546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibTVDee6wvl4HVurpUAtKl3Uyh5IZMqzY00oHtMrOws=;
        b=qVzRLTh7A9ThX+er5qXlCL2ZUZZUlkXCz4O3VPOMVlqe6kXm0/Ya4JYuM/AK6IgtEb
         OwPf2IA93LMOmNyn/KwStXRUmAepsgDXOZRAWzOHcVbPbdtLMgeMGQBqRQe8SZPTXyiJ
         TayBHEt3XA3IRa9GJ8kxFp8RbGu07QUcvBMc8c2G5DVL34XFLvaqq+tkBu0uvhIMvhew
         qdKylGrwUnAa/clwfs7VtZQGTnbUEulGufQpMeWSwzhZVbcr56/hprwFqQFr5nXzNOQP
         4dAF4GZYtp0ZwAfdZoo386BlxxiW4PcLfsMZ+ZlN/egudzbcPUq7w0GVrGNzOzAuKQyp
         D5Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUD/jVd8mOYJ3dv9ZmAirIQFpGhKCAjD4LKty+uB9ZvvrMMfha8EVvhTiLxnophyJ+4sV5Xz8EWJEweYtk=@vger.kernel.org, AJvYcCV48bQQkwPNmt4gr/uxR6XHXKZxlxHST8BhtDHmQ8aCSttXpkCJpTRyMfxDqS7ZirsksOJ0mNi4QA37Yi+6@vger.kernel.org, AJvYcCVAkjvuOu242AJEaGNEIyAjMzVyo3FBQcidP2jE6t+tOIYM1flqtAO/+fzeicGNhy099IIgsufb6B5w@vger.kernel.org, AJvYcCVTKDdYTy1fj5w7zqXhLBqyChsXxEGZY+nqEuyasaAs6h60AoUk5CuYlR4pCTSZIPgua+6ivwPytPE=@vger.kernel.org, AJvYcCWBMbsMJUNgd6hKVnrGUF3Q/PSgPmh2i06xQDomqTc0vbquecEEmp1ZvTtMX0LfSGu9kLzzT9yS0pNbjlRr@vger.kernel.org, AJvYcCXiWgfwRPUWusxRtiEyQ6A/ThwPalr43Ot2T+JN/VC+V8kzCW3eLJQh/q0K4jEfxNt1yjUhHfTTnSpi3zbqdJF7E+2Hlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIcK4vWF5wC55B4mR9QTsZ9q2dLVlB0AQBStSzr8JK902+95Ww
	Z07SyxJYQJQsmHdWKFbWJPnFaSlLo7AVmec5Oj5hA30X2tOkt1oq
X-Gm-Gg: ASbGnctZn4C6tUbWRASIaxOhGIM86lhKWvLDB3ASSDtaHBH8DlNBAEh1L8Ffs5Xqc7v
	z82y++ptAFZqJRbaz3eEZFMAhM8e8raKBnkykNs8e//tONKzr9bSKrZ/QBTlFUx7weIJ1HY2QEh
	X+vUqjBUdyq20nXgrbZzKp3qOTih4kEz34EakZgFih4eSNWEdIPTbbDqSWcZo01HggWx7vf5PtX
	hVZmYTnVfKPZQoePpZH9xIlbfc5NWFp7JsMh0/c6PLc9MrOkJ0/5d4=
X-Google-Smtp-Source: AGHT+IFYdOF476BTPQvJqPtNcwB1L3ff9+rRXpghCYzRsFDPKCLhiSLuRSxrKL63RcN8+yY3wvm+ag==
X-Received: by 2002:a05:6a00:929a:b0:72a:8b90:92e9 with SMTP id d2e1a72fcca58-72d21f30475mr28800901b3a.5.1736790745393;
        Mon, 13 Jan 2025 09:52:25 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4056a632sm6330669b3a.59.2025.01.13.09.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 09:52:24 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 2/6] platform: arm64: add Huawei Matebook E Go EC driver
Date: Tue, 14 Jan 2025 01:50:49 +0800
Message-ID: <20250113175049.590511-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are three variants of which Huawei released the first two
simultaneously.

Huawei Matebook E Go LTE(sc8180x), codename seems to be gaokun2.
Huawei Matebook E Go(sc8280xp@3.0GHz), codename must be gaokun3. (see [1])
Huawei Matebook E Go 2023(sc8280xp@2.69GHz), codename should be also gaokun3.

Adding support for the latter two variants for now, this driver should
also work for the sc8180x variant according to acpi table files, but I
don't have the device to test yet.

Different from other Qualcomm Snapdragon sc8280xp based machines, the
Huawei Matebook E Go uses an embedded controller while others use
a system called PMIC GLink. This embedded controller can be used to
perform a set of various functions, including, but not limited to:

- Battery and charger monitoring;
- Charge control and smart charge;
- Fn_lock settings;
- Tablet lid status;
- Temperature sensors;
- USB Type-C notifications (ports orientation,  DP alt mode HPD);
- USB Type-C PD (according to observation, up to 48w).

Add a driver for the EC which creates devices for UCSI and power supply
devices.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=219645

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 MAINTAINERS                                   |   9 +
 drivers/platform/arm64/Kconfig                |  21 +
 drivers/platform/arm64/Makefile               |   1 +
 drivers/platform/arm64/huawei-gaokun-ec.c     | 841 ++++++++++++++++++
 .../linux/platform_data/huawei-gaokun-ec.h    |  80 ++
 5 files changed, 952 insertions(+)
 create mode 100644 drivers/platform/arm64/huawei-gaokun-ec.c
 create mode 100644 include/linux/platform_data/huawei-gaokun-ec.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 520612b3d..0f9e0390a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10691,6 +10691,15 @@ S:	Maintained
 F:	Documentation/networking/device_drivers/ethernet/huawei/hinic.rst
 F:	drivers/net/ethernet/huawei/hinic/
 
+HUAWEI MATEBOOK E GO EMBEDDED CONTROLLER DRIVER
+M:	Pengyu Luo <mitltlatltl@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
+F:	drivers/platform/arm64/huawei-gaokun-ec.c
+F:	drivers/power/supply/huawei-gaokun-battery.c
+F:	drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+F:	include/linux/platform_data/huawei-gaokun-ec.h
+
 HUGETLB SUBSYSTEM
 M:	Muchun Song <muchun.song@linux.dev>
 L:	linux-mm@kvack.org
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index f88395ea3..67dc7aa95 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -33,6 +33,27 @@ config EC_ACER_ASPIRE1
 	  laptop where this information is not properly exposed via the
 	  standard ACPI devices.
 
+config EC_HUAWEI_GAOKUN
+	tristate "Huawei Matebook E Go Embedded Controller driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on I2C
+	depends on DRM
+	depends on POWER_SUPPLY
+	depends on INPUT
+	help
+	  Say Y here to enable the EC driver for the Huawei Matebook E Go
+	  which is a sc8280xp-based 2-in-1 tablet. The driver handles battery
+	  (information, charge control) and USB Type-C DP HPD events as well
+	  as some misc functions like the lid sensor and temperature sensors,
+	  etc.
+
+	  This driver provides battery and AC status support for the mentioned
+	  laptop where this information is not properly exposed via the
+	  standard ACPI devices.
+
+	  Say M or Y here to include this support.
+
+
 config EC_LENOVO_YOGA_C630
 	tristate "Lenovo Yoga C630 Embedded Controller driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index b2ae9114f..46a99eba3 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -6,4 +6,5 @@
 #
 
 obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
+obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
 obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c b/drivers/platform/arm64/huawei-gaokun-ec.c
new file mode 100644
index 000000000..3cbecc81e
--- /dev/null
+++ b/drivers/platform/arm64/huawei-gaokun-ec.c
@@ -0,0 +1,841 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * huawei-gaokun-ec - An EC driver for HUAWEI Matebook E Go
+ *
+ * reference: drivers/platform/arm64/acer-aspire1-ec.c
+ *            drivers/platform/arm64/lenovo-yoga-c630.c
+ *            drivers/platform/x86/huawei-wmi.c
+ *
+ * Copyright (C) 2024 Pengyu Luo <mitltlatltl@gmail.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/notifier.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_data/huawei-gaokun-ec.h>
+#include <linux/version.h>
+
+#define EC_EVENT		0x06
+
+/* Also can be found in ACPI specification 12.3 */
+#define EC_READ			0x80
+#define EC_WRITE		0x81
+#define EC_BURST		0x82
+#define EC_QUERY		0x84
+
+#define EC_FN_LOCK_ON		0x5A
+#define EC_FN_LOCK_OFF		0x55
+
+#define EC_EVENT_LID		0x81
+
+#define EC_LID_STATE		0x80
+#define EC_LID_OPEN		BIT(1)
+
+#define UCSI_REG_SIZE		7
+
+/*
+ * for tx, command sequences are arranged as
+ * {master_cmd, slave_cmd, data_len, data_seq}
+ */
+#define REQ_HDR_SIZE		3
+#define INPUT_SIZE_OFFSET	2
+#define REQ_LEN(req) (REQ_HDR_SIZE + req[INPUT_SIZE_OFFSET])
+
+/*
+ * for rx, data sequences are arranged as
+ * {status, data_len(unreliable), data_seq}
+ */
+#define RESP_HDR_SIZE		2
+
+#define MKREQ(REG0, REG1, SIZE, ...)			\
+{							\
+	REG0, REG1, SIZE,				\
+	/* ## will remove comma when SIZE is 0 */	\
+	## __VA_ARGS__,					\
+	/* make sure len(pkt[3:]) >= SIZE */		\
+	[3 + SIZE] = 0,					\
+}
+
+#define MKRESP(SIZE)				\
+{						\
+	[RESP_HDR_SIZE + SIZE - 1] = 0,		\
+}
+
+static inline void refill_req(u8 *dest, const u8 *src, size_t size)
+{
+	memcpy(dest + REQ_HDR_SIZE, src, size);
+}
+
+static inline void extr_resp(u8 *dest, const u8 *src, size_t size)
+{
+	memcpy(dest, src + RESP_HDR_SIZE, size);
+}
+
+struct gaokun_ec {
+	struct i2c_client *client;
+	struct mutex lock; /* EC transaction lock */
+	struct blocking_notifier_head notifier_list;
+	struct device *hwmon_dev;
+	struct input_dev *idev;
+	bool suspended;
+};
+
+static int gaokun_ec_request(struct gaokun_ec *ec, const u8 *req,
+			     size_t resp_len, u8 *resp)
+{
+	struct i2c_client *client = ec->client;
+	struct i2c_msg msgs[2] = {
+		{
+			.addr = client->addr,
+			.flags = client->flags,
+			.len = REQ_LEN(req),
+			.buf = req,
+		}, {
+			.addr = client->addr,
+			.flags = client->flags | I2C_M_RD,
+			.len = resp_len,
+			.buf = resp,
+		},
+	};
+
+	mutex_lock(&ec->lock);
+
+	i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	usleep_range(2000, 2500); /* have a break, acpi did this */
+
+	mutex_unlock(&ec->lock);
+
+	return *resp ? -EIO : 0;
+}
+
+/* -------------------------------------------------------------------------- */
+/* Common API */
+
+/**
+ * gaokun_ec_read - Read from EC
+ * @ec: The gaokun_ec
+ * @req: The sequence to request
+ * @resp_len: The size to read
+ * @resp: Where the data are read to
+ *
+ * Return: 0 on success or negative error code.
+ *
+ * This function is used to read data after writing a magic sequence to EC.
+ * All EC operations depend on this function.
+ *
+ * Huawei uses magic sequences everywhere to complete various functions, all
+ * these sequences are passed to ECCD(a ACPI method which is quiet similar
+ * to gaokun_ec_request), there is no good abstraction to generalize these
+ * sequences, so just wrap it for now. Almost all magic sequences are kept
+ * in this file.
+ */
+int gaokun_ec_read(struct gaokun_ec *ec, const u8 *req,
+		   size_t resp_len, u8 *resp)
+{
+	return gaokun_ec_request(ec, req, resp_len, resp);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_read);
+
+/**
+ * gaokun_ec_write - Write to EC
+ * @ec: The gaokun_ec
+ * @req: The sequence to request
+ *
+ * Return: 0 on success or negative error code.
+ *
+ * This function has no big difference from gaokun_ec_read. When caller care
+ * only write status and no actual data are returned, then use it.
+ */
+int gaokun_ec_write(struct gaokun_ec *ec, u8 *req)
+{
+	u8 resp[] = MKRESP(0);
+
+	return gaokun_ec_request(ec, req, sizeof(resp), resp);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_write);
+
+int gaokun_ec_read_byte(struct gaokun_ec *ec, u8 *req, u8 *byte)
+{
+	int ret;
+	u8 resp[] = MKRESP(sizeof(*byte));
+
+	ret = gaokun_ec_read(ec, req, sizeof(resp), resp);
+	extr_resp(byte, resp, sizeof(*byte));
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_read_byte);
+
+/**
+ * gaokun_ec_register_notify - Register a notifier callback for EC events.
+ * @ec: The gaokun_ec
+ * @nb: Notifier block pointer to register
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_register_notify(struct gaokun_ec *ec, struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&ec->notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_register_notify);
+
+/**
+ * gaokun_ec_unregister_notify - Unregister notifier callback for EC events.
+ * @ec: The gaokun_ec
+ * @nb: Notifier block pointer to unregister
+ *
+ * Unregister a notifier callback that was previously registered with
+ * gaokun_ec_register_notify().
+ */
+void gaokun_ec_unregister_notify(struct gaokun_ec *ec, struct notifier_block *nb)
+{
+	blocking_notifier_chain_unregister(&ec->notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_unregister_notify);
+
+/* -------------------------------------------------------------------------- */
+/* API For PSY */
+
+/**
+ * gaokun_ec_psy_multi_read - Read contiguous registers
+ * @ec: The gaokun_ec
+ * @reg: The start register
+ * @resp_len: The number of registers to be read
+ * @resp: Where the data are read to
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_psy_multi_read(struct gaokun_ec *ec, u8 reg,
+			     size_t resp_len, u8 *resp)
+{
+	int i, ret;
+	u8 _resp[] = MKRESP(1);
+	u8 req[] = MKREQ(0x02, EC_READ, 1, 0);
+
+	for (i = 0; i < resp_len; ++i, reg++) {
+		refill_req(req, &reg, 1);
+		ret = gaokun_ec_read(ec, req, sizeof(_resp), _resp);
+		if (ret)
+			return ret;
+		extr_resp(&resp[i], _resp, 1);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_psy_multi_read);
+
+/* Smart charge */
+#define are_thresholds_valid(start, end) ((end != 0) && (start <= end) && (end <= 100))
+
+/**
+ * gaokun_ec_psy_get_smart_charge - read smart charge data from EC
+ * @ec: The gaokun_ec
+ * @data: Where the data are read to, (mode, delay, start, end)
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_psy_get_smart_charge(struct gaokun_ec *ec,
+				   u8 data[GAOKUN_SMART_CHARGE_DATA_SIZE])
+{
+	/* GBCM */
+	u8 req[] = MKREQ(0x02, 0xE4, 0);
+	u8 resp[] = MKRESP(GAOKUN_SMART_CHARGE_DATA_SIZE);
+	int ret;
+
+	ret = gaokun_ec_read(ec, req, sizeof(resp), resp);
+	if (ret)
+		return ret;
+
+	extr_resp(data, resp, GAOKUN_SMART_CHARGE_DATA_SIZE);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_psy_get_smart_charge);
+
+/**
+ * gaokun_ec_psy_set_smart_charge - set smart charge data
+ * @ec: The gaokun_ec
+ * @data: The data are to be set
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_psy_set_smart_charge(struct gaokun_ec *ec,
+				   u8 data[GAOKUN_SMART_CHARGE_DATA_SIZE])
+{
+	/* SBCM */
+	u8 req[] = MKREQ(0x02, 0XE3, GAOKUN_SMART_CHARGE_DATA_SIZE);
+
+	if (!are_thresholds_valid(data[2], data[3]))
+		return -EINVAL;
+
+	refill_req(req, data, GAOKUN_SMART_CHARGE_DATA_SIZE);
+
+	return gaokun_ec_write(ec, req);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_psy_set_smart_charge);
+
+/* Smart charge enable */
+/**
+ * gaokun_ec_psy_get_smart_charge_enable - check if smart charge is enabled
+ * @ec: The gaokun_ec
+ * @on: The state
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_psy_get_smart_charge_enable(struct gaokun_ec *ec, bool *on)
+{
+	/* GBAC */
+	*on = 0; /* clear other 3 Bytes */
+	return gaokun_ec_read_byte(ec, (u8 [])MKREQ(0x02, 0xE6, 0), (u8 *)on);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_psy_get_smart_charge_enable);
+
+/**
+ * gaokun_ec_psy_set_smart_charge_enable - set smart charge state
+ * @ec: The gaokun_ec
+ * @on: The state
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_psy_set_smart_charge_enable(struct gaokun_ec *ec, bool on)
+{
+	/* SBAC */
+	return gaokun_ec_write(ec, (u8 [])MKREQ(0x02, 0xE5, 1, on));
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_psy_set_smart_charge_enable);
+
+/* -------------------------------------------------------------------------- */
+/* API For UCSI */
+
+/**
+ * gaokun_ec_ucsi_read - read ucsi data from EC, like CCI, MSGI
+ * @ec: The gaokun_ec
+ * @resp: Where the data are read to
+ *
+ * Return: 0 on success or negative error code.
+ *
+ * UCSI subdriver uses this function to read CCI and MSGI.
+ */
+int gaokun_ec_ucsi_read(struct gaokun_ec *ec,
+			u8 resp[GAOKUN_UCSI_READ_SIZE])
+{
+	u8 req[] = MKREQ(0x03, 0xD5, 0);
+	u8 _resp[] = MKRESP(GAOKUN_UCSI_READ_SIZE);
+	int ret;
+
+	ret = gaokun_ec_read(ec, req, sizeof(_resp), _resp);
+	if (ret)
+		return ret;
+
+	extr_resp(resp, _resp, GAOKUN_UCSI_READ_SIZE);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_read);
+
+/**
+ * gaokun_ec_ucsi_write - write ucsi data to EC
+ * @ec: The gaokun_ec
+ * @req: The command
+ *
+ * Return: 0 on success or negative error code.
+ *
+ * UCSI subdriver uses this function to write control command.
+ */
+int gaokun_ec_ucsi_write(struct gaokun_ec *ec,
+			 const u8 req[GAOKUN_UCSI_WRITE_SIZE])
+{
+	u8 _req[] = MKREQ(0x03, 0xD4, GAOKUN_UCSI_WRITE_SIZE);
+
+	refill_req(_req, req, GAOKUN_UCSI_WRITE_SIZE);
+
+	return gaokun_ec_write(ec, _req);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_write);
+
+/**
+ * gaokun_ec_ucsi_get_reg - get ucsi register from EC
+ * @ec: The gaokun_ec
+ * @ureg: The gaokun ucsi register
+ *
+ * Return: 0 on success or negative error code.
+ *
+ * UCSI subdriver uses this function to get ucsi register from EC.
+ */
+int gaokun_ec_ucsi_get_reg(struct gaokun_ec *ec,
+			   struct gaokun_ucsi_reg *ureg)
+{
+	u8 req[] = MKREQ(0x03, 0xD3, 0);
+	u8 _resp[] = MKRESP(UCSI_REG_SIZE);
+	int ret;
+
+	ret = gaokun_ec_read(ec, req, sizeof(_resp), _resp);
+	if (ret)
+		return ret;
+
+	extr_resp((u8 *)ureg, _resp, UCSI_REG_SIZE);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_get_reg);
+
+/**
+ * gaokun_ec_ucsi_pan_ack - ack pin assignment notifications from EC
+ * @ec: The gaokun_ec
+ * @port_id: The id of port which just received and handled the notifications
+ *
+ * Return: 0 on success or negative error code.
+ *
+ * UCSI subdriver uses this function to ack PANs from EC.
+ */
+int gaokun_ec_ucsi_pan_ack(struct gaokun_ec *ec, int port_id)
+{
+	u8 req[] = MKREQ(0x03, 0xD2, 1);
+	u8 data = 1 << port_id;
+
+	if (port_id == GAOKUN_UCSI_NO_PORT_UPDATE)
+		data = 0;
+
+	refill_req(req, &data, 1);
+
+	return gaokun_ec_write(ec, req);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_pan_ack);
+
+/* -------------------------------------------------------------------------- */
+/* EC Sysfs */
+
+/* Fn lock */
+static int gaokun_ec_get_fn_lock(struct gaokun_ec *ec, bool *on)
+{
+	/* GFRS */
+	u8 req[] = MKREQ(0x02, 0x6B, 0);
+	int ret;
+	u8 val;
+
+	ret = gaokun_ec_read_byte(ec, req, &val);
+	if (ret)
+		return ret;
+
+	if (val == EC_FN_LOCK_ON)
+		*on = true;
+	else if (val == EC_FN_LOCK_OFF)
+		*on = false;
+	else
+		return -EIO;
+
+	return 0;
+}
+
+static int gaokun_ec_set_fn_lock(struct gaokun_ec *ec, bool on)
+{
+	/* SFRS */
+	u8 req[] = MKREQ(0x02, 0x6C, 1);
+	u8 data;
+
+	if (on)
+		data = EC_FN_LOCK_ON;
+	else
+		data = EC_FN_LOCK_OFF;
+
+	refill_req(req, &data, 1);
+
+	return gaokun_ec_write(ec, req);
+}
+
+static ssize_t fn_lock_show(struct device *dev,
+			    struct device_attribute *attr,
+			    char *buf)
+{
+	struct gaokun_ec *ec = dev_get_drvdata(dev);
+	bool on;
+	int ret;
+
+	ret = gaokun_ec_get_fn_lock(ec, &on);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", on);
+}
+
+static ssize_t fn_lock_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	struct gaokun_ec *ec = dev_get_drvdata(dev);
+	bool on;
+	int ret;
+
+	if (kstrtobool(buf, &on))
+		return -EINVAL;
+
+	ret = gaokun_ec_set_fn_lock(ec, on);
+	if (ret)
+		return ret;
+
+	return size;
+}
+
+static DEVICE_ATTR_RW(fn_lock);
+
+static struct attribute *gaokun_ec_attrs[] = {
+	&dev_attr_fn_lock.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(gaokun_ec);
+
+/* Thermal Zone HwMon */
+/* Range from 0 to 0x2C, partial valid */
+static const u8 temp_reg[20] = {0x05, 0x07, 0x08, 0x0E, 0x0F, 0x12, 0x15, 0x1E,
+				0x1F, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
+				0x27, 0x28, 0x29, 0x2A};
+
+static int gaokun_ec_get_temp(struct gaokun_ec *ec, u8 idx, int *temp)
+{
+	/* GTMP */
+	u8 req[] = MKREQ(0x02, 0x61, 1, temp_reg[idx]);
+	u8 resp[] = MKRESP(sizeof(__le16));
+	__le16 tmp;
+	int ret;
+
+	ret = gaokun_ec_read(ec, req, sizeof(resp), resp);
+	if (ret)
+		return ret;
+
+	extr_resp((u8 *)&tmp, resp, sizeof(tmp));
+	*temp = le16_to_cpu(tmp) * 100; /* convert to HwMon's unit */
+
+	return 0;
+}
+
+static ssize_t get_ec_tz_temp(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct gaokun_ec *ec = dev_get_drvdata(dev);
+	int idx, ret, temp;
+
+	idx = (to_sensor_dev_attr(attr))->index - 1;
+	ret = gaokun_ec_get_temp(ec, idx, &temp);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", temp);
+}
+
+static ssize_t ec_tz_temp_label(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	int idx = (to_sensor_dev_attr(attr))->index - 1;
+
+	return sysfs_emit(buf, "EC Thermal Zone %2d Temperature\n", idx);
+}
+
+static SENSOR_DEVICE_ATTR(temp1_input, 0444, get_ec_tz_temp, NULL, 1);
+static SENSOR_DEVICE_ATTR(temp1_label, 0444, ec_tz_temp_label, NULL, 1);
+static SENSOR_DEVICE_ATTR(temp2_input, 0444, get_ec_tz_temp, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp2_label, 0444, ec_tz_temp_label, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp3_input, 0444, get_ec_tz_temp, NULL, 3);
+static SENSOR_DEVICE_ATTR(temp3_label, 0444, ec_tz_temp_label, NULL, 3);
+static SENSOR_DEVICE_ATTR(temp4_input, 0444, get_ec_tz_temp, NULL, 4);
+static SENSOR_DEVICE_ATTR(temp4_label, 0444, ec_tz_temp_label, NULL, 4);
+static SENSOR_DEVICE_ATTR(temp5_input, 0444, get_ec_tz_temp, NULL, 5);
+static SENSOR_DEVICE_ATTR(temp5_label, 0444, ec_tz_temp_label, NULL, 5);
+static SENSOR_DEVICE_ATTR(temp6_input, 0444, get_ec_tz_temp, NULL, 6);
+static SENSOR_DEVICE_ATTR(temp6_label, 0444, ec_tz_temp_label, NULL, 6);
+static SENSOR_DEVICE_ATTR(temp7_input, 0444, get_ec_tz_temp, NULL, 7);
+static SENSOR_DEVICE_ATTR(temp7_label, 0444, ec_tz_temp_label, NULL, 7);
+static SENSOR_DEVICE_ATTR(temp8_input, 0444, get_ec_tz_temp, NULL, 8);
+static SENSOR_DEVICE_ATTR(temp8_label, 0444, ec_tz_temp_label, NULL, 8);
+static SENSOR_DEVICE_ATTR(temp9_input, 0444, get_ec_tz_temp, NULL, 9);
+static SENSOR_DEVICE_ATTR(temp9_label, 0444, ec_tz_temp_label, NULL, 9);
+static SENSOR_DEVICE_ATTR(temp10_input, 0444, get_ec_tz_temp, NULL, 10);
+static SENSOR_DEVICE_ATTR(temp10_label, 0444, ec_tz_temp_label, NULL, 10);
+static SENSOR_DEVICE_ATTR(temp11_input, 0444, get_ec_tz_temp, NULL, 11);
+static SENSOR_DEVICE_ATTR(temp11_label, 0444, ec_tz_temp_label, NULL, 11);
+static SENSOR_DEVICE_ATTR(temp12_input, 0444, get_ec_tz_temp, NULL, 12);
+static SENSOR_DEVICE_ATTR(temp12_label, 0444, ec_tz_temp_label, NULL, 12);
+static SENSOR_DEVICE_ATTR(temp13_input, 0444, get_ec_tz_temp, NULL, 13);
+static SENSOR_DEVICE_ATTR(temp13_label, 0444, ec_tz_temp_label, NULL, 13);
+static SENSOR_DEVICE_ATTR(temp14_input, 0444, get_ec_tz_temp, NULL, 14);
+static SENSOR_DEVICE_ATTR(temp14_label, 0444, ec_tz_temp_label, NULL, 14);
+static SENSOR_DEVICE_ATTR(temp15_input, 0444, get_ec_tz_temp, NULL, 15);
+static SENSOR_DEVICE_ATTR(temp15_label, 0444, ec_tz_temp_label, NULL, 15);
+static SENSOR_DEVICE_ATTR(temp16_input, 0444, get_ec_tz_temp, NULL, 16);
+static SENSOR_DEVICE_ATTR(temp16_label, 0444, ec_tz_temp_label, NULL, 16);
+static SENSOR_DEVICE_ATTR(temp17_input, 0444, get_ec_tz_temp, NULL, 17);
+static SENSOR_DEVICE_ATTR(temp17_label, 0444, ec_tz_temp_label, NULL, 17);
+static SENSOR_DEVICE_ATTR(temp18_input, 0444, get_ec_tz_temp, NULL, 18);
+static SENSOR_DEVICE_ATTR(temp18_label, 0444, ec_tz_temp_label, NULL, 18);
+static SENSOR_DEVICE_ATTR(temp19_input, 0444, get_ec_tz_temp, NULL, 19);
+static SENSOR_DEVICE_ATTR(temp19_label, 0444, ec_tz_temp_label, NULL, 19);
+static SENSOR_DEVICE_ATTR(temp20_input, 0444, get_ec_tz_temp, NULL, 20);
+static SENSOR_DEVICE_ATTR(temp20_label, 0444, ec_tz_temp_label, NULL, 20);
+
+static struct attribute *gaokun_ec_hwmon_attrs[] = {
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	&sensor_dev_attr_temp1_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_label.dev_attr.attr,
+	&sensor_dev_attr_temp3_input.dev_attr.attr,
+	&sensor_dev_attr_temp3_label.dev_attr.attr,
+	&sensor_dev_attr_temp4_input.dev_attr.attr,
+	&sensor_dev_attr_temp4_label.dev_attr.attr,
+	&sensor_dev_attr_temp5_input.dev_attr.attr,
+	&sensor_dev_attr_temp5_label.dev_attr.attr,
+	&sensor_dev_attr_temp6_input.dev_attr.attr,
+	&sensor_dev_attr_temp6_label.dev_attr.attr,
+	&sensor_dev_attr_temp7_input.dev_attr.attr,
+	&sensor_dev_attr_temp7_label.dev_attr.attr,
+	&sensor_dev_attr_temp8_input.dev_attr.attr,
+	&sensor_dev_attr_temp8_label.dev_attr.attr,
+	&sensor_dev_attr_temp9_input.dev_attr.attr,
+	&sensor_dev_attr_temp9_label.dev_attr.attr,
+	&sensor_dev_attr_temp10_input.dev_attr.attr,
+	&sensor_dev_attr_temp10_label.dev_attr.attr,
+	&sensor_dev_attr_temp11_input.dev_attr.attr,
+	&sensor_dev_attr_temp11_label.dev_attr.attr,
+	&sensor_dev_attr_temp12_input.dev_attr.attr,
+	&sensor_dev_attr_temp12_label.dev_attr.attr,
+	&sensor_dev_attr_temp13_input.dev_attr.attr,
+	&sensor_dev_attr_temp13_label.dev_attr.attr,
+	&sensor_dev_attr_temp14_input.dev_attr.attr,
+	&sensor_dev_attr_temp14_label.dev_attr.attr,
+	&sensor_dev_attr_temp15_input.dev_attr.attr,
+	&sensor_dev_attr_temp15_label.dev_attr.attr,
+	&sensor_dev_attr_temp16_input.dev_attr.attr,
+	&sensor_dev_attr_temp16_label.dev_attr.attr,
+	&sensor_dev_attr_temp17_input.dev_attr.attr,
+	&sensor_dev_attr_temp17_label.dev_attr.attr,
+	&sensor_dev_attr_temp18_input.dev_attr.attr,
+	&sensor_dev_attr_temp18_label.dev_attr.attr,
+	&sensor_dev_attr_temp19_input.dev_attr.attr,
+	&sensor_dev_attr_temp19_label.dev_attr.attr,
+	&sensor_dev_attr_temp20_input.dev_attr.attr,
+	&sensor_dev_attr_temp20_label.dev_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(gaokun_ec_hwmon);
+
+/* -------------------------------------------------------------------------- */
+/* Modern Standby */
+
+static int gaokun_ec_suspend(struct device *dev)
+{
+	struct gaokun_ec *ec = dev_get_drvdata(dev);
+	u8 req[] = MKREQ(0x02, 0xB2, 1, 0xDB);
+	int ret;
+
+	if (ec->suspended)
+		return 0;
+
+	ret = gaokun_ec_write(ec, req);
+
+	if (ret)
+		return ret;
+
+	ec->suspended = true;
+
+	return 0;
+}
+
+static int gaokun_ec_resume(struct device *dev)
+{
+	struct gaokun_ec *ec = dev_get_drvdata(dev);
+	u8 req[] = MKREQ(0x02, 0xB2, 1, 0xEB);
+	int ret;
+	int i;
+
+	if (!ec->suspended)
+		return 0;
+
+	for (i = 0; i < 3; ++i) {
+		ret = gaokun_ec_write(ec, req);
+		if (ret == 0)
+			break;
+
+		msleep(100); /* EC need time to resume */
+	};
+
+	ec->suspended = false;
+
+	return 0;
+}
+
+static void gaokun_aux_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(adev);
+}
+
+static void gaokun_aux_remove(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int gaokun_aux_init(struct device *parent, const char *name,
+			   struct gaokun_ec *ec)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = name;
+	adev->id = 0;
+	adev->dev.parent = parent;
+	adev->dev.release = gaokun_aux_release;
+	adev->dev.platform_data = ec;
+	/* Allow aux devices to access parent's DT nodes directly */
+	device_set_of_node_from_dev(&adev->dev, parent);
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		kfree(adev);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(parent, gaokun_aux_remove, adev);
+}
+
+/* -------------------------------------------------------------------------- */
+/* EC */
+
+static irqreturn_t gaokun_ec_irq_handler(int irq, void *data)
+{
+	struct gaokun_ec *ec = data;
+	u8 req[] = MKREQ(EC_EVENT, EC_QUERY, 0);
+	u8 status, id;
+	int ret;
+
+	ret = gaokun_ec_read_byte(ec, req, &id);
+	if (ret)
+		return IRQ_HANDLED;
+
+	switch (id) {
+	case 0x0: /* No event */
+		break;
+
+	case EC_EVENT_LID:
+		gaokun_ec_psy_read_byte(ec, EC_LID_STATE, &status);
+		status = EC_LID_OPEN & status;
+		input_report_switch(ec->idev, SW_LID, !status);
+		input_sync(ec->idev);
+		break;
+
+	default:
+		blocking_notifier_call_chain(&ec->notifier_list, id, ec);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int gaokun_ec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct gaokun_ec *ec;
+	int ret;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	mutex_init(&ec->lock);
+	ec->client = client;
+	i2c_set_clientdata(client, ec);
+	BLOCKING_INIT_NOTIFIER_HEAD(&ec->notifier_list);
+
+	/* Lid switch */
+	ec->idev = devm_input_allocate_device(dev);
+	if (!ec->idev)
+		return -ENOMEM;
+
+	ec->idev->name = "LID";
+	ec->idev->phys = "gaokun-ec/input0";
+	input_set_capability(ec->idev, EV_SW, SW_LID);
+
+	ret = input_register_device(ec->idev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register input device\n");
+
+	ret = gaokun_aux_init(dev, "psy", ec);
+	if (ret)
+		return ret;
+
+	ret = gaokun_aux_init(dev, "ucsi", ec);
+	if (ret)
+		return ret;
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL,
+					gaokun_ec_irq_handler, IRQF_ONESHOT,
+					dev_name(dev), ec);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request irq\n");
+
+	ec->hwmon_dev = hwmon_device_register_with_groups(dev, "gaokun_ec_hwmon",
+							  ec, gaokun_ec_hwmon_groups);
+	if (IS_ERR(ec->hwmon_dev)) {
+		dev_err(dev, "Failed to register hwmon device\n");
+		return PTR_ERR(ec->hwmon_dev);
+	}
+
+	return 0;
+}
+
+static void gaokun_ec_remove(struct i2c_client *client)
+{
+	struct gaokun_ec *ec = i2c_get_clientdata(client);
+	hwmon_device_unregister(ec->hwmon_dev);
+}
+
+static const struct i2c_device_id gaokun_ec_id[] = {
+	{ "gaokun-ec", },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, gaokun_ec_id);
+
+static const struct of_device_id gaokun_ec_of_match[] = {
+	{ .compatible = "huawei,gaokun3-ec", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gaokun_ec_of_match);
+
+static const struct dev_pm_ops gaokun_ec_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(gaokun_ec_suspend, gaokun_ec_resume)
+};
+
+static struct i2c_driver gaokun_ec_driver = {
+	.driver = {
+		.name = "gaokun-ec",
+		.of_match_table = gaokun_ec_of_match,
+		.pm = &gaokun_ec_pm_ops,
+		.dev_groups = gaokun_ec_groups,
+	},
+	.probe = gaokun_ec_probe,
+	.remove = gaokun_ec_remove,
+	.id_table = gaokun_ec_id,
+};
+module_i2c_driver(gaokun_ec_driver);
+
+MODULE_DESCRIPTION("HUAWEI Matebook E Go EC driver");
+MODULE_AUTHOR("Pengyu Luo <mitltlatltl@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/platform_data/huawei-gaokun-ec.h b/include/linux/platform_data/huawei-gaokun-ec.h
new file mode 100644
index 000000000..dfd177bd9
--- /dev/null
+++ b/include/linux/platform_data/huawei-gaokun-ec.h
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Huawei Matebook E Go Embedded Controller
+ *
+ * Copyright (C) 2024 Pengyu Luo <mitltlatltl@gmail.com>
+ */
+
+#ifndef __HUAWEI_GAOKUN_EC_H__
+#define __HUAWEI_GAOKUN_EC_H__
+
+#define GAOKUN_UCSI_CCI_SIZE	4
+#define GAOKUN_UCSI_DATA_SIZE	16
+#define GAOKUN_UCSI_READ_SIZE	(GAOKUN_UCSI_CCI_SIZE + GAOKUN_UCSI_DATA_SIZE)
+#define GAOKUN_UCSI_WRITE_SIZE	0x18
+
+#define GAOKUN_UCSI_NO_PORT_UPDATE	(-1)
+
+#define GAOKUN_SMART_CHARGE_DATA_SIZE	4 /* mode, delay, start, end */
+
+/* -------------------------------------------------------------------------- */
+
+struct gaokun_ec;
+struct gaokun_ucsi_reg;
+struct notifier_block;
+
+#define GAOKUN_MOD_NAME			"huawei_gaokun_ec"
+#define GAOKUN_DEV_PSY			"psy"
+#define GAOKUN_DEV_UCSI			"ucsi"
+
+/* -------------------------------------------------------------------------- */
+/* Common API */
+
+int gaokun_ec_register_notify(struct gaokun_ec *ec,
+			      struct notifier_block *nb);
+void gaokun_ec_unregister_notify(struct gaokun_ec *ec,
+				 struct notifier_block *nb);
+
+int gaokun_ec_read(struct gaokun_ec *ec, const u8 *req,
+		   size_t resp_len, u8 *resp);
+int gaokun_ec_write(struct gaokun_ec *ec, u8 *req);
+int gaokun_ec_read_byte(struct gaokun_ec *ec, u8 *req, u8 *byte);
+
+/* -------------------------------------------------------------------------- */
+/* API For PSY */
+
+int gaokun_ec_psy_multi_read(struct gaokun_ec *ec, u8 reg,
+			     size_t resp_len, u8 *resp);
+
+static inline int gaokun_ec_psy_read_byte(struct gaokun_ec *ec,
+					  u8 reg, u8 *byte)
+{
+	return gaokun_ec_psy_multi_read(ec, reg, sizeof(*byte), byte);
+}
+
+static inline int gaokun_ec_psy_read_word(struct gaokun_ec *ec,
+					  u8 reg, u16 *word)
+{
+	return gaokun_ec_psy_multi_read(ec, reg, sizeof(*word), (u8 *)word);
+}
+
+int gaokun_ec_psy_get_smart_charge(struct gaokun_ec *ec,
+				   u8 data[GAOKUN_SMART_CHARGE_DATA_SIZE]);
+int gaokun_ec_psy_set_smart_charge(struct gaokun_ec *ec,
+				   u8 data[GAOKUN_SMART_CHARGE_DATA_SIZE]);
+
+int gaokun_ec_psy_get_smart_charge_enable(struct gaokun_ec *ec, bool *on);
+int gaokun_ec_psy_set_smart_charge_enable(struct gaokun_ec *ec, bool on);
+
+/* -------------------------------------------------------------------------- */
+/* API For UCSI */
+
+int gaokun_ec_ucsi_read(struct gaokun_ec *ec, u8 resp[GAOKUN_UCSI_READ_SIZE]);
+int gaokun_ec_ucsi_write(struct gaokun_ec *ec,
+			 const u8 req[GAOKUN_UCSI_WRITE_SIZE]);
+
+int gaokun_ec_ucsi_get_reg(struct gaokun_ec *ec, struct gaokun_ucsi_reg *ureg);
+int gaokun_ec_ucsi_pan_ack(struct gaokun_ec *ec, int port_id);
+
+
+#endif /* __HUAWEI_GAOKUN_EC_H__ */
-- 
2.47.1



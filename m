Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4895F24572B
	for <lists+linux-usb@lfdr.de>; Sun, 16 Aug 2020 11:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbgHPJ46 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Aug 2020 05:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726787AbgHPJ44 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Aug 2020 05:56:56 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A72C061786;
        Sun, 16 Aug 2020 02:56:56 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id o23so14452863ejr.1;
        Sun, 16 Aug 2020 02:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mvYUahNxDnPkOLnZpRzALHyAwEVQ3UCRzGHsSO2gqGw=;
        b=F6pNcmp09M7NQEjAjEq0/7A750EPXLs0OD0r20KnWPxpMvbah6mxzvMo9flqQbNTld
         JZcGqE4BKMHxZK/M4s+aiXe61kyCF437F8vBVon27t3qsMFZ9XNILefxNMd0I78wUpze
         yRHqEQNIFjdgYjQOeq4YEv2Yozwu+GepsNAAaoHbGkGRkyx+HrrqDBPyRTWmp/naGeTw
         6V4e7QFgQ0iwp8gmy2n7vze/pNBRGztPU96RFlhcfLBkW8exmrpDNoOF0XgdM/60U2an
         ICJZ45riVU6OaPwyXZmhAvzjxkK8t2v+DoisjnAhThcwtnQK/DGUAPYr752uZDz9iRNi
         dnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mvYUahNxDnPkOLnZpRzALHyAwEVQ3UCRzGHsSO2gqGw=;
        b=aIh+p4fHocfs9R0bfLBKFASE27IsQw32o5Qj1a2vEB8WD/F26QhGWMLknLZtgKpNfk
         VB+XEZitZC6SYdk7x4O9nySokR/UJaEWU31fMaQB4xg+jK1QDmTMmNc6CWf5qQpRN+p3
         USpXmM/EWh4rYER+RASn4wAeGD6qd2dHKMAoS2T3CjnBczXT0RXgnYlOah1lc/w/5dvn
         g5oqK9mFrgAy4T2KECVb16UvDmlIhiuEcF3ZRVYhUJd61K3zRk8a3IsMjfsnn8TyMlaK
         qR4gWe994ZXDPsh//o6YZ6xU4GM+PQCFGNq27iN7X19G5brwcwQYhPAVzl7Op1p9+NH6
         0yzw==
X-Gm-Message-State: AOAM533fawaCpmd4q4dMuc/IWXVEgipWYUe2F7/bzcOjlXw33Po2xvVW
        o+q2ZzK+tnqKRka8+PFULr8=
X-Google-Smtp-Source: ABdhPJxPOg9I1HYe8zFe5jQIB9jYgFjvo5efacEohiIphyG7JL9pvQV9j8yWXv+cZw0ksDIKWGLE6A==
X-Received: by 2002:a17:906:8608:: with SMTP id o8mr10816169ejx.156.1597571813822;
        Sun, 16 Aug 2020 02:56:53 -0700 (PDT)
Received: from localhost.localdomain ([185.95.176.207])
        by smtp.googlemail.com with ESMTPSA id r3sm11757188ejy.95.2020.08.16.02.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 02:56:53 -0700 (PDT)
From:   jaap aarts <jaap.aarts1@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     jaap aarts <jaap.aarts1@gmail.com>
Subject: [PATCH V5] hwmon: add fan/pwm driver for corsair h100i platinum
Date:   Sun, 16 Aug 2020 11:55:01 +0200
Message-Id: <20200816095500.123839-1-jaap.aarts1@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adds fan/pwm support for H100i platinum.
Custom temp/fan curves are not supported.

v5:
 - fixed #defines not being caps
 - check amount of written bytes + fixed expecting wrong amount
 - moved to `sizeof(var)` instead of `sizeof(type)`
 - fixed bounds checks
 - merged cases and simplefied switch statements
 - more error checking
 - destroy the mutex

Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>
---
 drivers/hwmon/Kconfig               |   7 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/corsair_hydro_i_pro.c | 701 ++++++++++++++++++++++++++++
 3 files changed, 709 insertions(+)
 create mode 100644 drivers/hwmon/corsair_hydro_i_pro.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 288ae9f63588..f466b72d0f67 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -378,6 +378,13 @@ config SENSORS_ARM_SCPI
 	  and power sensors available on ARM Ltd's SCP based platforms. The
 	  actual number and type of sensors exported depend on the platform.
 
+config SENSORS_CORSAIR_HYDRO_I_PRO
+	tristate "Corsair hydro HXXXi pro driver"
+	depends on USB
+	help
+	  If you say yes here you get support for the corsair hydro HXXXi pro
+	  range of devices.
+
 config SENSORS_ASB100
 	tristate "Asus ASB100 Bach"
 	depends on X86 && I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 3e32c21f5efe..ec63294b3ef1 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_SENSORS_W83793)	+= w83793.o
 obj-$(CONFIG_SENSORS_W83795)	+= w83795.o
 obj-$(CONFIG_SENSORS_W83781D)	+= w83781d.o
 obj-$(CONFIG_SENSORS_W83791D)	+= w83791d.o
+obj-$(CONFIG_SENSORS_CORSAIR_HYDRO_I_PRO)	+= corsair_hydro_i_pro.o
 
 obj-$(CONFIG_SENSORS_AB8500)	+= abx500.o ab8500.o
 obj-$(CONFIG_SENSORS_ABITUGURU)	+= abituguru.o
diff --git a/drivers/hwmon/corsair_hydro_i_pro.c b/drivers/hwmon/corsair_hydro_i_pro.c
new file mode 100644
index 000000000000..c0c8a0e1dea9
--- /dev/null
+++ b/drivers/hwmon/corsair_hydro_i_pro.c
@@ -0,0 +1,701 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * A hwmon driver for all corsair hyxro HXXXi pro all-in-one liquid coolers.
+ * Copyright (c) Jaap Aarts 2020
+ *
+ * Protocol partially reverse engineered by audiohacked
+ * https://github.com/audiohacked/OpendriverLink
+ */
+
+/*
+ * Supports following liquid coolers:
+ * H100i platinum
+ *
+ * Other products should work with this driver with slight modification.
+ *
+ * Note: platinum is the codename name for pro within the driver, so H100i platinum = H100i pro.
+ * But some products are actually called platinum, these are not intended to be supported (yet).
+ *
+ * Note: fan curve control has not been implemented
+ */
+
+#include <linux/errno.h>
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+
+struct device_config {
+	const u16 vendor_id;
+	const u16 product_id;
+	const u8 fancount;
+	const u16 rpm_min;
+	const u16 rpm_max;
+	const u8 pwm_max;
+	const char *name;
+	const struct hwmon_channel_info **hwmon_info;
+};
+
+struct hydro_i_pro_device {
+	struct usb_device *udev;
+
+	const struct device_config *config;
+
+	unsigned char *bulk_out_buffer;
+	unsigned char *bulk_in_buffer;
+	size_t bulk_out_size;
+	size_t bulk_in_size;
+	char bulk_in_endpointAddr;
+	char bulk_out_endpointAddr;
+
+	struct usb_interface *interface; /* the interface for this device */
+	struct mutex io_mutex;
+};
+
+#define MAX_FAN_COUNT 2
+#define MAX_PWM_CHANNEL_COUNT MAX_FAN_COUNT
+
+struct hwmon_data {
+	struct hydro_i_pro_device *hdev;
+	int channel_count;
+	void *channel_data[MAX_PWM_CHANNEL_COUNT];
+};
+
+struct curve_point {
+	u8 temp;
+	u8 pwm;
+};
+
+#define FAN_CURVE_COUNT 7
+
+struct hwmon_fan_data {
+	u8 fan_channel;
+	u16 fan_target;
+	u8 fan_pwm_target;
+	u8 mode;
+	struct curve_point curve[FAN_CURVE_COUNT];
+};
+
+struct curve_point quiet_curve[FAN_CURVE_COUNT] = {
+	{
+		.temp = 0x1F,
+		.pwm = 0x15,
+	},
+	{
+		.temp = 0x21,
+		.pwm = 0x1E,
+	},
+	{
+		.temp = 0x24,
+		.pwm = 0x25,
+	},
+	{
+		.temp = 0x27,
+		.pwm = 0x2D,
+	},
+	{
+		.temp = 0x29,
+		.pwm = 0x38,
+	},
+	{
+		.temp = 0x2C,
+		.pwm = 0x4A,
+	},
+	{
+		.temp = 0x2F,
+		.pwm = 0x64,
+	},
+};
+
+#define DEFAULT_CURVE quiet_curve
+
+static const struct hwmon_channel_info *dual_fan[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
+
+	NULL
+};
+
+static const struct device_config config_table[] = {
+	{
+		.vendor_id = 0x1b1c,
+		.product_id = 0x0c15,
+		.fancount = 2,
+		.rpm_min = 200,
+		.rpm_max = 3000,
+		.pwm_max = 100,
+		.name = "corsair_H100i_pro",
+		.hwmon_info = dual_fan,
+	},
+};
+
+#define BULK_TIMEOUT 100
+
+enum opcodes {
+	PWM_FAN_CURVE_CMD = 0x40,
+	PWM_GET_CURRENT_CMD = 0x41,
+	PWM_FAN_TARGET_CMD = 0x42,
+	RPM_FAN_TARGET_CMD = 0x43,
+};
+
+#define SUCCES_LENGTH 3
+#define SUCCES_CODE 0x12, 0x34
+
+static bool check_succes(enum opcodes command, char ret[SUCCES_LENGTH])
+{
+	char success[SUCCES_LENGTH] = { command, SUCCES_CODE };
+
+	return memcmp(ret, success, SUCCES_LENGTH) == 0;
+}
+
+static int acquire_lock(struct hydro_i_pro_device *hdev)
+{
+	int retval = usb_autopm_get_interface(hdev->interface);
+
+	if (retval)
+		return retval;
+
+	mutex_lock(&hdev->io_mutex);
+	return 0;
+}
+
+static int transfer_usb(struct hydro_i_pro_device *hdev,
+			unsigned char *send_buf, unsigned char *recv_buf,
+			int send_len, int recv_len)
+{
+	int retval;
+	int wrote;
+	int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
+	int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
+
+	retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, send_len, &wrote,
+			      BULK_TIMEOUT);
+	if (retval)
+		return retval;
+	if (wrote != send_len)
+		return -EIO;
+
+	retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, recv_len, &wrote,
+			      BULK_TIMEOUT);
+	if (retval)
+		return retval;
+	if (wrote != recv_len)
+		return -EIO;
+
+	return 0;
+}
+
+static int set_fan_pwm_curve(struct hydro_i_pro_device *hdev,
+			     struct hwmon_fan_data *fan_data,
+			     struct curve_point point[static FAN_CURVE_COUNT])
+{
+	int retval;
+	unsigned char *send_buf = hdev->bulk_out_buffer;
+	unsigned char *recv_buf = hdev->bulk_in_buffer;
+
+	memcpy(fan_data->curve, point, sizeof(fan_data->curve));
+
+	send_buf[0] = PWM_FAN_CURVE_CMD;
+	send_buf[1] = fan_data->fan_channel;
+	send_buf[2] = point[0].temp;
+	send_buf[3] = point[1].temp;
+	send_buf[4] = point[2].temp;
+	send_buf[5] = point[3].temp;
+	send_buf[6] = point[4].temp;
+	send_buf[7] = point[5].temp;
+	send_buf[8] = point[6].temp;
+	send_buf[9] = point[0].pwm;
+	send_buf[10] = point[1].pwm;
+	send_buf[11] = point[2].pwm;
+	send_buf[12] = point[3].pwm;
+	send_buf[13] = point[4].pwm;
+	send_buf[14] = point[5].pwm;
+	send_buf[15] = point[6].pwm;
+
+	retval = transfer_usb(hdev, send_buf, recv_buf, 16, 3);
+	if (retval)
+		return retval;
+
+	if (!check_succes(send_buf[0], recv_buf)) {
+		dev_warn(
+			&hdev->udev->dev,
+			"failed setting fan pwm/temp curve for %s on channel %d %d,%d,%d\n",
+			hdev->config->name, fan_data->fan_channel, recv_buf[0],
+			recv_buf[1], recv_buf[2]);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int set_fan_target_rpm(struct hydro_i_pro_device *hdev,
+			      struct hwmon_fan_data *fan_data, u16 val)
+{
+	int retval;
+	unsigned char *send_buf = hdev->bulk_out_buffer;
+	unsigned char *recv_buf = hdev->bulk_in_buffer;
+
+	fan_data->fan_target = val;
+	fan_data->fan_pwm_target = 0;
+
+	send_buf[0] = RPM_FAN_TARGET_CMD;
+	send_buf[1] = fan_data->fan_channel;
+	send_buf[2] = (fan_data->fan_target >> 8);
+	send_buf[3] = fan_data->fan_target;
+
+	retval = transfer_usb(hdev, send_buf, recv_buf, 4, 3);
+	if (retval)
+		return retval;
+
+	if (!check_succes(send_buf[0], recv_buf)) {
+		dev_warn(
+			&hdev->udev->dev,
+			"failed setting fan rpm for %s on channel %d %d,%d,%d\n",
+			hdev->config->name, fan_data->fan_channel, recv_buf[0],
+			recv_buf[1], recv_buf[2]);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int get_fan_current_rpm(struct hydro_i_pro_device *hdev,
+			       struct hwmon_fan_data *fan_data, long *val)
+{
+	int retval;
+	unsigned char *send_buf = hdev->bulk_out_buffer;
+	unsigned char *recv_buf = hdev->bulk_in_buffer;
+
+	send_buf[0] = PWM_GET_CURRENT_CMD;
+	send_buf[1] = fan_data->fan_channel;
+
+	retval = transfer_usb(hdev, send_buf, recv_buf, 2, 6);
+	if (retval)
+		return retval;
+
+	if (!check_succes(send_buf[0], recv_buf) ||
+	    recv_buf[3] != fan_data->fan_channel) {
+		dev_warn(
+			&hdev->udev->dev,
+			"failed retrieving fan pwm for %s on channel %d %d,%d,%d/%d\n",
+			hdev->config->name, fan_data->fan_channel, recv_buf[0],
+			recv_buf[1], recv_buf[2], recv_buf[3]);
+		return -EINVAL;
+	}
+
+	*val = ((recv_buf[4]) << 8) + recv_buf[5];
+	return 0;
+}
+
+static int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
+			      struct hwmon_fan_data *fan_data, u8 val)
+{
+	int retval;
+	unsigned char *send_buf = hdev->bulk_out_buffer;
+	unsigned char *recv_buf = hdev->bulk_in_buffer;
+
+	fan_data->fan_target = 0;
+	fan_data->fan_pwm_target = val;
+
+	send_buf[0] = PWM_FAN_TARGET_CMD;
+	send_buf[1] = fan_data->fan_channel;
+	send_buf[2] = fan_data->fan_pwm_target;
+	dev_info(&hdev->udev->dev, "debug:%d,%d,%d", send_buf[0], send_buf[1],
+		 send_buf[2]);
+	dev_info(&hdev->udev->dev, "val:%d", fan_data->fan_pwm_target);
+
+	retval = transfer_usb(hdev, send_buf, recv_buf, 3, 3);
+	if (retval)
+		return retval;
+
+	if (!check_succes(send_buf[0], recv_buf)) {
+		dev_warn(
+			&hdev->udev->dev,
+			"failed setting fan pwm for %s on channel %d %d,%d,%d\n",
+			hdev->config->name, fan_data->fan_channel, recv_buf[0],
+			recv_buf[1], recv_buf[2]);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static umode_t hwmon_is_visible(const void *d, enum hwmon_sensor_types type,
+				u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			return 0444;
+		case hwmon_fan_target:
+			return 0644;
+		case hwmon_fan_min:
+			return 0444;
+		}
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			return 0200;
+		case hwmon_pwm_enable:
+			return 0644;
+		}
+	}
+	return 0;
+}
+
+static int hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long val)
+{
+	struct hwmon_data *data = dev_get_drvdata(dev);
+	struct hydro_i_pro_device *hdev = data->hdev;
+	struct hwmon_fan_data *fan_data;
+	int retval = 0;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_target:
+			fan_data = data->channel_data[channel];
+			if (fan_data->mode != 1)
+				return -EINVAL;
+
+			val = clamp_val(val, hdev->config->rpm_min,
+					hdev->config->rpm_max);
+
+			retval = acquire_lock(hdev);
+			if (retval)
+				goto exit;
+
+			retval = set_fan_target_rpm(hdev, fan_data, val);
+			if (retval)
+				goto cleanup;
+
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			fan_data = data->channel_data[channel];
+			if (fan_data->mode != 1)
+				return -EINVAL;
+
+			val = clamp_val(val, 0, hdev->config->pwm_max);
+			dev_info(&hdev->udev->dev, "val:%ld", val);
+			retval = acquire_lock(hdev);
+			if (retval)
+				goto exit;
+
+			retval = set_fan_target_pwm(hdev, fan_data, val);
+			if (retval)
+				goto cleanup;
+
+			break;
+		case hwmon_pwm_enable:
+			fan_data = data->channel_data[channel];
+
+			switch (val) {
+			case 2:
+			case 0:
+				retval = acquire_lock(hdev);
+				if (retval)
+					goto exit;
+
+				retval = set_fan_pwm_curve(hdev, fan_data,
+							   DEFAULT_CURVE);
+				if (retval)
+					goto cleanup;
+				fan_data->mode = 0;
+				break;
+			case 1:
+				retval = acquire_lock(hdev);
+				if (retval)
+					goto exit;
+
+				if (fan_data->fan_target != 0) {
+					retval = set_fan_target_rpm(
+						hdev, fan_data,
+						fan_data->fan_target);
+					if (retval)
+						goto cleanup;
+				} else if (fan_data->fan_pwm_target != 0) {
+					retval = set_fan_target_pwm(
+						hdev, fan_data,
+						fan_data->fan_pwm_target);
+					if (retval)
+						goto cleanup;
+				}
+				fan_data->mode = 1;
+				break;
+			default:
+				return -EINVAL;
+			}
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+cleanup:
+	mutex_unlock(&hdev->io_mutex);
+	usb_autopm_put_interface(hdev->interface);
+exit:
+	return retval;
+}
+
+static int hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long *val)
+{
+	struct hwmon_data *data = dev_get_drvdata(dev);
+	struct hydro_i_pro_device *hdev = data->hdev;
+	struct hwmon_fan_data *fan_data;
+	int retval = 0;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			fan_data = data->channel_data[channel];
+
+			retval = acquire_lock(hdev);
+			if (retval)
+				goto exit;
+
+			retval = get_fan_current_rpm(hdev, fan_data, val);
+			break;
+		case hwmon_fan_target:
+			fan_data = data->channel_data[channel];
+			if (fan_data->mode != 1) {
+				*val = 0;
+				goto exit;
+			}
+			*val = fan_data->fan_target;
+			goto exit;
+		case hwmon_fan_min:
+			*val = hdev->config->rpm_min;
+			goto exit;
+
+		default:
+			return -EINVAL;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_enable:
+			fan_data = data->channel_data[channel];
+			*val = fan_data->mode;
+			goto exit;
+		default:
+			return -EINVAL;
+		}
+		goto exit;
+
+	default:
+		return -EINVAL;
+	}
+
+	mutex_unlock(&hdev->io_mutex);
+	usb_autopm_put_interface(hdev->interface);
+exit:
+	return retval;
+}
+
+static const struct hwmon_ops i_pro_ops = {
+	.is_visible = hwmon_is_visible,
+	.read = hwmon_read,
+	.write = hwmon_write,
+};
+
+static int hwmon_init(struct hydro_i_pro_device *hdev)
+{
+	u8 fan_id;
+	struct device *hwmon_dev;
+	struct hwmon_fan_data *fan;
+	struct hwmon_data *data;
+	struct hwmon_chip_info *hwmon_info;
+
+	data = devm_kzalloc(&hdev->udev->dev, sizeof(*data), GFP_KERNEL);
+	hwmon_info = devm_kzalloc(&hdev->udev->dev,
+				  sizeof(struct hwmon_chip_info), GFP_KERNEL);
+
+	/* You did something bad!! Either adjust  MAX_FAN_COUNT or the fancount for the config!*/
+	WARN_ON(hdev->config->fancount >= MAX_PWM_CHANNEL_COUNT);
+	data->channel_count =
+		clamp_val(hdev->config->fancount, 0, MAX_PWM_CHANNEL_COUNT);
+
+	/* For each fan create a data channel a fan config entry and a pwm config entry */
+	for (fan_id = 0; fan_id < data->channel_count; fan_id++) {
+		fan = devm_kzalloc(&hdev->udev->dev,
+				   sizeof(struct hwmon_fan_data), GFP_KERNEL);
+		fan->fan_channel = fan_id;
+		fan->mode = 0;
+		data->channel_data[fan_id] = fan;
+	}
+
+	hwmon_info->ops = &i_pro_ops;
+	hwmon_info->info = hdev->config->hwmon_info;
+
+	data->hdev = hdev;
+	hwmon_dev = devm_hwmon_device_register_with_info(
+		&hdev->udev->dev, hdev->config->name, data, hwmon_info, NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	dev_info(&hdev->udev->dev, "setup hwmon for %s\n", hdev->config->name);
+	return 0;
+}
+
+#define USB_VENDOR_ID_CORSAIR 0x1b1c
+#define USB_PRODUCT_ID_H100I_PRO 0x0c15
+/*
+ * Devices that work with this driver.
+ * More devices should work, however none have been tested.
+ */
+static const struct usb_device_id astk_table[] = {
+	{ USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_PRODUCT_ID_H100I_PRO),
+	  .driver_info = (kernel_ulong_t)&config_table[0] },
+	{},
+};
+
+MODULE_DEVICE_TABLE(usb, astk_table);
+
+static int init_device(struct usb_device *udev)
+{
+	int retval;
+
+	/*
+	 * This is needed because when running windows in a vm with proprietary driver
+	 * and you switch to this driver, the device will not respond unless you run this.
+	 */
+	retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, 0x40,
+				 0xffff, 0x0000, 0, 0, 0);
+
+	/*this always returns error, but it required for propper initialisation*/
+	if (retval != -EPIPE)
+		return retval;
+
+	return usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
+			       0x0002, 0x0000, 0, 0, 0);
+}
+
+static int deinit_device(struct usb_device *udev)
+{
+	return usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
+			       0x0004, 0x0000, 0, 0, 0);
+}
+
+static void astk_delete(struct hydro_i_pro_device *hdev)
+{
+	usb_put_intf(hdev->interface);
+	usb_put_dev(hdev->udev);
+	mutex_destroy(&hdev->io_mutex);
+	kfree(hdev->bulk_in_buffer);
+	kfree(hdev->bulk_out_buffer);
+	kfree(hdev);
+}
+
+static int astk_probe(struct usb_interface *interface,
+		      const struct usb_device_id *id)
+{
+	struct hydro_i_pro_device *hdev;
+	int retval;
+	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
+
+	hdev = kzalloc(sizeof(*hdev), GFP_KERNEL);
+
+	if (!hdev) {
+		kfree(hdev);
+		retval = -ENOMEM;
+		goto exit;
+	}
+
+	hdev->config = (const struct device_config *)id->driver_info;
+	/* You should set the driver_info to a pointer to the correct configuration!!*/
+	WARN_ON(!hdev->config);
+
+	retval = usb_find_common_endpoints(interface->cur_altsetting, &bulk_in,
+					   &bulk_out, NULL, NULL);
+	if (retval) {
+		kfree(hdev);
+		goto exit;
+	}
+
+	hdev->udev = usb_get_dev(interface_to_usbdev(interface));
+	hdev->interface = usb_get_intf(interface);
+
+	/*
+	 * set up the endpoint information
+	 * use only the first bulk-in and bulk-out endpoints
+	 */
+	hdev->bulk_in_size = usb_endpoint_maxp(bulk_in);
+	hdev->bulk_in_buffer = kmalloc(hdev->bulk_in_size, GFP_KERNEL);
+	hdev->bulk_in_endpointAddr = bulk_in->bEndpointAddress;
+	hdev->bulk_out_size = usb_endpoint_maxp(bulk_out);
+	hdev->bulk_out_buffer = kmalloc(hdev->bulk_out_size, GFP_KERNEL);
+	hdev->bulk_out_endpointAddr = bulk_out->bEndpointAddress;
+
+	retval = init_device(hdev->udev);
+	if (retval) {
+		dev_err(&interface->dev, "failed initialising %s:%d\n",
+			hdev->config->name, retval);
+		kfree(hdev);
+		goto exit;
+	}
+
+	retval = hwmon_init(hdev);
+	if (retval) {
+		dev_err(&interface->dev, "failed initialising hwmon%s:%d\n",
+			hdev->config->name, retval);
+		kfree(hdev);
+		goto exit;
+	}
+
+	usb_set_intfdata(interface, hdev);
+	mutex_init(&hdev->io_mutex);
+exit:
+	return retval;
+}
+
+static void astk_disconnect(struct usb_interface *interface)
+{
+	struct hydro_i_pro_device *hdev = usb_get_intfdata(interface);
+
+	dev_info(&hdev->udev->dev, "removed hwmon for %s\n",
+		 hdev->config->name);
+	deinit_device(hdev->udev);
+	usb_set_intfdata(interface, NULL);
+	astk_delete(hdev);
+}
+
+static int astk_resume(struct usb_interface *intf)
+{
+	return 0;
+}
+
+static int astk_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	return 0;
+}
+
+static struct usb_driver hydro_i_pro_driver = {
+	.name = "hydro_i_pro_device",
+	.id_table = astk_table,
+	.probe = astk_probe,
+	.disconnect = astk_disconnect,
+	.resume = astk_resume,
+	.suspend = astk_suspend,
+	.supports_autosuspend = 1,
+};
+
+module_usb_driver(hydro_i_pro_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jaap Aarts <jaap.aarts1@gmail.com>");
+MODULE_DESCRIPTION("Corsair HXXXi pro device driver");
-- 
2.28.0

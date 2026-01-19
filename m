Return-Path: <linux-usb+bounces-32505-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E122D3AA1C
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 14:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAFEE301F7CC
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 13:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAA5368279;
	Mon, 19 Jan 2026 13:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GHNGjgj8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6653036827A
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828733; cv=none; b=HHDOcdqWeHZh1IdXu0BxOmPh0qFy7YJMpxQ8BYNLXnE2plVtXPQ9ljtGZc1gPiKgIeFCEVZkz+gXt83NUpIZxYbeF/mAOkAvKOBcP5ZQ8IaQOBvPeZp57UGm9Ml8w8juJJuT8jB7Npa3C/6UN2u2I/mfyR9MVLou43BWBBccBQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828733; c=relaxed/simple;
	bh=DfrSPWYURzwp3WwkWbtpXKx1iOauYrzcxYjkJqvZmck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSnjd1tLxQG62GMJ0KudmbR5uho/KsxSDDW0blXPsqkFTEC6YOGdMdkpGNt3guUX40FfJoj2xZXN1RE7WcpvjDP8S9jcWE0payr9kP1EAckTsDgK6RnwV5A58tVXbrt/pfy1eKX2PWDE0PL9g5A/AqCXWwqa9OXC3GWJ7kVjjTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GHNGjgj8; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b86ed375d37so562684966b.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 05:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828727; x=1769433527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVZyoDBgCg278jS1vSrSjkeNL7wqN0touFgdWqJTr8k=;
        b=GHNGjgj8w6I55uTlodXaKq9PAWxY95pp/P/hMEDToyZqTogEKzKxywzPsQbInR/L8M
         S7uPHghylTaNUGPt3ZB1nrxqoXFsKO/Y/fGNEnyXnCqZwtzsySG0RYaoDLLwDV1JEUpn
         btVhI+HJoJkFhKXpWaFQu+sDpa+edXDGWU9Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828727; x=1769433527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JVZyoDBgCg278jS1vSrSjkeNL7wqN0touFgdWqJTr8k=;
        b=vNmcXgsrlhVuPgMmJ28nLGdoNJ4bEvIjl71GAnjc3U4iua+OHJG3hUEb6EVPd5/qgm
         RupqVqY3Usped2MSukAjEhHNgVYU1j6hPFwaBpgg7bNEVi/DuOhwjpgesTedhL7BlBXh
         w1CqOSK7MWAjk0cKvzEfNwimX2g9C+5MhKq1jzqR0RXAplIzUOIkED266Beat2C0Brkw
         XiikzXv3o0rknS0JAZW4DypyTL19hYgkkpldO1S9tkGLeqLbzi5S++2QKeiOdYuhJO2H
         2iT6nllDEZCqAfQVLMRH8O0ybXWsNjRUdWZVu33N+lHtjZWbgfm0OzcI3rIJJbdcq5Iw
         Z6gw==
X-Forwarded-Encrypted: i=1; AJvYcCVcG4a1mm+OVRo+chNWqGxMmD4w+4LrkF2mCi4uOTGZdgQ8TAUanicSn5sthmQsUfCa83t0vostM2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm3uBDtdK2UexyqfjqDvXA/AAdLR+yRV7+SgUul92OXTglWGzU
	pfFuBDM9tUBrXuOeCarXleqf6tnsp5g5r2zAM/scF+vjOKKR8QuftOBj1bwikBDQSTYMa/aPTWU
	11Q1xzA==
X-Gm-Gg: AY/fxX4EVWHYMDw0Fqj7TcAtDDlkuJzHiPDJvXMUlKzSQlIzZEIWWsacHdtnZQE//nP
	y5/D066MdvVhpnHwzcge5JE/5prM5wbRdH1U+1rpwnFSQpi6PgqMF6WTgJtj6BfS9E01MEGX6lP
	l/SD+jSfcSWwxtn0ydy+mQtTCyAz5lKkkl8OR6uiaBHqcNpckBt6VUGdqn9VJKD4fYeQsIpnKyE
	6CFm6FGeUszG2/uwltOYKcHEs0UO9CrpUo8LKqUUnzfSmRTxF+Yn26rVb9Wcb/eV06hGefc+aNo
	Ne4QNtD/x70expGq9nrSWzloBUaPl7dWrO+E4xqTu0yMhT3nbdkBBmxwu1Me5jvIklKRl66lLUg
	DeT70mQhBo1+DJStM3wF/akfJhXKdyzFeWKmiiZPf1Mp1t3T70CvBNj8XCbRhsR2AEarQVbopWm
	ER0PF+anSWyJ31S83Sylpo1jnwgOuWskLryLgLxYbzNJ7JlC3tUGcUlNLN/zmtpPXBHF+TGx+8g
	FHV62XX0rbWi6KlTaY=
X-Received: by 2002:a17:906:7305:b0:b86:fd46:724 with SMTP id a640c23a62f3a-b8792d489b0mr1082509366b.13.1768828726748;
        Mon, 19 Jan 2026 05:18:46 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:46 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 3/7] usb: typec: Expose alternate mode priority via sysfs
Date: Mon, 19 Jan 2026 13:18:20 +0000
Message-ID: <20260119131824.2529334-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260119131824.2529334-1-akuchynski@chromium.org>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces a priority sysfs attribute to the USB Type-C
alternate mode port interface. This new attribute allows user-space to
configure the numeric priority of alternate modes managing their preferred
order of operation. If a new priority value conflicts with an existing
mode's priority, the priorities of the conflicting mode and all subsequent
modes are automatically incremented to ensure uniqueness.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
---
Changes in V5:
- Clean up code style and alignment issues

 Documentation/ABI/testing/sysfs-class-typec | 11 +++
 drivers/usb/typec/class.c                   | 90 ++++++++++++++++++++-
 include/linux/usb/typec_altmode.h           |  1 +
 3 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 38e101c17a004..737b76828b509 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -162,6 +162,17 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
 		- usb3 (USB 3.2)
 		- usb4 (USB4)
 
+What:		/sys/class/typec/<port>/<alt-mode>/priority
+Date:		July 2025
+Contact:	Andrei Kuchynski <akuchynski@chromium.org>
+Description:
+		Displays and allows setting the priority for a specific alternate mode.
+		The priority is an integer in the range 0-255. A lower numerical value
+		indicates a higher priority (0 is the highest).
+		If the new value is already in use by another mode, the priority of the
+		conflicting mode and any subsequent modes will be incremented until they
+		are all unique.
+
 USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
 
 What:		/sys/class/typec/<port>-partner/accessory_mode
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 0f12d6120511b..a48c447125184 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -445,11 +445,88 @@ svid_show(struct device *dev, struct device_attribute *attr, char *buf)
 }
 static DEVICE_ATTR_RO(svid);
 
+static int increment_duplicated_priority(struct device *dev, void *data)
+{
+	if (is_typec_port_altmode(dev)) {
+		struct typec_altmode **alt_target = (struct typec_altmode **)data;
+		struct typec_altmode *alt = to_typec_altmode(dev);
+
+		if (alt != *alt_target && alt->priority == (*alt_target)->priority) {
+			alt->priority++;
+			*alt_target = alt;
+			return 1;
+		}
+	}
+	return 0;
+}
+
+static int find_duplicated_priority(struct device *dev, void *data)
+{
+	if (is_typec_port_altmode(dev)) {
+		struct typec_altmode **alt_target = (struct typec_altmode **)data;
+		struct typec_altmode *alt = to_typec_altmode(dev);
+
+		if (alt != *alt_target && alt->priority == (*alt_target)->priority)
+			return 1;
+	}
+	return 0;
+}
+
+static int typec_mode_set_priority(struct typec_altmode *alt, const u8 priority)
+{
+	struct typec_port *port = to_typec_port(alt->dev.parent);
+	const u8 old_priority = alt->priority;
+	int res = 1;
+
+	alt->priority = priority;
+	while (res) {
+		res = device_for_each_child(&port->dev, &alt, find_duplicated_priority);
+		if (res) {
+			alt->priority++;
+			if (alt->priority == 0) {
+				alt->priority = old_priority;
+				return -EOVERFLOW;
+			}
+		}
+	}
+
+	res = 1;
+	alt->priority = priority;
+	while (res)
+		res = device_for_each_child(&port->dev, &alt,
+					    increment_duplicated_priority);
+
+	return 0;
+}
+
+static ssize_t priority_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	u8 val;
+	int err = kstrtou8(buf, 10, &val);
+
+	if (!err)
+		err = typec_mode_set_priority(to_typec_altmode(dev), val);
+
+	if (!err)
+		return size;
+	return err;
+}
+
+static ssize_t priority_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", to_typec_altmode(dev)->priority);
+}
+static DEVICE_ATTR_RW(priority);
+
 static struct attribute *typec_altmode_attrs[] = {
 	&dev_attr_active.attr,
 	&dev_attr_mode.attr,
 	&dev_attr_svid.attr,
 	&dev_attr_vdo.attr,
+	&dev_attr_priority.attr,
 	NULL
 };
 
@@ -459,11 +536,15 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
 	struct typec_port *port = typec_altmode2port(adev);
 
-	if (attr == &dev_attr_active.attr)
+	if (attr == &dev_attr_active.attr) {
 		if (!is_typec_port(adev->dev.parent)) {
 			if (!port->mode_control || !adev->ops || !adev->ops->activate)
 				return 0444;
 		}
+	} else if (attr == &dev_attr_priority.attr) {
+		if (!is_typec_port(adev->dev.parent) || !port->mode_control)
+			return 0;
+	}
 
 	return attr->mode;
 }
@@ -2498,6 +2579,7 @@ typec_port_register_altmode(struct typec_port *port,
 	struct typec_altmode *adev;
 	struct typec_mux *mux;
 	struct typec_retimer *retimer;
+	int ret;
 
 	mux = typec_mux_get(&port->dev);
 	if (IS_ERR(mux))
@@ -2516,6 +2598,12 @@ typec_port_register_altmode(struct typec_port *port,
 	} else {
 		to_altmode(adev)->mux = mux;
 		to_altmode(adev)->retimer = retimer;
+
+		ret = typec_mode_set_priority(adev, 0);
+		if (ret) {
+			typec_unregister_altmode(adev);
+			return ERR_PTR(ret);
+		}
 	}
 
 	return adev;
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index 9197a4637a938..7e6c02d74b54f 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -36,6 +36,7 @@ struct typec_altmode {
 	int				mode;
 	u32				vdo;
 	unsigned int			active:1;
+	u8				priority;
 
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
-- 
2.52.0.457.g6b5491de43-goog



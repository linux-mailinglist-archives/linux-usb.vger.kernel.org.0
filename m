Return-Path: <linux-usb+bounces-30864-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDC8C80928
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 13:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06CE13AAADD
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 12:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35310303A08;
	Mon, 24 Nov 2025 12:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JVkuaqrt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C97302CDF
	for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988416; cv=none; b=VLiKttydBJolFs0xGSabBDD/3ivZECaP01jY9KyGGQVru8NQtdj5ejeksDUpDXSuImx+tgIOeViAbmoTTYyQXDxqGbzYaT/VBfX+S7V32wtA5i20mwcR66bmHS+qFtQQ5dwNHcmcTM1CIfbaV8NotY7xpggPIiXyE6kvB4Nvrks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988416; c=relaxed/simple;
	bh=ZcWRPSvnJY7j9sksuKnADdwDhkWT5l383JVkKi48Y4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gW12jrf1Ns+u6nUe3s+DmSRn7sjGdg4gqmaC70vPwsSFVZB3XqUh5gmXoV0kB9YYlap/nmyF+lklQ3uuGKT4eRmnUugjnJA2YMeLk3lzMYp7FwrPs/wbcB7d6G73xq/cZOFzLQb+qPI6M4cTZm433RPZKySXNsNSkmZOtDswmXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JVkuaqrt; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so6601134a12.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763988413; x=1764593213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tksLNCM9hMN6EA+LRxmgTQx4fghasKcuZYm2c3+N8w=;
        b=JVkuaqrtODvaUwGJgAO0HPOUNap9RmXpJluCO6w+k4HMPc7gWOJb7G722EJNrTw2Ip
         4nyxGF90iNj8KJb4drruzTwJwruiCm+OJLe5iLA3m+GfKw4WzkFtX5q7s1LbUaak1p0v
         3y+Aoo5IAWVAGfpXBr+BtIPkrzjYBF91njHqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988413; x=1764593213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+tksLNCM9hMN6EA+LRxmgTQx4fghasKcuZYm2c3+N8w=;
        b=AktzKf1z3O/cS3F5VN9yfAcd2oXMhKq8FfyMggmase9rn8hEO5aJz8WonFHhkGXRCG
         WIj7xleMKY6Fd0GhDBjk9biDsQAsr7KfAaaF6ybnCdIXl2h6rHAU5QC480UoqrPIbZD2
         +NSVUZpiIAINLzI+z0aFDU4uBOKQl5sdZ8s7jx3EKiYOc4c8sNjbdO+BdJr7YH1BWw07
         rTsICi4b/YC16KlCYsDRM+4D7uAIvZEhU4dZq9qVkJshzHSowJA8HPU9w+AWDMu1eA+W
         srZlBbJ18IB/SYHqOFL6n+/ch/rICyZFpb9DEocC7rwdOTojZlR/a2G1SQPzilMaGX0N
         nbpg==
X-Forwarded-Encrypted: i=1; AJvYcCV4c+R+87JfML4Hkc0/qFRoCEgxHce69Ew7Z4L3EaYKNnOkXDGJuxfexlcyoj6Al0/6IoMiz/+p1nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnKjxjK/krmz1Gd6Vq4REDTxx4a+1FxP0cX2cfe68X9RZbmG/g
	bdys5QtJl9lPZJoW8/B1xqnI1ZaaMQh0JA/wyCMcqvcy/x/pMfAurdW1V6e6iHSPhg==
X-Gm-Gg: ASbGnctIHQKkS+TUmgV9O9Q3lvc+eV5UrJhhqudEM183To0zchSMlfltM8e7alTkQg2
	P3dSHVpgq+D+O1iC1Jko5S+JYBG8qnVNUEUBfo/9V6P4NRCF2MX3D2dRosxS3P1j85Z0RIN1G+B
	BUrGCy718xxqJjuOihFE8ESV72ZoG3FoxH/OLC5sY/k77hiOYUe28OwD4OESPeSkPzG6U3gSZDa
	n7Mb6q5E0Cu2l9lrnemHMFYDr2xhrmzo6WLQB8qMEqJV0SdZXArRGt24UEJM2sih+kph2HJzTl3
	qThBv1y9ANtWxQ7hQs7cFfU7QvRiQx7l2ISr/xHs9Oe4L0sMw4mzLNhbtsMe4Tq1iedr+RtKZhx
	G411rbWOUyx0W7EBYo8CPPZ7E05z2H6+izb7yrkZ1fbYAO3KHGQtYWcoAYfuDLCFdeKW0UiuojH
	NHRVWDEX8ALM9X5H/EzWnfGglQxm/e3oOFcWAOyVrXuwCRV5Yg6nGr+7W55+/adH2/lQvzyhF0/
	wz7w4p7Oe8=
X-Google-Smtp-Source: AGHT+IEfcpbzsOCnT/x6NbrGmqhHYN1EwoeFU1i5kVHhF/kjyV0FZnqLTamKpVXxQGhmoo7XnU917g==
X-Received: by 2002:a05:6402:13ce:b0:640:947e:70ce with SMTP id 4fb4d7f45d1cf-64555b85acamr10495350a12.5.1763988413169;
        Mon, 24 Nov 2025 04:46:53 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536460ea9sm13342599a12.35.2025.11.24.04.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:46:52 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 4/4] usb: typec: Expose alternate mode priority via sysfs
Date: Mon, 24 Nov 2025 12:46:39 +0000
Message-ID: <20251124124639.1101335-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
In-Reply-To: <20251124124639.1101335-1-akuchynski@chromium.org>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
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
---
 Documentation/ABI/testing/sysfs-class-typec | 11 +++
 drivers/usb/typec/class.c                   | 90 ++++++++++++++++++++-
 include/linux/usb/typec_altmode.h           |  1 +
 3 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 38e101c17a00..737b76828b50 100644
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
index a5327e444265..049d1829be98 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -445,11 +445,88 @@ svid_show(struct device *dev, struct device_attribute *attr, char *buf)
 }
 static DEVICE_ATTR_RO(svid);
 
+static int increment_duplicated_priority(struct device *dev, void *data)
+{
+	if (is_typec_altmode(dev)) {
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
+	if (is_typec_altmode(dev)) {
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
+				increment_duplicated_priority);
+
+	return 0;
+}
+
+static ssize_t priority_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t size)
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
+			      struct device_attribute *attr, char *buf)
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
@@ -2484,6 +2565,7 @@ typec_port_register_altmode(struct typec_port *port,
 	struct typec_altmode *adev;
 	struct typec_mux *mux;
 	struct typec_retimer *retimer;
+	int ret;
 
 	mux = typec_mux_get(&port->dev);
 	if (IS_ERR(mux))
@@ -2502,6 +2584,12 @@ typec_port_register_altmode(struct typec_port *port,
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
index f7db3bd4c90e..2c3b6bec2eca 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -28,6 +28,7 @@ struct typec_altmode {
 	int				mode;
 	u32				vdo;
 	unsigned int			active:1;
+	u8				priority;
 
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
-- 
2.52.0.rc2.455.g230fcf2819-goog



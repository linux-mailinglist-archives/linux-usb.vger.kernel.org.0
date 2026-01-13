Return-Path: <linux-usb+bounces-32264-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF5FD19066
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 14:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C98CA30161B3
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 13:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28AA38FF19;
	Tue, 13 Jan 2026 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TN34hk0P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AC438FEFE
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309561; cv=none; b=gOoHV1QXYu7SPjFlvY7mNnQ2qFYh4MkpjDlzaVpHGJ0WZCuPX5Vr/eVhxo6gqFc7LjCbgkcXNpiErmQa+r/NwcFBAOb1ybUru34Yfe46pTWDNeoQS+pQARmCLobFk4i7eNI3Iqr2KaPrhefDPAPukj8E9eIiBFQJn0LuV2l2e9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309561; c=relaxed/simple;
	bh=bVUhc7VpDUnDxfDtkHva6EQ2YfFZC4bpqm5zztp0T64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fT27pRvV39uT7Ae0y8lPRpwGEMDuULLUwsnTF2sEUIK5wZLQBv+gxT9+JHr+oCqb/nhxV7e0E4s5svQD9UbnyhNUc+DFWRgecA30B/wtYYJU5ypJnC7hcOSkzgtf4btNKIiiaVaS7lVxv0LC0LwypueX2fgvTY/SQ54QOvYWkjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TN34hk0P; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8718187eb6so312178566b.2
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 05:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309552; x=1768914352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afo50+aNolz/eyc+FXJYc+MI5yPdVLIkEoTPV8JfhIk=;
        b=TN34hk0PfI2JYr960/J31pLy3pTkNcdlemMfMfu+4REc+BioKJf3Vv0xhY8hF8Od07
         H5CXZQVKFeCrHmBQGNjsPTuos5zWryYjlK0vDTcHQP5yVq2+I9TwY9VdnuGeMaOFZ2b/
         304XuDOcTfWmILX5QzZk6BFDCRwo+0Sh7uF8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309552; x=1768914352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=afo50+aNolz/eyc+FXJYc+MI5yPdVLIkEoTPV8JfhIk=;
        b=SxGGTppdpk5pWKqkFPmT691YY6f+CkmcjT8ckwWdqny7fcCnSrBI7hw80/xwf15gbl
         57eePqKT+hWKMZ0QqXpp+ZT1Uks6WSbdT3igKMG08YOvx6at9x6OZTYSbf5oEvqfmybW
         19Y9nPFujZ8RJahU0dtnXOq5C0iqSArtJYB4Nmg5aTaguFi0z4okBuBvrw5Ctb3il7Oa
         1zf/IT4Ng8uzpksrF5KS+FIHRHJZ1c10aI57loIstEGOxlmIWti9MsWq9jFgWxpOf0LO
         OX1cAFueWL7WdB2uI8QoCC7mM4KSoED3QgTtDb+zrhIv3ASPfOJsf7+ow0UWj80K9A09
         sMew==
X-Forwarded-Encrypted: i=1; AJvYcCVZZDvERfMxLnnrvCzSKW+YR/xQu0iwH5+lul9f1gjUDRebjeiRW49H3OwRy0cUo8nCILzYNXH5xUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzETfB3R1o/xZ41Y9FA3NXiY/GQNMLTzk0hWyvbCHDAwSr7yq3E
	DWLogWX/eW4m9YKCWYdneSZ2GcUOCXY0MVrk+JobE33aUWaWkAo3VvCEnk5y/1t6xg==
X-Gm-Gg: AY/fxX6pPxsupaesRAHU9HpoO/YNN/gob+5l2HUKt86VoyhwC3LbkSToOiiD8kgbliE
	6wPk5AMR7KpAGXwCqP04vjPGy1X78GLmtwO/qo7fTSUnvKCCMonTT9lzcnSNn//5ZSlW/nGaWdI
	/XvfaPAVT0AXDYhuB8cU8HtDu9XRF7Ck/pS8fiGrhD1RP5WgXKbLBsrYR+gCgwe0MKzVTVCD9+r
	ITbxSOPisF1UgZi4fhPEnNNkoAQiNmp9dZEIP0jBgbUwU6oealNhcCklU1zym5Vw8ukJf2xESqP
	kNLYJGJYyBwmR6dMZRaTYzOTZ7gAWae7WQ08sRvB+lw9L1BmfYlCDaPhVJcTt2bcTG8eLeRZcj0
	oiPSlLvpG6+3bDQJH9LoD3q9ccFA1KE3xCNrOgaj4kg0/brS0HWctYIpv6JN2+5XRhH9hF0K/1s
	aH7aQ+harkHeWBX9b7M7Yts3LkraibiaokqdJdDChm+XcAz5VG/mPdv8ZeCspElav03AbYVkwK/
	wNvIe97
X-Google-Smtp-Source: AGHT+IGIDWcZoX/igewBnXumY61TFpoC2nj6Rw8tc/gyULQtX23Kl7iOBicSZMG61hMYbEOewkNWZw==
X-Received: by 2002:a17:907:6e92:b0:b87:1a26:3672 with SMTP id a640c23a62f3a-b871a265b10mr652150866b.57.1768309551621;
        Tue, 13 Jan 2026 05:05:51 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:51 -0800 (PST)
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
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 4/8] usb: typec: Expose alternate mode priority via sysfs
Date: Tue, 13 Jan 2026 13:05:32 +0000
Message-ID: <20260113130536.3068311-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113130536.3068311-1-akuchynski@chromium.org>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
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
index 0f12d6120511b..1fb5450c0a2f2 100644
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



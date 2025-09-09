Return-Path: <linux-usb+bounces-27797-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A69B4FAE0
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 14:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22C0C5E1CA6
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 12:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8E6338F48;
	Tue,  9 Sep 2025 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m5Gq56iP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4FA3376BF
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421047; cv=none; b=Y9ufPuLfG0UlOdauYe08uhQug653EboIE7eob6PEsHMGFvr6upLV9vBVceJGN+XJI1W8gqrfZKWRoU2iJNaR625ZVSB7Tz/saSV33NvcDYr8Vd2CC+iABsjYbfEurArOhytaeKOzI3ezUkW2DvrPhG0EAwZWZsspaGAPlIpB0Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421047; c=relaxed/simple;
	bh=fN049EH0gqurHLscXSdiFKelXsZTTlJy1FAhnjS+5tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMMsgLC9QOFNAqw0oj7DXruE4jTcSaTXLwll0MGtjge0JvskfmsZMUDtw3KhJOfdLBBFfCpCz/sk2DVH5RhPA7dlxaV3utGMr37LBreNGtftPvxAmfCOibdaHCCUWrqr9I9kCyEmy84jBw5N/IC2NYrGISUDVKbbG/i+8rMnXOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m5Gq56iP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b042cc39551so997396066b.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 05:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757421044; x=1758025844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h11TJTxgMeaGK+Qbd8Gn2b3zaXWavrJHEj+psQs667I=;
        b=m5Gq56iPJYfK5q9lLlzv10yE6n5JKbWQvFIfbV5kUfCLrufVIG/Qt7vktYVtoQHjSY
         v7f2b2qIaF4ih6E0830kvMi1UIWOlLKsKxFf/C30ANzF4xHRPvpd94RGx2uBDXJg76Dq
         KeeFevv7vAEv89iyOsMLHrpt4fyCG/EEvHH7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421044; x=1758025844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h11TJTxgMeaGK+Qbd8Gn2b3zaXWavrJHEj+psQs667I=;
        b=PlmsYsnjZ5QKNUarpumBrHz8a4E5A/Li8ucchykQXDlnL/bsYx8Q1k4yzbJ7HYghZX
         1WLWHCl+a1T9gBDgd9RY6HE02BggjP19hJmerpVEAC3PrEe/nWWMcM9HrWyF6I54wj9N
         tYCTIGgvyElDqVCgEYuY6ZGOUcAZGfYpjwVVhl38wrjjrxagquy7XZifOC3fXqr7iOq3
         Pi1S4EiA2v45zcFN/1US3G0jVgba8rAvsLTu2Q7bTfJxfsgyVJndP1pMmtmif6Ic4BPx
         jnXuzK0NzaH7EQlvzTLJ68rc590zfGp8B+wsQk4jqNDpYGeVNWKRLVDoE0xypihVyxlT
         0cMw==
X-Forwarded-Encrypted: i=1; AJvYcCVo8EpbtDRMtqfKBqT4b9s0Rts8VgWozmyL+qqqeQmQNj4PwP/ZbF9Tb5uo4q49ywWCeAc8EsYhkHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlDeq5DiuDq1NiSURBkrI+1SBNyA5IVVGvlxq8QXTW6avZuNoo
	mnZmFgBiqSLYtb9+mKreF80Ewn01ulfUY6uiQ0cDsVqkgxXIhkGgDC7LRwmoDdfbCQ==
X-Gm-Gg: ASbGncs3hQiixiI3LH8GZvbvQ8H32Hn9jGmCx4QXUC0xrHq3inKJRVhNZZ1YYFyut/t
	xe1IomQm0yUPvcrtq9POn0QMvTAhxF03+VcKEtRLOqvbuDTq8+UAqEYPiNwpsKXiY9EjIHVbt4i
	Q5IiduavABajEVrXXnetLDwhOT2po80ThH2iDwJ6ZeuM8pbD09HGpXRV87f9Blgh0RSZmhZg+NI
	izxdlEiw1+opZplcTSHqKiomeQ766z7c2iSbxtfEGL+0Qn7hVO/TE69KZ0347b2H+wpz5m8pvr2
	wcCbl/iCvj/l1MMjoia1ZV5FyMzFKxcSUHV0ilr1dHnnwNRRV8PRBMdOlGSivCx/ygj3qAlcVHv
	xCSHufjb9JtRN/NhyOG9GJaiSH0AvHHdBhfF++zl/jA3qp9zR+laANvxi1cptY1xI/7ao5yPnca
	HGXAk43hZpKgtq7ANJDjZL+n25kg==
X-Google-Smtp-Source: AGHT+IHTbMUAWbZCStfN2KSvqbzF0cZzpg6HYKgjKjtANpkaaL7p64kwSsxCsJX84Bao/nA+lAnb5w==
X-Received: by 2002:a17:907:c1d:b0:b04:6e26:7351 with SMTP id a640c23a62f3a-b04b172e8d6mr1302976866b.54.1757421043811;
        Tue, 09 Sep 2025 05:30:43 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm2409702166b.12.2025.09.09.05.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:30:43 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 2/5] usb: typec: Expose mode_selection attribute via sysfs
Date: Tue,  9 Sep 2025 12:30:25 +0000
Message-ID: <20250909123028.2127449-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250909123028.2127449-1-akuchynski@chromium.org>
References: <20250909123028.2127449-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces new sysfs attribute to enable user control over
Type-C mode selection. Writing a boolean '1' to this attribute starts the
mode selection process, while writing '0' stops it.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 Documentation/ABI/testing/sysfs-class-typec | 11 ++++++
 drivers/usb/typec/class.c                   | 37 +++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index dab3e4e727b6..7addf0e69c5c 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -258,6 +258,17 @@ Description:	The USB Modes that the partner device supports. The active mode
 		- usb3 (USB 3.2)
 		- usb4 (USB4)
 
+What:		/sys/class/typec/<port>-partner/mode_selection
+Date:		August 2025
+Contact:	Andrei Kuchynski <akuchynski@chromium.org>
+Description:	Mode selection is activated by writing boolean 1 to the
+		file. Conversely, writing boolean 0 will cancel any ongoing selection
+		process and exit the currently active mode, if any. The attribute
+		returns "on" when mode selection is either in progress or complete,
+		and "off" otherwise.
+		This attribute is only present if the kernel supports AP driven mode
+		entry, where the Application Processor manages USB Type-C alt-modes.
+
 USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
 
 Note: Electronically Marked Cables will have a device also for one cable plug
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index aaab2e1e98b4..b66fe62f282d 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -763,6 +763,35 @@ static ssize_t number_of_alternate_modes_show(struct device *dev, struct device_
 }
 static DEVICE_ATTR_RO(number_of_alternate_modes);
 
+static ssize_t mode_selection_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	const bool ret = typec_mode_selection_is_pending(to_typec_partner(dev));
+
+	return sprintf(buf, "%s\n", str_on_off(ret));
+}
+
+static ssize_t mode_selection_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t size)
+{
+	struct typec_partner *partner = to_typec_partner(dev);
+	bool start;
+	int ret = kstrtobool(buf, &start);
+
+	if (!ret) {
+		if (start)
+			ret = typec_mode_selection_start(partner);
+		else
+			ret = typec_mode_selection_reset(partner);
+	}
+
+	if (ret)
+		return ret;
+
+	return size;
+}
+static DEVICE_ATTR_RW(mode_selection);
+
 static struct attribute *typec_partner_attrs[] = {
 	&dev_attr_accessory_mode.attr,
 	&dev_attr_supports_usb_power_delivery.attr,
@@ -770,6 +799,7 @@ static struct attribute *typec_partner_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_usb_mode.attr,
 	&dev_attr_usb_power_delivery_revision.attr,
+	&dev_attr_mode_selection.attr,
 	NULL
 };
 
@@ -794,6 +824,10 @@ static umode_t typec_partner_attr_is_visible(struct kobject *kobj, struct attrib
 		if (!get_pd_product_type(kobj_to_dev(kobj)))
 			return 0;
 
+	if (attr == &dev_attr_mode_selection.attr)
+		if (!port->mode_control)
+			return 0;
+
 	return attr->mode;
 }
 
@@ -1097,6 +1131,8 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 		typec_partner_link_device(partner, port->usb3_dev);
 	mutex_unlock(&port->partner_link_lock);
 
+	typec_mode_selection_add_partner(partner);
+
 	return partner;
 }
 EXPORT_SYMBOL_GPL(typec_register_partner);
@@ -1114,6 +1150,7 @@ void typec_unregister_partner(struct typec_partner *partner)
 	if (IS_ERR_OR_NULL(partner))
 		return;
 
+	typec_mode_selection_remove_partner(partner);
 	port = to_typec_port(partner->dev.parent);
 
 	mutex_lock(&port->partner_link_lock);
-- 
2.51.0.384.g4c02a37b29-goog



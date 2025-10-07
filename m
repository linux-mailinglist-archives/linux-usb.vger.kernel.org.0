Return-Path: <linux-usb+bounces-28983-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE31BC2C64
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 23:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2C8519A1F17
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 21:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9F92641E7;
	Tue,  7 Oct 2025 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c8Z3CUtp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC767262FC1
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 21:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759873179; cv=none; b=I81K3+IXPpGixDoAOgngym+nhRKRhdvPvBV7PRtjqqaLK76Cn+yOCuJXER0VQCtmtLafICrMrk2LE0oW5bIDfToDLqmQGXBXq9HQuzONIYuKpu4JXeOGrKYJ8/TVFHdNCJPZNL0UCnZ+UXmef/Ao4WO3mc9uBk8cD4PJ5bS46cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759873179; c=relaxed/simple;
	bh=jae6wEwCuEj60n/Wi+Fumw0PJmkCpok5Z+CVBQBIpe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jmyJ7qgX5E3fO+2A8F0s+2aEuaOuEELB8KAahhaVjbKC++Y648Y4uhXGJfAI+8Kvl6jetiZCt3QJ6u9ZTc7QeOHtWvbJUbuFumnSGncudHkx5XLF8uaTraTTWItoXxQxOoDyx8trVVdF9zitj0qg5m35GDSScRPDRl4h7Kv4XeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c8Z3CUtp; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6399706fd3cso5298357a12.2
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 14:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759873176; x=1760477976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHm6e/Aa2Au8HyhA74PVmV62yE7VVRn8yUWKBHNxwYQ=;
        b=c8Z3CUtpL3GvHHKrFpUh6tSK5l3/xB/WidjTSU7gckTE4IS2FqaniNMyrqqbFXDk4s
         L1eqVCtbTlGFsD04zYWXwv7hAvwnaJsZZM8zoEh5BD690EsLjsybg6bwddx/Z3QOGO99
         5USjxA8p18MTm8JP4fn9/zkVPuf7N9YZzeNYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759873176; x=1760477976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHm6e/Aa2Au8HyhA74PVmV62yE7VVRn8yUWKBHNxwYQ=;
        b=ghb+EQLvLzD0Ur8F6l/4IBsGCkrUl1zkv1NESqMdWTwwdDtrUj9Kxvei0RPt9rmtnn
         WYMXHqIetoRI5XRpoRrFrQHFfPNLn03ELfAkpLMK0Y4GSRwFdo2SBquJ+eP59+haSUU2
         /tGbq1PP0X67VUm1sjuNScvcKI9w6kVqJ3Wgmz7oP9q6ENUS5EjafuPs4WFM9DL5i33B
         7WgRehcl1x32EFCMvRt5KKrA2hj0bd8r/AnNXONKv/sl63C9WwwBsPbweFyByFUgb70s
         ugZ9OaWEjgbl4ET4zUHAAr3+Kr3h7Z1Gg8E1FxiMdWVbT+wyYSlZ9O17zvbj7NzMV3O7
         NU7g==
X-Gm-Message-State: AOJu0Yxc6HbqcbvYS2FoH/yjQ4YG26PC0O6A+4z1vMuj9x1uA9vSYXTw
	dswBlnOP/zgKU08sS0QS5PiGAjLjhWAZVDi+HwdNUeIxkPOrO7liu1TFUzYzXxIodwjCOfOjjgo
	gywMoz8M=
X-Gm-Gg: ASbGncvxQVWKIAa882H3S0TYjMi9NSC7XWKYUySJpR06tzbTNOBKZZ3NZzYtdH7VJWJ
	H/eYzcDscrTQ1x2hX6eOMWKxL3kcwpBYxSdQIewDO+ECG4fr8cbS28SUslctC/oxyZu4T6qJe+U
	u7H265dXUR8dWmm+Fde62/Bi/OoXd+nZqi2mPP8hUMmrpeqegmyOtUhq7H7XGkWf3IDRHE81Djs
	9HZTI/LBeQTJXF8iukXkCR+NGiWeOzVBAJIcEPkpjPGzoRsB1RIl7YxUWn8TlgUqxH3J1xY/24/
	nUfXWngTdgiP2aDnq+GdpwPS1KUcZlP4ZPb7z0tQIzg9Nzgec1ZD2lQOxt+vCDpsd2X78znJRou
	71O5L64okRMIyYiDUQPqDikOVpNcc0pN/n0/Il7mKew2OqtmTl3rpUREpb9U+XznMIUvoWHCVze
	3vYqcwRHrOH23EAaZZ9ITWLc/i
X-Google-Smtp-Source: AGHT+IEbYar8gFOUYHPmt4FA77xIB4GiKi6F2Dd21ZHEXc96gr9nGteQ+nYHI8en52lOd8DYpFzdwQ==
X-Received: by 2002:a17:907:9449:b0:b2d:830a:8c17 with SMTP id a640c23a62f3a-b50acb18aeemr135847466b.56.1759873176042;
        Tue, 07 Oct 2025 14:39:36 -0700 (PDT)
Received: from januszek.c.googlers.com.com (25.254.32.34.bc.googleusercontent.com. [34.32.254.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f74002sm1506331366b.42.2025.10.07.14.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 14:39:35 -0700 (PDT)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH v2 2/4] xhci: dbc: allow to set serial number through sysfs
Date: Tue,  7 Oct 2025 21:39:00 +0000
Message-ID: <20251007213902.2231670-3-ukaszb@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
In-Reply-To: <20251007213902.2231670-1-ukaszb@google.com>
References: <20251007213902.2231670-1-ukaszb@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Łukasz Bartosik <ukaszb@chromium.org>

Add code which allows to set serial number of a DbC
device through sysfs.

Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 13 +++++++
 drivers/usb/host/xhci-dbgcap.c                | 36 +++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
index fc82aa4e54b0..071688dbd969 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
+++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
@@ -85,3 +85,16 @@ Description:
 		up to 5000. The default value is 64 ms.
 		This polling interval is used while DbC is enabled but has no
 		active data transfers.
+
+What:          /sys/bus/pci/drivers/xhci_hcd/.../dbc_iSerial
+Date:          October 2025
+Contact:       Łukasz Bartosik <ukaszb@chromium.org>
+Description:
+               The dbc_iSerial attribute allows to change the iSerial field
+               presented in the USB device descriptor by xhci debug device.
+               Value can only be changed while debug capability (DbC) is in
+               disabled state to prevent USB device descriptor change while
+               connected to a USB host.
+               The default value is "0001".
+               The field length can be from 1 to 63 characters.
+
diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index c2fecaffd6f3..7ad83548ba4d 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1200,6 +1200,40 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
 	return size;
 }
 
+static ssize_t dbc_iSerial_show(struct device *dev,
+			    struct device_attribute *attr,
+			    char *buf)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	struct xhci_dbc	*dbc = xhci->dbc;
+
+	return sysfs_emit(buf, "%s\n", dbc->str.serial);
+}
+
+static ssize_t dbc_iSerial_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	struct xhci_dbc	*dbc = xhci->dbc;
+	size_t len;
+
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+
+	len = strcspn(buf, "\n");
+	if (!len)
+		return -EINVAL;
+
+	if (len > USB_MAX_STRING_LEN/2)
+		return -E2BIG;
+
+	memcpy(dbc->str.serial, buf, len);
+	dbc->str.serial[len] = '\0';
+
+	return size;
+}
+
 static ssize_t dbc_bInterfaceProtocol_show(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)
@@ -1287,6 +1321,7 @@ static DEVICE_ATTR_RW(dbc);
 static DEVICE_ATTR_RW(dbc_idVendor);
 static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
+static DEVICE_ATTR_RW(dbc_iSerial);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
 static DEVICE_ATTR_RW(dbc_poll_interval_ms);
 
@@ -1295,6 +1330,7 @@ static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc_idVendor.attr,
 	&dev_attr_dbc_idProduct.attr,
 	&dev_attr_dbc_bcdDevice.attr,
+	&dev_attr_dbc_iSerial.attr,
 	&dev_attr_dbc_bInterfaceProtocol.attr,
 	&dev_attr_dbc_poll_interval_ms.attr,
 	NULL
-- 
2.51.0.710.ga91ca5db03-goog



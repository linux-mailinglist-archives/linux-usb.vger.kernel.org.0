Return-Path: <linux-usb+bounces-30468-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F80EC54C98
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 00:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1496C34615D
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 23:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FBC27280A;
	Wed, 12 Nov 2025 23:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KrwQatJA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3925A2E2EE7
	for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 23:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762989401; cv=none; b=i0WqVqnMxiClA96xBTM+Bxfq2BSPVCSpo9Wj1FbYbTQG98pzQKOXFDDNTtJ7/0YQfXHYi/y7zuf2K9ACnJutl6rHpp87N869/roV9gma9lxnthlT7fXdvBUdW3ezkV+ze5Pkf1AbJQqdkX+dsqsa3IGeXizoP77cn0y/KIMRLqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762989401; c=relaxed/simple;
	bh=xVxGrM1lLUsK08MdnuwgwyptmDO98vCZFKK7oeiRX8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KTAziXqs7i7Pc+6arIBTIgMtSsRUNDKcu8Xw/KJspDef6LYrDlf8GWaKcrwEedFXer/jGEXP5Wt/AOGS5HiUVt6jOBnrwGkCjJtA5o7CK6FE8LPo1k0ujRuDWOU+DI5qivVs/Vta6PiBqLcSKV89eeuTUpXipQoipyu7plAp+CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KrwQatJA; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6431b0a1948so321686a12.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 15:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762989397; x=1763594197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeWUe7+1TfEm6WqLX3BLBrK1geO5LPEpoCXJXlOEz3c=;
        b=KrwQatJALystay3UlRgslQ0xUGKhJ7YSQX5L/ASwdVyrrX1x23ATzwgzzKh+vFDVsH
         B0XfAcvHcdeP0AkIvSua9bNYJVQHagwnUU7LBb9QlCQx+7Jddef2Wcmem6UXFfPyQLhy
         EjUW3PIUSP5A574ddryv2bvmoRXmEJk3TNVck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762989397; x=1763594197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CeWUe7+1TfEm6WqLX3BLBrK1geO5LPEpoCXJXlOEz3c=;
        b=gagSIc0GJXH1L4cVie0yY2vPXD6VR2WupkTmoRm0q4jh/uCJLX8Y4cvPYzDc6jovKg
         nbb8M+8GQXIi3MJkOjWoBnhbXRKr/K/F5kg79HPqux6Zyum+lcAtkyeIeT5dMnVkNsdG
         ikn7+0dxAwk42m+/utITWjFXYXakw3Xf6Kw51AE7zZyDhY4txMoh3Bn+/TtaJX8fCic2
         TqSGynRiMjvY5kSXe7NFduaq7yHSq9U7NWViEVx8NOLleg1isGSeapRywADPdasA03MB
         eucClPwE0yCTZmEP3RkFhGaMBbkA1cRg9MARLG5deY4GixbfACVtpdR2/cVJTgECVvmO
         55oA==
X-Forwarded-Encrypted: i=1; AJvYcCW4TZJkOeKYHJ0pg5TehMCB1RU/9n2C3pEdkp/M08nvYmE4bqPOHwtI9NNSUfe12vTWPvgOD9psIFM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/sMkpBVgbCQ/6r5EJqv3o0ZQRTt9vzeizeWyRNgfShXCnI3d
	lgmjKKKlvFFg2sX5tFalugb3UMyLQ+0bWMZXAEBCvI8ThYZ758OUKjvp5cUg6mpP
X-Gm-Gg: ASbGncsIv8hIJfIqJwg+1BtJxy5yvncEB9pjMZjVpRqcE+aitcBnvUDJecCwJSOQ16C
	QV/jvSOFFKBtw4IGy7oDX+Cs3uBfory0pZ0PHGb+387UbyJ+Ewt0r1//Ih8UOXE5gtFxGrZxIbN
	KBnnrRdf7KM6in87OiXMCy8aVV21T7fUwkKbEtZnRbaEyVwUnpEbOPkn4gh9U24wJHwjetbH4OQ
	hny717DnZ8ze6TiSqstg21o+0DBSc3hX0PaYeCeBgM4+T4TN4vWBzPfNxg+ecTHmWkSVMmGpdXW
	lFLx+q4xiUiwEnYXdw3QaLhDrbyXXUunfNhDgfG51d+cL/abLbqgGybFp1eZK+DTm3Kz4bIUjU+
	j3QQZBevx5KIe35qDJtP1HS8OV6QAhux+pr8b2+B9DhgeZND8nHrC12Qe7VLFLLJSUa+/YgQhj9
	JN2A+kXpH7itIAhHLX4+ASlh7KeE6i1stcL7xLrNUaHh2O4lAB8WoK
X-Google-Smtp-Source: AGHT+IHwupmJMHNs0wcK0X3rMdvZAZgzQb9cB8JQNgyaFW7BNw+C8KxOtbbBvAG6xJJTe7fZk1/hbQ==
X-Received: by 2002:a05:6402:1d50:b0:640:d061:e6b1 with SMTP id 4fb4d7f45d1cf-6431a4dd0f3mr4183037a12.10.1762989397494;
        Wed, 12 Nov 2025 15:16:37 -0800 (PST)
Received: from januszek.c.googlers.com.com (5.214.32.34.bc.googleusercontent.com. [34.32.214.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b2155sm124516a12.29.2025.11.12.15.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 15:16:37 -0800 (PST)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH v3 3/4] xhci: dbc: allow to set product name through sysfs
Date: Wed, 12 Nov 2025 23:15:56 +0000
Message-ID: <20251112231557.164797-4-ukaszb@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
In-Reply-To: <20251112231557.164797-1-ukaszb@google.com>
References: <20251112231557.164797-1-ukaszb@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Łukasz Bartosik <ukaszb@chromium.org>

Add code which allows to set product name of a DbC
device through sysfs.

Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 11 ++++++
 drivers/usb/host/xhci-dbgcap.c                | 36 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
index 071688dbd969..57ba37606f79 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
+++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
@@ -98,3 +98,14 @@ Description:
                The default value is "0001".
                The field length can be from 1 to 63 characters.
 
+What:          /sys/bus/pci/drivers/xhci_hcd/.../dbc_iProduct
+Date:          October 2025
+Contact:       Łukasz Bartosik <ukaszb@chromium.org>
+Description:
+               The dbc_iProduct attribute allows to change the iProduct field
+               presented in the USB device descriptor by xhci debug device.
+               Value can only be changed while debug capability (DbC) is in
+               disabled state to prevent USB device descriptor change while
+               connected to a USB host.
+               The default value is "Linux USB Debug Target".
+               The field length can be from 1 to 63 characters.
diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index c5bfd40bd496..d2f64a9a389b 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1206,6 +1206,40 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
 	return size;
 }
 
+static ssize_t dbc_product_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	struct xhci_dbc	*dbc = xhci->dbc;
+
+	return sysfs_emit(buf, "%s\n", dbc->str.product);
+}
+
+static ssize_t dbc_product_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t size)
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
+	if (len > USB_MAX_STRING_LEN)
+		return -E2BIG;
+
+	memcpy(dbc->str.product, buf, len);
+	dbc->str.product[len] = '\0';
+
+	return size;
+}
+
 static ssize_t dbc_serial_show(struct device *dev,
 			    struct device_attribute *attr,
 			    char *buf)
@@ -1328,6 +1362,7 @@ static DEVICE_ATTR_RW(dbc_idVendor);
 static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
 static DEVICE_ATTR_RW(dbc_serial);
+static DEVICE_ATTR_RW(dbc_product);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
 static DEVICE_ATTR_RW(dbc_poll_interval_ms);
 
@@ -1337,6 +1372,7 @@ static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc_idProduct.attr,
 	&dev_attr_dbc_bcdDevice.attr,
 	&dev_attr_dbc_serial.attr,
+	&dev_attr_dbc_product.attr,
 	&dev_attr_dbc_bInterfaceProtocol.attr,
 	&dev_attr_dbc_poll_interval_ms.attr,
 	NULL
-- 
2.51.2.1041.gc1ab5b90ca-goog



Return-Path: <linux-usb+bounces-30469-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 00026C54CA5
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 00:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 511064E222E
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 23:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F5B2F3625;
	Wed, 12 Nov 2025 23:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="acDtyXxo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3977C2F068E
	for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 23:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762989402; cv=none; b=eJ24DLEGsNHQ8HAA/oAZedbZ1AOB8xC9YUccbhGgj+/Tcm/cBMzPCl2rf4PHT0KVrqNpYTYWMbZXTCBtS0v79kCHNSSGdGCpQeFx+UmH4lRACyoRMFzQdli/cdEm2x53oCseLzb1U+ajyjjY+zLTq2wiEpSrS3VmcpEsB4qIFSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762989402; c=relaxed/simple;
	bh=r5BgyiZyo9pNOp+g4gGg5Qja9Jzv0nWZMbtmmJUvAJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wbv9C4C/5SBcL1EDuxYJv/IBrMrxOrHHdcZqigEK4X8pm38uzDEffN42gX+u+gLlwTij5ampEZKb3Ax2Ub3ZALppR+eP/RbCZd+hGpYVRe9Q+hdmET463XavEU9Or1xVWRfybCDjrowUBHGVC/zGFbPW9hjt1DFXipWAVHSAWcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=acDtyXxo; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6417313bddaso313032a12.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 15:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762989398; x=1763594198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWkAzrKle4cDDa9nZjJaeOWHJqEPY6PjZ/35wHxjriY=;
        b=acDtyXxoFs+7Rci71FEQeXN9ID5gWcrC/CF5j1DrGAbMql99OkY3AkCraC+YnLXt+i
         FUi5EnpK7g5ulAlmhI6Mr7YqAfvSI0JCs7iITZJz07PNq7/uRt5NNJfCFFB3tvKWuCh/
         lAr9Pp71lAOCArDSACZCXAuSXDNv5IlISHpFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762989398; x=1763594198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWkAzrKle4cDDa9nZjJaeOWHJqEPY6PjZ/35wHxjriY=;
        b=D1wGJZB70HOiljRcC/ubDwSpXwJxVdtS0aBYAqD3+90r7grAXvTtUjPHpyRgjOeA2r
         CFxwUMnV9PfJvqBEAXCjnTG8lK/wZ8mZKbulzREIGpYBVwImmuc/O2QOz0Tn1qPfaCPe
         uZ7blZxS6C5O13aQG40T0elDqfAvRmkHGDfMKxXy8Bg3lMXdIuRAMmaVNgzFSkn0KhQI
         jMORVICoosKTD0GNHDBc1JjCVRS3Q7RgYqGRlCBCfDo6ZpBqV1Gvy/1sJoVLMsLBSy8E
         5z6O1e6B1JfXtCoQaeyrJ6wV8X6z//Sc6PbO9HOFGSvPjh7kshbjtcEQC563cO8XBa37
         Yy6g==
X-Forwarded-Encrypted: i=1; AJvYcCVbJQR6BJWxo+Q0SL+89xtjG37/oZEcpwuVpUQZRk+5oRP3VSAxPpFBa1IQidd/FCtylhAfoDAP6qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwouCdDULeJjib9oibxzDJ9jdbOK/+P7Lk07XsWv7q2/XSJEs7L
	rXsix3xwOBnoolXUOLiq195C2miYGMcXMyhffcIAJXuA2Rn0IWkOdd2oLZ3vvvFRy/a49faDSMF
	XxwF9dbs=
X-Gm-Gg: ASbGncuin9ZHSR7AQ0dCCGO76ZDVbOGTVdsAho9+Lw5HAra32yZKScn+IL7aTFxpr7+
	V10w7x9CU3AVYzkKhItoOENkWxLYi+jNf+gv5ITof07oLPtVqgV1h9Ma5eA1oA78d8F4tWpiZF0
	/wZfdFQkWRca/H/LKiEEUm20753JaLUeUsOpDo2njAH1ssPdwp+zO/ytZaBeuaf8E3Gh/MPUlL1
	vms1oRQ0m6+4eZ1pHdpGjA7HXI02mt9BgYtz0B9WFp8+2KOznM+A3TwibXrhRyWYrX8/pmN8J5h
	fuDT8P78MWwFoq1YEzofpoc7kZcNRXbboh3hEc3NEdf+wuYMZq3sIMZa0m8S5QhqxYMbrLwJGVM
	dVNqkhmdA34GR+WzJUMZV0sb3bLNAjhrPJlOmGP8m/onIEIl6zNR5qjqMLafUhev8F+AHoHen5N
	ddYq97mAvKty22q/kWxG6d963IDB+BJfjqq5OCrp18hflIeaDnd8i2
X-Google-Smtp-Source: AGHT+IFt40ZaGPulqHfABY5KpJlWdF+qUcp5rjh7O1RswkIHSYuf+u+28bd91Be7Pmyz+zpn1cJ0nA==
X-Received: by 2002:a05:6402:1e94:b0:63c:4537:75c0 with SMTP id 4fb4d7f45d1cf-6431a57e1c1mr4635728a12.38.1762989398518;
        Wed, 12 Nov 2025 15:16:38 -0800 (PST)
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
Subject: [PATCH v3 4/4] xhci: dbc: allow to set manufacturer name through sysfs
Date: Wed, 12 Nov 2025 23:15:57 +0000
Message-ID: <20251112231557.164797-5-ukaszb@google.com>
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

Add code which allows to set manufacturer name of a DbC
device through sysfs.

Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 12 +++++++
 drivers/usb/host/xhci-dbgcap.c                | 36 +++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
index 57ba37606f79..26ca6a870e44 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
+++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
@@ -109,3 +109,15 @@ Description:
                connected to a USB host.
                The default value is "Linux USB Debug Target".
                The field length can be from 1 to 63 characters.
+
+What:          /sys/bus/pci/drivers/xhci_hcd/.../dbc_Manufacturer
+Date:          October 2025
+Contact:       Łukasz Bartosik <ukaszb@chromium.org>
+Description:
+               The dbc_iManufacturer attribute allows to change the iManufacturer
+               field presented in the USB device descriptor by xhci debug device.
+               Value can only be changed while debug capability (DbC) is in
+               disabled state to prevent USB device descriptor change while
+               connected to a USB host.
+               The default value is "Linux Foundation".
+               The field length can be from 1 to 63 characters.
diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index d2f64a9a389b..384c5ab400e4 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1206,6 +1206,40 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
 	return size;
 }
 
+static ssize_t dbc_manufacturer_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	struct xhci_dbc	*dbc = xhci->dbc;
+
+	return sysfs_emit(buf, "%s\n", dbc->str.manufacturer);
+}
+
+static ssize_t dbc_manufacturer_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t size)
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
+	memcpy(dbc->str.manufacturer, buf, len);
+	dbc->str.manufacturer[len] = '\0';
+
+	return size;
+}
+
 static ssize_t dbc_product_show(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)
@@ -1363,6 +1397,7 @@ static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
 static DEVICE_ATTR_RW(dbc_serial);
 static DEVICE_ATTR_RW(dbc_product);
+static DEVICE_ATTR_RW(dbc_manufacturer);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
 static DEVICE_ATTR_RW(dbc_poll_interval_ms);
 
@@ -1373,6 +1408,7 @@ static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc_bcdDevice.attr,
 	&dev_attr_dbc_serial.attr,
 	&dev_attr_dbc_product.attr,
+	&dev_attr_dbc_manufacturer.attr,
 	&dev_attr_dbc_bInterfaceProtocol.attr,
 	&dev_attr_dbc_poll_interval_ms.attr,
 	NULL
-- 
2.51.2.1041.gc1ab5b90ca-goog



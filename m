Return-Path: <linux-usb+bounces-30467-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D0722C54C95
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 00:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4CD6134619B
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 23:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC962F1FC3;
	Wed, 12 Nov 2025 23:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RNlwPDJc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8ED27280A
	for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 23:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762989400; cv=none; b=kjNjUKc1TQUuecm9PAuTncXVrtiLUU5R7/S7C0b4gl+NIWW2XGQ/OnadcQi2GgUF7EOzC7XYF3owWv3N2are+H88USqvbuBbpf9I931FN5SEuxixmFzuKXntbFiwDrY+5UVo71AGrwz1uOQfCZjNk9WWStZmfCBdOkBC4ORvWps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762989400; c=relaxed/simple;
	bh=6SCQxxPbJ6jZ7FJzfHpfQa/Zgzm/W7c3+no9cBII5SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pGt+IIp93NZ2zG7rooK16lRqv6pssTzuDqGFNLu7O7/Ct63yzO/YmKn6xkjjOfrrJkVlbUx+LGsRezclEhAL+L4gd44qPQtwoNLTDJyge9MkFSUfyfSY7R4w8Rmwx6k9XYofw5h0IR5Kyx7X5W9aNWgn9rWfyjka64iSm/gaHuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RNlwPDJc; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6417313bddaso313006a12.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 15:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762989397; x=1763594197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pazLZcJas3swZjk6YHo88OY8FvX9LV8jmhjHmthpb6Y=;
        b=RNlwPDJcQlDdYdm291QCO0aZKnum/BLSGbJr8reAvlohjcwW4pCYaljxq+DNxQHJzg
         kwbJOqRdi6OE24sKeWU72HlAPYjlfscHeN55saqW9C8PWSuS1WgJAgHEjt7CwQP7W6wA
         kZeGW4DF4ATJAQKHzST5zMLqhAs3BTHfxXlVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762989397; x=1763594197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pazLZcJas3swZjk6YHo88OY8FvX9LV8jmhjHmthpb6Y=;
        b=pL0c/sDtMAjFzpOiyOccBrrTXbNpgVzxntfhIIutpRCtsIURY0MMmc0TE+T/2AIbjP
         VtCWn35unjfsJx5Eb9Qtd8Kijko87Scy7f0EHRwTF3rOp8gxqyM8ZtB/GjHlOaE1Fp5n
         G0Etagxs83we6QwHe8t4Q4U77OfsQzgYPbjcKmyWs3+hTd+PdZ6uzmMu7YijoYgqjy4Y
         aFG9PgzhhiED4IP0s4LkIMHgSoWA87YU3m1xXv+OA5CyPg9TKfQrT4R34f0VZnlHnSFw
         t3Y0RJsiIulmNQv2kHXMEAGRVUHtxj6TMecQAI4TMmRjVpSm6+f1o9OutMIJaY84F3o/
         Y52A==
X-Forwarded-Encrypted: i=1; AJvYcCVC8aB6Zd/BcZro3txNheehUbQjpKWVYm1aS86+Z6j6aQcoCZyu/AY7Buvg1DRAdr98lUgf9jDMs/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY9HKAAbUSYZIjsIcmGzenDK9YATYic4QxOi0hHlSb0i32FiRv
	gLLvm5dprCuMEFG0bdVknoLBgY1rRE1+Q5+qfDCtCy+WtXozSHCaOitVVy5WPkdW
X-Gm-Gg: ASbGncti+x4g6SAfuoaSz9TEYkHSnL7WSPyYaTGPfa37ujUC8fttCsPd9aj52RQwybv
	Vn2pNGionAYWdyEsmbFAygV2cleIR1Vz+RZwR253tLxBYpGGJcZHv1Oz3SZbcdBVCR4ylmjZdhL
	rMOqiFrkbkqdFAWPRuYgd7JUcRxhaPGsO5x4FQXVFdijpqQ6KrEN+Li+unxCwwNhQ6WtKW9P5I3
	f+r0lGOMpXVglPnL4CyyBfdLD6t9m5PzrV3Ji9eQiS/f5v6mBCuG7vKez8AWizgnhbGTYsT1YyL
	BhPxqlUP54zQIYqjz+ooaqUmDVtVYAxnwcwGnrMLRJcaLnSoyFzO8dBmC4OgYB2zK6fddo7m6Va
	pr5+AorGqNk7/TR4g+su26JeaXbTWHgzDsyrpLtETeLul3xiJl1aSBTeLANZsmU6PxewUxic3+D
	eH/U92/Mg81htufEHewNLcgVwuVz1Ni+Y2DtcBF1j4j20+l2cgWBrf89WcTxtLY2g=
X-Google-Smtp-Source: AGHT+IFCK2uSaIkuZ/jisSgidsD9B1MjqLzZD0qlsbMMD3ofUecDGfdE6Oksy+pLUdmIZGAuLA5qvw==
X-Received: by 2002:a05:6402:5245:b0:641:966d:82ba with SMTP id 4fb4d7f45d1cf-6431a396544mr4039058a12.1.1762989396984;
        Wed, 12 Nov 2025 15:16:36 -0800 (PST)
Received: from januszek.c.googlers.com.com (5.214.32.34.bc.googleusercontent.com. [34.32.214.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b2155sm124516a12.29.2025.11.12.15.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 15:16:36 -0800 (PST)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH v3 2/4] xhci: dbc: allow to set serial number through sysfs
Date: Wed, 12 Nov 2025 23:15:55 +0000
Message-ID: <20251112231557.164797-3-ukaszb@google.com>
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
index 6605833f807d..c5bfd40bd496 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1206,6 +1206,40 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
 	return size;
 }
 
+static ssize_t dbc_serial_show(struct device *dev,
+			    struct device_attribute *attr,
+			    char *buf)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	struct xhci_dbc	*dbc = xhci->dbc;
+
+	return sysfs_emit(buf, "%s\n", dbc->str.serial);
+}
+
+static ssize_t dbc_serial_store(struct device *dev,
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
+	if (len > USB_MAX_STRING_LEN)
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
@@ -1293,6 +1327,7 @@ static DEVICE_ATTR_RW(dbc);
 static DEVICE_ATTR_RW(dbc_idVendor);
 static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
+static DEVICE_ATTR_RW(dbc_serial);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
 static DEVICE_ATTR_RW(dbc_poll_interval_ms);
 
@@ -1301,6 +1336,7 @@ static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc_idVendor.attr,
 	&dev_attr_dbc_idProduct.attr,
 	&dev_attr_dbc_bcdDevice.attr,
+	&dev_attr_dbc_serial.attr,
 	&dev_attr_dbc_bInterfaceProtocol.attr,
 	&dev_attr_dbc_poll_interval_ms.attr,
 	NULL
-- 
2.51.2.1041.gc1ab5b90ca-goog



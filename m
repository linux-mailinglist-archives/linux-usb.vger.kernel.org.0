Return-Path: <linux-usb+bounces-28986-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0313BC2C6D
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 23:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C5BA1889CAB
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 21:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCFB2561D9;
	Tue,  7 Oct 2025 21:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dXseqnVH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF915254AE1
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 21:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759873180; cv=none; b=Ruxkq0f/Huk6/7meneEBWkpS+sqEPfcD5c1PMWxI8qQccwciuGRwCqsQRQtR9obn1VStoDssUdzFQR6FYNnniLnFqss1tEVTuze9bLIp6vEwgZL7KL2awYmQo6m1URIca6KXi5J4V9A3VBpKHqsqYyChoJsxguyqRqmG2W4kHYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759873180; c=relaxed/simple;
	bh=YuWMAzsaHYeabXdnHlXbBv5BQxF/w3yCcEp1sa194CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qE+WDBjdBfXQwJL1SrNSJZCMCOaUKypERXUwxqEw2wC8qQ4iZKJT6pvjimAfVsds8KN7/Jnc3oNIpQi6t2uUa55A6Jfy0CHtwFxTVhYyrJUQg/veToLtViLSpwbgEDFDRRa65iCgIZSGOyoP7LwQtg7CUWmZHMjgCm3GehxwAhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dXseqnVH; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3e9d633b78so79087766b.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 14:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759873177; x=1760477977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WP4HdlwTbsFc82je0ccb25Mgns01mIh3ZHBi2fVbHvA=;
        b=dXseqnVHx4ZaV3EewM+WtnH/+wExb4v32BDl2ezArIYsFFkNvg/JcNq1rMZjYXkq/I
         pYcByNexWLd86aWc5qgjYBj97TLbHDJRLbVNpbhKWvhp4QrYiZD7JXGVxlZ8QPpYDrbT
         Xkx7EnFyhKGMMUBmugvVIvgMwXF9DDG3GCpjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759873177; x=1760477977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WP4HdlwTbsFc82je0ccb25Mgns01mIh3ZHBi2fVbHvA=;
        b=Aby6MCLUYmPXQHWYTGeZ3G/hBifUjIrKPLM49/g6sdAuNTfmYX2xRReT5DeTrNREY4
         6h42dsadJEIlkOnnl8YqqsG5rw27AZODxN6Hnnrq/xQoa/dg5AGSE3FkrcbYqGtUW+Fe
         +pqRWu2v3eMJiatFr75yX9S7arB5hVkjsIH2COucOEQOilqhsJjIm8w9u04tz3Xli2DR
         oqqhxkRE/sLnG5NkvkzoJhIIzWR/0EjvGIxZwR5epmSzFZHDQPRR4KNUQe6CqetakZG6
         8N7uozBMKzBuC+RNJNyvh1kWjZWmaL87kVF4iBWhVSQHo0mU16jIxmPBpbNp/Zf9jhbZ
         nw9g==
X-Gm-Message-State: AOJu0YyQfV1ItXV5CP3Z3aDa0LwQQeOFoGhxjDrHE7sSPxWZaPT4bAFs
	iZ/JVwA6KVDxvtHC5WZKc98sBS1SrC39ChOKVbFzXpzgi2GcbGvsJldYxJ0mhAOL81aYVe0Hri1
	A99mgBME=
X-Gm-Gg: ASbGncu8A9x1F7KX9jz1tKyZXYR7MmYtqh6zq4Afw9Ks35BgmFBCRPjc7WFPMcANBXW
	2eWg/IvF8zZSnZdS0+V7EHkwEMZoidB0SEwX5DWgZcH+bmSVXKc/o1WSw2kXlX54FwIpposOqJ6
	gNcnXsV6VeEDTt/f6KNmdWY1qz2vOKWjlNR0gXSkwmG91HAqJjMnNr5SuX7Xq+PfjyAdj17o8YF
	SHLS6YzUqlqqkBVxz1s9ZOHylLvaYah9/4gZaUw8nLzBg5xD6H6tzaPgtkyKo4AsKQVmw/QFbe8
	3Ho7az/h2zJi2ru0S4awPusMe5/cS0xGe3zDNBj7Ms79Ne1Io/w7JoRzHtHq8K7Xzx5umTGFbH+
	+Bs3Od/Uh460T5grFVnEzJPNo7BbdF++GFzBR1+gSVH9+yfdhbSRj54SZ07vkARYVwzU2HVoumW
	h9SECR9IycQi5hLOEttb2AOdlk
X-Google-Smtp-Source: AGHT+IEx3KJXeQXbqTwK8SnbDtAa5H8fhw5f6gp4XmsYXHyHKZ3o6I5cCNlUF5rT8XJMXTJloj+Zzw==
X-Received: by 2002:a17:907:8991:b0:b33:821f:156e with SMTP id a640c23a62f3a-b4f4116a352mr677794066b.12.1759873177131;
        Tue, 07 Oct 2025 14:39:37 -0700 (PDT)
Received: from januszek.c.googlers.com.com (25.254.32.34.bc.googleusercontent.com. [34.32.254.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f74002sm1506331366b.42.2025.10.07.14.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 14:39:36 -0700 (PDT)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH v2 4/4] xhci: dbc: allow to set manufacturer name through sysfs
Date: Tue,  7 Oct 2025 21:39:02 +0000
Message-ID: <20251007213902.2231670-5-ukaszb@google.com>
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

Add code which allows to set manufacturer name of a DbC
device through sysfs.

Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 12 +++++++
 drivers/usb/host/xhci-dbgcap.c                | 35 +++++++++++++++++++
 2 files changed, 47 insertions(+)

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
index bc782f6b533e..badd20f2dcd9 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1200,6 +1200,39 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
 	return size;
 }
 
+static ssize_t dbc_iManufacturer_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	struct xhci_dbc	*dbc = xhci->dbc;
+
+	return sysfs_emit(buf, "%s\n", dbc->str.manufacturer);
+}
+
+static ssize_t dbc_iManufacturer_store(struct device *dev,
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
+	if (len > USB_MAX_STRING_LEN/2)
+		return -E2BIG;
+
+	memcpy(dbc->str.manufacturer, buf, len);
+	dbc->str.manufacturer[len] = '\0';
+
+	return size;
+}
 static ssize_t dbc_iProduct_show(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)
@@ -1355,6 +1388,7 @@ static DEVICE_ATTR_RW(dbc);
 static DEVICE_ATTR_RW(dbc_idVendor);
 static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
+static DEVICE_ATTR_RW(dbc_iManufacturer);
 static DEVICE_ATTR_RW(dbc_iProduct);
 static DEVICE_ATTR_RW(dbc_iSerial);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
@@ -1365,6 +1399,7 @@ static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc_idVendor.attr,
 	&dev_attr_dbc_idProduct.attr,
 	&dev_attr_dbc_bcdDevice.attr,
+	&dev_attr_dbc_iManufacturer.attr,
 	&dev_attr_dbc_iProduct.attr,
 	&dev_attr_dbc_iSerial.attr,
 	&dev_attr_dbc_bInterfaceProtocol.attr,
-- 
2.51.0.710.ga91ca5db03-goog



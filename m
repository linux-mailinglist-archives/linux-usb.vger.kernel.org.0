Return-Path: <linux-usb+bounces-28985-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 503EFBC2C6A
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 23:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D4C51882E7F
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 21:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD542652A6;
	Tue,  7 Oct 2025 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PNcuab0s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6224B262FEC
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 21:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759873180; cv=none; b=sPKWP7GV5AdnV6nsEVK4MnohOjk6PZPPfd0dTPnv52VtQezCmuzw+D9jNjS/GEzr3r8kOGYTLGi6TF+LWMoRSq02jkVAxP4HIzjTgZehbVUJlmjXeE3Sqk7uDpKbNZYjXixe+hQih5HdZUlVXekSr95FssGMxaTpor9hboiMOOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759873180; c=relaxed/simple;
	bh=SEd3+9GpbVGWX/7dgV19h98JJ3+BP9GJ26eQSpdF7tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipn6mAVKR90LcutfKJFo65homNREZGizxkVOyTPpPA892qQkBEv7dhfiPxq+AaUt7VPy2I2FYIpX4U5WzaHFrLg5BG8t1NkxxMIEMQme9wuFJZOXGfip+HdyA9QplVx89LkF2ZKGTnynjBgt1V2QT9oZrVrdHk23IPzkq1V7uUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PNcuab0s; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7322da8so1424132366b.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 14:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759873177; x=1760477977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1XuZhs8+tEctmtNYZLPiUJC3IWOP4bv/SeU6urQRv0=;
        b=PNcuab0s6n/gUkmodFKWS2qPmYeogw0mXoByRDXu6YejXeVWbvLg/SJRV/jThe/Zwu
         EtoRXhAwLiy7MHwB0YIQf2KLLDuGd8x3PipdETVVmtVq6kVC8Akn3Le24/VbGao9Ro1z
         t1P6cH1LyeyOKZVFoyGaTBR5hmpDtsA6/J20g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759873177; x=1760477977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1XuZhs8+tEctmtNYZLPiUJC3IWOP4bv/SeU6urQRv0=;
        b=uH6q7L2/hp9v2yLYmBBo33sCg4k7tPSqaUqJm8Ab8xc10YtgSadNvR1+qIAz4y8rbw
         MQWRJBADqh0Db/wIkwyu6g7MuzHIij0F4KYfx1y9xjLdhv2C6XfMjd2bNkFAhWLL34hD
         WovZ3gRq09TJXyptcUoiEwW3WsoIra1bwI1C6annhHfOgAXgwQpHaY1Gj2bUxt3/J9y2
         g56aylb7jehLA3bp0xmhfDEtXiTQvuCwdeaUdi2lbEBlp3I4kJ+3FFdIfaPrQ+BZ15ew
         kqlB9bU+uzRs/Rn/BEkXblNJGNoD8Umi3Gl2r1h0mstRCo1IqIFSD4f0yddJRGlqJPh/
         ODqQ==
X-Gm-Message-State: AOJu0YxED01amCrnoNDSZnRI8ANcaTBNGTplKCnMxUf/ZS1pv/Q06Vcz
	XSpMmjli18zYc01gwJNE2ijHZzTfBEug2ZU3Z9ncTz07UQZRJvjXD1iGOoTeSCk5
X-Gm-Gg: ASbGncsKv4yq3HGF1jKyO6OgnRHccjfDM/PIlkZsZ2L3tg05jf1WwB4BX5/qruqZXB4
	qDrPfllN448lS7iS/CbKMBmWlQXDoU/qWZm6XzuUTF1HDmjdGc97vsXo3poxHnisMZAUFcZc4VK
	Vq0FVIgU5GGJo+Qe1w+ADKuFWlCJU+5otUd0/o6NyQ8uwYpFW7Jho9HmDJVKdP7/8u0pMMwUG8W
	ujbqvOpSSH677Bv227ikwEZc+vBmj0DULbtkATn8JBNzFy2aLppIjPWG8lDxckFz0feHHy9YCLw
	mBjhvDKFbGwqeK4cdSjuzdwh4EveopIPCuVXutaxLL5sGcikIlC8V9gMoIf5Ld/gX9b0VOQXl9E
	B0k7EpFBDwTkQsnrZyyZ4xNQnfcYS58efoesb2tE8mbBxjpBvBCTAeaHrimpqWwjFeF2yhKAptC
	fG8OyR9DvMd0up2Jdn5R5URw7G
X-Google-Smtp-Source: AGHT+IHmr7dgFq1AZJn8Xg0T4UW/uudvbpsx5WX2v6VSEGBDuYVUuAaPD6uNfrl1r5xBbedGMKsHMA==
X-Received: by 2002:a17:907:94cd:b0:b04:5a74:b674 with SMTP id a640c23a62f3a-b50aca12e97mr117444566b.58.1759873176582;
        Tue, 07 Oct 2025 14:39:36 -0700 (PDT)
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
Subject: [PATCH v2 3/4] xhci: dbc: allow to set product name through sysfs
Date: Tue,  7 Oct 2025 21:39:01 +0000
Message-ID: <20251007213902.2231670-4-ukaszb@google.com>
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
index 7ad83548ba4d..bc782f6b533e 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1200,6 +1200,40 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
 	return size;
 }
 
+static ssize_t dbc_iProduct_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	struct xhci_dbc	*dbc = xhci->dbc;
+
+	return sysfs_emit(buf, "%s\n", dbc->str.product);
+}
+
+static ssize_t dbc_iProduct_store(struct device *dev,
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
+	if (len > USB_MAX_STRING_LEN/2)
+		return -E2BIG;
+
+	memcpy(dbc->str.product, buf, len);
+	dbc->str.product[len] = '\0';
+
+	return size;
+}
+
 static ssize_t dbc_iSerial_show(struct device *dev,
 			    struct device_attribute *attr,
 			    char *buf)
@@ -1321,6 +1355,7 @@ static DEVICE_ATTR_RW(dbc);
 static DEVICE_ATTR_RW(dbc_idVendor);
 static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
+static DEVICE_ATTR_RW(dbc_iProduct);
 static DEVICE_ATTR_RW(dbc_iSerial);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
 static DEVICE_ATTR_RW(dbc_poll_interval_ms);
@@ -1330,6 +1365,7 @@ static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc_idVendor.attr,
 	&dev_attr_dbc_idProduct.attr,
 	&dev_attr_dbc_bcdDevice.attr,
+	&dev_attr_dbc_iProduct.attr,
 	&dev_attr_dbc_iSerial.attr,
 	&dev_attr_dbc_bInterfaceProtocol.attr,
 	&dev_attr_dbc_poll_interval_ms.attr,
-- 
2.51.0.710.ga91ca5db03-goog



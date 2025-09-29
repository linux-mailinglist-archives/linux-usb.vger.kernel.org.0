Return-Path: <linux-usb+bounces-28771-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C42D8BA8812
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 11:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73021173E26
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 09:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717B727FB2E;
	Mon, 29 Sep 2025 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IuLZgSdQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2489513AD1C
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 09:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759136535; cv=none; b=HkRcBuxhXQL+Sb3JRIBQue3bei3waAed+QLLhQH0ojzyDQ+DvbTuh8MM8hbTGNYzqI/tV3WNzXZ5QXrcbPjCSCXN77FX28zU7RuEKqhVHthEbfwvcLIL6IE0SdBwH9ac7dGTvdUdYIQTTblo/eKctGGVXDmvPSoQGScW20jQExo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759136535; c=relaxed/simple;
	bh=9AM/sHBSiQ0ySe2Xhj45O1IsDqQJFuqq//d9d9LqM4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tQ9f5gCoruC9CNFQF1OdFZB1aeV4mAuafgqWe1HseHkCnqMHdWS5Ca3D0VHPKw1evqcdDghz1TzS0vrmlrNeCZ9hviAXK0my9yJ/HzKRevugrtLDCOctrYa+MeSPx0KC8SPcZGsTm+aJqp8tDIpK1dwctYSafjyHI741S8SB/uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IuLZgSdQ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62fa0653cd1so6362258a12.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 02:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759136531; x=1759741331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJyWeGn1m+TcVOWpc/w+7Z8BUD4UHlHzIQGhboyzcUY=;
        b=IuLZgSdQHUxyE1l78+ijtT58M/XmYnPvGwyGYaFH65ZWRbEp3bwNMXrZnLIwB7bAHe
         dj+axI2THhdzrUtXmyQlx6i0evaO7w9Jrw15clbVhsucWGZiyaoeCa4wQl/BpNlIcoYP
         D2uvuij2q4GAcM9uDLUInvm4futdcYaxSU1/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759136531; x=1759741331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJyWeGn1m+TcVOWpc/w+7Z8BUD4UHlHzIQGhboyzcUY=;
        b=XhnqrTlLaZpMxSLX38NQ39nECAADFQi6MkcYPThcM+D3rDi+oA7W7JEK9xbRSc/5Nu
         D0H5mlLAjZNrAQkW2vNK4jzijWhOFPeNJ680t46hJwdU0MDCFUex6flw+6GuUoSNHV+r
         5keS4Uhoynbi0drFcEh0CC+Cd3FWsmP28UAvx7fVDKwKdtghJyhvxov78/Yd7MmLHsn9
         6tpihQicjMmnon+7EylNumBILg8zOUwxP7ChyCDd5nGGiM8uJynJll77L78mwD6LB0sJ
         0t+zCg7b6h7YcJHZi77LA5VBOmZZZETk0jsVBJRIbadUBvC7GflCTL/hePM+QqLZJVcf
         W3sA==
X-Gm-Message-State: AOJu0YyzGXuSEHwc5SIJJWooPs3Y/OKiKeRzjqpR/Fkz89RSt+vBIPgi
	Ih6Ongaxh1GxKkXHow77nlD+uCilNUEqAAqRMY/oa3eTpnUwB78TqqYWI0WbOTUQtwFw1O/8GAP
	iTtkR63w=
X-Gm-Gg: ASbGncvCKCGL7stqIbhfRIhLy8sr30x+S2wuqGvjNJ8RyXTJxUnBhIeBVDfX6J2vYPp
	YBgYWZZqRMcMHbzmLj1I7Al/vpNX/FmzBivGJ4cjvZlVkJNXxpaO7kPG5B6q+6v41/BpYSkg8RY
	ljWl13K8QrOicoHmjoMR8dC3QUtDDudoJT8Yv/5d9anlzE49EiMMQp7MYuvpsi3bCpmLK6wa8vy
	9HisxUaE7G3tI/M4YSKmRZKfvu5Ld0XBVvTdEDlIeKti5JFQtaVzPngWvhNXJCq6z2tJ+dwW4fG
	CXBGEJ35QxK4/7WHfOaOu56jBr5uXwcrNX15J5RHNmHKGvG8mLAWi0DRwdL82ChLhpltUuDI5GV
	Mmod7oA2hZ9rIWhTrx16sJ+LCfESR6+wzIGshssXY70BB9Dnc33bO9foYnuSYLz7oobtqtpvH9V
	M9dirTxmWWZDz+JVrV8xUMUA==
X-Google-Smtp-Source: AGHT+IFEAvCj/N1WsuDPlZFf6JLQx7igF4lCjZGy7bxWxltcQ2DqNrRVEqay38zRN8QvOmYrmVneYg==
X-Received: by 2002:a17:907:3f10:b0:b10:4355:2e63 with SMTP id a640c23a62f3a-b34bc67ad82mr1849874666b.46.1759136531366;
        Mon, 29 Sep 2025 02:02:11 -0700 (PDT)
Received: from januszek.c.googlers.com.com (25.254.32.34.bc.googleusercontent.com. [34.32.254.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98d7fsm880017666b.100.2025.09.29.02.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 02:02:10 -0700 (PDT)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH v1 2/4] xhci: dbc: allow to set serial number through sysfs
Date: Mon, 29 Sep 2025 09:02:04 +0000
Message-ID: <20250929090206.423937-3-ukaszb@google.com>
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
In-Reply-To: <20250929090206.423937-1-ukaszb@google.com>
References: <20250929090206.423937-1-ukaszb@google.com>
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
 drivers/usb/host/xhci-dbgcap.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index c2fecaffd6f3..5cc201afe8f4 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1200,6 +1200,36 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
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
+
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+
+	if (size > USB_MAX_STRING_LEN/2+1)
+		return -E2BIG;
+
+	memcpy(dbc->str.serial, buf, size);
+	/* remove newline and terminate the string */
+	dbc->str.serial[size-1] = '\0';
+
+	return size;
+}
+
 static ssize_t dbc_bInterfaceProtocol_show(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)
@@ -1287,6 +1317,7 @@ static DEVICE_ATTR_RW(dbc);
 static DEVICE_ATTR_RW(dbc_idVendor);
 static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
+static DEVICE_ATTR_RW(dbc_iSerial);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
 static DEVICE_ATTR_RW(dbc_poll_interval_ms);
 
@@ -1295,6 +1326,7 @@ static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc_idVendor.attr,
 	&dev_attr_dbc_idProduct.attr,
 	&dev_attr_dbc_bcdDevice.attr,
+	&dev_attr_dbc_iSerial.attr,
 	&dev_attr_dbc_bInterfaceProtocol.attr,
 	&dev_attr_dbc_poll_interval_ms.attr,
 	NULL
-- 
2.51.0.536.g15c5d4f767-goog



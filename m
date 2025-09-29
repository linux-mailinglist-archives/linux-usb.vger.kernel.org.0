Return-Path: <linux-usb+bounces-28772-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 263C4BA8815
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 11:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA7BA3C47AE
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 09:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB92728000B;
	Mon, 29 Sep 2025 09:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m74Ih5+D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705FB26A08A
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759136536; cv=none; b=mFnK1LTOYuD/WrX2FrL6U4EF3YTmuiG+Pd4K2ezCmJSuCsE407SK+K5lAA59Uy1JNNphzo4a762ems3zu/5ZySMxsd6SEy62mr8RqPJyJHXE/rW6/BWy0BkpKgaWg6VPV/WS4pm6uNcN3SsiZaw0E+gCBvpuWWdoCkZJ3oOSC8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759136536; c=relaxed/simple;
	bh=xtw1zdv3kWZXrAAOq3pU668FPP0Bzga/9rs6l1RITvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gs/RlTOArsUOq6RqveYeCeNdbU8S9f/n4KvCZTECR8dmHTlCTPK50cr653a6HBrgva1G2bA9r9rsV0ID0rhLdV1fv7ZJxU1Axbo621ykPz08S4h0SRhdTOjMkJ4DYIdeqVoNnGZXukkXzKYFOci2Q7HUkiaNJVlyJajxzxxDWRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m74Ih5+D; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3e9d633b78so182146766b.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 02:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759136533; x=1759741333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/scRGt94pLyLFFfrnxwSVmEkJmf2sGlBUAXSw6q1lM=;
        b=m74Ih5+Depk334xOMlo0cRiFdC9MHoCIhameijGxk5VDC72rfHKseMeIhphK585unX
         YRy42nluSnCIQQY/f4JbuwuQPvXMfz9kGnTUhsO/oBuYizF+dO5KnY7HTx2a2QLlO+8p
         Td0th3jnjYGQNAEFEoMrzQDpnKF8G79/MCbZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759136533; x=1759741333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/scRGt94pLyLFFfrnxwSVmEkJmf2sGlBUAXSw6q1lM=;
        b=uFg84b8TmNOGMWiiOKdmIK5687ZDgvH0Hvzc4HKf7709VMWkVyFvQ1PavWPUa0K04i
         5RwEvOPkaGPBKMa78EPxyYNBCj58C2FmVmJbfpfMA2tOGazpwspD6WIvmCLvttYDnqUE
         ibw3+u2xSHScIpks8GKZHiMSIaUvSUjkiaXmdTCGNDfwtFp78CehVDY+FoBUdgxuAXLD
         CJGd+9bgsVF6A0waMtHVVHp91l99onCR2rKPc5Him5RewTROedUOC32N8t7rPKACZtgb
         krzl8xsY0yAu9ZA9CvBHKOZEiEitBcLa8XUqIkJKwf32fyvzOV9a7OUhbzAgsMU1kq1A
         jNAA==
X-Gm-Message-State: AOJu0YyH84sKK3pvCusojc7jqjNXp89Ol9MLMa8ojryN4xpABIHv71GZ
	nXm3wfre7vPnAdJrlAa5r4WxVfgFen6f1FO2mWca6UpT+2LYR24uhRkpwHcJxuWl
X-Gm-Gg: ASbGncshzllqTQWrw0yKM+7FpGoTTTDylvO0r582GGlG8e5UlJomP2uamZTLOJuhmZ0
	BfzzPBtVgApK8rbZ9dOFLgPW/wqitJYJXVCko//xbw20F4Hwb8K7vBNcOcL3uKV1Y4ayZDIsBUG
	7CJcdvcDTWaLKACVnhupH2hHtXj+hJDQHWIDusDw07xqv/qj7ym8Io8merXKFheBW7gs1LeRcTr
	xGpH35w4z2O/gLXfcPFPZYJjuvtqIJoC+eBDCxnV/rjYwFlzRna82oR1WHdAHosBZvGadarElyy
	b4lZofw8jhiXa8puILq3bShc4UWCtWiRR+iJoEz2b7GrpeiBhKu40xqZqCVGrkKeHgHgy9qdh80
	q15ZeBWjUKLdORebSykJ/CEoTGyTn6/GvgrcgO0pD+cUJNiOt85vIogTINA7IKF4mjdjCocUNfW
	yBYAPjLqIYORI=
X-Google-Smtp-Source: AGHT+IELGlKV0gaxEHoWaW1HFbIRJUeBi6vDB2jgTsJ/1b/allUNfDMloGT9JXbNe/ZjG5Y6+rFp6Q==
X-Received: by 2002:a17:907:94c1:b0:b40:bdc3:ca04 with SMTP id a640c23a62f3a-b40bdc3da84mr70244166b.0.1759136532555;
        Mon, 29 Sep 2025 02:02:12 -0700 (PDT)
Received: from januszek.c.googlers.com.com (25.254.32.34.bc.googleusercontent.com. [34.32.254.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98d7fsm880017666b.100.2025.09.29.02.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 02:02:11 -0700 (PDT)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH v1 3/4] xhci: dbc: allow to set product name through sysfs
Date: Mon, 29 Sep 2025 09:02:05 +0000
Message-ID: <20250929090206.423937-4-ukaszb@google.com>
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

Add code which allows to set product name of a DbC
device through sysfs.

Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/usb/host/xhci-dbgcap.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 5cc201afe8f4..31fa3c7c63e4 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1200,6 +1200,36 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
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
+
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+
+	if (size > USB_MAX_STRING_LEN/2+1)
+		return -E2BIG;
+
+	memcpy(dbc->str.product, buf, size);
+	/* remove newline and terminate the string */
+	dbc->str.product[size-1] = '\0';
+
+	return size;
+}
+
 static ssize_t dbc_iSerial_show(struct device *dev,
 			    struct device_attribute *attr,
 			    char *buf)
@@ -1317,6 +1347,7 @@ static DEVICE_ATTR_RW(dbc);
 static DEVICE_ATTR_RW(dbc_idVendor);
 static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
+static DEVICE_ATTR_RW(dbc_iProduct);
 static DEVICE_ATTR_RW(dbc_iSerial);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
 static DEVICE_ATTR_RW(dbc_poll_interval_ms);
@@ -1326,6 +1357,7 @@ static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc_idVendor.attr,
 	&dev_attr_dbc_idProduct.attr,
 	&dev_attr_dbc_bcdDevice.attr,
+	&dev_attr_dbc_iProduct.attr,
 	&dev_attr_dbc_iSerial.attr,
 	&dev_attr_dbc_bInterfaceProtocol.attr,
 	&dev_attr_dbc_poll_interval_ms.attr,
-- 
2.51.0.536.g15c5d4f767-goog



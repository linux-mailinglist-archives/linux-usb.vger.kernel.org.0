Return-Path: <linux-usb+bounces-28773-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F7CBA8818
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 11:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7E0F18900AB
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 09:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D97928033C;
	Mon, 29 Sep 2025 09:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TJzSauxc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC77F2727E5
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759136536; cv=none; b=DrQ7d+vF3tMA01zxt7PmFe8OOXvNKt3+bo5Tu3aJrqiBDBdq9yRimKg+s8LV6XqLFHatHF9XAbskiOmEZJTjqfyVhx1gNfTXevDwcjYhPgu7aZgK1L1/EGYKkvCqeRTMlXZ3vQLca4LccZpGbIWotq121TjCnDehVmi84iQqPWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759136536; c=relaxed/simple;
	bh=Iz2BWCdSgdVFT+ZSV5FEnQ1mDouLiwwzq0NW5tWky2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K1ok28+4iG4702L8rQNE4yGFxgjHCbmaqOcaVUrmAZxVYNy8r3o4IOpjuc6WjziMvWMofC8oWaoDwk6G0DKFKOH1YD5F/dUjr9PWgOKrGyAHPdg2v2yUHJlBSY8ALOKFAIebm8PadJEkt1ezT0q035WVwE4mLwfXnI7V21SlN3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TJzSauxc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b07e3a77b72so894151766b.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 02:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759136533; x=1759741333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYo9Bvf48RUNwotXaFzXexOnDcIhbuguQx24asL2zgM=;
        b=TJzSauxcl8jvGAr9661BWW1jg4e1dbRUctIWX0Bf8TO8C1zxYRDJWjn/JuEqW0pCO3
         aGKAyyVo9kqgqVOSYFGLtY38Nurg40c6+PWQzYjIMA3pZntYfO3HMQnPEs4SuD8EshqC
         4HFt+nbIR6/fpF8oYGqVKgYCHe0Xg+3X+DaVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759136533; x=1759741333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYo9Bvf48RUNwotXaFzXexOnDcIhbuguQx24asL2zgM=;
        b=lPHkr6t+pRgk+/n7I+O/bEjhyrNv/+m0NNpIh4/RNsVESJ6w616YNtJD+HIaskChAe
         zd9CjcqpruTvkeWC/Rkoe898amztWLR/XRk6yBVjQqNFTx1EKT0d8JWan4SX1Ea8xU2A
         +34kpv7dNNP5ZQ8uJZcLNOy/IpTlzTIZvDhV0p1jq9tBcv/l5bTBmr5yKHCRXOfEkrer
         tZuVHG+JOh8DXzPM8yghhthRAvtIENQmf5n2FXnu0aCoGusFQ92+IRb9OafZxZmP7nYV
         +TmSB99rvO0TDLsvxCwZkV27eU2IELLp4EJ2dvuoqvwBjk25+JKXLQjP0eL44BzmsAQ8
         7b9Q==
X-Gm-Message-State: AOJu0Yxp8aevYWhunG15BP2OMfAxkcKKG1/XrohslQjADhqwNVCVt86m
	S9G5TLhBHD0XSfbYEGryO5fOWpNBUiSW1n64AA8G41X1reNDt0LQUNLktP0U6D5rSiyyv4mfoiW
	O1Oj/T+U=
X-Gm-Gg: ASbGncsk+34/XEWjkrtLIN8R0R/SDEkgK3/fSzc0r8bo0YHbD3eQBPNMqoPON3QCUZQ
	Fim9rwRHS+NAfRRpS8W0PNwcrpvXCtTJBX+pyf4fE6CY01/lslvQ9MpuqTauP9tJuzoXn0xs7XW
	QnZScRa4LJYJfTCFrK5etVtb5SBAYljjpznqSGye+z2+ZAde/VCCSj8FqA/eS+Otim10of0ih84
	MwsL3GzDENrPiHAhbX/E4my/Y6jLpFZ4zVyeKs1BLejpKM6vKJ741vtqwSUuDkVGHa9tjYhlbZY
	b0Y/G4YGTQizy0uW6NEw7qbknx0mn/j6NnAiGNRrsca1Bt1RIefDCW998tYZ7vQUJET1AeUsR5E
	ruNTGLItXp/ntv8djuNYDw6B3W9jXkaF4aNrqCRwl6uxj7LOr9s9nFYdEXXlkWNTz7vt+9KkoO5
	iq4+4MsbmeYoI=
X-Google-Smtp-Source: AGHT+IEYogRq6m/Zejt+rxTWrEOotQlBAFsCgf0n3rTC71Rr43/exUYFn+UnL1D42uu65FVAf2v7oA==
X-Received: by 2002:a17:907:6d1e:b0:b23:20e7:b480 with SMTP id a640c23a62f3a-b354bb6475emr1625045066b.18.1759136533104;
        Mon, 29 Sep 2025 02:02:13 -0700 (PDT)
Received: from januszek.c.googlers.com.com (25.254.32.34.bc.googleusercontent.com. [34.32.254.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98d7fsm880017666b.100.2025.09.29.02.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 02:02:12 -0700 (PDT)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH v1 4/4] xhci: dbc: allow to set manufacturer name through sysfs
Date: Mon, 29 Sep 2025 09:02:06 +0000
Message-ID: <20250929090206.423937-5-ukaszb@google.com>
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

Add code which allows to set manufacturer name of a DbC
device through sysfs.

Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/usb/host/xhci-dbgcap.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 31fa3c7c63e4..b52735c1474a 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1200,6 +1200,35 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
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
+
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+
+	if (size > USB_MAX_STRING_LEN/2+1)
+		return -E2BIG;
+
+	memcpy(dbc->str.manufacturer, buf, size);
+	/* remove newline and terminate the string */
+	dbc->str.manufacturer[size-1] = '\0';
+
+	return size;
+}
 static ssize_t dbc_iProduct_show(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)
@@ -1347,6 +1376,7 @@ static DEVICE_ATTR_RW(dbc);
 static DEVICE_ATTR_RW(dbc_idVendor);
 static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
+static DEVICE_ATTR_RW(dbc_iManufacturer);
 static DEVICE_ATTR_RW(dbc_iProduct);
 static DEVICE_ATTR_RW(dbc_iSerial);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
@@ -1357,6 +1387,7 @@ static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc_idVendor.attr,
 	&dev_attr_dbc_idProduct.attr,
 	&dev_attr_dbc_bcdDevice.attr,
+	&dev_attr_dbc_iManufacturer.attr,
 	&dev_attr_dbc_iProduct.attr,
 	&dev_attr_dbc_iSerial.attr,
 	&dev_attr_dbc_bInterfaceProtocol.attr,
-- 
2.51.0.536.g15c5d4f767-goog



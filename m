Return-Path: <linux-usb+bounces-24917-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F987AE0526
	for <lists+linux-usb@lfdr.de>; Thu, 19 Jun 2025 14:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70CFD3B4DD1
	for <lists+linux-usb@lfdr.de>; Thu, 19 Jun 2025 12:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AB422FF5E;
	Thu, 19 Jun 2025 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="u13NnDaU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DF41E7C16
	for <linux-usb@vger.kernel.org>; Thu, 19 Jun 2025 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334905; cv=none; b=kzaJ+fILjrOW8Cx6Ykq+dM2WSGKaoq5zBDdzaxucWqnr57I/9rrIcVahnXSFPQjKtRl4BUZO+ju9/KSGePfIk3JolOFAKHRZhbAiUZ4h6Vcp5m+iZOqFdaWMSWMuc48fYLEHzCahjz3zzKfGarwprA1Z/n4mB4QUTJYziIT+rOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334905; c=relaxed/simple;
	bh=5F3P1kfhpvJxNCeVfDn/5ybrVPWmzKVNAGZPkMTYSKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qD6DEMLhjCL4hKrSuO77WwOCIcCb2iQ54wFDM4DjT7eXzfcVWs7yOdemyRzD85AaDDiXdKf9IN1y/9tmDT30OtT0S6chQPhkXULjdk2g3Jkco1rn+F4LC6Gdt59sBgjHBbMwHdlt/9M6S6+x8hazaRowXebm0zGpQyc8NeJXgy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=u13NnDaU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cfb79177so3929815e9.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Jun 2025 05:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1750334901; x=1750939701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAxRLAejUsHjypjjnrTVOYXan4TT7QUHhYtr7a8fqYw=;
        b=u13NnDaUkEaDdZ1vtavQiwbLdYUAcrSfBa/sqirSi1hS5rtRLrLINn+veQ4VTH7ZFl
         w5oVv1J+X7ay66TMrvLMamf4MiDi3JsjohW/b+xIr/nyv9/T7TwNTmD0s5WgPfIFdSq+
         lSp2OM894S1iI6rEIc/3zxh5jKgwR5jDh0r0+iMuIU38yD2PP593+6KC0f349kGHWJnU
         cXfr+9XvMqYZeWkz3xB9E+XSKgFoBehn9SrBHdKBBSurCp81edwSQwqlE03OwvOGrcvT
         Il2YTozRHvxIEbluSD+51XFVY7MDO2eDcAADOIm4wkXv3PU6JkDLxeOl5DI7hYB7ZJyq
         uV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750334901; x=1750939701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAxRLAejUsHjypjjnrTVOYXan4TT7QUHhYtr7a8fqYw=;
        b=le+rku6ObuZs00WUKO6F8RN97lm3HYYVYSbcOt++oXeIPo5/K+ReXqc35y/RSEKwDn
         JDGgRhyRrwlSWjNQoMnUuWKQ+HyV88RAXu3LtruSbcvn+q4nuKkrshRPpbuaaD7ep87x
         KkH7s/jpW/7ms+Br2VLsQJ/zBq7vLbvtLmk3SE4RAarkoIMjKExM2rP/7OMiAfHmfDC7
         VG3ak2G+cfa4uFRDw8nJaYOOPOB6lzhXS31byovjIZoak2Y0olNRqMR2Em0SmHoXGc+o
         ipiDIaPzs4Sn+hgXU+tBxJO1IYYOk0lq77QETw7/AQlEKwvuqfYwA1M+icdwI+Mj517g
         fEHA==
X-Forwarded-Encrypted: i=1; AJvYcCWiLPnEG97jfbs5rop+XfNKo/xTI7MErYi0WwpHGD/8M7aOab4tLjYsStprn/uhIYU7biKyF46BDe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJUUt9aHSi6O81QsWFOMwIDD26mknfYd2iwQUyJImg7ALzrQaI
	YDp6TJYaRInKl4xbwA7jp8bjgXA59qunXQUA6ZFsV9V9v2U66Vlxi243MOPTmCoeG0I=
X-Gm-Gg: ASbGnctKF2JwckTvpWs2yNtC4T+yXTxLmdGmDS1Rm/4jjvpHI9mAXMxT7h0/Dse8oX6
	c6/8CJQkjgMZqskiJFu7s38wzHW6uqLaphNqm+ATTuWkTY2rK8AU4LXWWeN7YFMdobVV0gSUc70
	RbnBYzCRszHEetBRXCkGGrsm0+ul1CosvPEb5WQxuuHbQTSVBv53sISh+YjbtZRDT9Z3S5SgxrB
	Iq3uxqMKfkCHD32FS7nKWHLp/L4QF0RktKvKzZmaI9rppt59Dvve9fqD0LReFX5aZgpt6Eqqmjn
	IZpjRe/YMKOpt9PUvM0DwM07G3zrshWNvDN33auherzyu9/U3GknmkR2HWh2flWA/Okq8uYv9sk
	6AqEDhOSbx413
X-Google-Smtp-Source: AGHT+IGHvY1nrgiqXrIeN83GM536uQ7g5PaEHQSZe6jlMyRnlGAW4XCRb7LuhCIszof1RGsKeAWgUA==
X-Received: by 2002:a05:600c:4f53:b0:453:5d8d:d1b8 with SMTP id 5b1f17b1804b1-4535d8ddc69mr47412025e9.30.1750334899741;
        Thu, 19 Jun 2025 05:08:19 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:546c:6067:d6b:b4e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a734b5sm19738748f8f.33.2025.06.19.05.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:08:19 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] usb: ehci: replace scnprintf() with sysfs_emit()
Date: Thu, 19 Jun 2025 14:07:11 +0200
Message-ID: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per Documentation/filesystems/sysfs.rst, show() methods should only
use sysfs_emit() or sysfs_emit_at() when formatting values to be
returned to userspace.

Convert the uses of scnprintf() in sysfs show() methods to
sysfs_emit() and sysfs_emit_at() for better safety and consistency.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 drivers/usb/host/ehci-sysfs.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
index 8f75cb7b197c..3786e81b0ed9 100644
--- a/drivers/usb/host/ehci-sysfs.c
+++ b/drivers/usb/host/ehci-sysfs.c
@@ -12,21 +12,18 @@ static ssize_t companion_show(struct device *dev,
 			      char *buf)
 {
 	struct ehci_hcd		*ehci;
-	int			nports, index, n;
-	int			count = PAGE_SIZE;
-	char			*ptr = buf;
+	int			nports, index;
+	int			len = 0;
 
 	ehci = hcd_to_ehci(dev_get_drvdata(dev));
 	nports = HCS_N_PORTS(ehci->hcs_params);
 
 	for (index = 0; index < nports; ++index) {
 		if (test_bit(index, &ehci->companion_ports)) {
-			n = scnprintf(ptr, count, "%d\n", index + 1);
-			ptr += n;
-			count -= n;
+			len += sysfs_emit_at(buf, len, "%d\n", index + 1);
 		}
 	}
-	return ptr - buf;
+	return len;
 }
 
 /*
@@ -70,11 +67,9 @@ static ssize_t uframe_periodic_max_show(struct device *dev,
 					char *buf)
 {
 	struct ehci_hcd		*ehci;
-	int			n;
 
 	ehci = hcd_to_ehci(dev_get_drvdata(dev));
-	n = scnprintf(buf, PAGE_SIZE, "%d\n", ehci->uframe_periodic_max);
-	return n;
+	return sysfs_emit(buf, "%d\n", ehci->uframe_periodic_max);
 }
 
 
-- 
2.43.0



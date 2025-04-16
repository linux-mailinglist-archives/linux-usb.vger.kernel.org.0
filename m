Return-Path: <linux-usb+bounces-23150-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B40A906F1
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BF4416AA4B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 14:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00951EFFB4;
	Wed, 16 Apr 2025 14:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="05N7C1IQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A631DED4C
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814986; cv=none; b=Yk5bsAgfY9hkVTatkmGWRKF0QtmPqbh2QZmyEwqeLI5vhup+x8MS4HJYdFBex3Ccg6Mi5zwk7xVOPhPUIooulyjCYJirWd5KX45/uLpXFMjw/vKXbKj9Kh+68qQn8HUJlxzZZTwp2Hd/vT4Z8RGC6hKhlkMhB4BrFnx/dXuJtoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814986; c=relaxed/simple;
	bh=RmGXQWPOg0XHqbMDxkz8sqI1j76AnzNSSdYGP4N3py0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NlqpRjgza8z5F1c7uTM82aLpZz3VAhm/eOu3vjB1mhOXXVfiu5iWejeXn/R95oAgDB06PizeIBT6pzh/qEhXuyEOiOSDR24mAF6vNM3u1U+qTpLkmjfvK8osugu6uUCDFRI3vLAhuapDsSGlOLqd3Mqn5SMuLe9VKfPazP5CMwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=05N7C1IQ; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736bf7eb149so4965727b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 07:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744814984; x=1745419784; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z4QsznB5oM+PFUpeHGZHhA5kq133G5m+shQoot4idWM=;
        b=05N7C1IQkolKD8jCAGUtZLBEnVR4fUb+kMLhP1N/XeU1pDwZqvbT3V0e6Cix8PpGgI
         Ub9GPunm9ZAHmBAgWzZRQnIOTfnovu/SvO45g5UQJQQE/QAxSi9j6x9jRPQ7aVLEbGtv
         UkglsdcVY2HxOsPK6yQfaH349+nMFABox9HoGtYEbe8TDaIZvNsga7TzDTrwLtqsr5wi
         bNSnxSyKVRj9nUt4k3KvWdiJWa7TbwaKRlpsgWvJZda+HRassRHNJPV5gn24W8cHotqw
         GUTtxJ+zRmcmcvQT9BZf0sGJeLzY+8uRRlhvsAbLjPhpPZCsJ56bdV0XoZ+b0Acfjky3
         iIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744814984; x=1745419784;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z4QsznB5oM+PFUpeHGZHhA5kq133G5m+shQoot4idWM=;
        b=XF6coO1F+J0cg8AL8WGfcHFsq5N9auo6HoMwPRPjhRX/Y9lmjAP8yXgl6vd/W9J/Zn
         mg5CLytbJ6BkIufBLw/HNTmEOQtHzwe7Qd5b1CXjZF8iOUHIhqBPSh+82C1xWsPyGlkB
         YBJHSnJiTVUou55ZZw7JHJGEXO+G5K7Kz83pnXEgiBg6unu55s8ij0uWe5i4cjdT/YVQ
         91YqCsd1hzWmQYigcUOFRW1lNciLKwVkPokyBC3lDKcmkxEJimUBS0IwfV2+bg+A2WGK
         CiiVau6HTUEKZuYTomGIxLwd4P3mZL7Js6gK+rXzctMn85SYJmFYIrQCWVD6Oh8cYjWg
         ihHA==
X-Gm-Message-State: AOJu0YwFWMZuYDcaGbulRw/lUpov8PyIRPcOq0P1PExcHXeYkYjZh7Ly
	+q6NZ1kTUEXBYnnCHrBzwTzMWankSUVVAZZtJlaZ8SnNXEQBuploe/n2Glr/GHZ4L27CIPJWgbZ
	EOdBSGXMuYBfnpQ==
X-Google-Smtp-Source: AGHT+IGjRPun4sEvM5OJ4M+Aysj70s9KHd7i9GdPhgft76VLdq628NC5EbLSluIzNS/rZGqQ/GdQ8mrvox1selc=
X-Received: from pghl16.prod.google.com ([2002:a63:f310:0:b0:af2:681:e27a])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6d8c:b0:1fe:6bbf:af22 with SMTP id adf61e73a8af0-203b3e6aff2mr3084464637.1.1744814984013;
 Wed, 16 Apr 2025 07:49:44 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:43:01 +0000
In-Reply-To: <20250416144917.16822-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416144917.16822-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416144917.16822-2-guanyulin@google.com>
Subject: [PATCH v12 1/4] usb: xhci-plat: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, sumit.garg@kernel.org, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Separate dev_pm_ops for different power events such as suspend, thaw,
and hibernation. This is crucial when xhci-plat driver needs to adapt
its behavior based on different power state changes.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/host/xhci-plat.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6dab142e7278..9843d3ad5cf4 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -453,7 +453,7 @@ void xhci_plat_remove(struct platform_device *dev)
 }
 EXPORT_SYMBOL_GPL(xhci_plat_remove);
 
-static int xhci_plat_suspend(struct device *dev)
+static int xhci_plat_suspend_common(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
@@ -481,6 +481,16 @@ static int xhci_plat_suspend(struct device *dev)
 	return 0;
 }
 
+static int xhci_plat_suspend(struct device *dev)
+{
+	return xhci_plat_suspend_common(dev);
+}
+
+static int xhci_plat_freeze(struct device *dev)
+{
+	return xhci_plat_suspend_common(dev);
+}
+
 static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
@@ -528,6 +538,11 @@ static int xhci_plat_resume(struct device *dev)
 	return xhci_plat_resume_common(dev, false);
 }
 
+static int xhci_plat_thaw(struct device *dev)
+{
+	return xhci_plat_resume_common(dev, false);
+}
+
 static int xhci_plat_restore(struct device *dev)
 {
 	return xhci_plat_resume_common(dev, true);
@@ -557,9 +572,9 @@ static int __maybe_unused xhci_plat_runtime_resume(struct device *dev)
 const struct dev_pm_ops xhci_plat_pm_ops = {
 	.suspend = pm_sleep_ptr(xhci_plat_suspend),
 	.resume = pm_sleep_ptr(xhci_plat_resume),
-	.freeze = pm_sleep_ptr(xhci_plat_suspend),
-	.thaw = pm_sleep_ptr(xhci_plat_resume),
-	.poweroff = pm_sleep_ptr(xhci_plat_suspend),
+	.freeze = pm_sleep_ptr(xhci_plat_freeze),
+	.thaw = pm_sleep_ptr(xhci_plat_thaw),
+	.poweroff = pm_sleep_ptr(xhci_plat_freeze),
 	.restore = pm_sleep_ptr(xhci_plat_restore),
 
 	SET_RUNTIME_PM_OPS(xhci_plat_runtime_suspend,
-- 
2.49.0.604.gff1f9ca942-goog



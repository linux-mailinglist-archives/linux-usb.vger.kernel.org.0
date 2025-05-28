Return-Path: <linux-usb+bounces-24352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D94EAC6538
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 11:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1AEA4A45AC
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 09:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D044B274FD5;
	Wed, 28 May 2025 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="na4J6OKs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A7F27466D
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 09:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423350; cv=none; b=iE25mODyAMq6il2RLdhM0bZQvkka5kBO11A0hDhQjzUPgJP7KXUc3uMjt+HMyPxeBg0MyMKnt4E2qTWEVEUrHxvWQgKY74V4gLAAXdv25wcwlTrtfO3IKKT9X8G4ZdqbyBNBPi8EDDwHiOdAEOJbggt25ooX+eNIEISBblt6zbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423350; c=relaxed/simple;
	bh=yiqxlEef6e6oha1pchQ2m2q9rAFOKYzae/zmvK1wqYI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SzM7r6e/HuLGDvyR5rq/+fAIrSo5KAoVuoJ+tgk42DME78md4ObtEfnPPL2NRLDD8R8MBVZw+0AvQpMR3FGfjtRmVZohvZYlDbvcF15OKI2W1okd6qLZCEoRxvPyg2pW/UdJ2uuRmUKq69O9Gzf8psFrJSyoIK2yFMLJ4d6xMB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=na4J6OKs; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2344f88f9easo25079375ad.3
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 02:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748423348; x=1749028148; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TcH4wQEDitg7iKswMVLenRvnR5FQWdp+kaJqj06aZvk=;
        b=na4J6OKsqMB8oA2bft+eP55kA60mob1TU4mqPIq+qhOyLA0w/oT4Qj/l2WTqhbRNgL
         Gg1lYeIIYY8SQgrUUkTi7V+HjSGtrIrrb96SIkKQjU3paf2MGeqQPNRgsEHcMDnJkzDS
         USVB6G06W0adHpbY44+V4GimjwnN0z30KBjIN44gfG7DNRhafh9G1kPSXDwYHAFWYOK3
         8yUmBlzVh3tmZnwhVXqsfp2ppKR0KlYMQOpY2h5Flm3cfUdT9x882IKW9oK85j/JGDyf
         SlGjV0l2qUzTtj51I+ZOwwUHYTNZ4AFifskYaMp02itwL/qMNSVUKgMiSR1CwBsUEZ9n
         TpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748423348; x=1749028148;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcH4wQEDitg7iKswMVLenRvnR5FQWdp+kaJqj06aZvk=;
        b=t2ICJPzFXAXtcmldjvIxyZ3r/Id+ASEfMbCcyRUk8BnfvQu+CJIXmWg2ykc4VOVr6Q
         OsLWxgVgALr0GXY6SifdzDH+IiygCNaldTAnFQf4ACeilz17Zn6uqXZitS/53eySaxAB
         /W+iJZx8iOrOXeVPT6U5qed6T5TzTVE7ISXpDh2KRK+q5wOLddQTPSIX9w5awWSWCtiG
         2GOiIM6D6hiibTPAn+3q/R+ClrOtDVYLw7+VKUafsfpIu7qpc9NZO1DvpQ871LAdm/I0
         ruFJQiDzxQlFNfdrII3eZLMbQpgGjuO94etvI4h/GRIpUVnInrlsSwriJqSpntLp7XJm
         hXkw==
X-Gm-Message-State: AOJu0YwqrreQbc4rKoE3x60o3fxTZ7XWV8c88oduGWbITtIvpZ+YSIVI
	f83WLvzzIA9ae1inZsiAM/tiC5gLMFD9Z5XVtar6/VTfQjJNzjktvRuplfDYtKR6ITOub8d5xQV
	Z9pNvYUhC5vyi6zA2hQ==
X-Google-Smtp-Source: AGHT+IH+Sq62F/bY1S8bL8pzuwSaysSESeNWCQygopA9Z8I3D+IHWKzwUJfPC9+GkMueR/1jmMaoWl6hpYoz05g=
X-Received: from pllg6.prod.google.com ([2002:a17:902:7406:b0:234:aaa9:fcd1])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d490:b0:234:aa9a:9e0f with SMTP id d9443c01a7336-234aa9a9e76mr62606355ad.23.1748423348157;
 Wed, 28 May 2025 02:09:08 -0700 (PDT)
Date: Wed, 28 May 2025 09:04:06 +0000
In-Reply-To: <20250528090849.2095085-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250528090849.2095085-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250528090849.2095085-2-guanyulin@google.com>
Subject: [PATCH v13 1/4] usb: xhci-plat: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org
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
2.49.0.1164.gab81da1b16-goog



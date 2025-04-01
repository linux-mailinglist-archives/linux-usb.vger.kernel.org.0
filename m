Return-Path: <linux-usb+bounces-22405-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3B9A7747F
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 08:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9345A16AD3E
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 06:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002D71E25F8;
	Tue,  1 Apr 2025 06:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GjjG+jin"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D3D19D8AC
	for <linux-usb@vger.kernel.org>; Tue,  1 Apr 2025 06:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743489017; cv=none; b=H0XXZJiwLcGU9HRYQPz3I28NYnIRacrlyeL18q5gTdYDrEWbbns2qBzrAGWTO9soMQ5lGaweBrwoFYbLfc4w5ql4+PgdwJwdYfC+5FXbzA8dWVANCHM0oqupbVhEhuiTJ3Z3OIjewNNoiOjXjxMw2kYvMxyx02NFkqP50mU03rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743489017; c=relaxed/simple;
	bh=GC8luflfFudrWld/AM+Ewt6IdxJJ4dn/4qVZvzzuEV4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TD4QctHte77pgvaRvrprJofsgM9HiQE6PxGksp5Sky2rgKSBWZOwvryqVJ7DbCNsCEKnZ0Mgb74gY+bpoXIT1cDsOFfV6cHgevaTHApQwI8mO2ejK2hILE8Xs0eE8Mb0m+8l1Ijv6Irbgsqm7WI7BTAU/llx+5xF7w/xaPwLKso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GjjG+jin; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-227ed471999so84130645ad.3
        for <linux-usb@vger.kernel.org>; Mon, 31 Mar 2025 23:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743489015; x=1744093815; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G82tJsCWDISryXifn89lTAl+ld89TBbEQgTjv+aZOMU=;
        b=GjjG+jinxfMRctJUnlY1gN0XBeWH4LR2Cvvk6oBRE4CYO36dgXlbVrZqWXbwhrOXlX
         VeQSryjuIgLyFabAMKo6GVGfduXD1yOP338C4B2KMNPS4XEvp0cfzUdnFhxuv1fLfJcn
         Xflw1awjOUHzN4OQnLx9qo7yagta0KiFVAHoH0s5YDTYFYmlhTnVVDsSbU5OQkyuXi6S
         J5LxvhFiLDHHS0bdabyju8JgoFZ0W3eZMkUQ5is7RWTySTLBig8dqXc+byeoOe+YCM6H
         wQbSkEuRT5vDQt+SKlxGifVd9sZCtN1q+NzwHAND/q6kmQnz8PWlwv/UvuP9jD/OT//h
         70Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743489015; x=1744093815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G82tJsCWDISryXifn89lTAl+ld89TBbEQgTjv+aZOMU=;
        b=IKO1caOptx3jKkuJFMAurhcrSGNI+/XUOwUi9sxkZeIfIfv3+VC7Bh852oO4NEzs3y
         An7SIO547qqA2kiidAW2xVZt76p+xjyXxYCbA7LH4RIe9elM32ByULDgNY9OCuglGA5w
         SFh0eLhqxVecLNta0bZcr8qJzIno02bpQGCDon2QzFbWn0qPEVI9mWr2jLZAyTEP6mmt
         CIS7vzC8aCEqlk6N9SQGvDzdCbndiJSZCe+MWRBGPfnBKos4Zieb+kZe12t/ounjbUwo
         4a52jRdayC9g2AnYKfG9+ybHlZmbVSo9hlrGbygLSYFmuG3QBVAwfcaIov4MJMBw4jRm
         1S5Q==
X-Gm-Message-State: AOJu0YziyLLtzhqRNE3gD+9dyISF3QAQuPYOqsB6wJr3qQnFFAmBOWsd
	Wt2Nwtb1y9jodW17OjYisg3qC0dW3tihd95DhAn5oRMLxiAfNb3kF7mzraum/EpIxKm99CmqWrv
	wu3gI28vjyPfyuw==
X-Google-Smtp-Source: AGHT+IGDn4p5Vlq4+h8UmJK0+M+KvQbP0/FDSg7s54pu1Ji+HBQ1kRiqrn+pptQTrbAOX27/AgCloGelERbtwkE=
X-Received: from plbm1.prod.google.com ([2002:a17:902:d181:b0:223:2747:3d22])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e892:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-2295be92d96mr24970385ad.23.1743489015611;
 Mon, 31 Mar 2025 23:30:15 -0700 (PDT)
Date: Tue,  1 Apr 2025 06:22:39 +0000
In-Reply-To: <20250401062951.3180871-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401062951.3180871-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401062951.3180871-2-guanyulin@google.com>
Subject: [PATCH v10 1/4] usb: xhci-plat: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, sumit.garg@kernel.org, kekrby@gmail.com, 
	jeff.johnson@oss.qualcomm.com, elder@kernel.org, quic_zijuhu@quicinc.com, 
	ben@decadent.org.uk
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
2.49.0.472.ge94155a9ec-goog



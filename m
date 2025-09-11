Return-Path: <linux-usb+bounces-27951-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE5FB5351B
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 16:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 220831CC0313
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 14:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836DE338F3B;
	Thu, 11 Sep 2025 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zup7xF4Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12FA32A803
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757600473; cv=none; b=VBkBdrN6w4GbYUFoIwMYwLLM50VEGvGzXoy8dyCS4HRFMVFQ3c0qafCRcCPk99Z4eIoA3zkTgQtJI/dUH3aWK9MCu9baKuoF4rqEwBtPgaIP5+0t8kkgS1giEV5a97A64LYqV7TLXZVd4mYKQ5jmfNoJvrYxMhw/42DTX8GgCWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757600473; c=relaxed/simple;
	bh=faJE+cTueXsphf9F2YTETRq7iQrxqJIPSY5Wh3BTBzY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XDrXXGOmxcVe++gjZXdr/bmomRE1Aw76qsG0khl4NkaagoD7x9jbgQMRVc66dzKK3lcLxjtf5flhAtCUXvTyhT1Y4cQyQRwWhGKMjzXoyE6IlJc+ISKqOo+VYm9bnet2K0IFf362Bbb3CARI1IrHogUS0ij7iB/Er+Iufax2MPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zup7xF4Q; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-77283b2b5f7so1405441b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757600471; x=1758205271; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=di9vlGGwM3+bJg1YPMe3g5gvCbV0sk+DG/t3kCN+JkE=;
        b=zup7xF4QMFeplfJCe42tIwLdzE52Ge0PA/59veXAquSw5GgWEd1w4F3WK69SsyEjwo
         9LrROVzpMsF8dqU31smPQNRERvmxkngrAcbF26iZvLL+T17lBLx7p4Cy+6rVlVcsTW/b
         JUN5XcKKji06mRvVd5Qofqq2t+xLPpsTHyMBkK1ElM6EqXVKCJiGnMcNbu0HJGYji4nF
         oh7rOJMwH4I554VvZIgAcHjGg9u3J3beQIYRrNrzjozRevz4RGixTDzDKYbiqmsxSGkY
         C/QDQeqg1tF22a4tIyxxzqQBZThRI3wUPtTfqzwlSvET18IrrRXZlXaiRGC6ma2R3z7u
         pOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757600471; x=1758205271;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=di9vlGGwM3+bJg1YPMe3g5gvCbV0sk+DG/t3kCN+JkE=;
        b=pi7AdVhDAMShhS/fIouSnyiFOm2qqh+5YBWVtEmD/4XaPiKj5qkrX1EOmAC88VW+Oz
         OO9waxGrneD3vwRGliqRW5CHeq3els+LXnuVJxOOoAuvnCNlo/kmmEfgERgkoOHokj79
         /rWukXNJeQr+1Jd80UFDq7QPTl+m7lQkX0T1bwh485jpf02jFNOiKqnlo4azQsuG/jtg
         OsUe3ldVffmRF82RTJIZV9p+qsywh2yY/9qzNgRNU4ZdiZlsxsZLwS2EkinKomRbnzh2
         6Qk7SsAu3RCQz2+fp5b0UkIoHSidUqD7kjjpP9c0D/RRfY9HV9mNw+qIpE8z4kUSEOpm
         FrAw==
X-Gm-Message-State: AOJu0YxMKHg8IedcnH3LmgptY/lp8KzJpYk0PUB8PH7vcgcTpgWhWf9A
	Lt4sv+NnmhBAQot+03pJg7qQCwDElhcDBmqe/tDtSAzvS0H5QoRkKECO26zU0D0QrwnE8pdmP4n
	tMk3R/Qqf6ZFNRDpW+A==
X-Google-Smtp-Source: AGHT+IEDuORbCh7ohTP+tivq97Pf4Ap22u0st5ArBD+NLXFiMsoCRDqV5AuP+Csi9xEgcunezW7ghFIJ8zClIOU=
X-Received: from pgew14.prod.google.com ([2002:a63:af0e:0:b0:b4c:5356:a130])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:210b:b0:251:1b8c:5643 with SMTP id adf61e73a8af0-253466eca6amr27762178637.50.1757600470961;
 Thu, 11 Sep 2025 07:21:10 -0700 (PDT)
Date: Thu, 11 Sep 2025 14:20:13 +0000
In-Reply-To: <20250911142051.90822-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250911142051.90822-1-guanyulin@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250911142051.90822-2-guanyulin@google.com>
Subject: [PATCH v16 1/4] usb: xhci-plat: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, hannelotta@gmail.com, 
	zijun.hu@oss.qualcomm.com, xu.yang_2@nxp.com, stern@rowland.harvard.edu, 
	andriy.shevchenko@linux.intel.com, amardeep.rai@intel.com, 
	dominique.martinet@atmark-techno.com, quic_wcheng@quicinc.com, 
	sakari.ailus@linux.intel.com, dh10.jung@samsung.com
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
index 5eb51797de32..df2e942ad5f7 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -454,7 +454,7 @@ void xhci_plat_remove(struct platform_device *dev)
 }
 EXPORT_SYMBOL_GPL(xhci_plat_remove);
 
-static int xhci_plat_suspend(struct device *dev)
+static int xhci_plat_suspend_common(struct device *dev)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
@@ -482,6 +482,16 @@ static int xhci_plat_suspend(struct device *dev)
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
@@ -529,6 +539,11 @@ static int xhci_plat_resume(struct device *dev)
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
@@ -558,9 +573,9 @@ static int __maybe_unused xhci_plat_runtime_resume(struct device *dev)
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
2.51.0.384.g4c02a37b29-goog



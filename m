Return-Path: <linux-usb+bounces-19409-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D217A13B5D
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 14:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7BE91882CB6
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 13:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9381922B5B7;
	Thu, 16 Jan 2025 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tG72xwNg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08F022B8AA
	for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737035676; cv=none; b=Jqyzl4T0cqHGbYw+Oivo/1gy3dGbHf8QkkxXvQBMZKVacfQc5ughEBtkzSPvWwcb68vwgje/3fUaE22wtaerwWG7stsZB8Uv5cP4PjY8CY/LSzrR/ib4Xk6+SPQF6G0glz9S7gYX3mrHQUe22K3PhJ42PVFIUNsTcioN9n/k9fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737035676; c=relaxed/simple;
	bh=0NycYGu5HX5HIzAcJbBdr0cNDobK1Lk+gWnlktNiraE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HxZGFUZzwWIkKaS9p9GGH3hTeKRCdg4v03L4syUKm2/qGuV/zGAz/ugxnsgsbSz4luYcIjpBibeYVRER0SBlzO0XlnYp9+bbukYBpLdwPae3VY4rjAIRu7n36Jy8UzmFlw+lwUY7ZR2H/BwQrZAAI9csfKUm1q1ZLO8KJOseSEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tG72xwNg; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21631cbf87dso19336095ad.3
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 05:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737035674; x=1737640474; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RCJkWTokxKqqVc3PnxwU+b4mjlCy0+MI0S9WquV+jXU=;
        b=tG72xwNgpCNUc77WEbnoHqP/PsDRN6jp32u3HWgMpEOtpX6g71Q0y+qrfBoPnMKBZt
         zfqkbbmgMYV+GosaHNrPOwOos3gNVoRhAJlFfS9suIoCzdr6kpUeZ9MrRPhMFs71R2aY
         3WrG4PDdYmxXmMyZcC/kjH2N+M3X/H6uIGGlZYSYCmn+nL3MS5dWkku7s4LDBEjfH8vj
         0/RmEE2XA8a0xiN4ixfEulae+C1huonY40hKamPRidJetDiEa3YIBSyCsjFn4FOsFZ5+
         s33ssgPgsRFsYd/ugGJuFsQ7c5F+DhPvymZ3Oi/euJ4mBYZAz9hzjdOF8AF8x9ErNbqh
         pdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737035674; x=1737640474;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCJkWTokxKqqVc3PnxwU+b4mjlCy0+MI0S9WquV+jXU=;
        b=tVFzZsT9ieRorUnLQAbbZBDzNUWim2lrCG0CGYvjTvAusgvA6y3lGtneYyaZG8H2y8
         THKT2q9yFWWyBDV8yEkUtjQ4/jei6TnvgnNmhfoUR59dumrsGUVNhhS8IYK/V67LNwFF
         PmqatChkCiim72ejqsNQJzHBUOt1GD/5Hd2RKrtFa4SHQQr+2SRWyjkJaUE/mHXwewqV
         scIVvpbd8D4zWo+nLt4zP1GK61G2+/dSImvcY5pjc3d23RT3wqFX4BYcr9xchLAteiVa
         /bejVBitSqjfS61OCgIs/3zOdak6Pmnons/Yex5qfubh0WZbUntu5eCYaNZFudNKGEnp
         3+/Q==
X-Gm-Message-State: AOJu0Yx/JYXsDFJNiSnBUsP5nZMoYajC83a+SqnovDZHvepdfGuZ6wXu
	8qsunHijE3pywMT85bhlzOU89ZzLfon9sV423Lq748+UKlF3aXpU/u99xBMnQ8BADsu0egH3hXD
	MK1RJVuhLFwNlpg==
X-Google-Smtp-Source: AGHT+IEkH31TPDocapE0PpSLmzIIe3ly9TWrLnZP68uAj+iMOBcC23frOUBvtBRsh3pTGeGl/9K/82zsf9tEAEw=
X-Received: from pgvi5.prod.google.com ([2002:a65:61a5:0:b0:7fd:558c:c660])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:840a:b0:1e3:e77d:1431 with SMTP id adf61e73a8af0-1e88d10ccbbmr53259101637.23.1737035673983;
 Thu, 16 Jan 2025 05:54:33 -0800 (PST)
Date: Thu, 16 Jan 2025 13:50:14 +0000
In-Reply-To: <20250116135358.2335615-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250116135358.2335615-1-guanyulin@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250116135358.2335615-3-guanyulin@google.com>
Subject: [PATCH v8 2/5] usb: xhci-plat: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Separate dev_pm_ops for different power events such as suspend, thaw,
and hibernation. This is crucial when xhci-plat driver needs to adapt
its behavior based on different power state changes.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/host/xhci-plat.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3acdbbd9aea3..b676d4dbcec1 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -450,7 +450,7 @@ void xhci_plat_remove(struct platform_device *dev)
 }
 EXPORT_SYMBOL_GPL(xhci_plat_remove);
 
-static int xhci_plat_suspend(struct device *dev)
+static int xhci_plat_suspend_common(struct device *dev, struct pm_message pmsg)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
@@ -478,6 +478,21 @@ static int xhci_plat_suspend(struct device *dev)
 	return 0;
 }
 
+static int xhci_plat_suspend(struct device *dev)
+{
+	return xhci_plat_suspend_common(dev, PMSG_SUSPEND);
+}
+
+static int xhci_plat_freeze(struct device *dev)
+{
+	return xhci_plat_suspend_common(dev, PMSG_FREEZE);
+}
+
+static int xhci_plat_poweroff(struct device *dev)
+{
+	return xhci_plat_suspend_common(dev, PMSG_HIBERNATE);
+}
+
 static int xhci_plat_resume_common(struct device *dev, struct pm_message pmsg)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
@@ -524,6 +539,11 @@ static int xhci_plat_resume(struct device *dev)
 	return xhci_plat_resume_common(dev, PMSG_RESUME);
 }
 
+static int xhci_plat_thaw(struct device *dev)
+{
+	return xhci_plat_resume_common(dev, PMSG_THAW);
+}
+
 static int xhci_plat_restore(struct device *dev)
 {
 	return xhci_plat_resume_common(dev, PMSG_RESTORE);
@@ -553,9 +573,9 @@ static int __maybe_unused xhci_plat_runtime_resume(struct device *dev)
 const struct dev_pm_ops xhci_plat_pm_ops = {
 	.suspend = pm_sleep_ptr(xhci_plat_suspend),
 	.resume = pm_sleep_ptr(xhci_plat_resume),
-	.freeze = pm_sleep_ptr(xhci_plat_suspend),
-	.thaw = pm_sleep_ptr(xhci_plat_resume),
-	.poweroff = pm_sleep_ptr(xhci_plat_suspend),
+	.freeze = pm_sleep_ptr(xhci_plat_freeze),
+	.thaw = pm_sleep_ptr(xhci_plat_thaw),
+	.poweroff = pm_sleep_ptr(xhci_plat_poweroff),
 	.restore = pm_sleep_ptr(xhci_plat_restore),
 
 	SET_RUNTIME_PM_OPS(xhci_plat_runtime_suspend,
-- 
2.48.0.rc2.279.g1de40edade-goog



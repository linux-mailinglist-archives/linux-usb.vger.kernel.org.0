Return-Path: <linux-usb+bounces-19153-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE921A06C8C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 04:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B5A2188999A
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 03:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD7918132A;
	Thu,  9 Jan 2025 03:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FsCXlOsc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF09154C05
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 03:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736395006; cv=none; b=ewR7XyZCmNQJSi0MTzFGqbLPynV3CFmrk4K5ibClQotyhMMrpJhBtQJme1wDG97j9v/lY+IfEwzWSMr8WuGmRCWVhi13FTtmEz6OG61wDTbBqIM79urmJaYjjekJGK0UeSGytOilDsTRDkxKSsafy+02/1+tVvSv/TSWz6llQEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736395006; c=relaxed/simple;
	bh=U8jc42PW7/ktoftpSHk8MRrsiNyFroAZ122yKoykeWk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dx2QGABSREHLvA8kHLU4s4Kg7Uruz5LTreSLaPNMMmNFstf7HgsywyR4q+DyJLbSRyW98Swr2cWB2l0X41j69tjQ76H8TDzgpMhRAjaxSQ31vFxPsIgLPlgorLgV938PkFWP0HLxYG/QHstQiwK5NiEfKC+N/j8C1GVNu6XEOHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FsCXlOsc; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2164861e1feso7315975ad.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2025 19:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736395004; x=1736999804; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kLfOoQDnujr5A1F2r70MA5lfjVLn4qtfns7H9XAvRjU=;
        b=FsCXlOscOAAOE66PSUT71F7aMzd0jILLTAlrO3XI4vKV4sDpqmoQcdH+r/iXKdt5me
         STuRQ4pLHDhwebDpOiSwMpG5V4Mfu1KDwUBDzUrQAfRzYdTnnHnquHdrNY5LASX2xQLO
         JlVPruqY4j8f0mRgEY3jtR7pHXnjLeqblIQVmbbpIzoJ4vDZhJGiPEXFJIBrd1TrE0d2
         w/6Rg7AlF0A+SftpR9/SMuzxci1zZNahofP0Zzp0OihusG588ClSJAdsOU0jb6HnAKeu
         zKWyCi5bVoChQOFrsO/LZOGMyBkWM55iaujmk74oY8RsIHOuKiKXCdyNn8oHC4t7h7nd
         9TjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736395004; x=1736999804;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLfOoQDnujr5A1F2r70MA5lfjVLn4qtfns7H9XAvRjU=;
        b=hV9xz5URcOxMv3e7jiqPq2zMuA9uJLjBxm5apd1RLct6lHXKd5t/ewM1imrB5QqJK6
         i66h5IhEVCXKusL6+M+uqPZ06btWR89BAzI8AMTKs5PANMXp91zGqVkIvBlYR0K4HD8h
         nGBJXUiFaY/hz+NxPlbeR0QdIOmbw0I1RcqddKKszgi8vyliJ/9nwSOf6rAqBBZlPw6o
         nq2rimRpS4pCNzBVwc3lfTQSTQCd6PirnrhFoeKbClwPTvri7pto0fNBMItXL4CF7zEN
         L/hefgZjrzUGQVescfmwwSA5zv+8yIzZ+epMVHK2fAoKPYFfT8bo1bilglFREfBgguWP
         bmnw==
X-Gm-Message-State: AOJu0YymVW5UyDARdeEP0IFht8kYNbWauq4Yfwrep+IGia14zNbRgNFi
	og8rMjgy7PTY8XAg1pxV6a7N18TXpVzlzoaDbo6XsVy4KOZ/Fzn6qR/o8MwAyrL61RQxe5ysu2q
	U0n9Wk/pp5MDW8Q==
X-Google-Smtp-Source: AGHT+IHGWPQ97evR6CX9zmw6SJkm14AscRbwGnyXik8xyoj2Fb/TGu2ud6/l7gVV23yEO+9v9zzFyVQSJlVKoKg=
X-Received: from pgg14.prod.google.com ([2002:a05:6a02:4d8e:b0:845:b983:9e34])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:101a:b0:1e1:aba4:2095 with SMTP id adf61e73a8af0-1e88d0bb4bfmr10227278637.32.1736395004396;
 Wed, 08 Jan 2025 19:56:44 -0800 (PST)
Date: Thu,  9 Jan 2025 03:55:06 +0000
In-Reply-To: <20250109035605.1486717-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109035605.1486717-1-guanyulin@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109035605.1486717-3-guanyulin@google.com>
Subject: [PATCH v7 2/5] usb: xhci-plat: separate dev_pm_ops for each pm_event
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
2.47.1.613.gc27f4b7a9f-goog



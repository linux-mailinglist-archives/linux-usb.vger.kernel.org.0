Return-Path: <linux-usb+bounces-16177-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AC699C479
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 10:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C5D1C213EA
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 08:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B243F159596;
	Mon, 14 Oct 2024 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A6h32L9y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC53215748A
	for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 08:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896325; cv=none; b=NmRcSSBVN9IOL2UDzglxrTjT2HyAV6Bfbu0vypfSEbEfeYc0PiZE8lUr56NWtzuipBHQfmcko+D5LpS2mJqb8BqUnkm1m5BKaRZz9sdtKmqrfX7LEn5NZ/AtudPKnPTFLnOQnQnVshTXDpZFyxEWiVvH8bM/zyCurZ5AtAjdcKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896325; c=relaxed/simple;
	bh=2lp7pWa+Y9Lda05LwotKzYc/laDTaan9URjSvGwxaaI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iU+Xy465x37aQpGOQF/tMJoolltulZGFN6hbEzlBFjG6bmikr452mcwWr9aRvrj5msuJvCPjA39xv1SSdo1/r+JFZlR5v3bmxA8NppwUCRYI1OKNmbr0HKwcij2RRcjPTlzvt4OhUDCwJZMVJobz7iKUncUc9RnIMuR+fIDj53I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A6h32L9y; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e35199eb2bso37343297b3.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 01:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728896323; x=1729501123; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QbiVbUE4n2QmVYqe4n4Co2Ibt4J5qV8FN5F6a1txb10=;
        b=A6h32L9yC8ytugPzN5dK+Dq7bIFrJOLY6W14oSM2KuOYXcv6M0m0AOCdsnJQfUqLct
         WDJHvYHEU638lSbSrVnQ1OpLS9fevWK3lvhgazF0Wp9Cuk2kHaU3ykmMg9AiILxVXzhd
         zulCkrENajD66ZmohMQ6b//2ezl0Zc9SXqSVnP7ZyWQcMCKiAt4rTXymfROEfNDBYj0v
         3GWGX/dIH4LSc5QecX432xi8tHa4Ri7JN4IKqP/byJww4bKF37sjd1Yd/TA9iW7QzSlL
         pduRm34h+QE28i3l+Cn6LlKFv5Y3M5jdQ8m2kakJVBN8V54HuqGrdNZDh60TvWwWFxkK
         qt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896323; x=1729501123;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbiVbUE4n2QmVYqe4n4Co2Ibt4J5qV8FN5F6a1txb10=;
        b=IWfgwp7E6CfH2vlUsUx/4HL9imqKE4IxcWFiMMJuEA2KN2A1M8QbjUXtW4UZpSZyEt
         Wbd2fPmwL/jjLoWWTS7Kl/SjKp7XZnH639X0SmWCahd+fbfIn+d03s9ZSDP503uQimvU
         LkVluPRMy56rJpXkz/phBV9jJPlKodwSkX7SfLWnMTsMdhgEGZQC9rOaj7lx0EB12FGL
         wNjrALBlDk8doPW4HmrLQNNrppm0XixHPxEN8Y2N4HQPGs+jSCgfMy8kIuNNo7IpHDuc
         Rvj4G2Z5dxH5qgwvlbB0R3ObgsBW4ClzU+DVImRbQrF4mEk411NXlpD0RlwHO8A8Ix8f
         OE+A==
X-Gm-Message-State: AOJu0YwLq4C1/lTQBhvagBGz7GrJrhZTe0nA8JKrUF3txslyoMu1+L4u
	nl+ZyVLV9G+4sHPMTi4vg03IQQ4/tRIH466A5E58kl2nb2oF3CI4Ag1VJ+G8ZIK34MDOL8Ngw0M
	8CzLNx30ZT0Bl2A==
X-Google-Smtp-Source: AGHT+IE/5EOgs1bQNwKCDuXAlvqCP9BqZx0Xs7qoml7G+FtAvsXrY1GIN+Lb4ymiqx+wllbQf0cGzNfuJtzOSng=
X-Received: from guanyulin.c.googlers.com ([fda3:e722:ac3:cc00:131:cd17:ac11:19c7])
 (user=guanyulin job=sendgmr) by 2002:a05:690c:2b83:b0:62c:f976:a763 with SMTP
 id 00721157ae682-6e3477b6b5bmr908487b3.1.1728896322306; Mon, 14 Oct 2024
 01:58:42 -0700 (PDT)
Date: Mon, 14 Oct 2024 08:50:26 +0000
In-Reply-To: <20241014085816.1401364-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241014085816.1401364-1-guanyulin@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241014085816.1401364-3-guanyulin@google.com>
Subject: [PATCH v5 2/5] usb: xhci-plat: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, yajun.deng@linux.dev, 
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	dianders@chromium.org, perex@perex.cz, tiwai@suse.com, niko.mauno@vaisala.com, 
	andreyknvl@gmail.com, christophe.jaillet@wanadoo.fr, tj@kernel.org, 
	stanley_chang@realtek.com, quic_jjohnson@quicinc.com, ricardo@marliere.net
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, badhri@google.com, albertccwang@google.com, 
	quic_wcheng@quicinc.com, pumahsu@google.com, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Separate dev_pm_ops for different power events such as suspend, thaw,
and hibernation. This is crucial when xhci-plat driver needs to adapt
its behavior based on different power state changes.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/host/xhci-plat.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 8dc23812b204..6e49ef1908eb 100644
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
2.47.0.rc1.288.g06298d1525-goog



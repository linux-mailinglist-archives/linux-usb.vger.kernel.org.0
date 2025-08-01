Return-Path: <linux-usb+bounces-26300-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE1BB17B74
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 05:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 360BF3B7D10
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 03:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A67191493;
	Fri,  1 Aug 2025 03:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hYTY44ZO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF66717BEBF
	for <linux-usb@vger.kernel.org>; Fri,  1 Aug 2025 03:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754019638; cv=none; b=b2ey+uxhiWBH4Mz4Y0Wq63bPWfczAKNFdfab2T3Jolh/Uxwja00quNrA0IZgggmXsy/bRKX9yF4F2HPXHscfx9dDR9OUGQ0FlD3KsqCJmP/gdV6BhbQt6cOrIn5SZ1jQAK5kQANJjjnGg6DM/RUlKB2w3iSQNqmj4ThtK6zdCNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754019638; c=relaxed/simple;
	bh=qw/l+oOIaR35sp4DSrzqYgEX/oL/BUhtqCC1TeZTTIw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S6JU5O1HIrtv7QC/B2TEEHqyuD/KvZ4s5JFMuAnlCgYGAZIttFcKB47O5EX76o5YUwhiRRLwUVd/7hxl2rVk0AJcVN330b8GqnEQ1sroR6kjFQKJf7fURxMCsZOZVr8pxailoag63ifRTp8V3rBf2mCeSMzglFnMTHtVzJxyfKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hYTY44ZO; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-76bcfe2a8a4so1306132b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 20:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754019636; x=1754624436; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/wA8zWj3IHi5EGjxZe0hAzAqxv/u+HvHJFN6V2LV+9w=;
        b=hYTY44ZOOb16MU8qleS0Lo/G/8Us5GtWBy0FfIn0yeFp5GWgZmdY6m11/yxZxzNObv
         UxJvU+5+Kb9fID4Maci+/Etfs6BMzOMAQNMBj7vVYx4jxo+l/TM53tqA1USfPwQ3Pnmr
         ZMa2sF/LELZ/pA5EmbYRLkMDvhVkl40Fd8jA5pEZkb9uaxuhK8SPp3QmxX9x15ntj2SH
         OWbMhB6JuajSTHG4jADcbw1XMOTxZ7sgxEhZAh1gdeOoT3xI1ebSZe8zwbsuOri79Q98
         pcGGHZfSVA0cm5gqZad996DcMNKn+r5aK1fskOGNRU903Px4v1b1rXg6Gpr7xrqjdv1A
         Y/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754019636; x=1754624436;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/wA8zWj3IHi5EGjxZe0hAzAqxv/u+HvHJFN6V2LV+9w=;
        b=e78oQ2YP1EX7ZjAiy9mtNoOw255dvXTqijdQlSwJKdTfY9gA26GfwaQqhhew8BEng4
         gE3nEEfrcPfd0uSSGTt4xuBtUOeeWoPWHhhwJ9A9r89uNAC1GwC+OHzDcjlbFL/kvNVZ
         FgwenGMoKiD1dvGq9sjLYbKEoexalMxvlig1mTsItlx2lCNei9QM869fPwEUF9Vqn4gE
         h+sGUUzOruPTaA9DZXUIUawxyHMtroPtBLUW8hxB2Owte2JLdEQL2oFH+BtTWySJ7HC1
         JC8PISj0jyTDRDA+6C/0vlxggrARM24HTLgPwkz/6wgmJO+zVPMA+M1Bw0clWtDzlwBu
         JW+w==
X-Gm-Message-State: AOJu0Yy+USPGBo03dFT5sUop/tp5pxQV8/WX1cg/wi/58MJ3MMEANBB2
	F5a5jWygkIuONbaTHf4lDSJ6gL/It911n/EK3Ma1fjje1TRcCKB2kgJborHzRUpeTnzlryvx/KT
	3DOLF3K7OXwatd6NfTA==
X-Google-Smtp-Source: AGHT+IE7ZYE2G78VMvgr7QyQY3UGFoBv6nWkO+JYjwWdIf2eRZA8qO2YgC01bcZhcgqpeVje8R/Z5rh7HqE6ikg=
X-Received: from pfjw10.prod.google.com ([2002:aa7:9a0a:0:b0:748:fb38:1909])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:114a:b0:759:5208:59e with SMTP id d2e1a72fcca58-76ab0f21102mr14128350b3a.7.1754019635948;
 Thu, 31 Jul 2025 20:40:35 -0700 (PDT)
Date: Fri,  1 Aug 2025 03:39:30 +0000
In-Reply-To: <20250801034004.3314737-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250801034004.3314737-1-guanyulin@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250801034004.3314737-2-guanyulin@google.com>
Subject: [PATCH v15 1/4] usb: xhci-plat: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, hannelotta@gmail.com, 
	zijun.hu@oss.qualcomm.com, xu.yang_2@nxp.com, stern@rowland.harvard.edu, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	dh10.jung@samsung.com
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
2.50.1.565.gc32cd1483b-goog



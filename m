Return-Path: <linux-usb+bounces-19499-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B3DA15238
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 15:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E73D7A5894
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 14:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723BF18A92D;
	Fri, 17 Jan 2025 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sB/QKbVX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D2F18A6D4
	for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 14:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737125576; cv=none; b=h2pZy7xU1bu+mz5RJe9DmHXRZJ5OfMqKknCAcIf7Etc4cwI7AIxGaR5HheL5TMq2FKbJa+69BgJQDkMY6B6tW77YvrhoxmdeIwJWGR9gyb5p9Pgk5dWoWbSXEg9JMTSClHtauWO/Yf8raw4wb97HMxQ3o1UjVXqkPu7KByzg3uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737125576; c=relaxed/simple;
	bh=0NycYGu5HX5HIzAcJbBdr0cNDobK1Lk+gWnlktNiraE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MArJKIvURFuvIz7zUQ9cbkCOkVEcOuJMa4xu8GYIC00y3ygb69puBuEg7ThKOB2Rcr1Uuv390MXGnwNzSwnfyce+j9UHCLgY3VPifm8DKEij8t/zPS5CXe0/m3TD2t0urmuqRXPwJK9tfptGnyXsE39WgXgYg40+uuo8ZvF4Hik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sB/QKbVX; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f2a9743093so4146239a91.3
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 06:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737125574; x=1737730374; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RCJkWTokxKqqVc3PnxwU+b4mjlCy0+MI0S9WquV+jXU=;
        b=sB/QKbVXk4qjJwAcUE2Vvh0eYv1aYM8FriI5YVyUjTdlCBccJ1t0eB5buSl1fp+fnB
         8rzvQnjm/zYenJ/a4TzeHB5Ml6pNGZ7CMdPJp59zOIRRv/8HATZ9SRo4cd2kAj10AtK2
         7TIi4UT1DNlfkUV7krUg7X/M01lwWUliuHyjIa8XVUMMdHEi4kzzCTFOFLFnfchYxEfr
         fvulf9okjcvpyAJmo9tlDtUFJh6jNpDZIMwRFHeG0B0A1K+vru66XXhjywsBQ2Nxw556
         Q+LrCCMxHn+7RgUOHQwyy6PNUlN1Epn5x4SXuIal0vQuwic6MLO0zGikqdwpwS1f+ISx
         k44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737125574; x=1737730374;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCJkWTokxKqqVc3PnxwU+b4mjlCy0+MI0S9WquV+jXU=;
        b=H5S2mmjHNbuOR/vdO7bAV4cqMmjp23+B5BcJruyw2eBM7PKb9LBDaLKBf6j5+g9FDZ
         4bR1NScihnlJ01F+cLdasEHwnlPIwCCEvHDSmyNRo7aFuS4bZs/HVabntxhueYIds+wu
         XGFW4ZFvS4qqnBCOGYkbBt695Y9tZdY6sE8vkjWHqtLMSCYJZxUlCPiguPO62AbuVo+t
         wsMc7D4NU2IebfJWs/gi92UtWAF4W8T5gmP4+9H6XEhjfkRCLV7CpIMqMAlzWbyjoHGY
         ZrQI2Md/GgWWYQvDT1STNn7gB7KpXvC16teJpr/HHtc/ncbl4tnH7TXPWvHF4nXY3G24
         ybSw==
X-Gm-Message-State: AOJu0YzJyhCkA1yaMQtdGouRiewXOnXJ/LACvygwX3+VdZdbMdRdCnUZ
	N/RMpOtO66DbIQ4YJlzrILlOkUCAfWi6As80HNOKJIs487YJo69vZ+oiDGnvPke5V2oTNLGPXT/
	C7wekNhSFS4I33A==
X-Google-Smtp-Source: AGHT+IFuJ5ng71y+Dmn+KpRUE/OoajnStDmKGLDO/wmhPEz4Oiiu3kTjumYtiZyjjRbDNDd1+9iHmhUypVehviU=
X-Received: from pjwx14.prod.google.com ([2002:a17:90a:c2ce:b0:2ef:d283:5089])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2c84:b0:2ee:9a82:5a93 with SMTP id 98e67ed59e1d1-2f782c94021mr4783109a91.14.1737125573912;
 Fri, 17 Jan 2025 06:52:53 -0800 (PST)
Date: Fri, 17 Jan 2025 14:48:02 +0000
In-Reply-To: <20250117145145.3093352-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250117145145.3093352-1-guanyulin@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117145145.3093352-3-guanyulin@google.com>
Subject: [PATCH v9 2/5] usb: xhci-plat: separate dev_pm_ops for each pm_event
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



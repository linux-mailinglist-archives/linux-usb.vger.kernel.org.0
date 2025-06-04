Return-Path: <linux-usb+bounces-24484-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C57ACD9AC
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 10:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAAC03A4A2C
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 08:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F3328BAB8;
	Wed,  4 Jun 2025 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t22toakM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09842690D4
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025519; cv=none; b=oYAl8rn/naLgkG6VjRza5VyO6vrNILQeRZQlxxB8wc7JoBxFnkBX/uQQ2aNZBo2zn0diKeJqndFEVcivcGj0vuESorOWjPJypjetsYmL9O7hOHC5NIs5T1IJZUdcyyh0X9I3oPdkifx7KGLqXrMJMnNXxVF5dBslJQj3xJNYZ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025519; c=relaxed/simple;
	bh=lzCHfDuCjDrpXiwNQJbgcvSMvP+ebiegCrnWjJNf42Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OdIbdXzPaMbDGoVC5Uz+eumKUHjDrd0A1Nc2sI8GrbE1kVSYzvo+v2loPjNIVaYQO2lWCBvyudEuwlYIy3ZzSDymFqMQcF4Njky+58Mr2qbm9il2GQtO57oGSlSyg4qV1/4d85e38njdlkmYPTYMEleVt94dfKNhT2/yTypLzC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t22toakM; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235e3f93687so4765285ad.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Jun 2025 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749025516; x=1749630316; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Co0ps7MHbpn7rkQnx+NzuLB263Q8VMNfFSEgEbirchY=;
        b=t22toakMy4g8wX+unEj2jk6cRZEGTTa4ICKc7Wlu6sVC6ZkJGR9J9wcC4+Nq9T3WE5
         4B4Kcp91unH95SxbB0vHRhmwWjieKT/bFc+dpBgLwUQP5lMq1VRhcYoOiupHkjfyWzlt
         rg1jn77TM8QIxtiNq0JLkcIdvWPBsgAYrAJ351t4sP8Flfusd2/BSO4MdPdjEFj7ILsw
         dNw4zKFYVy1h03fMSWVAi9rP1sUP+tFndGJENDtjJVD7afU2za8jeW+YtpyfdMZ+d/ij
         Q1hBIEBMo0tk75lIKjVD0RwZFoIFXJAJSJ6wB7iJlSbeDifHJOEpOokAtZME0Lzxm7Vo
         +B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025516; x=1749630316;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Co0ps7MHbpn7rkQnx+NzuLB263Q8VMNfFSEgEbirchY=;
        b=qYJcmzdAA/ZOze8190HIQBz7NgO32Y2YSgX3UIQLGyUF23s80so8mTi1Ngl9t4uGmL
         WMh1VZ/4F6rzswWe+X0mahuPSxuRwuWvNCSpGuQQkGfhPWxEDYhgqSCaQtoqgZ60i5/x
         yD+zYALBZ40Bablt2z3QrU2z/35kMKpVbLxt7Py/vQQCwfjK11y81PMGX+LVMTUXO7zG
         sYiudhfueKMlbn2g2SMSCMIgcTn3scB5r9Bs5ADE93KadwkHKGqlgdbKrsMKXljW/DHR
         c2Hu6U5uMCQTWl5VRUxi/e9ylK4E04IF13Zqo0Y6avJDQxXqNJiQiudWrnD2gILrclHE
         ExPg==
X-Gm-Message-State: AOJu0YxhP/xNCXJ4CrSMGUBeWfap/oMFriArNBpjcYprz/pvphpq2Rkm
	ojiTX3jJPi5i3QM03qxtiyfmpLoNxErZa0j5Q48wlTNh7PXe+MUGzjLEqqN1B3ZO1vQw7SXnYoE
	JK5mPT+f4v/uZsrloyA==
X-Google-Smtp-Source: AGHT+IHF+WdkmlHfIoDpmKOjojy+Vo27TfduueaHwdLb3sRf0zC8mqwDEEIa4Dg0gLrSbdKSr8+6UZJYgZWFrrc=
X-Received: from plje10.prod.google.com ([2002:a17:902:ed8a:b0:235:e89a:e839])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:240f:b0:234:d778:13fa with SMTP id d9443c01a7336-235e11ebd60mr27791485ad.26.1749025516040;
 Wed, 04 Jun 2025 01:25:16 -0700 (PDT)
Date: Wed,  4 Jun 2025 08:23:07 +0000
In-Reply-To: <20250604082449.2029156-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604082449.2029156-1-guanyulin@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250604082449.2029156-2-guanyulin@google.com>
Subject: [PATCH v14 1/4] usb: xhci-plat: separate dev_pm_ops for each pm_event
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	sumit.garg@kernel.org
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
2.49.0.1204.g71687c7c1d-goog



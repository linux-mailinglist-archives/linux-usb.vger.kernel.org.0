Return-Path: <linux-usb+bounces-19834-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C0CA21B58
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 11:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A371418875B3
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 10:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5EE1B87C8;
	Wed, 29 Jan 2025 10:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="df3QvIf7"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CFB1B042F;
	Wed, 29 Jan 2025 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738148185; cv=none; b=QIfEmPMk9iWWr3wkr/W9I9sW8LTEh3YX78xTYr0NJMlCuToZ9sNcn8m1VtKrP7OvCt6W62gRzjkj4CaX0fgpWtaIt7czIaD/AA2nc0ayRhXf9UE7DQu4qLzbQw59Z5sYEEOZ6Mhg4M3UwaqX34A1kPRgTdd9tS8cfiTcWGbyesQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738148185; c=relaxed/simple;
	bh=V0XfBjxVLe8TjT1SzH9ee/rLTeJX0xs4FJiLO3XaGYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tt54vx7kkExwPDWCm9RVgAMCvgCr+Sv5E6bkxBJavH870s+ScXJo56zjvIQRJl9d7gB0R3JsaLj4U3WtmJw0DGPonW9DvXhaO8OTFyVwVp+ruOzB8a1k0Vla00FK1X0aBIT0x3g+JUfeBankxQMjeC7DXnFBAUJEwQkUHDsci6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=df3QvIf7; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B85B1FF80C;
	Wed, 29 Jan 2025 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738148176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cqyXcYPn6o4khrIuGIfr97uJFzLfRYA+LGIhlGC/Grk=;
	b=df3QvIf7jdpEWAGdB8sqlbc2Q7FZMNm+aZjO3DXQa0NyKiQoQlz1pE6jI1EMNTDLYJiLYL
	gU9FPh27XEkvV/cvqsGQ1oAFS6/YcR98ZdCs6xmaM39aTpdvGVNEt0bIoZV1hNAQTJ3l4W
	hyiBckgH+5ZTz+MaCmSxQIbaqWBlV8f4uRsw4RpKvRro/14bSGGKRh0nvQs0Wn9177JRZ1
	JO9ikEyYCIp2FW/KZtAWYcogFdih/gX2Bd28zCB4MFXer2Rtd4Eu8fAqQR7kW71ZDODLk8
	/CikeWRw95LE67N6KIiqkBFopfCwRy+HqfoA0aXv4A09hODwtPi5X+5LbWEHRQ==
From: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
To: theo.lebrun@bootlin.com,
	mathias.nyman@linux.intel.com
Cc: rogerq@kernel.org,
	peter.chen@kernel.org,
	pawell@cadence.com,
	gregkh@linuxfoundation.org,
	mathias.nyman@intel.com,
	gregory.clement@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] usb: xhci: tegra: rename `runtime` boolean to `is_auto_runtime`
Date: Wed, 29 Jan 2025 11:56:06 +0100
Message-ID: <20250129105613.403923-2-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <D7EHVKGXIFM4.3IDSI7TDG85AV@bootlin.com>
References: <D7EHVKGXIFM4.3IDSI7TDG85AV@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: theo.lebrun@bootlin.com

Unify naming convention: use `is_auto_runtime` in xhci-tegra, to be in
phase with (future) drivers/usb/host/xhci.c.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/host/xhci-tegra.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 76f228e7443c..94dd32f1a0da 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2161,11 +2161,11 @@ static void tegra_xhci_program_utmi_power_lp0_exit(struct tegra_xusb *tegra)
 	}
 }
 
-static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
+static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
 	struct device *dev = tegra->dev;
-	bool wakeup = runtime ? true : device_may_wakeup(dev);
+	bool wakeup = is_auto_resume ? true : device_may_wakeup(dev);
 	unsigned int i;
 	int err;
 	u32 usbcmd;
@@ -2231,11 +2231,11 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
 	return err;
 }
 
-static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
+static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
 	struct device *dev = tegra->dev;
-	bool wakeup = runtime ? true : device_may_wakeup(dev);
+	bool wakeup = is_auto_resume ? true : device_may_wakeup(dev);
 	unsigned int i;
 	u32 usbcmd;
 	int err;
@@ -2286,7 +2286,7 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
 	if (wakeup)
 		tegra_xhci_disable_phy_sleepwalk(tegra);
 
-	err = xhci_resume(xhci, runtime ? PMSG_AUTO_RESUME : PMSG_RESUME);
+	err = xhci_resume(xhci, is_auto_resume ? PMSG_AUTO_RESUME : PMSG_RESUME);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to resume XHCI: %d\n", err);
 		goto disable_phy;
-- 
2.48.1



Return-Path: <linux-usb+bounces-19839-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6BAA21B64
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 11:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D1643A2536
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 10:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30181DC9A7;
	Wed, 29 Jan 2025 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BT2VXL2O"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7121B85E2;
	Wed, 29 Jan 2025 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738148188; cv=none; b=PG7r00bvXUjMXv/BE7RNUycn1brp8bN6xS+uguEI7SmgaaQ3DD7OFeDR0uuiW61LO2dZCxPm1UcLw6mvZZnaqNHezXwWUHzEGhmrz3VflHxLItVFFooc371Z6kc6Glu/LACLqs/SlU+PByxza9mFbFAfDpv5LhRua55le3n0No8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738148188; c=relaxed/simple;
	bh=akp8FO9P2Jx990YIUJHM+r/jn8TJqVsUZUalIBq9TF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TeqIW4YLqqWNm//ETQDGNwGspTYD3obQvriEm2uoAKvPdZcREgtuJ9FSGJCfm2WtnSZsnCmflwHxaIleTzofA+7SUsS9gnd3rAlrOzyIGzo1NO1wfDWSSrjnL9/bBZQYGl2fRiYvNg8RBpJRlp5ixMfLtFrr390PyH39jH5HbSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BT2VXL2O; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D72F0FF802;
	Wed, 29 Jan 2025 10:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738148179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uaejGi7/Nw1yFvMy04uA40ZGAAurzlofQcopOK8Hb10=;
	b=BT2VXL2OPDg3DQZ+StP6OF6NzYE/iQIJy1PjhaaKpS4pVtzvwyZPXj30Gbzf3cyFXdQ1kN
	wOMfhJa7NBcr5EhNn0kLaX/ygzaGCWtlCg+tqZDYBFTf4GvMs+lUR+C8sngLK/y0MRmRg/
	1aYo2AA4PnhFTZ7xo3xxJ3FdumzN3sFIylnn68CDGhcOdezuJg0068CcsDvxa8gDPZ3ioH
	IoAl/p8483dUNRmfDrwXRzDyIcuhVsweQ8ou2mwZitN6PzKMCQAccNy0O3RDOZI8oJeOVD
	ubmo+R9ZwJnnWxyBs58q8gcuKtsHz2zFk/AoZ6Hu3Z4Wbth7XxAAbV94szT2sQ==
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
Subject: [PATCH 8/9] usb: host: xhci-plat: allow upper layers to signal power loss
Date: Wed, 29 Jan 2025 11:56:12 +0100
Message-ID: <20250129105613.403923-8-theo.lebrun@bootlin.com>
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

Now that xhci_resume() exposes a power_lost boolean argument, expose
that to all xhci-plat implementations. They are free to set it from
wherever they want:
 - Their own resume() callback.
 - The xhci_plat_priv::resume_quirk() callback.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/host/xhci-plat.c | 3 ++-
 drivers/usb/host/xhci-plat.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 831af518a6ec..8b18494ccc41 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -479,6 +479,7 @@ static int xhci_plat_suspend(struct device *dev)
 static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	int ret;
 
@@ -498,7 +499,7 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 	if (ret)
 		goto disable_clks;
 
-	ret = xhci_resume(xhci, power_lost, false);
+	ret = xhci_resume(xhci, power_lost || priv->power_lost, false);
 	if (ret)
 		goto disable_clks;
 
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 6475130eac4b..fe4f95e690fa 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -15,6 +15,7 @@ struct usb_hcd;
 struct xhci_plat_priv {
 	const char *firmware_name;
 	unsigned long long quirks;
+	bool power_lost;
 	void (*plat_start)(struct usb_hcd *);
 	int (*init_quirk)(struct usb_hcd *);
 	int (*suspend_quirk)(struct usb_hcd *);
-- 
2.48.1



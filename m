Return-Path: <linux-usb+bounces-27883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B68B51D0F
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 18:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5C791C8791A
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 16:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1772D1911;
	Wed, 10 Sep 2025 16:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0BvYz4ER"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAED333471D
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 16:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757520475; cv=none; b=sP746UtzxkbVpT/GfPzAqN+ty8NdpiJnRUkFxehAKJWzBQmEtqEJpbcV6vsJcw06HmIm+vmLQq/3XgVk7SU8E8xLgAGILAS7sFaPcrIxqYGPpPm28XPZOCMhzxp2uPMzMffQg/JIyrjjHIVUGGoGF8rxQapJ6TOgFYWPvDkKXpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757520475; c=relaxed/simple;
	bh=fncyrEdNVHaP3iiTP5h4jn2tcb6w6u54/9mKRzGPXR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gYa56qrmy6lzABbsA0eOaYi4nZ0rfr6DfsENBxG7NZgXY31gvm17xFwm4EBSmFxa7DPKjknEPlpPisFWVQ7Lb1F1bXLhw6Ye6ku/CmY2oOmkEjMAiHJXI53BEW3EWeIBzG3gLtdpJf512GM5pO1mFpRjbfkdBwEBcvtGu9K88GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0BvYz4ER; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 48D2DC6B3A3;
	Wed, 10 Sep 2025 16:07:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F452606D4;
	Wed, 10 Sep 2025 16:07:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96C46102F1CEE;
	Wed, 10 Sep 2025 18:07:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757520469; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=7Y9MQxzzNuuKu2RH1KeXrxnSz9xWkH/NZPX84EwGc14=;
	b=0BvYz4ERqKQ21hGFPJ2b7N+4cIM5L4qWyuWAwnd+l/j74H952eK5sCbGd9F4gekeC4rACr
	l0FG5pSd0FEZ5Jo3bEdZS6W2vLtsg9ZtunJNdv6mNXuwcTYyafJ9OflaW4Z2vwOGeW36Cl
	qtyQ0frgX0+aof97thvfQ/CBEj9U9ZEGYTF9YSMFK6b1VlosJrCcNy6ne/Hn/H8o3stvnJ
	j3muRTt0JKTB64ozo/sOBDt8v84vpisOvHqDSGHDuFjQgTQe1tsH6O4X95rxfQBn8CXRV8
	6k0ZGnx4kb3mzmAx0Kj40jv9WQ5TEg+HtOUpwCPTiZyGDL5XCD6ZuQXZgDBdqw==
From: Herve Codina <herve.codina@bootlin.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH] usb: dwc2: Add support for 'maximum-speed' property
Date: Wed, 10 Sep 2025 18:07:30 +0200
Message-ID: <20250910160730.585303-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The DWC2 IP can be properly integrated in a SoC to work at high-speed
USB speed but some board issues, EMC constraints or any other reasons
can lead to the need to limit this USB speed at board level.

The device-tree 'maximum-speed' property already exists for this purpose
but is not handled by the DWC2 driver.

Fill this lack adding support for 'maximum-speed' property and so allow
to limit the USB speed in device-tree (board description).

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/usb/dwc2/params.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index ea6bd537e337..091bfcfef753 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -1029,11 +1029,33 @@ int dwc2_get_hwparams(struct dwc2_hsotg *hsotg)
 	return 0;
 }
 
+static int dwc2_limit_speed(struct dwc2_hsotg *hsotg)
+{
+	enum usb_device_speed usb_speed;
+
+	usb_speed = usb_get_maximum_speed(hsotg->dev);
+	switch (usb_speed) {
+	case USB_SPEED_LOW:
+		dev_err(hsotg->dev, "Maximum speed cannot be forced to low-speed\n");
+		return -EINVAL;
+	case USB_SPEED_FULL:
+		if (hsotg->params.speed == DWC2_SPEED_PARAM_LOW)
+			break;
+		hsotg->params.speed = DWC2_SPEED_PARAM_FULL;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 typedef void (*set_params_cb)(struct dwc2_hsotg *data);
 
 int dwc2_init_params(struct dwc2_hsotg *hsotg)
 {
 	set_params_cb set_params;
+	int ret;
 
 	dwc2_set_default_params(hsotg);
 	dwc2_get_device_properties(hsotg);
@@ -1051,6 +1073,10 @@ int dwc2_init_params(struct dwc2_hsotg *hsotg)
 		}
 	}
 
+	ret = dwc2_limit_speed(hsotg);
+	if (ret)
+		return ret;
+
 	dwc2_check_params(hsotg);
 
 	return 0;
-- 
2.51.0



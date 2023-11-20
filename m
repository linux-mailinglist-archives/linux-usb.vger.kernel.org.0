Return-Path: <linux-usb+bounces-3035-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A88E7F195C
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 18:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55FAD281666
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 17:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096FB1EA7E;
	Mon, 20 Nov 2023 17:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="elgohwiw"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A760AD8;
	Mon, 20 Nov 2023 09:06:12 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5666E000F;
	Mon, 20 Nov 2023 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700499971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0N+JeDCct2n4pgXnrJDil9hLa2D4hq87laHaGCbNG30=;
	b=elgohwiwWAZjxzqdb9A7uBO0ZwHANO1eYP4fdo/kWWYKEUkfmfWsVYsvVXRm1okOGrovnI
	z5ol2gOy7Bb5WApNszNoJLqthfBDIiDrPdxSUlipiqJqaJRQVPrYOTlP96oi5VYddLJc8E
	II3HhYNB1jq39Gnv6Qxh1Y8RP0ftX28Bdvfwbj8R2Jd2aN+aMLldFHwwXB5mzpIY08Kzj5
	5U0jSMEsTHfEfCDvbrD+qY3TjtzCOVMRW/VcBo/6SY8XjGxHFWFteOlkrIpOlerf0CJzLF
	btqfyQGYF/sH44FpSXLniiTdnVcENmVeaV8jSwnnH7A1sdmtGmr64cqHHAUYXg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 20 Nov 2023 18:06:05 +0100
Subject: [PATCH v2 5/7] usb: cdns3: add quirk to platform data for
 reset-on-resume
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231120-j7200-usb-suspend-v2-5-038c7e4a3df4@bootlin.com>
References: <20231120-j7200-usb-suspend-v2-0-038c7e4a3df4@bootlin.com>
In-Reply-To: <20231120-j7200-usb-suspend-v2-0-038c7e4a3df4@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Thomas Petazzoni thomas.petazzoni"@bootlin.com, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.12.3
X-GND-Sasl: theo.lebrun@bootlin.com

The cdns3 host role does not care about reset-on-resume. xHCI however
reconfigures itself in silence rather than printing a warning about a
resume error. Related warning example:

  [   16.017462] xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit

Allow passing a CDNS3_RESET_ON_RESUME quirk flag from cdns3 pdata down
to xHCI pdata. The goal is to allow signaling about reset-on-resume
behavior from platform wrapper drivers.

When used, remote wakeup is not expected to work.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/core.h | 1 +
 drivers/usb/cdns3/host.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
index 81a9c9d6be08..7487067ba23f 100644
--- a/drivers/usb/cdns3/core.h
+++ b/drivers/usb/cdns3/core.h
@@ -44,6 +44,7 @@ struct cdns3_platform_data {
 			bool suspend, bool wakeup);
 	unsigned long quirks;
 #define CDNS3_DEFAULT_PM_RUNTIME_ALLOW	BIT(0)
+#define CDNS3_RESET_ON_RESUME		BIT(1)
 };
 
 /**
diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index 6164fc4c96a4..28c4d1deb231 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -91,6 +91,9 @@ static int __cdns_host_init(struct cdns *cdns)
 	if (cdns->pdata && (cdns->pdata->quirks & CDNS3_DEFAULT_PM_RUNTIME_ALLOW))
 		cdns->xhci_plat_data->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
+	if (cdns->pdata && (cdns->pdata->quirks & CDNS3_RESET_ON_RESUME))
+		cdns->xhci_plat_data->quirks |= XHCI_RESET_ON_RESUME;
+
 	ret = platform_device_add_data(xhci, cdns->xhci_plat_data,
 			sizeof(struct xhci_plat_priv));
 	if (ret)

-- 
2.42.0



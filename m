Return-Path: <linux-usb+bounces-5450-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D3F83A7B4
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 12:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD180281474
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 11:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B081AAD9;
	Wed, 24 Jan 2024 11:26:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2751AAD1
	for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706095587; cv=none; b=YmXtG01mGP4//wdMyQlpRamIHK5oTW8H/a9cBFT4ksLtHbKywumMnpc0746/iTPTFsoJwCZJLEaBzC1Fd199chL/WMF+l0ERqZMcF6GN45K+jPCHIaa00fAzlL4DNkQHuswvgnPrj12XUC/RZ6DbRbTcMrK8qzmCTosen7iZEpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706095587; c=relaxed/simple;
	bh=Q1sHbIivfI+zsL7lmcpRgEA34+6RBDIe5bColoq7y0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WmvtIWBz71WN1WWqHqtM1KIilbFV+1wseIMSoClBe1lSLm2MiD0j9j910Hb+Jrgr8NA9hQ9fesEMyku46sA4S8MsvXu3WelHfWOpAgPmWedcx1ZwZngKrhC5pVL5EqoCqypihSff3q8/DnU0WW12zJC9jj7v9V+fpfjjKM/ljXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSbOe-0003Xk-P4; Wed, 24 Jan 2024 12:26:20 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 24 Jan 2024 12:26:20 +0100
Subject: [PATCH] usb: dwc3-of-simple: Stop using
 of_reset_control_array_get() directly
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240124-dwc3-of-simple-reset-control-array-fix-v1-1-808182cc3f0e@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIANvzsGUC/x2NQQrCMBBFr1Jm7UAbs6heRVyE5FcHalJmilVK7
 +7g8n14/+1kUIHRtdtJ8RaTVh2GU0f5meoDLMWZQh9iP4TIZctnbhObvJYZrDCsnFtdtc2cVNO
 XJ/kwIi5jcGsshfxsUfj8D93ux/EDDMqhbngAAAA=
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.13-dev-f0463
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Use of_reset_control_array_get_optional_exclusive() instead, it is
implemented as:

  static inline struct reset_control *
  of_reset_control_array_get_optional_exclusive(struct device_node *node)
  {
          return of_reset_control_array_get(node, false, true, true);
  }

This makes the code easier to understand and removes the last remaining
direct use of of_reset_control_array_get(). No functional changes.

Fixes: f4cc91ddd856 ("usb: dwc3: of-simple: remove Amlogic GXL and AXG compatibles")
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index d1539fc9eabd..9cf9ee1b637b 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -52,8 +52,7 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(np, "rockchip,rk3399-dwc3"))
 		simple->need_reset = true;
 
-	simple->resets = of_reset_control_array_get(np, false, true,
-						    true);
+	simple->resets = of_reset_control_array_get_optional_exclusive(np);
 	if (IS_ERR(simple->resets)) {
 		ret = PTR_ERR(simple->resets);
 		dev_err(dev, "failed to get device resets, err=%d\n", ret);

---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240124-dwc3-of-simple-reset-control-array-fix-e4e9822028dd

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>



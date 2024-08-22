Return-Path: <linux-usb+bounces-13891-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1F795BA4F
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 17:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FE6BB26CCA
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 15:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706811CEAB4;
	Thu, 22 Aug 2024 15:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ahkaTrVs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344461CE6F6
	for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340514; cv=none; b=mtaKhDHZiOaelIEBijBkL0EYVNCSgeon3qkz+VmobUoyLTXxh768hVPQTtvQ+4eeOE1HV+SWuaPFDzE3UzFVIl9DnUaFq4lGFCCmbG4DlaBkPkc/FFeffBVgyLQyynJwuF+7E4OuxAqUVliMU8O9OYGQ+c9Xf1yey67eGt7sYg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340514; c=relaxed/simple;
	bh=w+weaAEOmGk0To+KXOoCxU7aqcf94aBLMt0+/RCKEWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sFcsEpiNewZuv3QnCXCvsZ3EUTSA/6nrfc9EhPVI/RPi/ud82fHrzLCzJpfLsREOAU0laI+ZmkHNXaLhZAsBBMALlPozHG7C0ZIPwAu9cjNVKGH0k/R6fzKVImGM+nHutXlCehzru5s5mGfookzFBvG/OtN3dLiIEKA4dKQ3yWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ahkaTrVs; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7a843bef98so112703866b.2
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340511; x=1724945311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7FkQHIsvgS8tLvmRvs57rTjX/u1Y5CHinD6jgFXzvM=;
        b=ahkaTrVsbrgQ++YRM9CHFl4Zt1+3G69WBNK9S9wraUUldB5QsS/cWtF/ZG2RH8KU+9
         M2mKY0d7w9bWgXOPxNGRHzQlNSRPe1Gv2PZzkyHKcFWZEFacvO3ZMnwPg1xPpN1Mr/2T
         EAY+1qjZ8hzVKrfuOLjmN99yyXjMwK8yIL9+1geoJuAL1kuzzmEDRfZyFWmRt179qpz3
         oOcsMQnpIqJu7zne2Bxi4UpIhLT6f1BAlOPi2XaHNrDu9XNE/NMPTiz/Uk3Xx7vpp+TF
         jFa+A0WvOqtCHyqitBslzL2/bagHKsS02TQU/uZ1Z7CqjW04HvrwVz6ypKCwzt/XS2ve
         z+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340511; x=1724945311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7FkQHIsvgS8tLvmRvs57rTjX/u1Y5CHinD6jgFXzvM=;
        b=LI0eBAJehV3ImGD4zxVvnYNrDWIqYXXppU+OBw3TZRFNoIjCDHk7HbqXD+DEr1SzYj
         W+3YlEgt03/MgtAULUa4jI/v/f2jlBAhJH//GE9gzVAHojkbhNZXgQQ38f8rr61Zz89c
         91xPtMNcv9hX/um/7cKW//lWGCvrguhCPYHkYCcqLnusOTuDShfYhATN+2oZUDV5ZKlu
         I/yDL7O3s1SbmK33zGSDkJp+znBK9p1g8Yq3q71BS9DnVf5TLGPRKwS3gX0PwX0aty8k
         NyKV2aleqMG5xqukgqJELPkQZCKrzbS0m5HXj/9jPz5bSrpuAeJu8v8SBCWC0LEtAgHp
         LNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeNyjikQBcF9o85WgLMcCyHMCQBgqI2n8vwxlTCz19EsUiB+0WL/cugN37pR1p8z84DqFcv+woPsU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1JY9/fb8KdNfVnOZLTNMZ6igr8L1MZmsuS2XRWLjQTR0MfMds
	rUmzCzRXDEHT/hZLR46H4QlqYSYvE0jd20eL6pX4tCug2qb1o09RjheMw/bxcYc=
X-Google-Smtp-Source: AGHT+IGPID6PnpNBLXBTXMtHC4bLo5V7GR8HicFGoYSBbUPtn858dZ2vIoy56QGfOFS6q2WDw3Kkwg==
X-Received: by 2002:a17:907:c7dc:b0:a77:d85c:86fa with SMTP id a640c23a62f3a-a8691abe63dmr193992366b.13.1724340510445;
        Thu, 22 Aug 2024 08:28:30 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:30 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 07/16] reset: rzg2l-usbphy-ctrl: Get reset control array
Date: Thu, 22 Aug 2024 18:27:52 +0300
Message-Id: <20240822152801.602318-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Before accessing the USB area of the RZ/G3S SoC the PWRRDY bit of the
SYS_USB_PWRRDY register need to be cleared. When USB area is not used the
PWRRDY bit of the SYS_USB_PWRRDY register need to be set. This register is
in the SYSC controller address space and the assert/de-assert of the
signal handled by SYSC_USB_PWRRDY was implemented as a reset signal.

The USB modules available on the RZ/G3S SoC that need this bit set are:
- USB ch0 (supporting host and peripheral mode)
- USB ch2 (supporting host mode)
- USBPHY control

As the USBPHY control is the root device for all the other USB channels
(USB ch0, USB ch1) add support to set the PWRRDY for the USB area when
initializing the USBPHY control. As this is done though reset signals
get the reset array in the USBPHY control driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 1cd157f4f03b..8b64c12f3bec 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -132,7 +132,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	priv->rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
 	if (IS_ERR(priv->rstc))
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get reset\n");
-- 
2.39.2



Return-Path: <linux-usb+bounces-13892-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEA595BA47
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 17:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A96181F22694
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 15:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BC91CF299;
	Thu, 22 Aug 2024 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nbD3wSrD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA091CDA37
	for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 15:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340516; cv=none; b=f28/28jDrnPDelXOY9Zsl3TDfM5fYTnbVzTZhH1WEPd6nZhGjCW4FXNZYtkDfsskSdpEzaOTR8tSAlsvbUI/0k12sbNbg2lEDKJssmDDegWZI/LBQeEL1FOMLfDQWiVUHEFJ3ocHbjGbr6vU806AqtxEH6liwcOzAlUbH4tJbmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340516; c=relaxed/simple;
	bh=hwOPs3VjSqv+5Z5VfJP9Z8BIWsDCu8awKAb11KLvGp0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QH0UrXmR9ujS2NcsAwj27JO9bCEAxaDNVevSpsnMfuZgwxyK/MexoBpSLzFR+t4f1MZUQpp8+C2nSVz24K8a5+BVUaoA40Qnfc/Dz2JKeqtAMbLRJ7Fg5fh/8bSDI698f2dGAAouyu6JUCasQpAlwbFzZa2V2tbALbb2IletPQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nbD3wSrD; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a868831216cso129485366b.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 08:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340512; x=1724945312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkWgitHhldKdeisz33EiZdlfuv0bPsRGbcOFCT+k5gc=;
        b=nbD3wSrDmsDg6iwBHl98KBRcXrkXuv9bk0T33rtiyr0E+YQD+/Dp9bI2YgBrEj/GSJ
         AV7dasG/x9B1OPIdaiJ4WePATHqQ/xLQUN9kMrz4O3v+UqBJveYqR80uo9yagMYkmy+S
         dPXXDnCE4XtB9xr5Gr6FdHLDqwzoRzUC+/REiU88a+cpjHAxboR/L2sVMNwi3Pat+Zsa
         MfWyemeoLB3B6dN1RSV/dHonudhBsvFF+ICTyn68w2j12cTKuLh/e6soTnt4pN+ZN6Vf
         y1i7IE0tX4kwM1atst8ZfxkOYFpHb5DaeUltWiHA6BSXz9rl7HQ1QchHIj2hxcrHxkqf
         hryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340512; x=1724945312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkWgitHhldKdeisz33EiZdlfuv0bPsRGbcOFCT+k5gc=;
        b=kHY+TQJaO//dSpP9vxLKYZh1p46L8A/1plLjRR2tijjzX/ESIglKuu8y+c3n1L6fMM
         wj9zCMCm6j7dOzaV+mW3LAO1+rmphdc7vZ6MWR2GZGe5nc/K7N5mXSr1AC2VSVkpFqY6
         yk9g8bZmNSblstFAOQV6m0FYlOl9dJyB5oom0y9aLDH+qR06nW5A9ccqhtsiD2ynVNoJ
         lelUnLYzC/ngtLiRcYs5L3LjJVCgjm+OYBy7R79x5wBRiaKwyXabm7JaSCW36UX8kHEk
         S4oXfwRVq9lYSI2bbLhscsQ4QkwI5AvPP0IYFNOWc43Rk3rBA/BfsYHuhPs3TWrvrt5K
         J/1g==
X-Forwarded-Encrypted: i=1; AJvYcCXLZ1Vo559clBPxQRL0sEndPEHyDFbcWoh7mt1VJ06DISKslnTpN1D0PSAXatCa4k9VSIFP595+xIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVUILioVAfEDec8VdXvceKtOmI2S74WQVOYVMgYnkRWT7zVx4x
	1i22skQZfzVFncyxvNxT1aGidWE36y29IYp4bzWgK6IwNWkYTYZfD0Kp8W+983k=
X-Google-Smtp-Source: AGHT+IFEWPJ3HqQL/w0KWFEJhV07xF/eMg4mv7Lejm46+5JkTivmt8Z+5f8B5VhGhYYih3FlUFQvOQ==
X-Received: by 2002:a17:907:980e:b0:a86:9258:aeed with SMTP id a640c23a62f3a-a869258b023mr191608966b.61.1724340512413;
        Thu, 22 Aug 2024 08:28:32 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:32 -0700 (PDT)
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
Subject: [PATCH 08/16] reset: rzg2l-usbphy-ctrl: Add support for RZ/G3S
Date: Thu, 22 Aug 2024 18:27:53 +0300
Message-Id: <20240822152801.602318-9-claudiu.beznea.uj@bp.renesas.com>
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

Add support for RZ/G3S SoC. It needs its own compatible as it uses 2
reset signals and it cannot work w/o both of them. To be able to
fully validate this on DT schema, too, the RZ/G3S uses it's own compatible
w/o a fallback (as if the fallback will be used the RZ/G3S will not work
anyway).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 8b64c12f3bec..08b18d7de7ad 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -93,6 +93,7 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
+	{ .compatible = "renesas,r9a08g045-usbphy-ctrl" },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
-- 
2.39.2



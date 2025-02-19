Return-Path: <linux-usb+bounces-20830-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCBDA3C4AC
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 17:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7AC2179DE8
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 16:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C223F1FECA3;
	Wed, 19 Feb 2025 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AhWHJV4u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBBE1FECA1
	for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 16:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981571; cv=none; b=tHX7kQBgQdUwz/vrJoVhS44rET1Xtp2vS7U07B3/rar18BQpYVi3JtKEStrA1375EFSM4TBL9m+324GSzleNCK4Txa27/7fbekYwf285ZqQ97BWDXBD7DaFBZW1dme75pAF1+M7QG80qI7kyHGpmTiEwbncEG2NKSdWHEF+EYFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981571; c=relaxed/simple;
	bh=olPIo7ondi9pZN9MKqIWTMM1H4TueaOeSXyLuuZ/SAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCFhtXUZR/wcZXeQ5jQfaU6ypy+B8N8PSlygAla20PTFHBxVI0r5pCnFQ5vOxQrx4Skb0gi0M7hCsQt/3dFFKTQLA6USwpWyKmZ5cCjTW+ACl5A0xo5/GyaMkgjcDRIoDw4nzPwdOIdXkUUqBBHQ2i2yhiTyxhWQRpyqK1me9FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AhWHJV4u; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso11101352a12.3
        for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 08:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739981568; x=1740586368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEDW0l1uLZpkKjBmTN25YyNDkquVrBpJCv7mOsXan38=;
        b=AhWHJV4utcdkE1jDXDWT1m6MSm3+dzy0lH/HKvEjMWLpK6pRwk/KhIX0ZBTfjufK0H
         ePz3L8CzVWYEbBs5iVoJ05PRB3wl9KjVV3LpSN4T8mDxI+LDQJ1XeuHMBnjPpIcQ+hC5
         YD6VOokiUkT2ixn2kEAxEBhQELGj9mOMXeGf42NbnLtNUgm89wZcxGtqZ2uOuRvLK+wd
         Y2BrpLD1E58tCqpQ/KOE2uUgDUpWK0tDKYNJapIsmyIe2j/K+4pjVT8uhtpgQnjAlRAt
         WkSXAa1QG6G5vdCDX7TB6s6pnj7+BQjPPGV3JdTzAzG6pFQUalT5D2CyWJkHQ44Bjvdo
         IE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981568; x=1740586368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEDW0l1uLZpkKjBmTN25YyNDkquVrBpJCv7mOsXan38=;
        b=ppWGEx9cHapjgVKqdhRK62vQHLwq0Oda0LsdkuL5SNXmya8kqAG6v5sk/br3vm7nXd
         mdEPoGNMrmz/D4KWNu8ocVFQsiMh0sFsIVANAnKFuF7cfMSkbq2DSecdxjT0UVZjMRos
         EzHevZAJ6MQkU6HqtHH/j3sOSMiTJad+G7VZaehJGgpyXA320GyjuJxq35tEyhw73a76
         E6NINoGps/SkGLlp8ugpyytnyGwZ/KixRhrF7/l5/NoVELjdGMl55s1qJMPSj2y8j8a2
         lY2whKW/lKDkl2RGm/M81oRmUhKF01/D01gpA095v0O4dtkRgQ6RIZLLPD6/VYZY81nG
         nJjA==
X-Forwarded-Encrypted: i=1; AJvYcCXPGfHIj2SkjnPgyrsPK1TM+azyBq4Uz64EK77VwTYBhTtC3BcXKejebpD+HlPjhdIGpOOMAuJ93fA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRf0OQjCVdgHPPVZe0hS6+CAabcAxYc6X1XG9OETYKcKziHKmB
	CMjSWjoB19EyqoZiX6ac+1Wem4ps1hV8ZGfdUhKzbZYyNOMQkBx0ty4As1o45Uw=
X-Gm-Gg: ASbGnct/9J0TuaBU4X2vWG43oWQpijlOtiCZyjsWvORQKHWxUWmu9cfj+gUZ9exI9XI
	pI/fb7z3sRo3sHXDvPLdZbPkyWqpxRDpFz9IUyoiz0DqGcNTRs/MAL52On8ePk+rXcvm0L99hMl
	+y3H0BmVWzwaPMcEPt5i5lHiclI5Meso1+eBSj41db4zlC+MTA0HeOaAte/ME3pkYijiOg8jj4L
	fVSakkncrtBG7SnausUKAnBWI1Kcv7Hch7/oxOjfEIzGrDfN6CBK3oUjYqBko+gR27IEmm47wWL
	CHVNO/Er9ZydzPX5eXENFHq1gAfMqJVzzSrNHYSvkUsd
X-Google-Smtp-Source: AGHT+IH3K7++bjaVQb708MVg6kp0Ba6iewq39EmLq++1d1VFY6n1zquEZBgNZF87Ke/PH45YqVx4tA==
X-Received: by 2002:a05:6402:a001:b0:5e0:445f:9576 with SMTP id 4fb4d7f45d1cf-5e0445f96c6mr13997168a12.18.1739981567920;
        Wed, 19 Feb 2025 08:12:47 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e07f390626sm2548881a12.30.2025.02.19.08.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:12:47 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	biju.das.jz@bp.renesas.com,
	geert+renesas@glider.be,
	yoshihiro.shimoda.uh@renesas.com,
	laurent.pinchart@ideasonboard.com,
	phil.edworthy@renesas.com,
	balbi@ti.com,
	kuninori.morimoto.gx@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH RTF 2/3] usb: renesas_usbhs: Use devm_usb_get_phy()
Date: Wed, 19 Feb 2025 18:12:38 +0200
Message-ID: <20250219161239.1751756-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The gpriv->transceiver is retrieved in probe() through usb_get_phy() but
never released. Use devm_usb_get_phy() to handle this scenario.

This issue was identified through code investigation. No issue was found
without this change.

Fixes: b5a2875605ca ("usb: renesas_usbhs: Allow an OTG PHY driver to provide VBUS")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/mod_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 105132ae87ac..e8e5723f5412 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -1094,7 +1094,7 @@ int usbhs_mod_gadget_probe(struct usbhs_priv *priv)
 		goto usbhs_mod_gadget_probe_err_gpriv;
 	}
 
-	gpriv->transceiver = usb_get_phy(USB_PHY_TYPE_UNDEFINED);
+	gpriv->transceiver = devm_usb_get_phy(dev, USB_PHY_TYPE_UNDEFINED);
 	dev_info(dev, "%stransceiver found\n",
 		 !IS_ERR(gpriv->transceiver) ? "" : "no ");
 
-- 
2.43.0



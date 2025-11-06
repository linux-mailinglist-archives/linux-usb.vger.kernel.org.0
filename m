Return-Path: <linux-usb+bounces-30154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F12C3BD30
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 15:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3E9B85013A5
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 14:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA56A34572E;
	Thu,  6 Nov 2025 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bIuM5Fl2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447D13446BF
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439797; cv=none; b=cBur9HP+BfB2ELlzysWObaUwC0VcmoSdAJIfGuUHjbGiKgJ+IsNiQ0pRiWu+vRkAZLDpdH0qe8fJ0o5UNRSn+GmKx0K6wP10nTP5jnu3gbREE4JVYAUo/Xgqkm9z4LwZq0KBO5X94B7fgQRNIpqeq7jQTAV2Cid1BzFicjRP8ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439797; c=relaxed/simple;
	bh=y3nzsFdj3yflb35dkl3eldAeca6dXxagNF3fVi2B9xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CnxLycW788o9FlyUv4J4EU6PUyyy3U+nWLHWjL3dPaeyk8S85K/66+pFZBEv5ymVz/JLKLJ6yjodu+y1hPVd7um6cx6qUbqHTcCIucgVIqu2vXECezJoQ79spwUhl1d+VTtZg6a6pShDWCtkUu9UAc+rrzQQYCwpTHRaFQIoTvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bIuM5Fl2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47754547a38so8358725e9.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 06:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762439793; x=1763044593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTsg2r6E/o8MY26Scy94jA8/h1trR6TBISeMWFJR7b8=;
        b=bIuM5Fl2eXGu4P5pBwuuv7f7omCfc7BQHmLtRfOAZSPeE8MTKd1Hrx4ikk1SHgyE+k
         3tAegWrzCHi4ZMZliIzIlFhzxJckt11SYpJqEWGqNFh7DQoWSuiMGo4dE+jZy05kMXYD
         aekkI1wk7AeKLsAuNHD258zvXEfD7sxhCKhOCg+Qmiv1whzwycjNzdPvikkCeoQjnX2S
         dNiET1NpVfPWKcZcW8N7YayjVTtsG+xj0f9jCsDIg34qJ32lQou2ZvjwLaheZdp7OAfn
         NxxYkE6We4F6m8opycEqZHTQ5DmV4t0MjLsmwnO7gQDAEdXvzsIQHbNE1O+Wp4qvZOqi
         T/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439793; x=1763044593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTsg2r6E/o8MY26Scy94jA8/h1trR6TBISeMWFJR7b8=;
        b=hfGj+Y+fT84JFI7lKt5Bm039urCI766yIVTipu7DO1LTTkUdkMAaX/VoYQe1q4zMxB
         aIX4QKYxgQWmnuwlmwpEPfhogXPaxhJ9llMi7CLUjWrVC9HcCbhd4SzJSEidL9PF4+Yt
         3U7jVViNTxDNyMoqcZKv2MjQLwa6en5jje6yHgGDjc4beSeOYNpONXtDfNmsh5PJqLbW
         KvjoE4wgq2HOazd6dutdfIq58NMooRqMKc9WbGPzR98InZHgejnm0u3NH3iTyEr3iTco
         R3H+UfAoLVevR56TlFSXBZl8mz6aUXermaE2S2i2CEt9vQqJslovuiXr8XupVxyPICZl
         yxRg==
X-Forwarded-Encrypted: i=1; AJvYcCU4sAAReUS2H7wBO1oRLYKLUklRDVxsIota5xbiX6TTg/NERtNjz0BNOqN1oH3TMQPv2bgLzDuGuS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvxWxBiGo8LtXoi6s2RxMniTCzLdOQJFIS3V1UjuI3P6yRkaqz
	hSvmsE5AKHySlgF7wwOpoqgsnLL0ZS07qQumhzMll54YfR20K9CPHvDEiAMZBKAG69w=
X-Gm-Gg: ASbGncuGevfTcz8l8cFCGkc80n1BavRvvTV4i8cCTu/v3GLQyIaM+yh+E1xZ0o0zcSL
	BU6AESDSJ8zAiaF+09qfzl35BmpniKWxCvyalG8hGbjLAX5XltA1SKBHYnBZN2znmojVh/ZxI++
	xr4M1l+j5V+vn1vs9j2bDgXOXijIj3BzXRrPoJ1SyxWAe2lYMbne8Ob8FuD0fU3VY9lgfqRbNYd
	OjHy7YfKVnpZpKg2f5h5dgS4l1s6e1t959DdpfVy29j/VKWf83Yjc70+cR1wI5EfyHO593SSRIL
	uhNFum0R+39eZIhkjb6tzB2dsnkLucue2H2n3tSGbTLa++9PFvoYwQXQ7XHqct9b0l0hzyYrX/3
	Qd17v4knVPwF5Y5u8BihjyF7k58zNvZYTFVj1n8o1W2sD97+xd5HPcFYdTIKm++kIzGRHDHMS7s
	YiR1OaR0v+tgGRbHieSUpWSENOa+2i7Q==
X-Google-Smtp-Source: AGHT+IFMwFI0y4UOkA1UeCISOOftitPMtlGydWwWFlXxerZKxOUxOgHPLcxYVbwkO2J4pyUDe0NAiQ==
X-Received: by 2002:a05:600c:358d:b0:477:b93:a7b8 with SMTP id 5b1f17b1804b1-4775cdbd478mr67500335e9.8.1762439793289;
        Thu, 06 Nov 2025 06:36:33 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce2cde0sm112185495e9.15.2025.11.06.06.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:36:32 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	kuninori.morimoto.gx@renesas.com,
	geert+renesas@glider.be
Cc: claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/4] usb: host: ohci-platform: Call reset assert/deassert on suspend/resume
Date: Thu,  6 Nov 2025 16:36:24 +0200
Message-ID: <20251106143625.3050119-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106143625.3050119-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251106143625.3050119-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC supports a power-saving mode in which power to most
of the SoC components is turned off, including the USB blocks. On the
resume path, the reset signal must be de-asserted before applying any
settings to the USB registers. To handle this properly, call
reset_control_assert() and reset_control_deassert() during suspend and
resume, respectively.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/usb/host/ohci-platform.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index af26f1449bc2..2e4bb5cc2165 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -270,6 +270,7 @@ static int ohci_platform_suspend(struct device *dev)
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct usb_ohci_pdata *pdata = dev->platform_data;
 	struct platform_device *pdev = to_platform_device(dev);
+	struct ohci_platform_priv *priv = hcd_to_ohci_priv(hcd);
 	bool do_wakeup = device_may_wakeup(dev);
 	int ret;
 
@@ -280,6 +281,14 @@ static int ohci_platform_suspend(struct device *dev)
 	if (pdata->power_suspend)
 		pdata->power_suspend(pdev);
 
+	ret = reset_control_assert(priv->resets);
+	if (ret) {
+		if (pdata->power_on)
+			pdata->power_on(pdev);
+
+		ohci_resume(hcd, false);
+	}
+
 	return ret;
 }
 
@@ -288,11 +297,19 @@ static int ohci_platform_resume_common(struct device *dev, bool hibernated)
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct usb_ohci_pdata *pdata = dev_get_platdata(dev);
 	struct platform_device *pdev = to_platform_device(dev);
+	struct ohci_platform_priv *priv = hcd_to_ohci_priv(hcd);
+	int err;
+
+	err = reset_control_deassert(priv->resets);
+	if (err)
+		return err;
 
 	if (pdata->power_on) {
-		int err = pdata->power_on(pdev);
-		if (err < 0)
+		err = pdata->power_on(pdev);
+		if (err < 0) {
+			reset_control_assert(priv->resets);
 			return err;
+		}
 	}
 
 	ohci_resume(hcd, hibernated);
-- 
2.43.0



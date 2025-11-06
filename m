Return-Path: <linux-usb+bounces-30155-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69472C3BD39
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 15:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43A813BBC2B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 14:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18745345CA7;
	Thu,  6 Nov 2025 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XsKb/r75"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8EB3451B8
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439798; cv=none; b=CGRau81XsIK6qyJTGXLV8aopKRDl2X7s6BpWBLiXF9CyI0SZ0ifWYheDl78CemwuHaf4lYddlWCQdu7vo+vlhCeegxurRKSsx+HVKSHS3ba3nSHknDDN/iUh2mVzlaxfAXXOo3wHx3kywuZbwsgRUjI9QIW2L+lKMXmthp2mYPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439798; c=relaxed/simple;
	bh=HLxsmV76ehddQN8d76HFTrl6xNiKy5eHzSIhXA5dsmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixI6VFOHvcB83qhzMFKuzU7Znw3svY8yhSeS+GC4440cVt7Y/5yshbcswFiYmODCIT7w+17GJ2jOvx/YN4ezJ2QKKSbiYoI5zsE3qdeWtSMJRIK9VFu2x11x8Q0VEyfyVMw5KdJra0pI7NL1HTDS9mGSjDzlEeK6G6FGFuXihtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XsKb/r75; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so5456685e9.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 06:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762439795; x=1763044595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwweW3VPRm8jVDmzvseiBOYWzO9CKnZgrSha6jb9mzw=;
        b=XsKb/r75CoRvVdoB20dF/p6RE2mSqr4Aqnc0D7YmEr6knednGjN4g5K1I5SJmmwo6p
         0gy2A0OtzmMq2TclaTXKlvQYREJH0HDRjGaj2r1zjmAZIJQVURVhjqlq6Pn7ctt1y1PE
         UZ8aTwE92QYrfyY7FnL0CVET/4biqltc23d++hwmNOPmABa40teJEUzOz+X6/4Kj4zYF
         tMte4sW79PaLwyC8A1G6i7e3PolnkqgaCLup5XNEouQ0NzS+NStqsv3ZSAcQxPL1jiyi
         b3uY2FtTZKr/Ntj5oj4eiu64c/CySamVp3Czgoyqb1NdQQ8Bqg3EnRhRfMg5C+d/fCAn
         VRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439795; x=1763044595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwweW3VPRm8jVDmzvseiBOYWzO9CKnZgrSha6jb9mzw=;
        b=T+7gRlp3EC2sdkCqbba8NuWm5xfsHcDiTFd5cY1fFs7z4LA6E3WWvlJvx7jeAzhg6r
         ABPmOu7GHBPvdjyG7fb8g+Scw8jIfH40OgmylOxqYcAjKc1q4XF+mxPuspxgW/6gziCg
         PuycN8J/LLJ6j+hP2+5+q95fKL1zDJI4lv3iFsBTNz3IjzpYiaOPMch9aq0fHdS91/D6
         ndib4QF9KlU5InkprLKH1Iz6KxOcwnGFwHP1dGb3pvsEhIaEUKCBlqlXC38qQUA+mOMX
         CC2mW0E8JfyJ93B9ecTYyu5k2VlTRHDzHMNvW+79pYiryMtZiwm7Jkkz4pyuqQdw7s4a
         0+wg==
X-Forwarded-Encrypted: i=1; AJvYcCX6XzS2zGOj6t7PUT2IHo/i08EWHtKNJUIrVunai0EWuV4rrmYj25V24a47h6+PggffwPq+QSsPz7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFR03omQGZ3ONQWxE0OfqddrmlESS1D79AQFBC3raHG6aymEYB
	8aW2AJDnTcU2Cmix5TqqJIx5hp9bPcWthonvBUEb8ZU2u611RWN/rA0bNBrTq77/lZ4=
X-Gm-Gg: ASbGncsDkMtYGUVYw80wv9fodxs3CvBV6tR/dth5/OxRGoD7lZDmiKLcp6lAx+isyAq
	0ycKtntebPG4Pknb2r4rBztMlyvSsq/vAsEXW/BJ5T15ScLtcnZjXLJMBfEpdY8Cyazg8VKx722
	4hTsGTemw2xb14R8sLwuWF20nsZ3GpbjgEQe05TpRa7j2i4U8HzkcQ4wDa3lt+cwgzzTAlYieCO
	vw56tamCsJUCwoWZT8TYJypwpy22ROF8OGeNxmnqNYIBfpVTYJT7WTBPVwhymlRJKKJhT/Lt1oD
	+rCuUg6/FsaagvKk2z0eZst/qMk2kTXi/KvO8kBiLyqI2sFW/xsVE8PKrL9PiDyF4f65XZ1jNZr
	oeTk+GAAa4TxFy7ZH/ndEohhHCsL4ZBEmRu+xW7SdV8aTs3ODzWG30ZzyXEmCJCTG7aDA/MTalz
	0wPs5Wq8cu9cCy5wS9a9l3wG3c4mvzxWKm0B7CRjd2
X-Google-Smtp-Source: AGHT+IGGbNMu5TPPDVt6ESZjoI+4K6fRzX8Tg/wskLMEN2NLbcif0mgNZCyLd/u4ReVocqUwcHhm0g==
X-Received: by 2002:a05:600c:4703:b0:477:639d:c85b with SMTP id 5b1f17b1804b1-477639dc896mr28168675e9.2.1762439794670;
        Thu, 06 Nov 2025 06:36:34 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce2cde0sm112185495e9.15.2025.11.06.06.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:36:34 -0800 (PST)
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
Subject: [PATCH 4/4] usb: renesas_usbhs: Assert/de-assert reset signals on suspend/resume
Date: Thu,  6 Nov 2025 16:36:25 +0200
Message-ID: <20251106143625.3050119-5-claudiu.beznea.uj@bp.renesas.com>
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
SoC components is turned off, including the USB subsystem.

To properly restore from such a state, the reset signal needs to be
asserted/de-asserted during suspend/resume. Add reset assert/de-assert on
suspend/resume.

The resume code has been moved into a separate function to allow reusing
it in case reset_control_assert() from suspend fails.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 35 ++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index dc2fec9168b7..cf4a0367d6d6 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -827,10 +827,26 @@ static void usbhs_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static void usbhsc_restore(struct device *dev)
+{
+	struct usbhs_priv *priv = dev_get_drvdata(dev);
+	struct platform_device *pdev = usbhs_priv_to_pdev(priv);
+
+	if (!usbhs_get_dparam(priv, runtime_pwctrl)) {
+		usbhsc_power_ctrl(priv, 1);
+		usbhs_mod_autonomy_mode(priv);
+	}
+
+	usbhs_platform_call(priv, phy_reset, pdev);
+
+	usbhsc_schedule_notify_hotplug(pdev);
+}
+
 static int usbhsc_suspend(struct device *dev)
 {
 	struct usbhs_priv *priv = dev_get_drvdata(dev);
 	struct usbhs_mod *mod = usbhs_mod_get_current(priv);
+	int ret;
 
 	if (mod) {
 		usbhs_mod_call(priv, stop, priv);
@@ -840,22 +856,23 @@ static int usbhsc_suspend(struct device *dev)
 	if (mod || !usbhs_get_dparam(priv, runtime_pwctrl))
 		usbhsc_power_ctrl(priv, 0);
 
-	return 0;
+	ret = reset_control_assert(priv->rsts);
+	if (ret)
+		usbhsc_restore(dev);
+
+	return ret;
 }
 
 static int usbhsc_resume(struct device *dev)
 {
 	struct usbhs_priv *priv = dev_get_drvdata(dev);
-	struct platform_device *pdev = usbhs_priv_to_pdev(priv);
-
-	if (!usbhs_get_dparam(priv, runtime_pwctrl)) {
-		usbhsc_power_ctrl(priv, 1);
-		usbhs_mod_autonomy_mode(priv);
-	}
+	int ret;
 
-	usbhs_platform_call(priv, phy_reset, pdev);
+	ret = reset_control_deassert(priv->rsts);
+	if (ret)
+		return ret;
 
-	usbhsc_schedule_notify_hotplug(pdev);
+	usbhsc_restore(dev);
 
 	return 0;
 }
-- 
2.43.0



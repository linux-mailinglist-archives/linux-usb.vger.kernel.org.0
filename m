Return-Path: <linux-usb+bounces-17874-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F459D9446
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 10:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B309162552
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 09:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29911D619F;
	Tue, 26 Nov 2024 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NrfxCNhi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B31D5ABD
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612891; cv=none; b=bJrvVh9z32zJCNq5znRBUxuhRoeZEqGWfrdCa6GwMVK3YzYUTw0rq3C92IKQ/hSwsI6kF0vRie8/uRbYKAeDlzXeBUqMDEPUSPY7zevJDMy76cSJc00orgMmQRfMgJAtoKmS9x+gan4GPaHB4eYHy9LLw+eULcy8riqmhDI/RYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612891; c=relaxed/simple;
	bh=yx8G5kN1dPvXv5haopV3811q4NYnuaEFQqxgpb3NT9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XJf3Z8W+6LCjWoAQKmugP8i5WFx7nnqosBE2+TD5av46QYVpx9V4ujVJ0QdusdWjsBO4oKIjSe7nA5pYH2ZTDphot+XN01yEggjaDZk+tBUppMRTWouc83Dg59Z09g8DKRifMN9pC7c3aOB23Nkpq5cuHAj5pjYWC1gsvbLicjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NrfxCNhi; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53da209492cso6811285e87.3
        for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612887; x=1733217687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YL9Ut0Si+rVh2q7F4JB/asIqIrf6jT+s8Jqs0j7Utvw=;
        b=NrfxCNhilBiejXHT9F52bpfhlKI8cP9bJGB16MQHlKRZvZwLiRszjJ90dAXJHV2zue
         VnJV35XznayLZuWj+EUz+sY9/XHmgGqjziXqcjSTzs+zUZ4Oh2HGpGWJicTe/jv9aw5i
         zKXCZHUQAO7SN2TmaGYUx5K8ioS4bH/T40pMN+WVMo3A9NAOu6iL4jSjycvU5FIOgKyu
         glDKSLCbYapA1ZzM5HtN+VR7zqxtLgVt1xDTlSPaXJpUMEmF0+rJQif9qTNO4xyMgb5E
         eGrF3e71XVu8bB5N/ms7UHFyUjoP9NdCjY2HrQ2vUoeBoE20kBz8lpr0gSW69LHIiEa9
         Su4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612887; x=1733217687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YL9Ut0Si+rVh2q7F4JB/asIqIrf6jT+s8Jqs0j7Utvw=;
        b=OXq3luX/X57MgLCHINVShbYXJ1C52iCb208Zb5HCfyz2Q3jj3/ogNGK74GpL6uJgcv
         Nah9ZoA++oxi2RCPsOsWLTLtDf5wn81z9VLvb37xQxdGo5dAqqrR+EwnY0rXiw7dzZjO
         xRlk4emv+kb9YOMCj99J+jH/IVT9D+5HsmO6RmcwDRjeO+UxVAgOfqkOn0kSgtHbi/4I
         48et+Voei70lBrDmnkJc8ccIjJ3/MwEyQPgOt+iQ5k0HvoGDFKLiNDds72vg9uRnHQzH
         4P3OYi91eKu7MZhOXBtkGu1Jo2g3i1+JkdFWUPaktUM8UHwn9LkzQzEiv6/NQpIPYjN+
         IQdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuoZ7LzAFfZLSVDpACYmMGTn04g5jDXAOBruEBI4W9db2W+imwt1CnFVng9q8O17iEvFsHTSXlA1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA15bX6p1SBez18ycxrUVwElYiKecmVmuapa6WWHHbEfjJLJC1
	79qgZERLPk3DVIpEfGVJC8fSR73xI30WHgaEUpS/YDL0NEywWbXB2Zq5m0u3mRY=
X-Gm-Gg: ASbGnctJcmCzJkZleOX0uFSOlevTqClv2hUPLwDIFqt//mHYK5+IvSjoUeZEojFGL7G
	KwKFf2aPqokIp0/FSB5gFwtNU1ufKrqQzsv15tUTSy4+kAEqDARKM8DOowuZ7f0EyI2kwLqxWIC
	E8gU1+8bAUze7HTF6PxYMrqmHELF4gkAxfPtVCVY+6R6brQqIVrgMzDI7xACZ7rmoj0nVKyp5cD
	empN/W5wtjYN0nD/pAz0s5NTTHNxGbNTf7vvgRNw8ehWYaj0/QUoJPKM+kCXa9BT/QvK+vfRab6
	fgs=
X-Google-Smtp-Source: AGHT+IEqjpoyWsGOaOphc9gwJtzIyZu0gka779JBN5g8gKK1cf1hZ2MPQM9ajRauQ6fRNW3ZJEX2Wg==
X-Received: by 2002:a05:6512:e86:b0:53d:de36:7069 with SMTP id 2adb3069b0e04-53dde36707cmr4605894e87.6.1732612887547;
        Tue, 26 Nov 2024 01:21:27 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:27 -0800 (PST)
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
	yoshihiro.shimoda.uh@renesas.com,
	christophe.jaillet@wanadoo.fr
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 13/15] arm64: dts: renesas: r9a08g045: Enable the system controller
Date: Tue, 26 Nov 2024 11:20:48 +0200
Message-Id: <20241126092050.1825607-14-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the system controller. It is needed for USB and SoC
identification.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 169561386f35..89cf57eb8389 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -207,7 +207,6 @@ sysc: system-controller@11020000 {
 			interrupt-names = "lpm_int", "ca55stbydone_int",
 					  "cm33stbyr_int", "ca55_deny";
 			#renesas,sysc-signal-cells = <2>;
-			status = "disabled";
 		};
 
 		pinctrl: pinctrl@11030000 {
-- 
2.39.2



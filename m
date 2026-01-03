Return-Path: <linux-usb+bounces-31879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6209FCEFCC6
	for <lists+linux-usb@lfdr.de>; Sat, 03 Jan 2026 09:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC2783027DB4
	for <lists+linux-usb@lfdr.de>; Sat,  3 Jan 2026 08:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1079F2F4A05;
	Sat,  3 Jan 2026 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fyl7+60J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0685D29B22F
	for <linux-usb@vger.kernel.org>; Sat,  3 Jan 2026 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767429204; cv=none; b=V7qGDECGyZY46jAT8cxv8B5aC/2Z50s38Ir+zxnrL+9xNt3rrqcLrbOvYElfj9l59ubq5Zx5RS2Hgvw8h8ax43pbESQPPxTZ+gonsl6ExrHTDBq+E/PnbUWYeV4wUO9gOhOwfJ6QPXBInRLYIAifVoCQa3Rfn0PKF1C3eXZpkBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767429204; c=relaxed/simple;
	bh=izi4VvU/qHkp/nGvi/OJ7celFPcbQBwlswNh4vYfIMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjkdDRJJyC2RukSQtNz33YPmpxKeEJmxpShCnbjNu61D4CfGp2MFl9g8Soc2SDAH05SRDmKqppfbYiY7XgbwVXJN5cF3AoTzucQj2f58uG2GVgOmBppj++iUIH2/wn3qGTJIO9A1RIECfmD+D+v9Fs5h07/I2q9GhTBglE22ML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fyl7+60J; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a099233e8dso106348265ad.3
        for <linux-usb@vger.kernel.org>; Sat, 03 Jan 2026 00:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767429202; x=1768034002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29VsiJqR0uFBbQHYC75VBavG4DpR3+cDRVjS52nwMSM=;
        b=Fyl7+60JpdPVFOBSwjT60+F8rl1CPaxLMz1yXxZLezLVX3nANOrDhW6yB21uyG42kS
         RiSgzPOiB3iwMKeCtBZSOmWhjkEcbuTqbABosuEn1bU0AFLy4A7BDp5klMKJc4/YQL3y
         9hlGLrhfEvmnH23G69GPULiG/IuHAUOZiTl5d9p1Uv81PeaaoR9hPCfrp7kyRZzli+/p
         byPdaNHodC9QNMeg8ETBmX7jIr2aA2Rv4Hz6soGXJk3DB4CKsj7zsOChbLfvHTp/BaTa
         1QYKC7RaLqOjLLq3qrsyMaLIyDrGiQlrWFZ1utYhtUKiMW6ZvrtiGn9JceI3PBs52nrV
         oh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767429202; x=1768034002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=29VsiJqR0uFBbQHYC75VBavG4DpR3+cDRVjS52nwMSM=;
        b=uZbGUeTHjy7UA4CdzIPC22DmpQSeKjCWxZV9/tSlTOpMnr2II3zoWVBRSkqRXestuu
         1HFvyZsn7CkGHFQljvzhO//3w4J17vQY0itg6L0rIo0ugrLQIRVLyPkRVkRJsRV0NW7E
         /Hzx/ILJmLdgC0oSOlqROO4J5b3p8bCQQimgq2rxetI0GwVOcW2w+eM8r1qtYuNsLfNN
         t90SvrsrzC9w+xRW1BiCLih34C4y3RuURHbs5ZdLJAkZ3eaS3VPSFsPTiaMAD49Cr5FP
         Ezrm/0lnJ5tw29fiJlWIKp+42cTtFrJlNYy6v8CEwtnSOpvHRWY4iI47ghCyfdf5Co/Y
         GQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh0wnsNGiJNGw1xXVdub0L4t9NIHkOJ4lZokc8LMDbVvWkEKAws3/JzadFG9LBpa7rBavOwd1+oXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNuEPreKslM6NkgWJBnfZK474eiRYhNkqv5iOkUgRGqVbVleoo
	M/jIin+2gRs+M3KA7VoyjbWy0Wd8CUuV9E0kdfeCNPJwBSm/UXoIsw1H
X-Gm-Gg: AY/fxX6XDzm1KtrE8zfX90/5sWwqhrPigiKDkT5prl5g0nBKXIMqnX1GNAr6eXqFy/Y
	yh/GBIPy55ZX+HSM73awvIlKSv7gR5rcZ2J+hzuzZpku7gxq/p+yNMcTWNZR0Bp4kYyqsH3K8qV
	27K5WZonD8UZrcl+R9+WaXWSjyDZKf18TwogKPu21x2iptzAUlnZMc2DOuN6wgbtbAJNTwuRD0g
	C/sAvLEj+O2oO2z3EhPiwbxB9OplWNPH5nsYIAgygwzhQ+hzVilG0aDrUTzFjtu/qu31jx0jD4w
	1LRaP6uzno+5NsPzG4me3a+tBqii//mcB0ksopMaYdIYFQI1DumgXhJV/zMDAiDCAmvpvKOhsyi
	5Wf1PdCP5JdaJp52suwDRJ1jMzWh76zlw+11bFeqtPBgk8TK2fV1QnTFboQcSoex8N1d4dx0f1e
	6Oz23BCw==
X-Google-Smtp-Source: AGHT+IEdATA9P7k2n5CWUx8yOsmhm/F/9su5pYtPk4wylobkfRFEAHqb0+3yD3t4l4QDFzSZPoWtgw==
X-Received: by 2002:a17:903:1c8:b0:2a1:3769:1cf8 with SMTP id d9443c01a7336-2a2f2734d5emr447661885ad.33.1767429202381;
        Sat, 03 Jan 2026 00:33:22 -0800 (PST)
Received: from rockpi-5b ([45.112.0.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm391700365ad.21.2026.01.03.00.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:33:21 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yongbo Zhang <giraffesnn123@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB TYPEC CLASS)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 2/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Fix USB host phy-supply on Rock 5b-5bp-5t SbC
Date: Sat,  3 Jan 2026 14:01:18 +0530
Message-ID: <20260103083232.9510-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260103083232.9510-1-linux.amoon@gmail.com>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB host USB2 and USB3 on the Rock 5B, 5BP, and 5T is powered by the
USB_HOST_PWREN_H gpio pin which is used to enable vcc5v0_host host
regulator which ensures proper power sequencing and management for onboard
Double-USB-HOST.

Update the u2phy2_host node to reference the correct phy-supply.

Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 0cd8ac7bf538..886d788572fc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -981,8 +981,7 @@ &u2phy2 {
 };
 
 &u2phy2_host {
-	/* connected to USB hub, which is powered by vcc5v0_sys */
-	phy-supply = <&vcc5v0_sys>;
+	phy-supply = <&vcc5v0_host>;
 	status = "okay";
 };
 
-- 
2.50.1



Return-Path: <linux-usb+bounces-23466-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB553A9CCBA
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 17:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 945001BC477C
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 15:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D9E28F53E;
	Fri, 25 Apr 2025 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="lchmvhlw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF5528BA9E
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594335; cv=none; b=AbBVU70YoNQlNf7o+lw6+VAfN98MyyetTeSs2dMLqVJqc2Nf4bQ34mVMdni2hrf9B3OuyrhVKfwz+JHjp39uqRdW+SWY8q7ZVqa/JXIq3TCv0hZ7wykSscNASqIsKlwX9V83TLkcfikISp0nKKG1MJfOav+GuQQx0iWMfo/Umz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594335; c=relaxed/simple;
	bh=+ce7+BTY4yeMzFbT6Akdy3KIL7k7OJDthEDgS6+rbEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gdSJCSyewq+e89deO3AHE2lMGaYzM3n1Ti3ZX5ZfQ3GFQVEpbp/vy2+GGFM7cJ4yjtd4l/jB48bO4mv9zJRZbIJJhv+7go+JgYp4gM4CpcoC3YKey3YPsvv9zxid6aW7qavSghr72Cxe6MctU7IrzZAZMTvAdIhVGs24ToQDO/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com; spf=pass smtp.mailfrom=thaumatec.com; dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b=lchmvhlw; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thaumatec.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acbb85ce788so471207866b.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 08:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1745594331; x=1746199131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OY31xp7Dll9vOIEOmAuyrG07iLGmNS/7kqtV/vhc5Y=;
        b=lchmvhlwO7bwGEgJBEgpZN/k4rav9vWLKDzd+soZMVH+Yz3KfIo4voaxR25W32u43K
         rWQ5Qs02bGwHRiGaSDpgKypd3HAQD3SVE4p+2ldw+nzx7CuWKxNvH+egV3h1Qyfd9+7Z
         Zvc32z+V3CaWVZ+9PMmgvZpzrFGeeHEuQqd6/IS7aN3cUyrxw/x0v3VH9urYRffqjTpX
         aZNTBP37pm2zShOoqvvJqbLMfKMGTrxMw6p1sYWqv21lmAdA3EIkRgXP5U3OFHDcmPbx
         L6q8YAwwSWf1JO05tPiiYeWQH+uLQVXfnpnHdYkbT6OSY+sFBUk6Cf2dSLhaXVuHCAvb
         4hmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594331; x=1746199131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OY31xp7Dll9vOIEOmAuyrG07iLGmNS/7kqtV/vhc5Y=;
        b=W1FGDoFReS4N/b9fn5GiN78WEC5pf5n0+CPmrBk4ZEdlPDOm4DDsIqouf20suvjK4u
         XiR9Nukz8860YFjtz5NnGkQIrEENN8O0Q3sbE2bdSxUw+xlw76RVXK+5/1Z9mypl1A6p
         copRUOJIzdr4FFhMezr3nGAhRPsPWlvjQsKvzHARlvcatNIZq8F0qwJDk9HHtYRS4N6g
         LZdIQsADN4Y/4oLeNNtHs77f9kRtCCYQPYar5Eq7Hc7M9habwjv2qc/Y/4VeHxM1LPqP
         tjL6i94SX3uYelCvLV9N58t0EIuHC1R4pa7LkQwSeDHQhnlkuEgA2ZaQ67M5nRZZquI2
         lNjA==
X-Gm-Message-State: AOJu0YyiDBpBgDOSjC09tMdL1ctn9O5hD5fU81cCYMNSeCrAaEQLhHWQ
	Ba9SviRlR2mqexuXA86TYo2g5yV24B+QnvtZvZ6tC8s/YpaLMJ69Zy0Eta9hjOE=
X-Gm-Gg: ASbGncskLySG0jL9ctx1XvjWe1exsSY+rvnYlgwEQRuqV4HHsUV5aLrZZAniwt2gDaI
	oDWK+sZeAiBl2eRzfCZqwbFQ+xvvzrYBoNc+KTeJqzmSSl+lY4L8BO7etfC61qxu1V6Pf/nKvJ1
	4IsJ9OGX745bFl+6C1Ii8qHK0dpOJ3Qd11R/XB3GwwUmu3EdrK4bklcPiSvxONEBjdu5hkP/tZm
	wLOz9lrj9HPZFtech914lRmAOezM6wVsQPu4d0tGge9VPyXnDBmNKAuHDu378QbfNguKEESnzh3
	V8XlvazfpWiveBESubY3oIkh7C85DLUKncH1pXz/gA773qO7N2Cbr9cAkw==
X-Google-Smtp-Source: AGHT+IF/D7KC9l8++rWqiUEiNq3eyx2s0Qq/rmeB9HU9Sb4W5K3CdWLHL8yd44YFf3+hogCSyIirhg==
X-Received: by 2002:a17:907:2dab:b0:acb:bbc4:3344 with SMTP id a640c23a62f3a-ace71098d8dmr246518666b.22.1745594330687;
        Fri, 25 Apr 2025 08:18:50 -0700 (PDT)
Received: from [127.0.1.1] ([185.164.142.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e59649fsm151099766b.85.2025.04.25.08.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:18:50 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Fri, 25 Apr 2025 17:18:10 +0200
Subject: [PATCH v2 5/5] arm64: dts: rockchip: disable unrouted USB
 controllers and PHY on RK3399 Puma with Haikou
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-onboard_usb_dev-v2-5-4a76a474a010@thaumatec.com>
References: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
In-Reply-To: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
To: Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2

From: Quentin Schulz <quentin.schulz@cherry.de>

The u2phy0_host port is the part of the USB PHY0 (namely the
HOST0_DP/DM lanes) which routes directly to the USB2.0 HOST
controller[1]. The other lanes of the PHY are routed to the USB3.0 OTG
controller (dwc3), which we do use.

The HOST0_DP/DM lanes aren't routed on RK3399 Puma so let's simply
disable the USB2.0 controllers.

USB3 OTG has been known to be unstable on RK3399 Puma Haikou for a
while, one of the recurring issues being that only USB2 is detected and
not USB3 in host mode. Reading the justification above and seeing that
we are keeping u2phy0_host in the Haikou carrierboard DTS probably may
have bothered you since it should be changed to u2phy0_otg. The issue is
that if it's switched to that, USB OTG on Haikou is entirely broken. I
have checked the routing in the Gerber file, the lanes are going to the
expected ball pins (that is, NOT HOST0_DP/DM).
u2phy0_host is for sure the wrong part of the PHY to use, but it's the
only one that works at the moment for that board so keep it until we
figure out what exactly is broken.

No intended functional change.

[1] https://rockchip.fr/Rockchip%20RK3399%20TRM%20V1.3%20Part2.pdf
    Chapter 2 USB2.0 PHY
Fixes: 2c66fc34e945 ("arm64: dts: rockchip: add RK3399-Q7 (Puma) SoM")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
index 947bbd62a6b09ce55320d0889ee8cf50ca59dfd4..93cefacc7a01ec8f9716de828077b3395a5e7696 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
@@ -292,14 +292,6 @@ &uart2 {
 	status = "okay";
 };
 
-&usb_host0_ehci {
-	status = "okay";
-};
-
-&usb_host0_ohci {
-	status = "okay";
-};
-
 &vopb {
 	status = "okay";
 };

-- 
2.43.0



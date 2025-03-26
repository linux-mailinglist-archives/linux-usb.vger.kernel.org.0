Return-Path: <linux-usb+bounces-22186-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFE5A71BF1
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 17:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30E59171BC2
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 16:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2999416A395;
	Wed, 26 Mar 2025 16:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="Hi416A8b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A8D11185
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 16:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743006733; cv=none; b=dXRqNb9F8RerL7dDsuxG0pr8X5FPt7mQoSNtQvLV/hoBfJvziePiXOPQymXUMbuxcXKcJ+ZOi2A2Pk2I6OocnWyDkcD0I0UN96KIYjWy6eHHyJRcz7pZ1Ea6owz+x0gkkZlfvf7JrmiAowj4yOsViAN7RNArXNWKl6dA6vGsAJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743006733; c=relaxed/simple;
	bh=sbUdINhLsUhhAyV0mvnO02l63FQfC+wlrb8lw8RlunI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQ/JrIjT6PZ3rAJIEoDpWwuY4X1SI6PeyL8akFp21nVG2K5CPaTLWT/uFF0EfjY6r+mCHz4fJ/rFL8IWaiuqkbZQIuYRccCDIVw/LV/xKmUgTGjsKhN40OcyUWicqJKAvLBhi8Sh4ba6E6tayPIXXs8bc+p65PCPXcmIZOXA4L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com; spf=pass smtp.mailfrom=thaumatec.com; dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b=Hi416A8b; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thaumatec.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso3975266b.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 09:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1743006730; x=1743611530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLyts1UbCS80soWAIK/VLH5pGMtL6M9HaPrhO/pX88s=;
        b=Hi416A8bTGiUgOd03eX9Yknms7znizFWF1FZ7KGUin+SZsrnno7xxA6izrkcqPzvJv
         KTpgAt3WXhXQ0JFgyTJoA4itG46LXfxk0v4W4HhpQE9NYauf2CSkNU298mABGKga4LF5
         uparfqVTjVPkD+9BtsojKowZXBhwgyJQV5ZnlatCasnfcl1L0QhJeQ/kzBHAkinUrzVo
         G7EEwPc64g9Zq4bKXIBGaSaREPIHOVhCrhc/TkzIO2gadnSjFJnWGjNhlXBuCBXq0ubo
         K9KuLCfmycOdkM0jx81DesQ0Kn5oFmXq2LjhQoeDuYjRDhlI3L0pgzbKA/EjA3fwWmwX
         5KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743006730; x=1743611530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLyts1UbCS80soWAIK/VLH5pGMtL6M9HaPrhO/pX88s=;
        b=tVcA5LKilqQRFsDusqcufUQDIlDR+uk/2aluiW9P5dnBukGm77dvhEJ2/2YKuU9D5t
         DM3oRmDuAXJzj5GcjEO/5+r/UANEn9kOG10ytZXI2JvIJJIuhVaz+AyfGKxPbgUZ9+It
         8SVVsVJIxEph9kfPRzt7YSi9iG8d/wKEu6mBc7IsAKxfxa9iJyxPVuKKjqRRQz4XX1SV
         98EC8rbKHfrHcjkUC0ityVZL+h9hlOvrPDgwFYm+yW0p7cTdypKNwf/CYeB52fB9tIcU
         /gaE9v4wkZxbjT+ApajNE0qKWBWIxFg69SguTNl2d0ElkrUPyT9APQ0jOdUeNNo1wxsQ
         vlfA==
X-Gm-Message-State: AOJu0YxUCJ3zJDNsGelwFXbLTL4p0KMKDqD1m+snS3ZRPscZg/HVXcVP
	SRNTQfp59PANx7nRgmkCRAthQAEiy6FgPzQlY7o3pFFDDqA0ZNSRhvB8qAvYVvZk569Gl5Xgx/+
	Ijx0=
X-Gm-Gg: ASbGncvgFGbrJE55OCrbRN5ELyxecTlr3XF+3/zBOU5BDcbCv+NQd2BuqUE4DYOBK82
	KjSzTPM2qxdyaQyokn8xgYhauwrfdlK3FnM5kSBpAwxptMTNdshqmRMGPeBNVMz95Rc1qPYU4cQ
	NuD0vgb8npBXGQiqc9YgPXhgxUqRhag3wD5k973f+lSzj/x5p3TgJvW2plYEVFejBeLApll+6i7
	xBHduhiDLBcErI2y0JCVzPHgBVxtDGOvvQyuz8gn1XtBj1VE+O6QzQlI+n0Q4obRqkO/jlhMYxZ
	gm57ld8J1P+VsVivMBGCrsIfR4AWEuCbx34foEOeplr5IYbtm06540BHSHvhH3ymcJ0w
X-Google-Smtp-Source: AGHT+IGuL6Nt4ApMHrsVVJxTN8kmsE+fO+syqOdRHUYnjFPTrq5knLFF6NaAbaKnyWcocuiQ/Tst8w==
X-Received: by 2002:a17:906:4fd4:b0:ac6:b639:5a1c with SMTP id a640c23a62f3a-ac6faefef90mr4899766b.22.1743006233086;
        Wed, 26 Mar 2025 09:23:53 -0700 (PDT)
Received: from [127.0.1.1] ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac6f0f498ecsm76678866b.135.2025.03.26.09.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 09:23:52 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Wed, 26 Mar 2025 17:22:59 +0100
Subject: [PATCH 4/5] arm64: dts: rockchip: disable unrouted USB controllers
 and PHY on RK3399 Puma
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-onboard_usb_dev-v1-4-a4b0a5d1b32c@thaumatec.com>
References: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
In-Reply-To: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
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
 quentin.schulz@cherry.de
X-Mailer: b4 0.13.0

From: Quentin Schulz <quentin.schulz@cherry.de>

The u2phy1_host port is the part of the USB PHY1 (namely the
HOST1_DP/DM lanes) which routes directly to the USB2.0 HOST
controller[1]. The other lanes of the PHY are routed to the USB3.0 OTG
controller (dwc3), which we do use.

The HOST1_DP/DM lanes aren't routed on RK3399 Puma so let's simply
disable the USB2.0 controllers and associated part in USB2.0 PHY.

No intended functional change.

[1] https://rockchip.fr/Rockchip%20RK3399%20TRM%20V1.3%20Part2.pdf
    Chapter 2 USB2.0 PHY
Fixes: 2c66fc34e945 ("arm64: dts: rockchip: add RK3399-Q7 (Puma) SoM")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index 3a9049372e12..d0d867374b3f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -579,10 +579,6 @@ &u2phy1 {
 	u2phy1_otg: otg-port {
 		status = "okay";
 	};
-
-	u2phy1_host: host-port {
-		status = "okay";
-	};
 };
 
 &usbdrd3_1 {
@@ -611,11 +607,3 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
 	};
 };
-
-&usb_host1_ehci {
-	status = "okay";
-};
-
-&usb_host1_ohci {
-	status = "okay";
-};

-- 
2.43.0



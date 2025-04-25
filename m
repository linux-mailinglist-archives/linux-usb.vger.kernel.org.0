Return-Path: <linux-usb+bounces-23464-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2B3A9CCB2
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 17:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C97041BC274E
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 15:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4D028CF73;
	Fri, 25 Apr 2025 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="sQWUlTDm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFB52820D1
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 15:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594332; cv=none; b=dMAHJvDMlpQz7xJeZqbvogZbJbfXR2i2EVXzBqJrsa4zXzrvoe5LnadDdkcfC8CLueZ36u8Oc7Mpyt2AwnTC40doXJtS5ay1K88xwb+C92FWGCrMxzUQsOsG1W1KJ6rMqLTnQB3ahRB7bhZSeMFldNPQVXJHmuH5hVamlii5dAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594332; c=relaxed/simple;
	bh=OraUiKfm1Dyuf5j7XdekXggByDjVCkBh3H2EGp18ffI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/0DZ2gbyEyOQatg01GxwmEle6Pi9vX+7VE/XGw+W23ow9WsrO7wpwgJwvEcgZa902locYAdiPmLWk4hrxtlSynLzxGy2h21t3Ip/D+sn9KbeHUVMzwi19K2KXRRjfdN8V3Bp/6iJHB5Ws6ndUIR45N2O/kyiFPdgTEFr88GtkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com; spf=pass smtp.mailfrom=thaumatec.com; dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b=sQWUlTDm; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thaumatec.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so4593879a12.0
        for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 08:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1745594328; x=1746199128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NqGpeCgEQAUcPs6hxmWuzzpxKmr/yNO0w1y1ZqO3+o=;
        b=sQWUlTDmlF9kKrpIOx2QFPry03qIbhgA1GzI4Mq8Vt8juEe8Pryqngtr0hc5SMEpiA
         QqEKmwgYjNmLWatq8Hquxw+tJ3OSrMJV8PSD2e6TlkVtXvquv4u+k3J2kT+tqsi5Pb9/
         YlCJvNjxSYvZJABQYl7GYAtKQJzGOM3iQmKi+c9Gdp/JzjD0+1O+cXOfKOMWZiP529jC
         g/DDqh9CXMtWOxmYtdWNG99k+WjO3TdcgvfNztchA4xluN4rS1ITI55IIJPfInglxcma
         DZo7f9zRMohQClSlYRjpfUkqHUnnQRvOLy8F64lUsPSNRgH7JsrDlA2sVaT+KQ5qbm2S
         TN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594328; x=1746199128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NqGpeCgEQAUcPs6hxmWuzzpxKmr/yNO0w1y1ZqO3+o=;
        b=nyWl+De2f/pwA3L+QXDydk0c99odLxpaez1UuCSiP1ZtHoEVF3s/N3sbgC+oSyb8Lf
         aY2K8MmNIh4CiGpW3YFyYuQ/ohbqK0uRDk00KtMmELvtpsDx4XwtW1rdAHIaerWRYI+y
         JSIuCx9Vei2jHZbVmW8CUGt7O4U96GxU3HW3NQxnXeDCAF2zfZ2BHAnUCzoMZ80fQsk3
         a05hgtn0iiqjeaZzdvoW9OH+eteo6iqKsXY+QR54vHtEByVm2yzK6a8c/gBme/v2yqzD
         9xwG4KHfOxbJV0hTSucthW5eAIvxdxYckJEaMCe7Z5qWogrT7/TfhDOVq9t1DOURIoTc
         tqMg==
X-Gm-Message-State: AOJu0YyqB3K0O6aLCjsS2A5fmhLHW6MHSk+n9I0pcB1jDDeqLeqp7B9k
	KNHwRl64aEhVcDvHnpp+Tx1c6l87K2Jfg1N6N0yXY1NHKpThqVZdPI0Z4g0H1ZlffZ1StnwTkwY
	EQCs=
X-Gm-Gg: ASbGncvenREUbXbk8DOBbUpI9uRKlZWnLRlD509rTPDKOe9aQv5KZ6YK6cIb866aIwF
	2lFRebJAGHPuSmObIFc0U0vSre5Sbrlt5v4nC62qhe/TJC+8Wb97Hn6josPGW1TaI8rTH5d9/Zv
	hgZ5Dc5Pp2PZ3zq2l9JqcStoOnYXjukKC5gcQdr1PMCgy3g95Ke7TY4JKy+UN7yLKN39Qr+IxmL
	wvRderKpx9MBQqYcFxC+vayfUJDt9mquC96ax9Cyk2QmVNJK3HOX34XXJzSy4YknBcW3/fhgxcv
	0VVy4ns8sLv+HTcRNvyvn2E/t85jBHAjEvzy4EO3HmqP45UFzDVaqUAC+Q==
X-Google-Smtp-Source: AGHT+IEUamcP+7odYOOdpoBpwq4Ga4sU/sBxRb/GHkSRX9M2Uw0bvZNoH1NBuPxH9S4vCQHnw3MNhg==
X-Received: by 2002:a17:907:72cf:b0:ac7:150e:8013 with SMTP id a640c23a62f3a-ace710a20a1mr291795166b.15.1745594328214;
        Fri, 25 Apr 2025 08:18:48 -0700 (PDT)
Received: from [127.0.1.1] ([185.164.142.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e59649fsm151099766b.85.2025.04.25.08.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:18:48 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Fri, 25 Apr 2025 17:18:08 +0200
Subject: [PATCH v2 3/5] arm64: dts: rockchip: fix internal USB hub
 instability on RK3399 Puma
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250425-onboard_usb_dev-v2-3-4a76a474a010@thaumatec.com>
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
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

Currently, the onboard Cypress CYUSB3304 USB hub is not defined in
the device tree, and hub reset pin is provided as vcc5v0_host
regulator to usb phy. This causes instability issues, as a result
of improper reset duration.

The fixed regulator device requests the GPIO during probe in its
inactive state (except if regulator-boot-on property is set, in
which case it is requested in the active state). Considering gpio
is GPIO_ACTIVE_LOW for Puma, it means it’s driving it high. Then
the regulator gets enabled (because regulator-always-on property),
which drives it to its active state, meaning driving it low.

The Cypress CYUSB3304 USB hub actually requires the reset to be
asserted for at least 5 ms, which we cannot guarantee right now
since there's no delay in the current config, meaning the hub may
sometimes work or not. We could add delay as offered by
fixed-regulator but let's rather fix this by using the proper way
to model onboard USB hubs.

Define hub_2_0 and hub_3_0 nodes, as the onboard Cypress hub
consist of two 'logical' hubs, for USB2.0 and USB3.0.
Use the 'reset-gpios' property of hub to assign reset pin instead
of using regulator. Rename the vcc5v0_host regulator to
cy3304_reset to be more meaningful. Pin is configured to
output-high by default, which sets the hub in reset state
during pin controller initialization. This allows to avoid double
enumeration of devices in case the bootloader has setup the USB
hub before the kernel.
The vdd-supply and vdd2-supply properties in hub nodes are
added to provide correct dt-bindings, although power supplies are
always enabled based on HW design.

Fixes: 2c66fc34e945 ("arm64: dts: rockchip: add RK3399-Q7 (Puma) SoM")
Cc: stable@vger.kernel.org # 6.6
Cc: stable@vger.kernel.org # Backport of the patch in this series fixing product ID in onboard_dev_id_table in drivers/usb/misc/onboard_usb_dev.c driver
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 40 +++++++++++++++++----------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index 995b30a7aae01a0326e9f80d6be930f227968539..dd5a9bca26d1d221607e73071685d5774330d760 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -60,16 +60,6 @@ vcc3v3_sys: regulator-vcc3v3-sys {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-	vcc5v0_host: regulator-vcc5v0-host {
-		compatible = "regulator-fixed";
-		gpio = <&gpio4 RK_PA3 GPIO_ACTIVE_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc5v0_host_en>;
-		regulator-name = "vcc5v0_host";
-		regulator-always-on;
-		vin-supply = <&vcc5v0_sys>;
-	};
-
 	vcc5v0_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_sys";
@@ -521,10 +511,10 @@ pmic_int_l: pmic-int-l {
 		};
 	};
 
-	usb2 {
-		vcc5v0_host_en: vcc5v0-host-en {
+	usb {
+		cy3304_reset: cy3304-reset {
 			rockchip,pins =
-			  <4 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
+			  <4 RK_PA3 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 
@@ -591,7 +581,6 @@ u2phy1_otg: otg-port {
 	};
 
 	u2phy1_host: host-port {
-		phy-supply = <&vcc5v0_host>;
 		status = "okay";
 	};
 };
@@ -603,6 +592,29 @@ &usbdrd3_1 {
 &usbdrd_dwc3_1 {
 	status = "okay";
 	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&cy3304_reset>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
+		vdd-supply = <&vcc1v2_phy>;
+		vdd2-supply = <&vcc3v3_sys>;
+
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
+		vdd-supply = <&vcc1v2_phy>;
+		vdd2-supply = <&vcc3v3_sys>;
+	};
 };
 
 &usb_host1_ehci {

-- 
2.43.0



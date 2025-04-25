Return-Path: <linux-usb+bounces-23461-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C8BA9CCBE
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 17:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DDED5A6B3D
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 15:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BD1288C8A;
	Fri, 25 Apr 2025 15:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="PR1frhJw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB8C25E804
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594330; cv=none; b=Xzu6Bei/RhUhAoguHvm5p/Vh6XXRCUBET6rZAjn8Se7jxNuNxk8zzasFqovsZ0WM9ccN2F3PiQrJG+xVYUeDWbgp4dAgA/As8RSpyCym1ELgIsy0gINBlSQs8AtognYIftHJykrzqZsUej5vMrwRfVzuIMWtC1lO7Jc44Ei4FYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594330; c=relaxed/simple;
	bh=oNHQdseGba9iDo9kIAZ1Ni9JcRGkmGb+Y7y0dTTMQw8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lPoFf1e/tB67skhc0yAc0RqZCuinP1FO5TaVIfxjSxVDi4mVa81pz79PShySSBzuu9iwPvIoZaehYN3r/aDBUKZtjodKhspjq3c+k5ZxF+ZWbV956Pdus9aLEzENscnqQKPqMmxdymaFz6+9oEsCYWEEUzFCuPYwd9ABsI2RHTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com; spf=pass smtp.mailfrom=thaumatec.com; dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b=PR1frhJw; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thaumatec.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so361468466b.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1745594325; x=1746199125; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ghCaB0hzHCWB/lFbG9vF6MwKWZS9AGmGkqVTq/KrfM=;
        b=PR1frhJw27AALlQ/efJfVbTpeGPFq1KnIDmhbIe2ehkALQq+crll5mo1a2Nhaj4KiC
         zgimTKLMt5Hfnl0c74V//6UWlq50ElZ0WWQJeoAaqxPuJj5uKGfGxFxirh/cFFZRAMy2
         mzMAi2iYGcA8uEdLksoaCwuqCi4Pbt7WVachXVUGWqHNeffQLHZn6QQlRdXeMSrQgiJT
         6yJLclQTs3jHQI9yDmUFIvtEC0RvLlS1r9q/byyXDL0eH+9TiXV+2iORuv6npib25mxt
         KZR9neugJ6qISukWkAbTHQeU19IMk+Thy2m1j2rP8W6qnf7yRw3fol9NBHRf2XXC79NH
         4hhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594325; x=1746199125;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ghCaB0hzHCWB/lFbG9vF6MwKWZS9AGmGkqVTq/KrfM=;
        b=sJnLccq+rWSwkD6j1jjU/fuNemJMIOCehLLmeDlrDnOyKHV/lVsL6N651qxaTk7ZL4
         T1MgkdpP/CgCghsrzOM3mCQdQ5srACK3VtiR3j3OGqHWvG+I7HmzWTOHfPCz/7pj2/V8
         PrPH+imWnTVR9ATCk6qiQ2wSOZkdg5qkE9EHByk850Uniy68VL51iJYpBIkOaedewGaW
         nkJdu0ttkZypzFF1x6SWV4hMPibo76UeYtfMyJeGoPMJ5aKQrzGD62OdPY2YQdXphAd8
         c9mGiIc4xfniaXpQ7R2cngFolY5JMNa4AFYSYVXiKCAs/hcigr/weOEM19X3YIA134Xt
         79zA==
X-Gm-Message-State: AOJu0Yw3PHnYP5Y8CbusbWP2KilwdXVFMeig7/ckgRE1DQmb8dNOhqZL
	8uLxbWTLGqEbd8ZKrdM0I4kHLGe4CfMz0TVI2I+ra3P7DoY1hbprea1CAJzyLXEPf0HEfsRCZp7
	/3JY=
X-Gm-Gg: ASbGncvoWeIo211/cNjXZT5iZNcBdak5XXWZuRH8jW+LK9LKm93c/ypAf/gfT3TwZXf
	VTrXjQEtNllNGzskyBrK4lP6+MZ4NgYhDP0AJGOHq7EbjZSFOYzKFV0m4nFsDybEU+NszoSinLi
	JwnqVluLj8RT4hdb6/DrQW9k0G1RGey19ynjLQV7jnS9KOX1fsGxvhrrqc1UmsHOWjQRyGri9Rz
	2hf7QcrYKbENYPsPbIwSJffaJ1Z08DW1eke7BbMrdAqjmqkiZm1CptAyQgS7mNVAq7/vivPQwef
	pW4IWpfuP5pnBFm+Rg66ZghrdJ36djWbTcUkSlHRIBluSCzVbUHOwpncbzhCk//fUg5d
X-Google-Smtp-Source: AGHT+IHZJ81zFkmLlmOHjq8b1Drpt97ks2gb1lVoqv7+XTRItZNdJHhWhZeKg3aZUqr8AUurmOKZUQ==
X-Received: by 2002:a17:907:6d27:b0:ac6:edd3:e466 with SMTP id a640c23a62f3a-ace710b0b78mr299551666b.19.1745594325144;
        Fri, 25 Apr 2025 08:18:45 -0700 (PDT)
Received: from [127.0.1.1] ([185.164.142.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e59649fsm151099766b.85.2025.04.25.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:18:44 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Subject: [PATCH v2 0/5] Fix onboard USB hub instability on RK3399 Puma SoM
Date: Fri, 25 Apr 2025 17:18:05 +0200
Message-Id: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK6nC2gC/3WOzW7DIBAGX8XiXCrAQLBPfY8qipYfxyvVdgLYa
 hXl3bt2Dj31+CF2Zh6spIypsL55sJw2LLjMNNRbw8II8zVxjLSZEsqIVlm+zH6BHC9r8ZeYNg6
 nIGwLDow0jK5uOQ34fRA/z7RHLHXJP4dgk/vr/6xNcsFBewEmSt+q8FFHWCeoKbyHZWLn50uQ0
 32l0vqy/IVS947W0vBYucc54nzlROdEx5A4QW5Q0X+lwqVzw4lUTnrdb2pv91COPxPWvnGtBg3
 WdbbrRCdACxultcqLFoYBnJfGRNJR1fMXyU7UBEcBAAA=
X-Change-ID: 20250326-onboard_usb_dev-a7c063a8a515
To: Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, stable@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2

The RK3399 Puma SoM contains the internal Cypress CYUSB3304 USB
hub, that shows instability due to improper reset pin configuration.
Currently reset pin is modeled as a vcc5v0_host regulator, that
might result in too short reset pulse duration.
Starting with the v6.6, the Onboard USB hub driver (later renamed
to Onboard USB dev) contains support for Cypress HX3 hub family.
It can be now used to correctly model the RK3399 Puma SoM hardware.

The first commits in this series fix the onboard USB dev driver to
support all HX3 hub variants, including the CYUSB3304 found in
the RK3399 Puma SoM. 
This allows to introduce fix for internal USB hub instability on
RK3399 Puma, by replacing the vcc5v0_host regulator with
cy3304_reset, used inside the hub node.
Please be aware that the patch that fixes USB hub instability in
arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi can me merged only
after updating the Onboard USB dev driver, otherwise the hub
will not work. 

Two last commits in the series disable unrouted USB controllers
and PHYs on RK3399 Puma SOM and Haikou carrier board, with no
intended functional changes.

This series depends on the patch:
Link:  https://lore.kernel.org/linux-usb/20250418-dt-binding-usb-device-compatibles-v2-1-b3029f14e800@cherry.de/
("dt-bindings: usb: usb-device: relax compatible pattern to a contains")

Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
Changes in v2:
- Removed additional entries from onboard_dev_match table and
  updated dt-bindings list, as suggested by Krzysztof and Conor.
  Fallback compatible entry in SoM's dtsi file is used instead.
- Added vdd-supply and vdd2-supply entries to onboard hub nodes
  to satisfy bindings checks.
- Changed the default cy3304-reset pin configuration to pcfg_output_high.
- Added dependency to: change-id: 20250415-dt-binding-usb-device-compatibles-188f7b0a81b4
- Link to v1: https://lore.kernel.org/r/20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com

---
Lukasz Czechowski (3):
      usb: misc: onboard_usb_dev: fix support for Cypress HX3 hubs
      dt-bindings: usb: cypress,hx3: Add support for all variants
      arm64: dts: rockchip: fix internal USB hub instability on RK3399 Puma

Quentin Schulz (2):
      arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma
      arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma with Haikou

 .../devicetree/bindings/usb/cypress,hx3.yaml       | 19 +++++++--
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |  8 ----
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      | 48 +++++++++++-----------
 drivers/usb/misc/onboard_usb_dev.c                 | 10 ++++-
 4 files changed, 48 insertions(+), 37 deletions(-)
---
base-commit: 834a4a689699090a406d1662b03affa8b155d025
change-id: 20250326-onboard_usb_dev-a7c063a8a515
prerequisite-change-id: 20250415-dt-binding-usb-device-compatibles-188f7b0a81b4:v2
prerequisite-patch-id: f5b90f95302ac9065fbbe5244cc7845c2a772ab6

Best regards,
-- 
Lukasz Czechowski <lukasz.czechowski@thaumatec.com>



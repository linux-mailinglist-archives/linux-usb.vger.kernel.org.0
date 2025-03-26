Return-Path: <linux-usb+bounces-22182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D92A71BB9
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 17:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C2713BC76E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 16:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40521F7911;
	Wed, 26 Mar 2025 16:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="RRRbODCm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114CA1F560D
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743006234; cv=none; b=ftqTpdfugVP38mKYG1iA3F8W1ehdD/enH2l4h6E4020XBSYJAalBujHBWA6m/HJu3cNkN0D4aHQWFh9OpxMOMH8XG+AEiMGvhske719PB3145GbXfXnA08DWpt7x/LOy+m6/PpbFi9B6HGpWgzm/GrEx+aidf4JK4xExKpaxFvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743006234; c=relaxed/simple;
	bh=PeEgCfBvUgiOjdlm8XMEYe+at2eqiLHn8dkuleqfmAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PPB3AOFIZqc8ESHnROc09YBSibMvV33sn62vWLIvU6Hh0awCimRUxyRr/EHJpCO5rDjf1CxkxKTiy5TXT0hDydU3jw2VcwvXavU7g1qfd2FwN2UgqzY31vRyOf91YoWttgujnXvQvIjBqxFbfb/sW8YjdVihjKHvsbaeG/zIH7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com; spf=pass smtp.mailfrom=thaumatec.com; dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b=RRRbODCm; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thaumatec.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac29af3382dso1186143166b.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 09:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1743006230; x=1743611030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9tCKOxWlZzVo+LW0OfZaKnD5ARH/KKbqzp36dlNLJM=;
        b=RRRbODCm2LHcPlpkQaQqOc/Puj2Or9Bj5XdulAevFh0ud/qukCO75P+4YPpZJbn/iq
         9SkpVndWh1PAh9YPIgLEhHoDRyv8QSUYPwNRFiAHqyGir6030Qa9kLCOBO0ZBrg4rwlx
         KYVucIlPZVexwY0o6PiBpke4W+MECeWkDvY+NabYNdiAInVxlJXL3nlthuMEdEtV3OP0
         PwmhUSDCVi9QlAy8jdomeOgzfvJ3ZgGJ4W5OLld0lNjsPmn+MniJO56pVB0jlA0IYSVz
         LsBg7gc3cVZ/i0PpBk6DSwmsBHOy/0pZ8U4Dh5woYvDnihRIvWP1g57FJQ0vJtbpLdCJ
         iyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743006230; x=1743611030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9tCKOxWlZzVo+LW0OfZaKnD5ARH/KKbqzp36dlNLJM=;
        b=gsURUg2XmLjSpXmM8bIJ97cjXda44dJggUBH0gOGkiOcLKW7lv7RctaytxXBpFx/av
         xnDUonAS2+PBOz30YaT7YozwwiBnVJkpdIA9yeyLZv14zMWTErtdxcsh1OwFymfbTc2v
         lBiOomp2ECUZg7xAy1RQtkOfEH5lq73IETZhEbMbXl5EmNrKTY4C5ubUDleQuosewkv9
         ODu47I87FVWvKEL3VzZi3uKfdCYToWpD9t1u4zvG+wmAqSQpWrQD5DVKpX7/zODFQfan
         1kLLexJ8FqsKRewgiOYt/PieXTs/s8pGWKDBXwhvfZpPYuOXL4RYmGnwiP9QO3zeJac3
         G35Q==
X-Gm-Message-State: AOJu0YxKXFIHp8S7EfDaWj8pKsFmR3V+iMzo239c5/U1XpVCQ60bW2o9
	BbyzBmjMUA+O1ZfHmeWgL5sHaBFj3g3cmsshqawVyTIN3NmymSzmH9VRR+8BVSM=
X-Gm-Gg: ASbGncs1qEsUKOjKu/B5ppAcdBIMlrLLhRP1eHiy2qbr6JqniRqGh1gE411aKreujZ2
	cOM/LaPcnm14ZHibgwdAEJqASn01h3otlEy3gd03yS5xvc9i1XA4vbpuLr22OnCHJr2N6ZuNAVx
	h+yiJDdhwntEsYmOgujMOeYtxOQl6HGRaaV5RURz/OAPGWBRaYntBICrkc6Q4tDjnUtp8XDJmtU
	soOsYuOUwjyt09A8A+tB9sxNtIpfDPSptbo0uKdF4sZdY/G8an9v1fvsmM8zfR2yTtV1CIcMlsD
	hkOJjHuUbeJMTkLroOYC0iL/4D8UlIRKw36JBFbm5Ne9bBeXiO9Sn3qoXA==
X-Google-Smtp-Source: AGHT+IFR7MKgek1aYBM8pLPyUk2XklCCGA9XeiQoGfN17QwCt+mtrdcAqb3TA1eUWqsMBXRD9Qv/5A==
X-Received: by 2002:a17:906:794a:b0:ac2:dfcf:3e09 with SMTP id a640c23a62f3a-ac6fb100848mr1832966b.43.1743006230250;
        Wed, 26 Mar 2025 09:23:50 -0700 (PDT)
Received: from [127.0.1.1] ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac6f0f498ecsm76678866b.135.2025.03.26.09.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 09:23:50 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Wed, 26 Mar 2025 17:22:56 +0100
Subject: [PATCH 1/5] usb: misc: onboard_usb_dev: fix support for Cypress
 HX3 hubs
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-onboard_usb_dev-v1-1-a4b0a5d1b32c@thaumatec.com>
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
 quentin.schulz@cherry.de, stable@vger.kernel.org
X-Mailer: b4 0.13.0

The Cypress HX3 USB3.0 hubs use different PID values depending
on the product variant. The comment in compatibles table is
misleading, as the currently used PIDs (0x6504 and 0x6506 for
USB 3.0 and USB 2.0, respectively) are defaults for the CYUSB331x,
while CYUSB330x and CYUSB332x variants use different values.
Based on the datasheet [1], update the compatible usb devices table
to handle different types of the hub.
The change also includes vendor mode PIDs, which are used by the
hub in I2C Master boot mode, if connected EEPROM contains invalid
signature or is blank. This allows to correctly boot the hub even
if the EEPROM will have broken content.
Number of vcc supplies and timing requirements are the same for all
HX variants, so reuse existing onboard_hub_pdata.

[1] https://www.infineon.com/dgdl/Infineon-HX3_USB_3_0_Hub_Consumer_Industrial-DataSheet-v22_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ecb53f644b8
    Table 9. PID Values

Fixes: b43cd82a1a40 ("usb: misc: onboard-hub: add support for Cypress HX3 USB 3.0 family")
Cc: stable@vger.kernel.org
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 10 ++++++++--
 drivers/usb/misc/onboard_usb_dev.h |  6 ++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 75ac3c6aa92d..f5372dfa241a 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -569,8 +569,14 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
-	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6504) }, /* CYUSB33{0,1,2}x/CYUSB230x 3.0 HUB */
-	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6506) }, /* CYUSB33{0,1,2}x/CYUSB230x 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6500) }, /* CYUSB330x 3.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6502) }, /* CYUSB330x 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6503) }, /* CYUSB33{0,1}x 2.0 HUB, Vendor Mode */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6504) }, /* CYUSB331x 3.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6506) }, /* CYUSB331x 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6507) }, /* CYUSB332x 2.0 HUB, Vendor Mode */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6508) }, /* CYUSB332x 3.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x650a) }, /* CYUSB332x 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6570) }, /* CY7C6563x 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 317b3eb99c02..17696f7c5e43 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -104,8 +104,14 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb451,8027", .data = &ti_tusb8020b_data, },
 	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
 	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
+	{ .compatible = "usb4b4,6500", .data = &cypress_hx3_data, },
+	{ .compatible = "usb4b4,6502", .data = &cypress_hx3_data, },
+	{ .compatible = "usb4b4,6503", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6504", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6506", .data = &cypress_hx3_data, },
+	{ .compatible = "usb4b4,6507", .data = &cypress_hx3_data, },
+	{ .compatible = "usb4b4,6508", .data = &cypress_hx3_data, },
+	{ .compatible = "usb4b4,650a", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6570", .data = &cypress_hx2vl_data, },
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },

-- 
2.43.0



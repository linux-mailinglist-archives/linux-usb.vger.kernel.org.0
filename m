Return-Path: <linux-usb+bounces-23462-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7C7A9CCAF
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 17:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 373C31BC23D8
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 15:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D305E289343;
	Fri, 25 Apr 2025 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="mND5F44k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA33C26A0DD
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594330; cv=none; b=Hq0ZtIAEADrB4BOt1Racay+/kNso6oI7L60BBckxT0yhTisZsq1fRNiSg8tMTImVmgDUWqSy0EQtbIiPjofyIF/f/bstplbLUZlQhCkO5ViROK1RihGNmtYED3A0aFKV+3pvWzA6zeSnodToHqQWI1NmHBWdfmqiTtC+Pu/YlfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594330; c=relaxed/simple;
	bh=GvHZb4LgvZavNrWnrHHNVHTVupagN/UULTDDQRYT6M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VrzYazovcd/JieRhUBrHWFuUzfVNuOjNAKW5KUj6NFzz4wU1XdBp0jPvtICkThExT39FefqWT+HPbCZ5w/psdv+4QlM61NJ4AIbaVyvj5T8pW0ptVBfvyBKOFRHTLR8Jt9e6991GFCiTUd93acDShZ0xsMKVxIOOItpndqSSMQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com; spf=pass smtp.mailfrom=thaumatec.com; dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b=mND5F44k; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thaumatec.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso427118666b.0
        for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 08:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1745594326; x=1746199126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+M5rdkwGZu/VDL8llLe2S9tCSCM0PahPEImRhTBfwfY=;
        b=mND5F44k0QwjtBBmXX5EcdauDd8m0T9azY1HnqsaCbDhWTQEaaWXzMH1j9Uhdr9M9b
         pl2/Z2QCgDdJVPkVsBQfy4PulI8tkqnYDQQS0WCKpoF8uYx9luHpqRYpdAUAsbLFRXiw
         WyGsqQYAKyR2JDgWzWQK61rDJCDUKgwgMFF/giJLmVhI7gb67juI5Z6d3txSq0vAb78g
         L/Ddq8SkQz5NwQxIXCVnVRcSiJE67HWwda4wGtywAmqtVTEm/nSmUthbCXj/8ETT0mX+
         8vyyce3DVasTIlJrgG5SAlnh9id6rggo+LciH3MkDkRKT8+swkYtw8oFi1ALjLfmosAT
         xhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594326; x=1746199126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+M5rdkwGZu/VDL8llLe2S9tCSCM0PahPEImRhTBfwfY=;
        b=fdqM6sjYhW0kd+gZzy+nh+2wFI6GqYmNLFA/h/MoyNb67WgBatkPaP8XfjuxqZHPoy
         HLexLpSE4Fk/y5y9Ne8taRnvWWx5M+Yyp16nMfK1NzLDRF5EozahGcI5EnDDlgqvRf3x
         OAt9k0BKZYEXHyUDqLxYFwMAAS2N9jEeet0Ef/wu83rdcpMd8bXOnvFI0PDgtZMqyqVa
         SI3Y9TyCBFcK2h3QNvzBJu79HCZTaXnF2wQitgfmWS0m4fmIo5MuuRi1pvF8hTE3SBdb
         EikGegDj1pHwBR3dfE4Dk5WvrptsHfDbN/Ein33rAHwhXlp7qarHN35goppaj2/HoQW2
         KbXg==
X-Gm-Message-State: AOJu0YyBRyDGJpIFHotulKn8JSv1L3mptcpM3W+5J9PjxMKjepoOXd7h
	Y2epETFde5IMTiOs0ATTvObaRF9NVpccpWz6kLEdnBuz0ohHK8oFbEUJ/9KTG3w=
X-Gm-Gg: ASbGncvdPzDgDwkZ8TYCgXrFrDoLY5yyDWpu2a9AJtcwoay6wfPahsReE2+K3v3xKwd
	UxqcaXNNj98r3o8gYz59p5oDZoA7n6zYzsW4d5NdLQ2p//8aXZoUTfzH0qW57HWarAg+9bAg14G
	NDIYqJAeIDD/hhy6qEN9alCVYBT23nLpLbq2pycV6A8z9bwRoOZ6kN9QzPWn1Bip009DSUXdo5E
	+U1ObiTNowy9cSZIiuZyE7kgJjKTN/Q6tKQ4HF6KjU0hgY81ik7Uh/3iMIZr90tzXBIhJFFP5MK
	OMVTDViuSbLdtYC6tw+lQtJ5daSLyUbOEkR80xRvLRRjBsgta1LIKBVAc1b2LV5Mrcrk
X-Google-Smtp-Source: AGHT+IHaoG8RjUwrvQSyvJG6aKSZajj5vFrhmm1pCthBlIn1lk/zpPP3YRLIRhFmyc6BfcY/0PDTEA==
X-Received: by 2002:a17:907:1c08:b0:ac2:9ac:a062 with SMTP id a640c23a62f3a-ace73a45d0dmr248025266b.23.1745594326097;
        Fri, 25 Apr 2025 08:18:46 -0700 (PDT)
Received: from [127.0.1.1] ([185.164.142.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e59649fsm151099766b.85.2025.04.25.08.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:18:45 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Fri, 25 Apr 2025 17:18:06 +0200
Subject: [PATCH v2 1/5] usb: misc: onboard_usb_dev: fix support for Cypress
 HX3 hubs
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-onboard_usb_dev-v2-1-4a76a474a010@thaumatec.com>
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
HX variants, so the platform driver's match table does not have to
be extended.

[1] https://www.infineon.com/dgdl/Infineon-HX3_USB_3_0_Hub_Consumer_Industrial-DataSheet-v22_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ecb53f644b8
    Table 9. PID Values

Fixes: b43cd82a1a40 ("usb: misc: onboard-hub: add support for Cypress HX3 USB 3.0 family")
Cc: stable@vger.kernel.org
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 75ac3c6aa92d0d925bb9488d1e6295548446bf98..f5372dfa241a9cee09fea95fd14b72727a149b2e 100644
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

-- 
2.43.0



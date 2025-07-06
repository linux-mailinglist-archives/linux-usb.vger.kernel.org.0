Return-Path: <linux-usb+bounces-25374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DC1AF0130
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 19:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67311173DFF
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 17:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEAF2820A7;
	Tue,  1 Jul 2025 17:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNulYtlH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF74627E07B;
	Tue,  1 Jul 2025 17:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389358; cv=none; b=JsUKz2YSMLHgkczgyQMixo8xC2Z52UvqdlQajz7fY6fbEsipK4EbuFxpWZ9dviBqLok4Ej0R1xUlYIBzaoOLiwI35d/Q0x3vugA6Nj8cjS3JtBf6gI9ME8tql6uGg+f6RDZp1DQNNmLnI3Rsl0v4WmPRLY6S0fnqebURplVpHA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389358; c=relaxed/simple;
	bh=XmyB1rNKO18anQqvORet8yta0PGu+2SWB9A7XrYcCqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gjul1FDg9XDSPs3eoQunBT/5Q3IUMTZqiAYbaRVVBnzoaVR1SFApoPv1a28hD17aCsVhG37axgoy09Aj+kcPSUg+2KmbiI/HJJ3RHUbuiL1YRc81/6rgwx5UIHQD5DuWAw5gHbXwGX+LVIwMgpzNHg0GCbVZy0CAfKbOFqM+JDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNulYtlH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E8CEC4CEF1;
	Tue,  1 Jul 2025 17:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751389358;
	bh=XmyB1rNKO18anQqvORet8yta0PGu+2SWB9A7XrYcCqc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dNulYtlHA8vO6OSHqpyq+zCXe1Vbx9MiyIlRBpeE17iLPqXMHeMOaq0eLI0NNBGQD
	 9WW4xInZi6sxJd8jORYomu6Y9KhGPipOhhb4q03IhIdLhDECiKOis4FuaCTLHTDF5M
	 kjSLhAm8lHIGPsO176sdUZpuwTvzvYgRLyvUuCoWYHBtv6vuhBbOxPRwsQ5unpF3/I
	 lyTcVV7TYKEE8xk3UH07IVBWFmu+AEMqAyu08j3JdK2WWim5msBrhhNrjk8sr+EjQu
	 79q0CQjQzlPLrKGLrayGqyoFHl1TcFG+AZlY2Mu0YJORS7NopCqcc85V4GWfd6KfiX
	 5sCv2lLaOsy4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B24AC8303C;
	Tue,  1 Jul 2025 17:02:38 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 01 Jul 2025 19:02:36 +0200
Subject: [PATCH v9 2/4] usb: misc: onboard_usb_dev: Add Bison Electronics
 Inc. Integrated Camera
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-tb16-dt-v9-2-7d9e280837b5@oldschoolsolutions.biz>
References: <20250701-tb16-dt-v9-0-7d9e280837b5@oldschoolsolutions.biz>
In-Reply-To: <20250701-tb16-dt-v9-0-7d9e280837b5@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751389356; l=2561;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=h6WO02MR6hkk/XKsY4jmKEhlAD1G0RpEeH0+I5ptKsI=;
 b=voTGp/kljIeU4En1kNhS9HOfhWbaSY/N36DTwDoq3lPxu8UsBWEI2nwJvILT/yZ1k+OeSQLFj
 3Gt3TNapL/OBVmebZqOhId0HhCCxSMtOYAYkOdWY7cZNtXRIstxu/Eq
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The Camera is built into the Thinkbook 16 G7 QOY and directly attached on the
usb_2 controller (dwc3 USB2 only). It has a separate power supply that needs
to be controlled for PM.

Add the support for this device for the power supply.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 5b481876af1b2c10ce625fcf0fb8bfbe8905aa8c..41360a7591e56b2b1fe973ff1c42e68707fff54d 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -564,6 +564,7 @@ static struct platform_driver onboard_dev_driver = {
 
 /************************** USB driver **************************/
 
+#define VENDOR_ID_BISON		0x5986
 #define VENDOR_ID_CYPRESS	0x04b4
 #define VENDOR_ID_GENESYS	0x05e3
 #define VENDOR_ID_MICROCHIP	0x0424
@@ -647,6 +648,7 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {
+	{ USB_DEVICE(VENDOR_ID_BISON, 0x1198) }, /* Bison Electronics Inc. Integrated Camera */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6500) }, /* CYUSB330x 3.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6502) }, /* CYUSB330x 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6503) }, /* CYUSB33{0,1}x 2.0 HUB, Vendor Mode */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index e017b8e22f936be66da73789abb4f620e6af4d6a..c1462be5526d5c15de2493742d27155e6d1ad8ee 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -73,6 +73,13 @@ static const struct onboard_dev_pdata ti_tusb8041_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata bison_intcamera_data = {
+	.reset_us = 1000,
+	.num_supplies = 1,
+	.supply_names = { "vdd" },
+	.is_hub = false,
+};
+
 static const struct onboard_dev_pdata cypress_hx3_data = {
 	.reset_us = 10000,
 	.num_supplies = 2,
@@ -144,6 +151,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
+	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },
 	{}
 };
 

-- 
2.48.1




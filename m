Return-Path: <linux-usb+bounces-8423-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A29C88C69F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 16:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 402661F22F7F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 15:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941C913C831;
	Tue, 26 Mar 2024 15:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtQwjYix"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96AA13C81C
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711466220; cv=none; b=gK5DXt44r3USXz32+c+OHdX/THCcTX7bQCAS89BrXHAcqCykUlDiH9ok8yXFbIMBsEe/HPzvlk39bt2OQ2Apgg9C4BJarh7u7c9ec13rZ0klPd8qRcjnqNuRTBkOytbxIo0PdmF4ynnQ9PpSfEzCSwBOmfd8lpTC9qcoK48ekew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711466220; c=relaxed/simple;
	bh=PxvX2wcX2JiqOJih/m2mFt5MSYx228b9tQN4NLazxW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYYF5ZoGZ3SdA6GjA/5QOATB9DpO37t7C8dWxtgrvjjYQQBiwfAYcy1XoLr9635ZRLD/37pIM9b8hlomfYILG/8tcgx2YQIeH3P1WhwhwYejlAbJ/8hV5dAPHqSjVEKUO0s0dpbShoq/EFPkTW75xrQjihmIZFy+yCt6Jjv8V4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtQwjYix; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e6b54a28d0so3739961b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 08:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711466218; x=1712071018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HogMHtwYFBoxl6J9fl1rX7TCztC2DxlcdxXdBKoLCps=;
        b=HtQwjYixAr2et1G8479SymabXvmtB/FpRzNKqHmAScwvDX/9L/swbt7e4gxDuFehW1
         DNZA03f2E+tNhoEE9vMzlckemg6eMLDCVTjDw3b3ssNK+2/BjNm3kXOmx8pqfPgqP08D
         7A2yx/5aMVNHCgCMNTSZ3HdvbGlF/OmcgrGVuQrBfZtyKFmFt08m+AALVm4N1NG8pkRN
         VasVt8560XiSAog1wg3zXnfp1TgocSrhj3JVrn/oUwRDi1xWYHuiFKfE9ZXKeqJ1G2IE
         WUsqFB+xCoZiVns3aarCCEe25mtfZjHm42p5S7oCsyoKA677bOF3oF0gl4V6Mbjs0bYg
         ZMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711466218; x=1712071018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HogMHtwYFBoxl6J9fl1rX7TCztC2DxlcdxXdBKoLCps=;
        b=mkwgJaKscKpWmYdnNExem64qSpeIvyhqLxeRjtUV7okW11CTHGekfDxweMb9do471b
         Wx6PkCC/m3pwUMlEX6yDklhM/usq7tHc/ulAvUq+GbdGPKEgD74DQXNnyV0BUfRyP0xN
         9sDKso5rfxGtaIQxjUgoBrP+ldUSWkHki7mzA6UolkNuwrOannem2x60XMbpAtdH2bhS
         tEuqIeVWvKE+oXFs8wwenx6nnIPSHhWukltKz7AT3kQ3LdsLTgg5f3HB376mXq11peAc
         R1CDw842K/8gEGHpgchCDg0/BafKeOBB8b1P9pifuxFkuKY57rq7c4UF9ANiYjsyX+qo
         Pw7g==
X-Forwarded-Encrypted: i=1; AJvYcCW06QZUpXLXOPUYGmX0cfkwHTEj1RPRIkXE5xALRAPCQjorbV50eTJ6RfQys5r90FLKZtUZoM9n/HEsAlQ9lvC82VPmwg3FUUHa
X-Gm-Message-State: AOJu0YxHs0LtfHp7qV0pu/adrtHITxGSMH/DcT6W20tmsTd4AfdPv+F5
	OAs3vFPluNnouaI8HJSp5WOGAauoz7a3XVCaahgHO+yAsYhfe/GX
X-Google-Smtp-Source: AGHT+IHemcKzOybWEdq/HnSzpDE6ZypDFN1UyrM63rOS/QF+hHG5TZAnDkzeG/Pwcc7xA843slYhng==
X-Received: by 2002:a05:6a20:734f:b0:1a3:c4f4:5bb3 with SMTP id v15-20020a056a20734f00b001a3c4f45bb3mr7933649pzc.4.1711466217955;
        Tue, 26 Mar 2024 08:16:57 -0700 (PDT)
Received: from petra.lan ([2607:fa18:9ffd::c91])
        by smtp.gmail.com with ESMTPSA id s3-20020aa78283000000b006e631af9cefsm6073126pfm.62.2024.03.26.08.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:16:57 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-parport@lists.infradead.org,
	linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	johan@kernel.org,
	daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com,
	reboots@g-cipher.net,
	mike@trausch.us,
	gregkh@linuxfoundation.org
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH v2 3/4] usb: misc: uss720: add support for another variant of the Belkin F5U002
Date: Tue, 26 Mar 2024 09:07:10 -0600
Message-ID: <20240326150723.99939-4-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326150723.99939-1-alexhenrie24@gmail.com>
References: <20240312055350.205878-4-alexhenrie24@gmail.com>
 <20240326150723.99939-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This device is a gray USB parallel port adapter with "F5U002" imprinted
on the plastic and a sticker that says both "F5U002" and "P80453-A".
It's identified in lsusb as "05ab:1001 In-System Design BAYI Printer
Class Support". It's subtly different from the other gray cable I have
that has "F5U002 Rev 2" and "P80453-B" on its sticker and device ID
050d:0002.

The uss720 driver appears to work flawlessly with this device, although
the device evidently does not support ECP.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/usb/misc/uss720.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index 32caf3ca300f..5423da08a467 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -693,7 +693,7 @@ static int uss720_probe(struct usb_interface *intf,
 
 	interface = intf->cur_altsetting;
 
-	if (interface->desc.bNumEndpoints < 3) {
+	if (interface->desc.bNumEndpoints < 2) {
 		usb_put_dev(usbdev);
 		return -ENODEV;
 	}
@@ -719,7 +719,9 @@ static int uss720_probe(struct usb_interface *intf,
 
 	priv->pp = pp;
 	pp->private_data = priv;
-	pp->modes = PARPORT_MODE_PCSPP | PARPORT_MODE_TRISTATE | PARPORT_MODE_EPP | PARPORT_MODE_ECP | PARPORT_MODE_COMPAT;
+	pp->modes = PARPORT_MODE_PCSPP | PARPORT_MODE_TRISTATE | PARPORT_MODE_EPP | PARPORT_MODE_COMPAT;
+	if (interface->desc.bNumEndpoints >= 3)
+		pp->modes |= PARPORT_MODE_ECP;
 	pp->dev = &usbdev->dev;
 
 	/* set the USS720 control register to manual mode, no ECP compression, enable all ints */
@@ -774,6 +776,7 @@ static const struct usb_device_id uss720_table[] = {
 	{ USB_DEVICE(0x050d, 0x1202) }, /* Belkin F5U120-PC */
 	{ USB_DEVICE(0x0557, 0x2001) },
 	{ USB_DEVICE(0x05ab, 0x0002) }, /* Belkin F5U002 ISD-101 */
+	{ USB_DEVICE(0x05ab, 0x1001) }, /* Belkin F5U002 P80453-A */
 	{ USB_DEVICE(0x06c6, 0x0100) }, /* Infowave ISD-103 */
 	{ USB_DEVICE(0x0729, 0x1284) },
 	{ USB_DEVICE(0x1293, 0x0002) },
-- 
2.44.0



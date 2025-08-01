Return-Path: <linux-usb+bounces-26308-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C7B17DE3
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 09:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39C8758183D
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 07:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946A320E030;
	Fri,  1 Aug 2025 07:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="tRDMdfEn";
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="flHLfnIk"
X-Original-To: linux-usb@vger.kernel.org
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101F92063FD
	for <linux-usb@vger.kernel.org>; Fri,  1 Aug 2025 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754035156; cv=none; b=oyQQljV4oWsba+fqbunSjXtLKEeb9OeGBYbRWK2d0M8fpoiifKmsJYiBk+/VPhtdyGWRh3XmOhi1KyO3DNigJnU1v6nYIvI8l1ZIVkiT5AbBUAUoCibf1mqzIMqyTHoDnCvWwSqQ8t04M1x6Ri94KgDvU4XIBc+wRrTRUup+oE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754035156; c=relaxed/simple;
	bh=g2tsbghthZF7Ok70mi07TWd2XLpIQrg341UrJzs6YD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gic30dtLvNEAr1+KhdiLObYJ98V4Vhr/XVn52uRRnw8BU8P9bl1FhOXmTOk4w4cuQHyDx3k0BQ5JUdDBGrgYjStgI70Mqjz8Yi7rmr1CsH2AAXsGF9NhEpkBX1NiWBsGfV0Htydr+R5ie4c0t5MkThrtkS9UyGINjgaPFAW0kPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=tRDMdfEn; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=flHLfnIk; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1754034732;
	bh=g2tsbghthZF7Ok70mi07TWd2XLpIQrg341UrJzs6YD0=;
	h=From:Date:Subject:To:Cc:From;
	b=tRDMdfEnptSK4wCKkLhwa2BKDJx8V9BHmKW4ct0WmPdGhHnC0HA2yCOLE48JTVwor
	 tua9PwczW/kAOk9fqkAz5eO+ZI9BONC0VD3SeO0kNsBn7xtdS2c91d0EBJKIRReEgc
	 6PEVOU0uyWxNxKuNprtnVjvS7In+4j5HwE6qwfq2Cm8GJE4aa/XSaPzhJP5jXLRs3T
	 3LIB8Dz2lDYwU6cnjJ0crquK9Xv0YOCTuOzoT08QnWDV4aNZiHW1le/FQRiipj4roI
	 T0VxbZBVgpsLYVrxMraABUdtZPusFdgg7E20t+oHJX7s/188fV1zUUZa/nTkKkntj3
	 v0jg9mFA8/s9w==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 5D8C7133
	for <linux-usb@vger.kernel.org>; Fri,  1 Aug 2025 16:52:12 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=flHLfnIk;
	dkim-atps=neutral
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 07694AA
	for <linux-usb@vger.kernel.org>; Fri,  1 Aug 2025 16:52:12 +0900 (JST)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235dd77d11fso15737155ad.0
        for <linux-usb@vger.kernel.org>; Fri, 01 Aug 2025 00:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1754034731; x=1754639531; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PENsYT4Bk55TgvBflADdlJ0hEBYRAmRAKBWvshuKGFI=;
        b=flHLfnIk8pu4ZAIIFoCLr90OkDA/06wliXEyo+OwPk/eieb45eOgQhOSwW62cn9lxT
         l6Eiz9EY6/AWWzvgw0cvrLMw5W4qvGMUDN7ieAcHnEkGZNHBrNnh3KGf2pdZAfmzl0bY
         2Or1KMnJcgfxIM7Llhq4Ms2gN1466kGrWIH7ygVR7RN84GEOSkePNBUG9TMtT4PHyHUn
         OrWNAC8x4G7AjYZOOd3NvF4qcgXSfD3H+S2B+cVLzYU/p4HnyGeO7t4QzeVGH8FCo20E
         5MsxGKCFyTm+s+MLTnuTSGpRd+wdl1zXSK+PeXUMcU8+mytvaZ40XfU8kXlZnNIVsckQ
         H9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754034731; x=1754639531;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PENsYT4Bk55TgvBflADdlJ0hEBYRAmRAKBWvshuKGFI=;
        b=En71plhJSdOv7IJMfGdglCeahuRJnFlkuM2k+9+PncpE7ilHRGopmycMpcqqg9eViv
         9sn4xSeRSc7qT7lcH/rQzcThRmmXfKSld+LMP/ZQpI+SMiPBC1RMnwt17VTvu57RS1Ae
         QPfIWBeln8yFpwJNbfJGZOOQxy5ETFevB3dFFUFfzz7RX6xdJXCWBy5r9Mdbf6C/4Ld5
         KNzNmVvCWsOF1EqCNuJg60whXVYRSI0A9CbPeLEUATxjpPDvvSU1c8Ch8eOuOcE7Irx4
         xsAV+/Vy1TvpFfRWMLCrajZKhp5iwSMusXCpLmBiDgmoSKXqTZ4nIQsRvSga7Il1oAR5
         /4aw==
X-Gm-Message-State: AOJu0YwfV/UO9bzk9HRXrArOy/YrTmDO6XnMPwNVCE+UNXwDK6PwZUBU
	LdMF1YIkGywbehQi6YgThag/xfD5WpD/KbvPaCqT47TEOwtq3KgUXWb1oPGPh7+GGtkasz4qWVR
	GNNWfVvgd1OCty2vo7GCn+dkah/0ouDnCabMZrzBSfIdS7Qpg+Cy/xHJ5UjW1uoHjgwDZXCc=
X-Gm-Gg: ASbGnct1M4At0K+QsMzvqb60gi0Kf2A8uTPhRvVOYeQARDtXtR09YoY8C9x7q/MIO+j
	HrxO6IN2xwPEYa+ZcIkLigHQn3LA+OuBG7vJnT+lRDlDT7CRZVBTfVWm4v0LM3misiG5mbmCuMo
	//EUMqoZKmULFjuGb4nzwub4DPxez1zr56cEowkdNEunKql0ejqJ9p94Xqfh/l5xGNevrnsyqxO
	PxV1a9EDNYfinBPCaCz8WosMRX6KogERdZu/iOLpIQ04R+VB7Sjkxm56YPt8dwcs9IRZ7kkw9eM
	5wtXW/LTCCr2XNpPjClmCdN7qSvVfuBmRLO4Dvt/U0sFd/T9dP9LszYTluI/4swP+W2IA8HYQm3
	80bNPEUud7O1HhAvOSjYBC+0=
X-Received: by 2002:a17:903:41cd:b0:23f:f96d:7579 with SMTP id d9443c01a7336-2422a6b1438mr29079715ad.37.1754034730914;
        Fri, 01 Aug 2025 00:52:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOJMlsA/0Ci10UBu7wXYxPx1rv5jG/rLEYL/kGPe3kSOexBTZ+C91YMZPnXolYXEWyk3ovxw==
X-Received: by 2002:a17:903:41cd:b0:23f:f96d:7579 with SMTP id d9443c01a7336-2422a6b1438mr29079365ad.37.1754034730487;
        Fri, 01 Aug 2025 00:52:10 -0700 (PDT)
Received: from localhost (117.209.187.35.bc.googleusercontent.com. [35.187.209.117])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241e8aab53dsm36045405ad.170.2025.08.01.00.52.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Aug 2025 00:52:09 -0700 (PDT)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Fri, 01 Aug 2025 16:52:02 +0900
Subject: [PATCH] USB: lower "Device is not authorized for usage" message to
 info
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-usb-auth-v1-1-a59bfdf0293f@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIACFyjGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwND3dLiJN3E0pIM3aRkC4s08zTD5CQDEyWg8oKi1LTMCrBR0bG1tQA
 oz/V/WgAAAA==
X-Change-ID: 20250801-usb-auth-bc88f7f1cb04
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2453;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=g2tsbghthZF7Ok70mi07TWd2XLpIQrg341UrJzs6YD0=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBojHInI9+feSKPrPIhJE/NBsJSvf6AdWGchQWmb
 0c8Q2H88NeJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCaIxyJwAKCRDyimB/1oxx
 B8p1D/0Ss0LBU0KzWLVQVV6icyJsApWnOBdruWFiT02N9cnyz4M7tTrLHeQ85EX92Df80gu+pUH
 6ToMoa8tqNLWWlxAUdHUkkWN/wTXTRphPBrZaZRWER6ByTel92sSo+U/2zNfYyYvFjmk5cPLpUy
 nRkhF1dE+AyIQ5Tnc+WO9Y8Ji7fAcNUy1C4qhHE87bI4x+ftMyAqE5WyHhXqSAnvAa6ORqp7w3w
 g51TXVUFezjRliDKiPI5thxcJYU7PtANVGO0D+63OfLQqYovU48dY7+SKUZtjtuF3hYZGlh6Vqe
 +6661+NyDz2nYGS3Vq2TToqyYVT3DViR+fp7AakTd5jmUr+h3l1W8mlik+txaRdYJV97Dm1f5wr
 rgqUIAr2gEUsSYiE7cTCnd3eohbW07JgKeWKUgurpP5Pu0BJUzInPHVCltatO8BAba+8teWWSwy
 KLTRRlI3EXz0PLk1ljc2DePSdczibEjMChyx6BlaOe81qc+bGeLdxlychd2dgl60r4F342ZylLz
 M/htfYp2xfd+aAtWaQcXEPWTy5WKnBZwyuJ9dyekPMazOYJrMhptNVvxjhUtRKB7E72s9C8KRIt
 kNosJfP5Ws8bFPKyfbO2ZttnnHOAXW8ME91ZeA+Jf6t3ecpRmtMea7i9mkx4rljUOYiG9ZXKDqo
 gxo3pbmGBUAaXMg==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107

This message is not a useful error in practice:
- when using tools such as usbguard, the message is always printed but
  it does not presume anything regarding the actual device acceptance
  (later 'authorized to connect' message is at info level, and not
   displayed on console)
- this can be a source of flood if a usb device connection is flaky
- ... and it is only displayed as the result of an admin action
  (modifying authorized_default), working as intended, so not likely
  to be an error.

This is still useful to know when looking at usb devices problems, so
info seems appropriate for this class of messages together with the
later eventual authorized message.

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
 drivers/usb/core/driver.c  | 4 ++--
 drivers/usb/core/generic.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index c3177034b779eb9e7c61b941c358f615b33ce01d..69216c3951fd9613d9e10ecd75ace8e6fb888229 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -332,10 +332,10 @@ static int usb_probe_interface(struct device *dev)
 		return error;
 
 	if (udev->authorized == 0) {
-		dev_err(&intf->dev, "Device is not authorized for usage\n");
+		dev_info(&intf->dev, "Device is not authorized for usage\n");
 		return error;
 	} else if (intf->authorized == 0) {
-		dev_err(&intf->dev, "Interface %d is not authorized for usage\n",
+		dev_info(&intf->dev, "Interface %d is not authorized for usage\n",
 				intf->altsetting->desc.bInterfaceNumber);
 		return error;
 	}
diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index 9c6ae5e1198bb2043d27e2f309a46f8ce512225f..a48994e11ef3d07ada3b945558fc8e0924d5ce54 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -243,7 +243,7 @@ int usb_generic_driver_probe(struct usb_device *udev)
 	 * with the driver core and lets interface drivers bind to them.
 	 */
 	if (udev->authorized == 0)
-		dev_err(&udev->dev, "Device is not authorized for usage\n");
+		dev_info(&udev->dev, "Device is not authorized for usage\n");
 	else {
 		c = usb_choose_configuration(udev);
 		if (c >= 0) {

---
base-commit: 89748acdf226fd1a8775ff6fa2703f8412b286c8
change-id: 20250801-usb-auth-bc88f7f1cb04

Best regards,
-- 
Dominique Martinet <dominique.martinet@atmark-techno.com>




Return-Path: <linux-usb+bounces-5707-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9FA844699
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 18:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 435E31F232C8
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 17:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340B912F597;
	Wed, 31 Jan 2024 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gnuage.org header.i=@gnuage.org header.b="c45iazXv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.techno-city.fr (techno-city.fr [95.216.245.165])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493EA12DDBA
	for <linux-usb@vger.kernel.org>; Wed, 31 Jan 2024 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.245.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706723822; cv=none; b=b96Ua+2UcyvrygUoMnnkLc3fg5BvorYSDc79g6+q036hywZYfrTSbFyMBKHtvkd6uJrRstshjibBF9oaxFjeBKBSEhG93XoDahVad9RiqJb1GjIOENcEU839Ig6Qk5IJLjtHFF9gekCIgxnZG9uoUqWcUWBoJSxzZ4dpOYQ07Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706723822; c=relaxed/simple;
	bh=1G05z0zOLKjMzMt/j0HBkkUliu1g8iEZr6DpNeaA06Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLZcw4HN3mbNDFbGX+7r4GQvZvBYMuWyc5iQ9WE+Wt/PDTK1VOFESa9mPg/A6LRxU/qpjDjm+uyIBVkxcrKORwSMiQu2kyCphb7/aiSLGpXuAAT+XbLkbGtR7OKAeRRb2EbSY4P0LEUq+wb/Tk489ge00B/T9LRqPdhWr4Fi5t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=gnuage.org; spf=fail smtp.mailfrom=gnuage.org; dkim=fail (0-bit key) header.d=gnuage.org header.i=@gnuage.org header.b=c45iazXv reason="key not found in DNS"; arc=none smtp.client-ip=95.216.245.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=gnuage.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gnuage.org
Received: from pc-aurel.techno-city.fr (unknown [IPv6:2a05:6e02:1076:6010::230])
	by mail.techno-city.fr (Postfix) with ESMTP id 310E1AA3E2;
	Wed, 31 Jan 2024 18:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gnuage.org; s=2019;
	t=1706723372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sXIUFkTe1dz1NoHORlgSyUJAH2ZBAi89CEsWHTD7uqk=;
	b=c45iazXvLCVe0cZ1Wtzm6N5zMprGS+uG58iAxPY52UFVS8x1qHYMFFM8JOv6P+40PoE/Nk
	pZ5NFbHGe3w/XUGFPZWBS+ylE9pLz72T8IIkBk+owlDoJqh8zzCSO7ojMlFG73M7iQH47d
	BC1nGPdQSutwY3iqfLGuTGGX5FHMAB1EEO0UR+aTAAxBufhgmS54sH6odmE7LUctGBLLp2
	k2e8txNJj9pfv54ldiMSDbTmaotk/0jh45vVPP/w5Kfam0jLFg3Xzrb+/j2zvP6mW/XIbE
	f0F0exDReC8VZRUlKhymVR7U7ifFgvseqk6LIK92DAaSYlsEyPUC35z6P6HPOg==
From: =?UTF-8?q?Aur=C3=A9lien=20Jacobs?= <aurel@gnuage.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	Aurelien Jacobs <aurel@gnuage.org>
Subject: [PATCH] USB: serial: option: add MeiG Smart SLM320 product
Date: Wed, 31 Jan 2024 18:49:17 +0100
Message-ID: <20240131174921.2097403-1-aurel@gnuage.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <D0XE7S.X6XGW1CB307A2@gnuage.org>
References: <D0XE7S.X6XGW1CB307A2@gnuage.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the USB serial option driver to support MeiG Smart SLM320.

ID 2dee:4d41 UNISOC UNISOC-8910

T: Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 9 Spd=480 MxCh= 0
D: Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs= 1
P: Vendor=2dee ProdID=4d41 Rev=00.00
S: Manufacturer=UNISOC
S: Product=UNISOC-8910
C: #Ifs= 8 Cfg#= 1 Atr=e0 MxPwr=400mA
I: If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E: Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E: Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I: If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E: Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E: Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I: If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E: Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E: Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I: If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E: Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E: Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I: If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E: Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E: Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I: If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E: Ad=06(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E: Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I: If#= 6 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E: Ad=07(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E: Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I: If#= 7 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E: Ad=08(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E: Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Tested successfully a PPP LTE connection using If#= 0.
Not sure of the purpose of every other serial interfaces.

Signed-off-by: Aurélien Jacobs <aurel@gnuage.org>
---
 drivers/usb/serial/option.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 72390dbf0769..b5468f51e0f8 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -613,6 +613,11 @@ static void option_instat_callback(struct urb *urb);
 /* Luat Air72*U series based on UNISOC UIS8910 uses UNISOC's vendor ID */
 #define LUAT_PRODUCT_AIR720U			0x4e00
 
+/* MeiG Smart Technology products */
+#define MEIGSMART_VENDOR_ID			0x2dee
+/* MeiG Smart SLM320 based on UNISOC UIS8910 */
+#define MEIGSMART_PRODUCT_SLM320		0x4d41
+
 /* Device flags */
 
 /* Highest interface number which can be used with NCTRL() and RSVD() */
@@ -2281,6 +2286,7 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SLM320, 0xff, 0, 0) },
 	{ } /* Terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, option_ids);
-- 
2.43.0



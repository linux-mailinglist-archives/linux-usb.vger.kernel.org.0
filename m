Return-Path: <linux-usb+bounces-5181-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A27830A09
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 16:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7753E1C21C4F
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 15:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C993D21A10;
	Wed, 17 Jan 2024 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gnuage.org header.i=@gnuage.org header.b="giJAti83"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1A82231F
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 15:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705506658; cv=none; b=DgfW//Jm+0kY03Zkj6JoX6BFZ/8VvIRtEmvRmLxh4fP1NRBUtPS/VwNw79OBca2u1y4ZGDV5ia6No+cazFVJox2+qsa9cSsOwq+g8G0FtjDZwngnaYB/0i5qBqBpAJxaJlAYRG0XvvmflrEJRIxkyxG46JeJZKW+8XnUNld2JbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705506658; c=relaxed/simple;
	bh=6rVBPkC7a4myX6xI1N8A+w5+ks+zPFqaZq2WipELt2s=;
	h=Received:Received:Date:DKIM-Signature:From:Subject:To:Cc:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding; b=KQey0yhKtP00BH1RF0UStS0fo5DKPuEPApHrKBuzhh0ZxW19RD8q5IM+M+EaUcV9Diywc0GIK2mNWEAw7HWhzShpIDXt8K5oTX4+cHBRv9/e9J64LGM9tiLscc6IMrzj+xyyM3ehwe0bMJpxIo+qOHynxFmXujpnHXVojhTZ/gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gnuage.org; spf=fail smtp.mailfrom=gnuage.org; dkim=pass (2048-bit key) header.d=gnuage.org header.i=@gnuage.org header.b=giJAti83; arc=none smtp.client-ip=212.27.42.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gnuage.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gnuage.org
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 907F54D80E
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 16:43:44 +0100 (CET)
Received: from mail.gnuage.org (unknown [82.64.106.216])
	by smtp1-g21.free.fr (Postfix) with ESMTPS id F1E56B00596;
	Wed, 17 Jan 2024 16:43:35 +0100 (CET)
Date: Wed, 17 Jan 2024 16:43:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gnuage.org; s=2021;
	t=1705506214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j1/SPoY++DW/AOUd9EYM/1r2CpJFcZH42Ao8yHwCMM4=;
	b=giJAti83p6W4rOzwJ5l0nc3dYPmOgfBNe4sBLOmXymzZcgRBu+Hv454C5PuZrOLsSdQl/q
	nF9tJq84QQEZFTKRsZtJMxnUp4q4tW4DZiGX0/dUNhkrhahzDGOLqRorN/5apMNP8Jq04r
	E4mVTyE11bf5l/CNNhcpQ1FVrf6uzKvvGuuVybFlPfRreofY36yGtatP7kr+1kylK58VMG
	DxaztlkENk7gxja+f+WAYUR614u6BvrQhBQC58XUnVCUTbaEKr1mHVPG/glUVJs8IiufrF
	fN3hpC+PbcqD0OrG+vLfNYWapYm0Fll6XygyCzLW+QVN4xPtejWstcEF6k5GGw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=aurel@gnuage.org smtp.mailfrom=aurel@gnuage.org
From: =?iso-8859-1?q?Aur=E9lien?= Jacobs <aurel@gnuage.org>
Subject: [PATCH] USB: serial: option: add MeiG Smart SLM320 product
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, =?iso-8859-1?q?Aur=E9lien?= Jacobs
	<aurel@gnuage.org>
Message-Id: <D0XE7S.X6XGW1CB307A2@gnuage.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Update the USB serial option driver to support MeiG Smart SLM320.

ID 2dee:4d41 UNISOC UNISOC-8910

T: Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D00 Cnt=3D01 Dev#=3D 9 Spd=3D480 MxCh=
=3D 0
D: Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D 1
P: Vendor=3D2dee ProdID=3D4d41 Rev=3D00.00
S: Manufacturer=3DUNISOC
S: Product=3DUNISOC-8910
C: #Ifs=3D 8 Cfg#=3D 1 Atr=3De0 MxPwr=3D400mA
I: If#=3D 0 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=3D=
option
E: Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E: Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I: If#=3D 1 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=3D=
option
E: Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E: Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I: If#=3D 2 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=3D=
option
E: Ad=3D03(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E: Ad=3D83(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I: If#=3D 3 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=3D=
option
E: Ad=3D04(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E: Ad=3D84(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I: If#=3D 4 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=3D=
option
E: Ad=3D05(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E: Ad=3D85(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I: If#=3D 5 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=3D=
option
E: Ad=3D06(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E: Ad=3D86(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I: If#=3D 6 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=3D=
option
E: Ad=3D07(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E: Ad=3D87(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I: If#=3D 7 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=3D=
option
E: Ad=3D08(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E: Ad=3D88(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms

Tested successfully a PPP LTE connection using If#=3D 0.
Not sure of the purpose of every other serial interfaces.

Signed-off-by: Aur=E9lien Jacobs <aurel@gnuage.org>
---
 drivers/usb/serial/option.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 72390dbf0769..b5468f51e0f8 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -613,6 +613,11 @@ static void option_instat_callback(struct urb=20
*urb);
 /* Luat Air72*U series based on UNISOC UIS8910 uses UNISOC's vendor ID=20
*/
 #define LUAT_PRODUCT_AIR720U			0x4e00

+/* MeiG Smart Technology products */
+#define MEIGSMART_VENDOR_ID			0x2dee
+/* MeiG Smart SLM320 based on UNISOC UIS8910 */
+#define MEIGSMART_PRODUCT_SLM320		0x4d41
+
 /* Device flags */

 /* Highest interface number which can be used with NCTRL() and RSVD()=20
*/
@@ -2281,6 +2286,7 @@ static const struct usb_device_id option_ids[] =3D {
 	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID,=20
SIERRA_PRODUCT_EM9191, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID,=20
TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID,=20
LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID,=20
MEIGSMART_PRODUCT_SLM320, 0xff, 0, 0) },
 	{ } /* Terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, option_ids);
--=20
2.43.0





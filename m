Return-Path: <linux-usb+bounces-31345-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1335BCB102F
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 21:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9859D308C7B7
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 20:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FE0307496;
	Tue,  9 Dec 2025 20:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semex-engcon.com header.i=u.mohr@semex-engcon.com header.b="ntaFZ5He"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B2126056E;
	Tue,  9 Dec 2025 20:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765310944; cv=none; b=mrd1rJ6pXzckVVgn8pvq/SmNyDeui8GhSDbzTw+vKGvtJ3CXOmCelfELbprSmtUF2wLKbLJgsC82KHE0wlRANUnzIvntSE2WTWCSuZNTjcYSTj6gysAQWO9X8+tjrA3ngYnGfXb6Nx5YjB5jkxzoeljbn8m7upDbJgEjiZB6mf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765310944; c=relaxed/simple;
	bh=BKg91UCMYdz32JKQrPGy+o0cvJvL2fhS4OEYqHn4A2c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DDTyf+kFVva4MTmMcwixv2yyG5VAEgyWAN2fOSrMgb1puSWb8QFrIioQBsWrx2a5SG5pMnjhGqvfzr/wjGLfFRauyTffiIAgU8M3VIa+4Io5/MPYyNtDaS3b1HLDbl2aKS+7OXQshNirR0R8zVo3aXzigGoBhZatHK0PIKcBb9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=semex-engcon.com; spf=pass smtp.mailfrom=semex-engcon.com; dkim=pass (2048-bit key) header.d=semex-engcon.com header.i=u.mohr@semex-engcon.com header.b=ntaFZ5He; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=semex-engcon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semex-engcon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semex-engcon.com;
	s=s1-ionos; t=1765310939; x=1765915739; i=u.mohr@semex-engcon.com;
	bh=Mcy7QVLKSok0f6mGGIhiPgpErANt/9b1uUpIwOrklDE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ntaFZ5HengyPzO/rgmGRe1rnICE1sCfto5pOzPTenrUhsBFqmYh0zEkypWBij958
	 z+mO2ZkWXQtZjFRBK7s937x6RKxykn7uqoLGeCu+LjlVNK9a5x09b9kSKgPV58tHn
	 yAykqOgxSvpZe3+d5wtVt6mI3fcfsTFNyZumUqQq8qleOqeQTZW1rkTMLdI+PrUeE
	 36WaBAJphnW2lGwMjjxZHHFHu1R5asJnAiUotnNuMZU4BokGDHXIUva6R6HYpYM17
	 F1qWGiIEUz7Ni2j4bQjny40ks/eZlDrtCtVq9XUz6XvbjFNlFbd42Y59riKW/tgRq
	 K0hzsK6uovYCAaSxow==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from SE-UM-LT.semexengcon.local ([89.246.161.244]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MEFrX-1vLg2I3Izl-00CC3Y; Tue, 09 Dec 2025 21:08:59 +0100
From: Ulrich Mohr <u.mohr@semex-engcon.com>
To: linux-usb@vger.kernel.org
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Ulrich Mohr <u.mohr@semex-engcon.com>
Subject: [PATCH v2] USB: serial: option: add Telit LE910 MBIM composition
Date: Tue,  9 Dec 2025 21:08:41 +0100
Message-Id: <20251209200841.21207-1-u.mohr@semex-engcon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+URUiFQ/MR4DYTgQc5zqylmzXbBITzdiQXX69wk96pBHQsWOMmT
 3PGrR4VmfHMZaqvootvpgjwW2KXTR8H0n5HR5oB8R2JM4DOSo9Wjw9gBSfgshUAG+YEsW92
 KlseYec6z2i7vnG4LCESXIeVJxNKsUx/RmtCGDuT9dJLObRwURwcqlqZBsc1FwqkUwiL2LH
 CQO26xCsNgUr0tpmZLU1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:I9N74gmaie8=;g+DMxsiIAvDvaGSS7CDjE+Fu+GJ
 +UtUSYInTz3DHXisERn3nk5MopXOyzlv/8ThmyXd0HSJtqOCKXQ+fE1nWJRHYASpAqkSop7ve
 8Sndzp+JnOhC8D/gi8H4wjM3WqFjy3vY/cFvki0iaWnn/FGLuhSzO/Ukm82Df0fnVgtcG3xK3
 e/uzeANXnIfu6tMd3qnPjYi4OVnhml71wGjVzB76CX63cxFbjh3Aog42BFxixlZT0ynXgdbrj
 50zR3bxgDr9/VIswh1JI5eIOmUw13PTp1zNrAc2slGp5QSUA/vmDI6lFaRiU3BYQLKc9habKW
 R09s4RMs3JdXkyVvA6vavVZmqRf+BKiTdVQipLeXa6DtsVZQrBbSxccmgm4CtDrahoyurjf+6
 p8aIz3Aro6rsQz497Qbhdn4dwA/yqQRJIcu30e+X+wHqaDcncJWSkuYtMYFg9BmNGLefRCpu7
 ATQ/W0srngQeXrK/SIvDQB3lhvq6sVdBNo5RFH2BBk2ViZ2k/Q51hGE63XTuI7B9fV9f2mSFZ
 l1rXuFoFeMJSm99aJA976JkN7vX86Isbr/gUe7IGabUgDiV+eFb4X9VFZCHec1JthD9jFmRJ2
 DBnmD+D7vHC+U4Ulf0QY/Y5CA3lp0NbpazlMJYK4yDyShlO++IFaesUxZlPGB3k47x4Us+GW5
 WSEdvJVI6vk2cvue3z34smJnzVwaFNZKT39aRUK2/ACHbps13WcgifEtaRq+sTrvIYazz6gy0
 euzD9P/mcrUw+hdQK/nPNoJODxZRD0puUAKuzgiUMdEvCdh4NhcsyHG3d8WqURzjnUgHR68n2
 WnnjdDbvp2YrODuKw4bqlU+4SZsEDRorv7PaG+4wVc7gRyKXZ5SM73ArfTaHJS11UU1jvzzRG
 ErKI+Am4bBiw6jAkrvOifwCcV4WKJtqT514Z3REjfCpncW+VUVPUqIgvZs1Xwiyjy7XTKIZEl
 w3jzJm7jS0cxp8vG1WBDvJX1TFwT7kue9ryzXc8vLg3YdDv2OOMs32e9PxN2teSOLokCh/ydB
 sNi7/SCeRmhpOCEeZLFEqGrJxvnPivAEEcY2vFA3IFPxc7oZhVjrwmqaHj4r6conjTAc0gtIA
 CZM6I6q1oxYHU3sALPy+9HKrC1WiBteqvoQHVtolBKTuuYUDaj05c04fPq5pQmqfbMGh09C/6
 qUh7F3ASD1LVr9lLbIAUUIGVfyTVUeZ9Bryyn/4XCXurmwj2ZfRrqNNlGfIf0I2W/QUV+4aCo
 BOIV3z+Dlf57/7UA3byjq2oJ/DVidXgt44e0SrVO7DMG1TgL5VKQWqZol8GzZP3qlAC7ivpws
 NhAEQsZw/G4GXWjp5KZuvRixrvys5+tAg+2cjXl5T8u65VI54a8b/Fwvp7y8V4QNNbH73cKAc
 fKBXmas/ve7tLKjXkFD32oSxwk1t/WRYle77V9Zu0UHukbGWOzE2mZ1Nplisf7aCzHFpagFHD
 V6zRDwhK5tsBOUaIkadjbww2HvFhJyqnaHcdifyIJgXim8eX1RcqAckhBhkf6bnPtiMnsHZdc
 RJF6RF6fxE0Vm/L3lRJf9qRzZh/5uJgKZTMinpWz0ympTE+5cWVIzKXxwq9aQ3i2qX/JMS/hb
 BuruKgyTIXr5uRgfl0QwsHzQGLYSQMs6la0Xup/tJwFQc7cgcr06vrcjWoSXKo11tFhxwAenh
 OjzoXE3ibQ/dY6wu7Dk3w9J8sJ3usZ6TGLvladiySU4R54cXpe4aJUwb7cAkhW6BFS+ZKTKJH
 Bsef0hCPkO8gH4dL8XNnELcZMlnjHkhlTF4y0f1k6PEi7y0WkuUl4on/uIZ5D/bYFxcmilIWt
 uh0h

Add support for Telit LE910 module when operating in MBIM composition
with additional ttys. This usb product ID is used by the module
when AT#USBCFG is set to 7.

0x1252: MBIM + tty(NMEA) + tty(MODM) + tty(MODEM) +SAP
T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D01 Cnt=3D01 Dev#=3D  2 Spd=3D480  M=
xCh=3D 0
D:  Ver=3D 2.00 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D1bc7 ProdID=3D1252 Rev=3D03.18
S:  Manufacturer=3DAndroid
S:  Product=3DLE910C1-EU
S:  SerialNumber=3D0123456789ABCDEF
C:  #Ifs=3D 6 Cfg#=3D 1 Atr=3Da0 MxPwr=3D500mA
I:  If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D02(commc) Sub=3D0e Prot=3D00 Driver=
=3Dcdc_mbim
E:  Ad=3D82(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D32ms
I:  If#=3D 1 Alt=3D 1 #EPs=3D 2 Cls=3D0a(data ) Sub=3D00 Prot=3D02 Driver=
=3Dcdc_mbim
E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I:  If#=3D 2 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D83(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D84(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
I:  If#=3D 3 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3D(none)
E:  Ad=3D03(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D85(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D86(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
I:  If#=3D 4 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
E:  Ad=3D04(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D87(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D88(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
I:  If#=3D 5 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
E:  Ad=3D05(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D89(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D8a(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms

Signed-off-by: Ulrich Mohr <u.mohr@semex-engcon.com>
=2D--
Changes in v2: Omit define for PID, use PID (0x1252) directly
=2D--
 drivers/usb/serial/option.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 5de856f65f0d..e57aee524858 100644
=2D-- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1489,10 +1489,11 @@ static const struct usb_device_id option_ids[] =3D=
 {
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1230, 0xff),	/* Telit LE=
910Cx (rmnet) */
 	  .driver_info =3D NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1231, 0xff),	/* Telit LE=
910Cx (RNDIS) */
 	  .driver_info =3D NCTRL(2) | RSVD(3) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x1250, 0xff, 0x00, 0x0=
0) },	/* Telit LE910Cx (rmnet) */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1252, 0xff) },	/* Telit =
LE910Cx (MBIM) */
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1260),
 	  .driver_info =3D NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1261),
 	  .driver_info =3D NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1900),				/* Telit LN940 (QMI) */
=2D-=20
2.39.5



Return-Path: <linux-usb+bounces-31337-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A756CB0866
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 17:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACA35304C1E5
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 16:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9160A2FFF9C;
	Tue,  9 Dec 2025 16:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semex-engcon.com header.i=u.mohr@semex-engcon.com header.b="vU/zCy7W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A3119D081;
	Tue,  9 Dec 2025 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765297018; cv=none; b=DLTb/ZRbMqISiRzN3zSPXLPnfcbj1NlVGx2c0zN+4vE6Arlv5lt2sEdwY/qSId9GT8YqBPFC+BkZUZmRNRIIPHDY7xWbY+xlM5VVgRmL54NLs/Qsnd49UO3HRBG8SDyoeJ0eUWNhbIx6/fDI62ek1mUOYxhqkuTeWPL65nRbDOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765297018; c=relaxed/simple;
	bh=w1MiaVHhux0nhduREcUvqRza7kAjMyC/dkPjJEe/Lg0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yn6r3cvq5SqCjB2P029BQ2ieoXuF1k5ifrJRyTk1LCSatPraW2B+EM4/IUMAz3zCv38Jzq2yJAS9KRjywr6/hVs9yvo8jjUViou8MFv5l1yNMvv88GpXrvZ/SSuKJfYWOUpMvsMWD2q5qY/zPrA9J1rblPKTWCeNOYU6WhhhjjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=semex-engcon.com; spf=pass smtp.mailfrom=semex-engcon.com; dkim=pass (2048-bit key) header.d=semex-engcon.com header.i=u.mohr@semex-engcon.com header.b=vU/zCy7W; arc=none smtp.client-ip=212.227.17.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=semex-engcon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semex-engcon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semex-engcon.com;
	s=s1-ionos; t=1765297009; x=1765901809; i=u.mohr@semex-engcon.com;
	bh=ESoXD56etKWTBH1FaIews9Dz2cNmyN1tKeLoAplOYHg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vU/zCy7WAKhzU4W3BK6WcVOuq2coifd91RhG/0lW0F1SLddFkzIEzS4Q9W+mTOnd
	 /Hpg+10D2PoVyVJv2p/OxupaWbPK7xe9gmWsEGAjTk87yctM8SE7g9g932mO4Bcp7
	 IzlD5dGTziM7FqTHoF6qWa/pLkb2M8DSXATk+0e0FDjnfWiZwP70xsYFWYghewYHY
	 Vu8qMVz1nSbvJf9U7p49o9bianRAx/+OH80UPYI0gbMYl6zpIWKNA/Negc/jSDzw0
	 cSWgpfFX3BWyFKxb+nKwt7DzrE00fxg/8W8eYTqL0Iu8Fe94/OkDml0K/fcMAXEVv
	 /1v69Y9c5JBG/yu5gA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from SE-UM-LT.semexengcon.local ([89.246.161.244]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mgvn9-1vx89N1fKf-00ewJb; Tue, 09 Dec 2025 16:50:56 +0100
From: Ulrich Mohr <u.mohr@semex-engcon.com>
To: linux-usb@vger.kernel.org
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Ulrich Mohr <u.mohr@semex-engcon.com>
Subject: [PATCH] USB: serial: option: add Telit LE910 MBIM composition
Date: Tue,  9 Dec 2025 16:50:38 +0100
Message-Id: <20251209155038.912-1-u.mohr@semex-engcon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fBLIcTbF8DDlWiK81TT9Sfr0HNI36O85MvPODch5SB090F/qEJ8
 ifn6XlXDGoxtEIPdeVJel22Eisg3L8lv5GbT6KyOOfkISXI9U0ixbv1iWJmzU2rqKxG1CuW
 sxusMaYqDFZcezNKYhOoGVsmxGb8CnPMXZ/rn427tknTpOCmP0OE2z9Ig6R/VTpPHyFnN1i
 YLt0hYUGv+yC6yAwBINow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GTHT5XW053g=;SexU9OvV63sbOLze83DMxxUpM4A
 tRvsIlxsiVuzYpfsB0mvGuiIq3T4x/6NqFOhR2HNK1vzQLlAvUn7X+R56/kaW4narIEWuLpZV
 IU95qTePqpqNY54wAYKGf1z90xI96GMJPs6i8QoyeHJu7/DoRx4fVTceAtb9Y29qIJ2ta9B9x
 BzBc77exrlBn5qQ0WjBpi8BmEDEls1G7SE8apKKI9i1AF6e2osAq0TpZuIajMmVM6YdfSgSTS
 39EJNI6ZtJ0jAdcMpZsFqWN9KbcVNCkDRzI4XYLDZ56p9OjSAe2LYOvWc8GJg0A19BP4Ua74J
 KS8DKJTef3QMEYmFZGSMRcR+S+fPJWxGSfRYieDmOFvA4kmcCOm4cFS3l4EBweGTL1xVMBtqK
 HvhKxpp7s8rS3yEhrUWS5+CwRJkJJ7C86UrgSokCTbkPBruR/qf15SXQSDkVbVLaCiSHk/mJQ
 8qs2E1dFtD6uGIvl+xPsEOO96dlA9EwniTJJ92eGvD2U9pmelSdfsrlocZCb+Gh+nthrKl6of
 spt0uGG9wiuHyP0RCRsC6w25syDzJK32vIS/fvG0nnsqAX2hJOP0d+BNArZJ/jbJYGKp0/Qjj
 WGamdl+UsHgQkB4Xi4yS703ObE6661dPyUgBV9oXKXhTOyJnyT+1DyuhR0oPuyMAOVsaXQ2zm
 Z3c07Zziv+SJOtl1QOUfrwD6x1dJ+2skEHrxkKUAqwDGOCxVaBgKCAoSjyNVFBC7gMIx/lECq
 5MjX+bcf4IFjzNe7ivdRiga/V79PakQB3X+PpTD7vGf0UqVtTpUIseLY6Hh9d0OsbnpMcyd9V
 Unkdd4eyiPhke9gHaqbmeEaCQAjqPgW+lvRsBfwvwYyWnJDgXnE0a89g0YVeG5ryuXbvF03AQ
 TAl9/Vt6oXjpuSkJUBi2GO/SGT3PlG5hPRInO/pHj5jAsdz00rqh1wiCA3u22g/wW4WZ4/Q2w
 7U2GR2KdbvYLpaGKBookl/F2yAoBoaW8Sp/yBy9/9UySTM1L4Ka9In+wXmk0nLMHyZpm/gYeH
 R/NiQb/8wRSQlxLkS7/6sdEC4masodEx/xna53fuxXOFyHgIHy2V4xESOoq7L1YHDyc7bINfX
 hL9/fWzH0OKynyvxDqqs7CvJsCUeAsfb0CjnArU93Fy5NABL2dhscZGkDX2lzfuTjgM9Je/qA
 5zhMZ0/a4rNjkG8FpfdutxoHm8Jh3VnHqaBhcxVXVvlIp0v9QZhts4iMJKArecrzuMWpFWHKL
 3ph5/c9XtMkYIyvt7uYKgDGBpohTC+bnI+8tJ0NzG49MXgZsPPSVDP6zZ6hupFQdyAQjp3gPL
 TBQkK+yj8YV9eqCSzgJ+DU7iS2RzyUqTSUkIX4daXUqhCNZzGoUYSXj2bCRii+07nsH46IiI3
 Wz887elgAHN9NXCpRf5JqIn53bTvDHsmEX++oLw9tYXAu+4rLP9wuXmVSAOJr3BAAl/fW8zrY
 aeG6d82VTL1ZB+PZwbUSeuI/KqnNxdpo6TnDagW1YNNVQVQj5L20CTCR18AP/yKozkXM2LZW9
 2k9H4nZORARYQk8V78/G60QLt7VFiVZPYBon5NVhra5EwI4Xe0YDzQT0FU0Fg+BuM3kCpWe/A
 s2vxjzNTlZ00c59FRSmwAfT+CuVO0E5vzwKen2hp37ZHjSis5DD9TCvvQcbm8CgC8BexpBuyO
 HgJ3i+YwywlFLvHPdRBO1gmlSVr1DYuzGOVEQ1vRSkhQKGVAJvlIV8p45aK9S2M/RuakQbUYP
 vrq+nYjaweIKUl5Unuz86RSZtbYUQoy1nJj3Z/xh4RHS6c7kFv64AejRtqiWJI1XQIrW1cF3O
 IyHUfULtXKb7aNTBKX+Z50JhhA==

Add support for Telit LE910 module when operating in MBIM composition
with additional ttys. This usb product ID is used by the module
when AT#USBCFG is set to 7.

0x1052: MBIM + tty(NMEA) + tty(MODM) + tty(MODEM) +SAP
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
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 5de856f65f0d..19921f129c0e 100644
=2D-- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -335,10 +335,11 @@ static void option_instat_callback(struct urb *urb);
 #define TELIT_PRODUCT_LE920A4_1208		0x1208
 #define TELIT_PRODUCT_LE920A4_1211		0x1211
 #define TELIT_PRODUCT_LE920A4_1212		0x1212
 #define TELIT_PRODUCT_LE920A4_1213		0x1213
 #define TELIT_PRODUCT_LE920A4_1214		0x1214
+#define TELIT_PRODUCT_LE910_USBCFG7		0x1252
=20
 /* ZTE PRODUCTS */
 #define ZTE_VENDOR_ID				0x19d2
 #define ZTE_PRODUCT_MF622			0x0001
 #define ZTE_PRODUCT_MF628			0x0015
@@ -1489,10 +1490,11 @@ static const struct usb_device_id option_ids[] =3D=
 {
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1230, 0xff),	/* Telit LE=
910Cx (rmnet) */
 	  .driver_info =3D NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1231, 0xff),	/* Telit LE=
910Cx (RNDIS) */
 	  .driver_info =3D NCTRL(2) | RSVD(3) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x1250, 0xff, 0x00, 0x0=
0) },	/* Telit LE910Cx (rmnet) */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910_USBCFG=
7, 0xff) },	/* Telit LE910Cx (MBIM) */
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1260),
 	  .driver_info =3D NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1261),
 	  .driver_info =3D NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1900),				/* Telit LN940 (QMI) */
=2D-=20
2.39.5



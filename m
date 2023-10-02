Return-Path: <linux-usb+bounces-937-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2983D7B56E5
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 17:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id CFBF3282997
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 15:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECDB1D538;
	Mon,  2 Oct 2023 15:51:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857FE1C6AD
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 15:51:50 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49DDFB3
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 08:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.fr; s=s31663417;
 t=1696261901; x=1696866701; i=benoit.monin@gmx.fr;
 bh=lh1aE9YpmQCdpUG+BreEcBrKk2Vn4kd+pzt+uU+xYds=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=NkSM3dHK/gw0pNDfW+MjXZX38XoWcpc9urBiirovZUyula0oFtGz/kvxrR5K6f0fIpx/xGGe1t6
 ioiOKPC3JTtcoIIhMshY+fkORjyg1C5pWCIswHVNwQmPDEXlcoqLZy8tBS8mZ7JPPSj0KlEisl20M
 KSObcxsq+JYlWslEk/WqSZxxe20H5S8zYwn4+ZSvhNdXZhbwuqiFUM8CPtHA64foUANJfzsW1+M4Q
 u5qeIyEsnezCDp3UJFABjYUUCYWIvXH9XBKxeuoz865rMmYbWGs/kcgiUpM57ujvHeT2fVCHZaDeW
 v9YxBuWJSqNjUB15RggIpheoXruRRET8EXSQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pianobar.pianonet ([176.145.30.241]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1M1Hdq-1qkb7H19KM-002nFY; Mon, 02
 Oct 2023 17:51:41 +0200
From: =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@gmx.fr>
To: Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@gmx.fr>
Subject: [PATCH] USB: serial: option: Sierra EM9191 with new firmware
Date: Mon,  2 Oct 2023 17:51:40 +0200
Message-ID: <f72b49af24b281f80bb217cff04d0cc249f229b6.1696261301.git.benoit.monin@gmx.fr>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vsSsFFld9Z80C8ItqDbsaYEXRh0BWx8J2chZWT/LujqQQ/8HCYG
 GNv6vgSS9Yk1hb4bdNXPAOuPL/DwP+tR3L4RxbK9Xg75SXIjJ6s34PIrjifV40Z/TnP/mOL
 z9W3AKU2irjzPhyJMsR2GWmuc7kuShOl5sn0zNP/W14ISwuijVmN7jOZCMe2Q6uwhOzsAyI
 c8e68BE+iGMuDmP5DZFVQ==
UI-OutboundReport: notjunk:1;M01:P0:Kds6RaSlMrY=;Oidnk6TNZsnLSnSMn8E5EMLHWYi
 cbP37Sa4bdbpggS92uvrTsRXM+4YPzyb6TJU6SJLXG/1dPnsWjmL1Xjry94zvlIIUHLX/0IQY
 aHcICn2p5Ic1fdmKkMSvm+ggyygar8clds8Lx1cW3z3NXejMKYKNTTMU/AZvxOAWcG5GmuilF
 b7uch8IbYyFJTwZR1iXc/qcxb7YiUwW8Calakota/iOBaKGlU0QNdC+PBeLVySyazeQLQCA7y
 By89Tnyx9lpiWLPzvGSXVdW9OJ3Y+C0OFAkyuofvF6uY/VQdPWqIot9OHhF5fQo/Bt+/zsI/r
 o/JK86NlnmFQkJMKokln+Nn6vhgTWqmHL4at0YKnywSJilOjdiIeGKx7gFPjdj9HLyZghIWQQ
 rfzgyS1by7kjdwyxgxtSHw4KORDrhxohuXlVSXSELm+DfJe5mLCQ8XrorqSriQGBfp6subsjm
 JT1S9HsM55MpgUF5RwRqFe2YMX1a9zVfKwgGn1hi6fZernb+w8o39Izs0XYeLGwRkd0FkJV3/
 3mpChewW1T/I/IfbJJH3Me5Jbyja+LCXV1v4a0Xe9ZwXMMzvxTrUcjatwULwNX7dRTbqOBYRG
 Yu3cd7UWaVS+H4uxr6zMRHVegXCx+tWny1Vh9clsRHb0QXpkqqHz1xZufxMfA8ZQGlECYk8sm
 TDsN7L/qRfRHBkVTAZGzGLzS0tsfyg4dMYAFNW+WtKKZVsPSao1c3rKcQ4XwnCd/bCcuW6l5Y
 mpHRkkxKBrvZhZ7By9jZadzZNt0xt9StN8srer0PiB9mfjkVOHkPgWjKtxO0ZPjbHiI4qOPSU
 Wqtwk5y7CCacL7JnnvooerxGxEsEQUvFJwFXs1JwtmUEbhfgdlZUZm+UfPMqnZAyhB4mNtU14
 AyRCLkEaQfQfJDJVY6SyijTU+t6GoVlB2hgwFxXsDsfKeRXqSuDMIGeAn6a2UzxV1hLnvFpx/
 xy1eVsEONLgjh675ohqnsS7KMhk=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Following a firmware update of the modem, the interface for the AT
command port changed, so add it back.

T:  Bus=3D08 Lev=3D01 Prnt=3D01 Port=3D01 Cnt=3D02 Dev#=3D  2 Spd=3D5000 M=
xCh=3D 0
D:  Ver=3D 3.20 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D 9 #Cfgs=3D  1
P:  Vendor=3D1199 ProdID=3D90d3 Rev=3D00.06
S:  Manufacturer=3DSierra Wireless, Incorporated
S:  Product=3DSierra Wireless EM9191
S:  SerialNumber=3Dxxxxxxxxxxxxxxxx
C:  #Ifs=3D 4 Cfg#=3D 1 Atr=3Da0 MxPwr=3D896mA
I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D02(commc) Sub=3D0e Prot=3D00 Driver=
=3Dcdc_mbim
I:  If#=3D0x1 Alt=3D 1 #EPs=3D 2 Cls=3D0a(data ) Sub=3D00 Prot=3D02 Driver=
=3Dcdc_mbim
I:  If#=3D0x3 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3D40 Driver=
=3D(none)
I:  If#=3D0x4 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3Dff Prot=3D30 Driver=
=3Doption
Signed-off-by: Beno=C3=AEt Monin <benoit.monin@gmx.fr>
=2D--
 drivers/usb/serial/option.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 7994a4549a6c..73971a3a1897 100644
=2D-- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2262,6 +2262,7 @@ static const struct usb_device_id option_ids[] =3D {
 	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1406, 0xff) },			/* GosunCn GM500=
 ECM/NCM */
 	{ USB_DEVICE_AND_INTERFACE_INFO(OPPO_VENDOR_ID, OPPO_PRODUCT_R11, 0xff, =
0xff, 0x30) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191,=
 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191,=
 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191,=
 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0=
xff, 0, 0) },
 	{ } /* Terminating entry */


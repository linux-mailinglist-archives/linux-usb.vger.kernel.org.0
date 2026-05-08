Return-Path: <linux-usb+bounces-37131-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODdrB/Pn/WkPkgAAu9opvQ
	(envelope-from <linux-usb+bounces-37131-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 15:41:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5F44F7364
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 15:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17BDD30B1907
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 13:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BF13F074C;
	Fri,  8 May 2026 13:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUh6OhU6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBE236212F
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247150; cv=none; b=ogQtPvUJcF5JS1V8A8UZM6a/a4T2WHxhy70eWL3f49GF/xgQsEt0yPcNRGTN+75CsWRq+Wm/k9hAdWTJKPx/1hxDvKvGX92lXqolqfREzoETSvlRp3tz7QjLAMYtwB3a9dGriQOdJQttgAGXSMF8kB72CV/+DwXEowuQ7RSOJ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247150; c=relaxed/simple;
	bh=MkCAiMy4tek0ZfaDZJvlcgkp2frcWs2a3Py/5WNty68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D5Nrbo+9cTBcJplry8wnNSD1QMaFSAnO+0Ie6GXyJDHIbfNplUQTxo18yiwy+8eLpy6bW2fXDMgTu7HEfeKLIXy4v5Nw8L0N9aWyJY+vFonh1COm4p5xn0wcYbCn6kRsLs9gGu7gPEOpBOli3kL8+UrCwKU/+ID6WHHgmlD44UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUh6OhU6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-441209fb77eso1241782f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 06:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778247139; x=1778851939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r7DhCUiR2nARnCR0sd7foQ/+6u2FijsNZJHR6uVeC/s=;
        b=IUh6OhU6s/ZfFkOU+1iaUqURvHm/9DvsNMAAF+HNjyNmG1b3u88DcEeSwNiu2wkl3S
         tY+PIwgj/9fniOSUVsFNbpu1SeSU5j2EQWBIWBTQnY7MpBCcO3w7gCZ+WJznpbWVd1y/
         w6SiDVL2K62AWxe7jANHk5uIRtVoQRF2R0gxTRR27x+keaRnKeCkMmy76EjzwVZ8DF96
         BjxxefJp5tbkYxUoQXf+Zk2ebZmYfXIPTYHPuz1fCRawFxoOSm14jvhJEOQ2Oxknrsu6
         0XChIk2rOqWH+TCjDZIto2vc+lP2tmBdor5AZUoUr4te2+7Hk30VlX2+foo59Ya93tVw
         dp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778247139; x=1778851939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7DhCUiR2nARnCR0sd7foQ/+6u2FijsNZJHR6uVeC/s=;
        b=T2kXeTu+ckbnMbkA6V8AYiLe0oSwyL9RgJ/9NqXA4WRSTPZIaKonfclhpb1qoqdlGJ
         IMl4rs7vn4M2arnT3Houc/OabLQ7ObIgRBkcl1LkVEShRGvJ2AxoTghhp4EyMvaqRJTW
         ycb62FLxzo41p67QKKcCiXRWNSY445EGtglFuO9HhLmJu6mCoXmg5F36OejmYq3qGAlE
         2ESPbAUxla/yxu6kNwMprEqMUTGXaqyWH2U2croWuaXdWMEklZvzSKHYJoawWa8G469O
         bycDt1A3looqrQJHyY8aE/Q0p/aApkRYDH9ImR5UX9Omsm/L4I6t30/S8gvIMX8ks4p6
         XZlw==
X-Forwarded-Encrypted: i=1; AFNElJ9QW/e+fAmzux82s0EIT+zIz9cXmIWlyx+xmgKszLGtQVk+LDObmGU72+Wo+uEAFiPcC4OtQqHwtDo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ijNGGLIMMfS9e/o7Qh6MtNaPxXPu4uIX4yzjZrHvgqgYiZ3/
	rS3X3WlNfAqpkFFoF4noI01tShuIBEPPjC8g89YgWYCoVeZwCawKZss=
X-Gm-Gg: Acq92OH/uHUSjb02G7qnoSADSE6Pj5f1JCbzoPgp1DUbOU39rThpg9gADayxiypEFuN
	mJLiVtF0PBVk30smCVHIrWLUcP+MqI3XhXFVP/Rix5mWxQKFS8wI3cgZFR6/uEW9cecmeJ2Srs8
	YAbsuiH0JqndI/y1nhwtmtItZLiYFdfIsB81BuvdZPL6umN7Pc5uc21d/lBRr5d5uhEYTiJYMmE
	i2u+yvrhE7gMb5d6MGARiYWBQjEEauGH3IFvqKMPD7ERx90vQV0qQR3hVZ7XnLoGoPiXyeinapn
	0mbPrdWSDK+Q2HIBOsC9kziqH8ul+VIhWPXAyKlawWYDsWYFatFmWMlJKiebyfmr3T9BGlM/bTi
	ej0m52YajkaJT6uAG7NCgI6yKAoLJGN0hI6dFhKWQ2zPNPHa73s2uJ0opEn+zl6qJ8UuhcAD6Zk
	q0FKRTYsDYIcqwf3lhw1a9IRZrpNLKCj2EKum7Y4Yh4x3aySE68ZGfA10a1QMYbaEiCHjNsL+y9
	e/izc94LA/mqsmnqfzc
X-Received: by 2002:a5d:5f87:0:b0:449:b7dd:4a75 with SMTP id ffacd0b85a97d-452ea177716mr11743626f8f.20.1778247139102;
        Fri, 08 May 2026 06:32:19 -0700 (PDT)
Received: from kestro-laptop-linux.kestro.home (94-224-231-213.access.telenet.be. [94.224.231.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491da03a7sm4270885f8f.33.2026.05.08.06.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:32:18 -0700 (PDT)
From: Jan Volckaert <janvolck@gmail.com>
To: bjorn@mork.no,
	johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jan Volckaert <janvolck@gmail.com>
Subject: [PATCH] USB: serial: option: NET: usb: qmi_wwan: add MeiG SRM813Q
Date: Fri,  8 May 2026 15:31:59 +0200
Message-ID: <20260508133159.564206-1-janvolck@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6E5F44F7364
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37131-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[janvolck@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Add support for the Qualcomm Technology Snapdragon X35-based MeiG SRM813Q module.

The module can be put in different modes via AT commands to enable/disable GPS functionality:

MODEM - PPP mode(2dee:4d63): AT+SER=1,1

If#= 0: RMNET
If#= 1: DIAG/ADB
If#= 2: MODEM
If#= 3: AT

P:  Vendor=2dee ProdID=4d63 Rev=05.15
S:  Manufacturer=MEIG
S:  Product=LTE-A Module
S:  SerialNumber=1bd51f0e
C:  #Ifs= 4 Cfg#= 1 Atr=80 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms

NMEA mode(2dee:4d64): AT+SER=51,1

If#= 0: RMNET
If#= 1: DIAG/ADB
If#= 2: NMEA
If#= 3: AT

P:  Vendor=2dee ProdID=4d64 Rev=05.15
S:  Manufacturer=MEIG
S:  Product=LTE-A Module
S:  SerialNumber=1bd51f0e
C:  #Ifs= 4 Cfg#= 1 Atr=80 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms

Signed-off-by: Jan Volckaert <janvolck@gmail.com>
---
 drivers/net/usb/qmi_wwan.c  | 2 ++
 drivers/usb/serial/option.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 05acac10cd2b..94cdb61dca83 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1452,6 +1452,8 @@ static const struct usb_device_id products[] = {
 	{QMI_QUIRK_SET_DTR(0x1546, 0x1342, 4)},	/* u-blox LARA-L6 */
 	{QMI_QUIRK_SET_DTR(0x33f8, 0x0104, 4)}, /* Rolling RW101 RMNET */
 	{QMI_FIXED_INTF(0x2dee, 0x4d22, 5)},    /* MeiG Smart SRM825L */
+	{QMI_QUIRK_SET_DTR(0x2dee, 0x4d63, 0)}, /* MeiG SRM813Q w/ Modem(PPP) */
+	{QMI_QUIRK_SET_DTR(0x2dee, 0x4d64, 0)}, /* MeiG SRM813Q w/ NMEA */
 
 	/* 4. Gobi 1000 devices */
 	{QMI_GOBI1K_DEVICE(0x05c6, 0x9212)},	/* Acer Gobi Modem Device */
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index c71461893d20..e3827b1e4f27 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2446,6 +2446,12 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d38, 0xff, 0xff, 0x30) },	/* MeiG Smart SRM825WN (Diag) */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d38, 0xff, 0xff, 0x40) },	/* MeiG Smart SRM825WN (AT) */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d38, 0xff, 0xff, 0x60) },	/* MeiG Smart SRM825WN (NMEA) */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d63, 0xff, 0xff, 0x30) },	/* MeiG SRM813Q (Diag) */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d63, 0xff, 0xff, 0x40) },	/* MeiG SRM813Q (AT) */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x30) },	/* MeiG SRM813Q (Diag) */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x40) },	/* MeiG SRM813Q (AT) */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x60) },	/* MeiG SRM813Q (NMEA) */
+
 	{ USB_DEVICE_INTERFACE_CLASS(0x2df3, 0x9d03, 0xff) },			/* LongSung M5710 */
 	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1404, 0xff) },			/* GosunCn GM500 RNDIS */
 	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1405, 0xff) },			/* GosunCn GM500 MBIM */
-- 
2.43.0



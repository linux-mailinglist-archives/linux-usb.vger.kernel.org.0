Return-Path: <linux-usb+bounces-37554-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULHxAt3fCWqvtgQAu9opvQ
	(envelope-from <linux-usb+bounces-37554-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 17:33:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 247DB562002
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 17:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD5633003838
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 15:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED823BFAEE;
	Sun, 17 May 2026 15:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvB/g4ig"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AB23BE17F
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 15:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779031976; cv=none; b=IXNSfYkQfmOdSr2IdTkPVrKNeRK/8DmvSMz+955Sds62KqP2vm88MXYxPblGqQpBX2yfWta5GDuy2WvGL3cu+wRvs/fw3qaSCZdQJbgdA4fSU4GZX1B5dTp7E2GL6N5a4NbSs8rwVuFV2JNm3t9IwCtq77F/CBLePCjeEor3Jpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779031976; c=relaxed/simple;
	bh=F8ZDoSnCINZyu/mFQFWUW2g/btpcv0l033mkPJlFbII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DgsQdYmXn9vIKr48UH0qsNmgFDjznvYQd3Dav45vgnbnuiMnAZy8jbX18CyKUc5ldkbAmSTIglH7t6xAYueAvHYqjrrDKVljPf/qdY/JF9iC8+ha4ttGQLh2xDUbR1CEhZKoDJ6u36d15nMKMLjYCP9qZAJkXHBfI0TOGrDKzvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvB/g4ig; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso14578595e9.3
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779031973; x=1779636773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Uiz8xiJvwo/H75PhbU5mDS73mUbtuTKV11ZSEnTPoo=;
        b=dvB/g4ig1HxN0rvotHW2pFuJQ6SR9k604WPT43EWEnzi4PDd+drNEpBU0MX5T4EeaR
         dI0raPcQ+MdcptCiSwGwKJmKMPzPw43mZ/6v/s8Pxvj3D/KNeNY/9rtwgrAr4zHcUYCF
         We7Wm3yBmww4pkEFhxv91SATS/YhXh1cePmElcxpNiEU1Rwg8fSePeZLG7AqkPbSIEPK
         2DNWDWoMSYkhIkuo+wg3S1JtZ4EGen0Q+7IrX4cBRiUzVKYjjyk3X07bG6cqPJyMjHTA
         uau+YcEdI61fbi/2ppXoqZ/1tpbVyp6o3Ej2GrcnWeaBbrMbydXBPVYwKQ9J5EZybvWD
         kT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779031973; x=1779636773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Uiz8xiJvwo/H75PhbU5mDS73mUbtuTKV11ZSEnTPoo=;
        b=eGylR5KqAiQqsBsUK+wjXGLqNzypbPCDFBjnMI3jbxhifLHsrzCTCmCvo68k6abrbW
         guxinUUn0nOkBdg+0IuSS+i1GTnPOKMLhvv+XWH/CrIamxCZFnHRtA7ISDEZwfdxmGzm
         bwS6sLI0qKsBvcgMZv2RrXOgTFs2yEFvE7IVgc2KPVJXGnB0c6CCYGI+xjYx3u7YJtty
         llgR2MqI4fC9soV1NZIw53D4mDfLLW/4eYRSoP2fvHi1DZ6EuMtqINmj/tB03AU83wwH
         fTuQIpT7fdZV9ZyYpUK8smb99kk9Mu4DWY1RGQvUEQs36YcWld8qq210yQNawpwZZuSn
         atyA==
X-Forwarded-Encrypted: i=1; AFNElJ/B/+tbZqU7q92OnuWG9Dw/WrS/1VWqNYh3U/tZIkKOGPSnttJ6PYIVk1DnPY3EXqC51LqU64gBZp8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4VeWKBfzbB4pb7Krj4hGJUbBXB+jzFMtk+MRBgvWDr3KRZQFx
	ulruu6aKZqEZYQvQtNYsIZc/vQ1EY7oha3F1dzkJ36j6MUF6eCFISj8=
X-Gm-Gg: Acq92OFalaB7ixL7apbGu8MeufIyfv+1CetxJ9D+1k3+nsmA3lkuj5TIkl5TvmN8tZD
	YMPzYp3HMAQzgCQgsEwtHkcIGef8qorIOqO2IzTkMsrlcRRHfLmTIjCvJ4wDBOdaeAOisZxO1FZ
	WwmC/s1qR2dM/7dYRJoBb39xtnPovzqZunrQ+lJ1gr1Uf8/dfpVFa10D31rytK02VzjzeaG1Egg
	T9jjIVkjLD9bRIVjUYbegbNmrgY4uiAMxyoFoOTGEl0BoFToAJ+QypkQ6ey+qEByMxk8f8Um8bL
	FL61rJ9aTFcZYIEfPg8Z4oZ8mYRPrb5hZsKsNvqpR8DvcrKPq/4Lnlm/BO1zaU+ALwBPSGlAJ/M
	5UOkzY6qvjwcFETsJ60GQrL1/UXsixPQJT914qT9z/PewIzs171T6Vk2EThEbGkdRlF4MZn8hbO
	/JMhaN8mMNuTCmps2ct5Pz2ujaV9rQWdo292q+9Yg7gODVZ/gPu3VgVBqrDaWaJOPZDiC/0fFGT
	BaK8fdCBg==
X-Received: by 2002:a05:600c:3104:b0:48d:35e:82cb with SMTP id 5b1f17b1804b1-48fe651b2a9mr159990145e9.28.1779031973241;
        Sun, 17 May 2026 08:32:53 -0700 (PDT)
Received: from kestro-laptop-linux.kestro.home (94-224-231-213.access.telenet.be. [94.224.231.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab290e1sm95307395e9.2.2026.05.17.08.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 08:32:52 -0700 (PDT)
From: Jan Volckaert <janvolck@gmail.com>
To: bjorn@mork.no,
	johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jan Volckaert <janvolck@gmail.com>
Subject: [PATCH v2 2/2] USB: serial: option: add MeiG SRM813Q
Date: Sun, 17 May 2026 17:32:37 +0200
Message-ID: <20260517153237.55995-3-janvolck@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517153237.55995-1-janvolck@gmail.com>
References: <af3nDLa1A1JcTftq@hovoldconsulting.com>
 <20260517153237.55995-1-janvolck@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 247DB562002
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37554-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
 drivers/usb/serial/option.c | 6 ++++++
 1 file changed, 6 insertions(+)

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



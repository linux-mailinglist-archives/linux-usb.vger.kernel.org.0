Return-Path: <linux-usb+bounces-36522-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFT/CCkm72lE8AAAu9opvQ
	(envelope-from <linux-usb+bounces-36522-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:02:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4FA46F83C
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B7F530046B2
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515D03AEF55;
	Mon, 27 Apr 2026 09:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lg3/eHHP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8DC3AEF43
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777280458; cv=none; b=lsLDBAKcxcBqXO7tCYkV0s478Mg5sQoXFeMYYIH/WK+lYiPIMIW9ngulg39sST/n/BUV+VwWZy/UY8CF9ht3d5ZM0JKs6D2vqX8JdDvZpOUdzv0VO8sx/CvBOkG5YuY6dGnRuT4bIV74pP9oJSCLPJTQmpelg4wOy+r+gmrL7T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777280458; c=relaxed/simple;
	bh=nifGzHK1KDi+MhaD+diN4b5xlOQ8KfhpoDluFhd0VHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j/wv4gfomeXxlKz2Cj842vZJkaELN81op+AJOOtJbyyrhLABBmrM3MOMWuZBXS7mdziLhP/cYAhFKoZ1J0iyONMgNm7qpkn5ccXje3nJci8ScvNUdgha0LbRWHEJJGqgBjpjwaM1PjGY4BW6l7n4uOWDgBIjL7rVJ2fZ22BxeOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lg3/eHHP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d77f60944so7342916f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 02:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777280455; x=1777885255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qNCPN6+T16GFuM9cQYRA4xcaJ/ZDsKI0wjBkIoMFCU4=;
        b=lg3/eHHPGt5kH9TtP79oWzyZFIOo3bIMJuUQqbaLyurxybF4CvW/FN6qVHIL/mmgbW
         a4HkS9fM1r5MsNE9dPtmcP8uQu7tdbGbYzwqVrfsQniMX/QpN9lndaUZ5mqWNOqkunDm
         uygb6Aaw4PzZvGf4T0VQxrzqYsvJZMlwjQGM95TfszO2GDHnIcRYv8oliJF8915QJWNT
         3rmOVNqOdt0SdQmY8zKVB/Rvft7rZWmTXgP5Z4USknrvLlh51zlLi1sM0H4JCkOzf54+
         CCIiqGtGTuEUXK0jmv/vnCtC8mB/EhXY21kwPCwaXNRJDGXViDyVrmnffWA1lektIagE
         /ITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777280455; x=1777885255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNCPN6+T16GFuM9cQYRA4xcaJ/ZDsKI0wjBkIoMFCU4=;
        b=IX+XPrMAQVnxd9cXJvKmMBnlDxRTNF5XPv/Qll/keXYFeHK0PSF2yODNWLXbfRFn6/
         C7yS5vnvB/kW2PY1iNEPNpgj55cZ/02t3XJSwo696vT7sCr0j7Qbt6Sjeh9fputogZkc
         pzNZ9fEJlxkSQfMoiEpGzFfO5W7hR7RKSCYKZN49BlDuRkdy/VcS0Pjb2PVbC7qbu6Of
         VnC5OONRrhYn+aKw0/DE165Gz39R3hxfwAt4aZIkx5mSMkNb+i+LvsZkSDX+g0/fDQfz
         TmuBwbsG/EG2HM5F9ySfeCJUv4nF0iBdRWFfvtNVyeI6zlbAayrCUc/wO2lrJW7302W+
         Zukw==
X-Forwarded-Encrypted: i=1; AFNElJ/LDYz6Mw5m/xWkPYOvJhnHhnBWitKRI1K0p3xio+n1RGTCenM8QfEhhVvR8QrhZcVALJTOkgnEL5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXaJSuR+uCnNJdP6AFQRshp+/3dUtL2+6zBHo7XChSRjeUwEQW
	MsQ0w5rQjJHACskCcXqzUBqGvX5RlAglr+GVmqRFLJ9QmczbAXcrYyeA
X-Gm-Gg: AeBDieuDwqJDAt7nFpHIn+zo3mGohiIL+IR8hQLTeJgahhUaMjIkrg7ZSEaSHLVciM2
	xy+QMMQFs57NXzZiE+rJ1zrS3oQIbGLDeewqadRa3YGqb2ZEnTKMzS6rprDDSJmAN1Al0Q0LIfD
	sDf/ympT0e/TDJA9hRVkdesghPGKEjkbz4kcjA384z02GwhIP3d5OzZ10hiDfwVQqF/ZxpJTUtq
	pfUTmT3m3NX4ovHCNVQQiMzhg5fCGzCfQlDslj/sJawyANtRtXgKOjEX5edLPWP8hs60ZyHJfTY
	qus0QnyCU5k/kFK8rUHiA1Wpxu5k5e1m7WRg548qX1suOHrC0XXDKFLB+yqOuyVvZG9SeEmSUn3
	gFMtb+ivsa5IImAmFIN3Sa1aEdHTzPcmZs08TpEYOsq9IIrAUiE3gsJks0i8fO8iOkl6NRaF38N
	JPcuznrpdAYPmJpFUGEuAbDf4J/yI3APJzUC9CHrnyCodQy8wbZCSyTj3exvbyZ/hf/1ij5fUmo
	ZdGKhQbD9IpMaMnP44IrAGEPZWW3dmWbx62L08xjKuGEX0UjkNL
X-Received: by 2002:a05:6000:4308:b0:442:c577:72c0 with SMTP id ffacd0b85a97d-442c577756amr11050790f8f.13.1777280454914;
        Mon, 27 Apr 2026 02:00:54 -0700 (PDT)
Received: from labdl-itc-sw01.tmt.telital.com ([2a01:7d0:4800:7:a04:488a:882a:de93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e44f69sm83091879f8f.25.2026.04.27.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:00:54 -0700 (PDT)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH] USB: serial: option: add Telit Cinterion LE910Cx compositions
Date: Mon, 27 Apr 2026 11:00:47 +0200
Message-ID: <20260427090047.582858-1-fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EC4FA46F83C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36522-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabioporcedda@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Add the following Telit Cinterion LE910Cx compositions:

0x1251: RNDIS + tty (AT/NMEA) + tty (AT) + tty (AT) + tty (SAP)
T:  Bus=01 Lev=01 Prnt=21 Port=06 Cnt=01 Dev#=108 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1251 Rev=03.18
S:  Manufacturer=Android
S:  Product=LE910C1-EU
S:  SerialNumber=0123456789ABCDEF
C:  #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=02 Prot=ff Driver=rndis_host
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=88(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=8a(I) Atr=03(Int.) MxPS=  10 Ivl=32ms

0x1253: ECM + tty (AT/NMEA) + tty (AT) + tty (AT) + tty (SAP)
T:  Bus=01 Lev=01 Prnt=21 Port=06 Cnt=01 Dev#=121 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1253 Rev=03.18
S:  Manufacturer=Android
S:  Product=LE910C1-EU
S:  SerialNumber=0123456789ABCDEF
C:  #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=06 Prot=00 Driver=cdc_ether
E:  Ad=82(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=88(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=8a(I) Atr=03(Int.) MxPS=  10 Ivl=32ms

0x1254: tty (AT) + tty (AT)
T:  Bus=01 Lev=01 Prnt=21 Port=06 Cnt=01 Dev#=122 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1254 Rev=03.18
S:  Manufacturer=Android
S:  Product=LE910C1-EU
S:  SerialNumber=0123456789ABCDEF
C:  #Ifs= 2 Cfg#= 1 Atr=a0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms

0x1255: tty (AT/NMEA) + tty (AT) + tty (AT) + tty (SAP)
T:  Bus=01 Lev=01 Prnt=21 Port=06 Cnt=01 Dev#=123 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1255 Rev=03.18
S:  Manufacturer=Android
S:  Product=LE910C1-EU
S:  SerialNumber=0123456789ABCDEF
C:  #Ifs= 4 Cfg#= 1 Atr=a0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=88(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/usb/serial/option.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 0cd65b782488..d2db0005ea24 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1513,7 +1513,11 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1231, 0xff),	/* Telit LE910Cx (RNDIS) */
 	  .driver_info = NCTRL(2) | RSVD(3) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x1250, 0xff, 0x00, 0x00) },	/* Telit LE910Cx (rmnet) */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1251, 0xff) },	/* Telit LE910Cx (RNDIS) */
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1252, 0xff) },	/* Telit LE910Cx (MBIM) */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1253, 0xff) },	/* Telit LE910Cx (ECM) */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1254, 0xff) },	/* Telit LE910Cx */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1255, 0xff) },	/* Telit LE910Cx */
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1260),
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1261),
-- 
2.53.0



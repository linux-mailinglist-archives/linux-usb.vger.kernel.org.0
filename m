Return-Path: <linux-usb+bounces-35842-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IETRFVgpzmnIlQYAu9opvQ
	(envelope-from <linux-usb+bounces-35842-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 10:31:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A61FB38609C
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 10:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0705F3075EF0
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 08:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD60156F45;
	Thu,  2 Apr 2026 08:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5RxGs0j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9151F36657D
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 08:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775118484; cv=none; b=iIYMoTv47IK21uQw7HVNH6UUJ7/ArD2RdrXgieyVXGH8yN7Rysti5xa6WAJ84qYqfY8ioTqJ7pNxb4lW3Pr6I8n1VFAY7ZrsXyFM1vriGhapEvsrSJgCMFxPIOQt/KxwJNouNMx6Jynw4n/PxrWQPNsY0NTfhofHfO3huSiGA3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775118484; c=relaxed/simple;
	bh=tarLERNBKOtyYb4Q+HBSCbG+JD9EoCIFwUNlx2VSDfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S+qWsL83rfoUX0O/ecl9dqBnx7IuM+/9+arnARGZ/xgP/v07z95aZyL1V0vPnY7N8Q9zqm/wYK7TXU7ycVY+KJ93iV+BtpuQwit7w1yLg0YDdjzFYtF6/vdD2jCPfHoDmml/GXgtRFAGe/CYn/YbW4SqXgXDw5LSNF8yRs51OUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5RxGs0j; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488895ad947so6419245e9.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 01:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775118481; x=1775723281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UrWLSJgQTK1T18x1WNavYJmwmGYoKkJtsdK/sj+YpBg=;
        b=C5RxGs0jw7NEGj5mvISM+zLoYNiKXJLQIQHcNXZgkNbuLUcRzHmR+Jlo0QvWuHZyM0
         qlC878lQDwcuZxAaPUC0wkotkBKvydmZ68wBIrG66mvKctUwgFvV2kDvUQCYgjn0Wass
         opva0w9hby2ItmJ+3Wa/eSPT2qosqjP8H0xhQRjisp3FoZ2cu6+1EHpGVwwWklx6U4ue
         29oWAoDv1RjiisFR7Vg9yuSYUfJBTnAqEgGr8KKCY0RgX7h/VFogOvoxJGn64ukta36Q
         Rfjgj41svv7/QlhX4BuUR38myUf4Q2x4ag/OPo31GJOoE820bXZB7QMlOCZmDUrvnxXZ
         F7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775118481; x=1775723281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrWLSJgQTK1T18x1WNavYJmwmGYoKkJtsdK/sj+YpBg=;
        b=hUMS1l2vP2YvHMTrL/IlYmfo6genxkgvpM5mE0JwHcx5x2fnIcRh34kPT5ZBdL67R/
         aAkveOsxZ6iDhiEPI99yecM6NPhqx8A8jvke35jtPQCgNiKv9cz0YzYrP5ZiZ6wqf1dm
         yx08DPN4VVclzs3AzUSZjE/w9TZAAs7RFVSUDC6eMhiJEsqh5GEugav6oXNWLd5blOFz
         DXSGXEZJWOqrnOzfIOPRkeltmeqNA/elTLaXUL7/5UNNUXS33svohdGMZn9EVWli2/fI
         niWtGFpyw1cDVQU5FBduI3FF5vaU+WMtw+PT2BVjThQy5Fgzuu3yStiGI6KgSVFY+cF3
         YSDw==
X-Forwarded-Encrypted: i=1; AJvYcCW1aAhArNqYZczPE879wxqzs2YTfMcEXQ5mHkx8IudhgQE3Djj3gP3V30n5rJ/UyYynzG/STlaKI3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQuSXhz2LMgcUSTcb7Bn1UWH7IzgAx8V6I2Zw0TyIJCZ2I+/VN
	cUhARTUN3MnEC7fmO4tDTGiPYYXKDUWcAP4v5e7plv4E7kHAFXta+3wUCkIxofxr
X-Gm-Gg: ATEYQzyHO0pCJaH5HOQKGdqVU0sPgg0tlyMKXfS8t5uW3muowoY0u6zl/LRi73U6VlG
	YFvm8mP9zBqU1I5WeV3lug8me80rAyignWWYqOgTmnzQzxOfHthQaZNVdVHZ+BMyTqApjyofVwm
	dvG3+VFoytMmd1a559ZpJdq0eOpxTymwnak4wcY2okhB3ccefGWeB0CoCdq7xnhHdSAr8kcpOfi
	+pZj3pd1zoqFLxTXKOqNnUWZFPhgpOTqyE/VGD/UlJd78n1zUHg4nXct0Ii1LQqay/IvsrRo0Sq
	Afx7GCIFlFAv7J4ldfOS/ZFR6DHd3BK+tPmGCqTzFO/wZSTC38yIrh4c2JdpQosxTtgYVGIB3HE
	1nn36SPx1ganxSi6P/Xa5K9UdFXg+DqSn9jSdTxUCegOzmTNRAYyTsj/ZuU/uiDXH/Xdr/RXXIe
	g4MY1q6U99T+peSDm3eiVsmoa/lYe2AZMAiGb4FjXgmymT1oI2fiZS4RVdbKvhzLQqj/ZEWoVDl
	IKE2Qhymweh5dgxN2eTcCJcJ16ioG3tvSH33pC9bA==
X-Received: by 2002:a05:600c:4f12:b0:485:9a50:3369 with SMTP id 5b1f17b1804b1-488835a1820mr111150445e9.29.1775118480721;
        Thu, 02 Apr 2026 01:28:00 -0700 (PDT)
Received: from labdl-itc-sw01.tmt.telital.com ([2a01:7d0:4800:7:a04:488a:882a:de93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c91f0casm61961085e9.35.2026.04.02.01.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:27:59 -0700 (PDT)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH] USB: serial: option: add Telit Cinterion FN990A MBIM composition
Date: Thu,  2 Apr 2026 10:27:47 +0200
Message-ID: <20260402082747.98441-1-fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35842-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabioporcedda@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A61FB38609C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the following Telit Cinterion FN990A MBIM composition:

0x1074: MBIM + tty (AT/NMEA) + tty (AT) + tty (AT) + tty (diag) +
        DPL (Data Packet Logging) + adb

T:  Bus=01 Lev=01 Prnt=04 Port=06 Cnt=01 Dev#=  3 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1074 Rev=05.04
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN990
S:  SerialNumber=70628d0c
C:  #Ifs= 7 Cfg#= 1 Atr=e0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 6 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
E:  Ad=8f(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 313612114db9..c71461893d20 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1383,6 +1383,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(2) | RSVD(3) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1073, 0xff),	/* Telit FN990A (ECM) */
 	  .driver_info = NCTRL(0) | RSVD(1) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1074, 0xff),	/* Telit FN990A (MBIM) */
+	  .driver_info = NCTRL(5) | RSVD(6) | RSVD(7) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1075, 0xff),	/* Telit FN990A (PCIe) */
 	  .driver_info = RSVD(0) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1077, 0xff),	/* Telit FN990A (rmnet + audio) */
-- 
2.53.0



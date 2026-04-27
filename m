Return-Path: <linux-usb+bounces-36525-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aA3CMaMr72mb8wAAu9opvQ
	(envelope-from <linux-usb+bounces-36525-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:25:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAA046FE2D
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23E88307A79C
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A033B19D5;
	Mon, 27 Apr 2026 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLhb9bUi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA4B39B943
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281488; cv=none; b=UPWS2niyj2a23jLHhKUTQ4OfOLiCCXALe+XvEKKIqHtdKPeL+845AR582tr1NyC21WvKbIYi3xJhT36Tl1Gsp+DZgFK32gUVueJ08bKd5TMmL22ngVM8j9bigsyWqh8HjRqpAbiHSUUNSXxinmQDPGXufKlNueNqzW6aEZmXVo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281488; c=relaxed/simple;
	bh=fnN35qESeOdgi4tF4w09XQRiEb7fMrqlZft8OZ4lmno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FCcF7RqFAJy+/SnLkYKoyVJptDhrd2Gfu2KXS1qg92N4WEJQIcEQ9ZEl90yXzfohkCnfGYdDMe7Q8sXFn08xtNWAzLoPZOLTGDiUBgTidJRt8wKXtwcLcxJj7bff26lE5/WozTwOT3hXfbeOpN/UvWEby8Euf1WVo7evJOvi3Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLhb9bUi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso108069505e9.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777281486; x=1777886286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5GEpNVWjonWBwD4A06zP9qS6FFrJA5lpTK9sFcNHDE=;
        b=JLhb9bUi3fM7++ocNF/cyD3hgm5Y7+r8V9qPsL+M6JVBy6RvfN7vTVwQQHhuHa2tyi
         lkbiCNqPv+2t5tqrpCpJJ0jr9PMxBBt2H9eLadLNZExRnQjGXXSINZC+dRHMnBGTNTOj
         7Wqc6vsaG7Z45yQbhiUOj88Bpi2VwRSpj1NY8DiZz59NYaIFE4lpST+eXGPzFdlELu5m
         dxs9i/fuQdOAO1J2hwfubsc4Rp7Vtvf5HtloVwSzSHMVdN9O+zHiRe0kQWaAd4aHuoKE
         VzBf3dgfZAOPqyyXEfNQe0v27TxcnIV+GpQQn/jeBpzus/uMjUCOnn7JzZ1c4wmDZldr
         5AmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281486; x=1777886286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5GEpNVWjonWBwD4A06zP9qS6FFrJA5lpTK9sFcNHDE=;
        b=Nv5TeBzOnowL+KTPwCHtKNBoxM/ojL8aWOeOVaABYZKZVEV1N9XsLCRhTjEg5fuY/K
         Nnjie4kYUsPTgYP4uykpK+HAWS0j4eSFEGHrNqiYMsaP6v6rXqeIJlpvCCAFrH1BuP8q
         FbRBO28Rh1cjaxPyqNbBZp9nYT9H2wpL/dRt1B0arLWDCtpkXFIxMLs1nJIxpkjGJ5ly
         uxcOFp2QvRv4qIaTUIPWdpJi/UBFVrU0xuXJV0ERH3B1vikec3Jpvy1GZGFkiOmdqS6j
         73HPMDxKdYtK4L9kOl0bdXin91Y8wvyKLTKstGF/Boc2EYc3ayjyzf3ExV5ysNqt9AUT
         leZg==
X-Forwarded-Encrypted: i=1; AFNElJ+2p6YLqRyv3OzkK+NCaol7EPdUvIYZr+nH57oYuWE9xdti0CnFQuCkk8KEE5NHpiSR+xomj00P0jY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi9tmbzIoeTTwGIvt9SHsaLsMDya0UkLyJlbiCYCWXqN4FVTDX
	oawX+7ojXlkVCr2/9MzXQ/d4NmopitEQfHdd4Xqzzxga5dHIMSjy8J3g
X-Gm-Gg: AeBDievQFn03lnyoopWVOSxxgpWRtjrPp/OLeeo/LSqUwnNr9SfyIa2NGKBholZqJqr
	Q2ZHZPhUINI8PxR3s61BcfZ1AWgkVF9gPCc3mOEsXElDm2kfIJPPp4aLV9Wxcj/1ypuqgUbwf4Q
	EMYG7aQ4ZC+zr2Xf67rVyK98cvs7sBfp6c0QjV7D5rp44pPzM58WpgUMsGBUXc1qC69fwmHgPod
	NdqmKfC7XLDZAsf/Ej+xBZ96e0yV+dURSMKkALASS7cs/E0wkZRklMLAYOyDUfyQXz/54+i1hQG
	nuhd9yXq4+qfNDqFFbSp9AioHD+afPPRXhmiV8MrYHeBrzdZtEFGiCS9nniYba5znZcFNdycFjV
	9cWvKMz6sWGxZcnvQwL9wWu0Ue3Z5unc6q0RCJ1mlAt33IZc0sZE/PT8HVWqZ3Wzlu8n1Fd0mQq
	cqTeUxfGm9ECBRapE1Mw0TEtVHcsGUxRdO0i2mb9efV6/WznFdZpZejcCy7+cXI/L7vfp8fE/DY
	GEk00XQELb53Ke/1H8HQMiIGNekO9GkDPVsWGcIlJWgyk/FuLCJ
X-Received: by 2002:a05:600c:2d09:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-4890c5778ffmr279466465e9.27.1777281485373;
        Mon, 27 Apr 2026 02:18:05 -0700 (PDT)
Received: from labdl-itc-sw01.tmt.telital.com ([2a01:7d0:4800:7:a04:488a:882a:de93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a525a0b1asm231769375e9.2.2026.04.27.02.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:18:04 -0700 (PDT)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] USB: serial: option: add Telit Cinterion LE910Cx compositions
Date: Mon, 27 Apr 2026 11:17:46 +0200
Message-ID: <20260427091746.592613-1-fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4BAA046FE2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36525-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabioporcedda@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

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

Cc: stable@vger.kernel.org
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
v2:
- Add stable tag

v1:
- Link: https://lore.kernel.org/linux-usb/20260427090047.582858-1-fabio.porcedda@gmail.com

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



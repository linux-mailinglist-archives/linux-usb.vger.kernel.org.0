Return-Path: <linux-usb+bounces-32653-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKc/IpyRc2ntxAAAu9opvQ
	(envelope-from <linux-usb+bounces-32653-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 16:19:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9977B5B
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 16:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69E413033A8C
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 15:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18624288D0;
	Fri, 23 Jan 2026 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zs9Flc+f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F218E2FF669
	for <linux-usb@vger.kernel.org>; Fri, 23 Jan 2026 15:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181569; cv=none; b=XSHdCZOr3Bk27dPK0NKJz1QDwbNcS6XH/uOzSoPMhaELbFjXalhilmVoqp+M3dI3DtKZORm+kw1X+dtbWpfGat1UbLIyraBOVIKxvyiVqp475ZJiq52NtTJApmRJ5DwzZvrfGc+j76xVKp7cM3T4raSWkQtF7/6tSlFVwatEhA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181569; c=relaxed/simple;
	bh=4LpPjfe9rn+yS1PGQxoW/QbbKg7ajPxiq2wbY1UkUUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cXxvUBuHfNNphWDKCdG+wShc270uWeCkC89vqYSMDy2kP1lsIF7EYrOPVMtAIPrlBmwd1HTbmp+o5w5Nbz5CeQ9fEmlqY7qcvip2JzCp88WCrKYG/OBqKMD7k+8Eqii77F+lyJrAJkxoqrGY+JtXaWz4MRO45AyG8eU2Q61Xxug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zs9Flc+f; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso23591395e9.2
        for <linux-usb@vger.kernel.org>; Fri, 23 Jan 2026 07:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769181563; x=1769786363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BCjQjnmUQotpo9OdMGqmi14ed2NFhOcZgtY8X7pDrs=;
        b=Zs9Flc+fAeyyyKHfhmHjUPegKiKLL6nPJmoknG8HJTkjVgJ1c6AB24S6ZM4iQeMIQm
         a5mTUTR8n6MhqqM45xixn0Xs5QweY4GxVQ0YgDVAD7ON7x3cmpI8f2gyyc54Nv02CQ5B
         cntliDFsXi/Oru+K82NZbI0iIULfj7zloo0BBsd4v8XOJ+Lb5QEUZdRWlNUwYvER7WLY
         zt/p6TtMPzILLynMB7QH8V3qc+aJp1IpiRdZmkxWvd6rEQvSzBWnbD7tf+o9yAwLM4UC
         o8ZJo27SkLiPN5G/YogSFv4LFD2lgHdClhqYrCdsjvV1gBI5XfwJ5eHorEmtpwipsLgd
         dhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769181563; x=1769786363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BCjQjnmUQotpo9OdMGqmi14ed2NFhOcZgtY8X7pDrs=;
        b=tr66qGsdgk+NTIJb6iPwmMql+CI4AWHhuBUllG8U/96LuZzPiiAdBrdYYvD4k1sZ+s
         sI4goClCkEeig7R5FUNyo+RGzRWoaEPL3m95bz5Pzxy4oKrDQ0qQKPU0oZZUIyQLmQbZ
         xYlW5KoQr2d7xxF+xqK8a9lTwjxf0GepCECwsVe69KqeNO063zpRKtqLJ5AABJFOuHwY
         RlgsxlVh1VmDKXB/EEZUbUpXtz33AIyTUWSYDj7u27tkNO51K0X/Z25M85y2lALgZ/+x
         yCoGNt5cJeJFM8tTSKhr1W/U1jSu3e5OJdir9S57+a/qrkL0LMjOZXamXjI1bHOgMekN
         mcig==
X-Forwarded-Encrypted: i=1; AJvYcCVQVQuGGkhcNW3liOLGbdU4SxAmQvX5xDw/cy4iie7p7i35QQEq4DzA+900hsDZVv6dmGYxgEtEXzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvI/K0wgCOoTyWyLE8l9iknQ/vsCa9YZNSATaheYCtUgB+MA2I
	z+Mk9guNQ4O+KHx/om8XHDfedkOy/mQFnMWPi0+zXX2bTATn2oOAD5HX
X-Gm-Gg: AZuq6aLgnO2agRtrzgPxjwb6no19pHP1dpzp9PFXjaIlMDAe+2kl54Dji3KqqKXB0/e
	+DF9NTSLXOCa61EmEagDF3Mhh9N8Bdr8TtIRe2wlOrYbdg1NObtFROQlveXISFoec1Fb7Llry8s
	Oj7fHQa07abBW3veEFMhZCgHR/5NQBVmlrK1fOSN+scE8cpHRCUEuvt9iG1QAzS5nLqtdAIaq21
	/9LYK1hwRXZiiXSnMdO/o1PuDOTCOvW9Ig46HgPypx+yFOA43daSN8WjREmzU933ivbSu1raxez
	KlnrIl8JnpYeyLnjmSyLjZ3AQkYxNPyymKzJ04f/Nfk8SMZv9eX110csb6l8qmNsQDfZp/pFSDV
	aO+SRuBGXLV47/RA/2fXw2mACnmj3jBFku2w6XUEgB1Iv+zrZhgrU7lU5UaIujnodooys1xM1vf
	DPxqHvlrejY9FmzGTB/HNzpnjMyT7pNIZU0TcCJEf2otEN/+8YTXMiYI8fvfGMR1k5iaFA5+sgL
	7nWMUFTvo0h1DNglB2cJEQ4N0QOxRQ=
X-Received: by 2002:a05:600c:8216:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-480511e5085mr28092675e9.7.1769181562560;
        Fri, 23 Jan 2026 07:19:22 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com ([2a01:7d0:4800:a:8eec:4bff:febd:98b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804db8da59sm24375875e9.5.2026.01.23.07.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:19:21 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] USB: serial: option: add Telit FN920C04 RNDIS compositions
Date: Fri, 23 Jan 2026 16:19:16 +0100
Message-ID: <20260123151916.25381-1-fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32653-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: B1C9977B5B
X-Rspamd-Action: no action

Add the following compositions:

0x10a1: RNDIS + tty (AT/NMEA) + tty (AT) + tty (diag)
T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  9 Spd=480 MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=10a1 Rev=05.15
S:  Manufacturer=Telit Cinterion
S:  Product=FN920
S:  SerialNumber=d128dba9
C:  #Ifs= 5 Cfg#= 1 Atr=e0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=rndis_host
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

0x10a6: RNDIS + tty (AT/NMEA) + tty (AT) + tty (diag)
T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 10 Spd=480 MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=10a6 Rev=05.15
S:  Manufacturer=Telit Cinterion
S:  Product=FN920
S:  SerialNumber=d128dba9
C:  #Ifs= 5 Cfg#= 1 Atr=e0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=rndis_host
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

0x10ab: RNDIS + tty (AT) + tty (diag) + DPL (Data Packet Logging) + adb
T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 11 Spd=480 MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=10ab Rev=05.15
S:  Manufacturer=Telit Cinterion
S:  Product=FN920
S:  SerialNumber=d128dba9
C:  #Ifs= 6 Cfg#= 1 Atr=e0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=rndis_host
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Cc: stable@vger.kernel.org
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/usb/serial/option.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 9f2cc5fb9f45..d4505a426446 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1401,12 +1401,16 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a0, 0xff),	/* Telit FN20C04 (rmnet) */
 	  .driver_info = RSVD(0) | NCTRL(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a1, 0xff),	/* Telit FN20C04 (RNDIS) */
+	  .driver_info = NCTRL(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a2, 0xff),	/* Telit FN920C04 (MBIM) */
 	  .driver_info = NCTRL(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a3, 0xff),	/* Telit FN920C04 (ECM) */
 	  .driver_info = NCTRL(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a4, 0xff),	/* Telit FN20C04 (rmnet) */
 	  .driver_info = RSVD(0) | NCTRL(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a6, 0xff),	/* Telit FN920C04 (RNDIS) */
+	  .driver_info = NCTRL(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a7, 0xff),	/* Telit FN920C04 (MBIM) */
 	  .driver_info = NCTRL(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a8, 0xff),	/* Telit FN920C04 (ECM) */
@@ -1415,6 +1419,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(0) | NCTRL(2) | RSVD(3) | RSVD(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10aa, 0xff),	/* Telit FN920C04 (MBIM) */
 	  .driver_info = NCTRL(3) | RSVD(4) | RSVD(5) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10ab, 0xff),	/* Telit FN920C04 (RNDIS) */
+	  .driver_info = NCTRL(3) | RSVD(4) | RSVD(5) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b0, 0xff, 0xff, 0x30),	/* Telit FE990B (rmnet) */
 	  .driver_info = NCTRL(5) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b0, 0xff, 0xff, 0x40) },
-- 
2.52.0



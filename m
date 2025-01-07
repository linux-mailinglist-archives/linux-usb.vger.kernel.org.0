Return-Path: <linux-usb+bounces-19076-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF416A045CA
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 17:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D17AE7A324B
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 16:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4511F4E30;
	Tue,  7 Jan 2025 16:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=turris.com header.i=@turris.com header.b="rpdrZI8C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9021F4710;
	Tue,  7 Jan 2025 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.31.204.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736266598; cv=none; b=LLDH3DiNaG8HOrQub/Rxq+RMo1WWd4LqKKizVZscQZZ63j2BZc4wVDRsRMaDq/yWNHevqCQIXZSNVoY/aCIFbBfAZbFrD04f1VPPI8hPWrfwC4xh27t9JRdRLQ1IOsFENdG6u9h1qtUSd7mKCoFP5noGXEGhSmgcdz+QSauKXrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736266598; c=relaxed/simple;
	bh=9JsarrC4F+wToYPsN9sg4QYg8GM2RYtdHLdT9Gc69jw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i8nF8SDPa6PiKAMoOz672/0naP03giQeCKx3IwvApfYR1O0eYLUW29T7uYeJkEGMeXgwYCIyuGB7ZBcZSXoWgN5v4LQwaGiG/rxkNhFsflMzMdYZG2p1Ddi2AWuCsE2RM5A2YtMc461ormEc5UKaVkAe4EsVAKplHXBnETGPxbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turris.com; spf=pass smtp.mailfrom=turris.com; dkim=pass (1024-bit key) header.d=turris.com header.i=@turris.com header.b=rpdrZI8C; arc=none smtp.client-ip=217.31.204.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turris.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turris.com
Received: from localhost (unknown [IPv6:2001:1488:fffe:6:1695:51de:f3c4:a72a])
	by mail.nic.cz (Postfix) with ESMTPSA id 983451C130C;
	Tue,  7 Jan 2025 17:08:29 +0100 (CET)
Authentication-Results: mail.nic.cz;
	auth=pass smtp.auth=michal.hrusecky@nic.cz smtp.mailfrom=michal.hrusecky@turris.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=turris.com;
	s=default; t=1736266109;
	bh=9JsarrC4F+wToYPsN9sg4QYg8GM2RYtdHLdT9Gc69jw=;
	h=Date:From:To:Cc:Subject:From:Reply-To:Subject:To:Cc;
	b=rpdrZI8CCZeVRNF/GTgXeoXIY5vD9oDzD5EQndsHdsg0lmxQ8G4izlAHcX4nb3aD6
	 gGF1NVHMvaEcItEWisbT5tSojHQWBOujKR5ilmce8KS8oiqYONR79AJIYrmYWSjB6q
	 YGwtRKyiDg6U5xV35FIoVuI0bfqPq1pn1ivlBLPc=
Date: Tue, 7 Jan 2025 17:08:29 +0100
From: Michal Hrusecky <michal.hrusecky@turris.com>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: option: add Neoway N723-EA support
Message-ID: <csxkrj4qclw3yzijwr57zqqd737kk47zpwjvy6t2oxnobmvswp@o5gt4k7vtwql>
X-Operating-System: Linux
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 983451C130C
X-Spamd-Result: default: False [-0.10 / 16.00];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:25192, ipnet:2001:1488::/32, country:CZ];
	WHITELISTED_IP(0.00)[2001:1488:fffe:6:1695:51de:f3c4:a72a];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Server: mail

Update the USB serial option driver to support Neoway N723-EA.

ID 2949:8700 Marvell Mobile Composite Device Bus

T:  Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=2949 ProdID=8700 Rev= 1.00
S:  Manufacturer=Marvell
S:  Product=Mobile Composite Device Bus
S:  SerialNumber=200806006809080000
C:* #Ifs= 5 Cfg#= 1 Atr=c0 MxPwr=500mA
A:  FirstIf#= 0 IfCount= 2 Cls=e0(wlcon) Sub=01 Prot=03
I:* If#= 0 Alt= 0 #EPs= 1 Cls=e0(wlcon) Sub=01 Prot=03 Driver=rndis_host
E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0c(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=89(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0b(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0e(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0a(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Tested successfully connecting to the Internet via rndis interface after
dialing via AT commands on If#=4 or If#=6.

Not sure of the purpose of the other serial interface.

Signed-off-by: Michal Hrusecky <michal.hrusecky@turris.com>
---
 drivers/usb/serial/option.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 64317b390d22..758f02f0d2b9 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2412,6 +2412,7 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0640, 0xff),			/* TCL IK512 ECM */
 	  .driver_info = NCTRL(3) },
+	{ USB_DEVICE(0x2949, 0x8700) },						/* Neoway N723-EA */
 	{ } /* Terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, option_ids);
-- 
2.47.1



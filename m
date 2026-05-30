Return-Path: <linux-usb+bounces-38187-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOlrLgJkG2o2BwkAu9opvQ
	(envelope-from <linux-usb+bounces-38187-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 00:26:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3293C613AA1
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 00:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6941830AEF55
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 22:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90EF37999D;
	Sat, 30 May 2026 22:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=expunge.us header.i=@expunge.us header.b="t2QqMHmB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XtiI2ZFK"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9EE379974;
	Sat, 30 May 2026 22:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179619; cv=none; b=eHY4MBgfNRP6r6VA9eIK0PmORjxrvgRbBvFIXlSxwLkLCGhPo2xNtTxelp1qtFQ/jbzUqiy/yaCcgV2kDFOwFBCDkwATRDa9qSEl425MePJuSzYtUSG5aT3I67MqyKX7JdMKw0yQK8jVfc5kmUm2TcdlbLWZfWn784DuXlQU9Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179619; c=relaxed/simple;
	bh=+z0U5rVoXYVrhRpUArt2FjfGKPszEsrubs4Cd0c1xXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FED1z13OiFmsJtK0hj9LaEb/6RvwWDKanW1zzt0XhWkRm2J6sNsdqsYMlrWFkX65Zw1pekH+/uj80Td/8XoK9fc/GlhmQqXs2sOx40D+A84pE7blonxPW+ugPR3SoG8YnFKlM1JbiFGjq8AGCy63i3DDY/23zRx6CkNBskwtPVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=expunge.us; spf=pass smtp.mailfrom=expunge.us; dkim=pass (2048-bit key) header.d=expunge.us header.i=@expunge.us header.b=t2QqMHmB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XtiI2ZFK; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=expunge.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=expunge.us
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 630D07A0097;
	Sat, 30 May 2026 18:20:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 30 May 2026 18:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=expunge.us; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1780179616; x=1780266016; bh=AY9+HyWFLGJq/TbTgr1Fr
	Z7duk9/Yrjcw8UxB2yEWng=; b=t2QqMHmBsNCmT0WXy2xuZzmiXS+fTspPos8cH
	e5oq/cxrk5OkmHvTDj2CgnnjAkjOkcBxyryaxOXUTC7YSX4BiymY68ErDDScuukb
	9cYtu1ASIff0JsfQUiqrFjZjlbQ+WWK11YcvnHrXXNLN5c69+yUcv79Cgm/tjipA
	U9yEc45W0V8nVI7pfbM4hSc8Ivxoo5FQEWTQZSbkvp63+qjy3Djl7/Rnl+d/4LH8
	jaGaAo71APyRvLGeqUugYqdkAM25dNNJYXwAKbBepgVlhSMF066Bd36CFUaLkmbO
	9c4QNZtlIH4IElewuiaRs6Ifbt6X2xcnS78oNEuvdjv4+BaDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1780179616; x=1780266016; bh=AY9+HyWFLGJq/TbTgr1FrZ7duk9/Yrjcw8U
	xB2yEWng=; b=XtiI2ZFK9XtuujBPjIPOra+xecZUqFpVD4IYx8/cuiCoK2U/V8A
	wRq9VaL1nvdLYfaY+RoKdwYnPzE9s/VG3z6qi0oI4vn6YllazOH+KOxc+B51Igaq
	qGXGtCprsQwv5G0/vbSeBcQz5LgqaGuDM1GNi524UFSKwgJ/HAXWYhrJ7j41Z20m
	ya/7hXmQLRomNaqnZXiPmK3ZC1HIFGt/jIiY0mwmzkqybOp8UjWEoTVJvrNzRjCa
	sf0w6fa6JgWMeMw692khgs9x2gaNySQGRaNAQrp0Nq1mL9K8v5Sub0G1RWzxSogv
	Kv1ajs7+kAlSR3LGlNCu0hK1D0Ri5u1yXew==
X-ME-Sender: <xms:oGIbau59z5yGqcH7bl4fOEJ6QpEr6pZI3eAuADqYMrpKMbSwDZdazA>
    <xme:oGIbapachTDGP2wC3ErHldbFwuNFEbsvAZ37OAujLrTnCFOR5ciQYyeyJZkiVXQjO
    Vl-Q-pVzJOpioutvXo90mDW_I5_TIwD01odxvzc07YC_5v2ov_KbjI>
X-ME-Received: <xmr:oGIbatgs8FZ0IwvQ77NgTZCclMCYaCVHcxeMqneRKoePLzJ2wrObOwkMvZJcqpI0-gRb3yxhbwBvjsyQKrEghviIh1j3nIlsZN2I-Kz1OLJCjz5TzA-mTULRLE8nhx8oVWHrJi5uapg>
X-ME-Proxy-Cause: dmFkZTFXNlZs5ygAmLH8cyqVcCE/xwWISata/dB5Xmip7TYH2HMH/ia/g33yKyblEKTWNH
    meRps/v/rSu3dnLREQz6YP8XyILfrXFL5CRyy89X188xRDkZ5W9XuZZJJjAw2UOVIfZG1g
    6EFEG2DDSAe3NgyMm15hs0H5fQzr3lpVMIkuR8xMWrWuH64xATi2T7A8UDL/kVxjglZ18c
    2V+CcAcb+xNDPUhcMzZ3rSzr8PiNMbsB1JWxh43Ij2jfRKqhld96+KzH0+rnPJNt/jicxy
    zZTswiAOCk6g8qiz77risIsnP1JOmO0/cYHxjA3wZ2WdGu9dQJkjAWruvnH7Mi8Zze0+aF
    e1x+VlL+PXmkyBnRIBmlR0OHVR9XyziUdu+WHlWTBbXQYChVH8yEStOve5RWPT3sX2majO
    6+cVRHxZoLksSdPUS6N1dmgvhyEI/J54UZZXxeUZvVkXbdRTDqs4VUUMzWez/XZX2SQ7iI
    +2owUm4Pep5NFAg2Zf+pKfTVEzHp4yKSvSJgELTAEoXTTOf3wPEOsCMnbg1hOXqAkyB7i8
    gmtXatdq8eh2+iJmL+0SBNLmNgbToK+rRR6orclD1E93xdIr1nXlm9Vt8GUVZh7d7I8C2C
    hUy52bTCDlNcpoCXoBSfzqDdDqBkK0BFw65d0DijEVu2LLtGV4kWQ05P8Bsw
X-ME-Proxy: <xmx:oGIbaq-BqXfNwvNNcb4LSYlJfyj9dNzjIZdcbhyW3aMhJUYx_-M5jA>
    <xmx:oGIbaoq5POOSQf78kx8fyIUZx2ERvXPbHlwr0wN4XGaabrWPxtG5eQ>
    <xmx:oGIbaiU9Nv5fevXuQ-qVlzs0O5TkTp4YZjI213aAzeKjmdG70CD5gw>
    <xmx:oGIbanCh5rS0p75AuZ4bKhmuM72OmrGYihuJZoRzI_UEPLTaoKYVow>
    <xmx:oGIbaqAN5ubRWDqaS0jnMJY6iwA1Ya3Dx98ZLQ3jgNY5mCjACgh7eFA2>
Feedback-ID: i0af9447b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 May 2026 18:20:15 -0400 (EDT)
From: Jared Baldridge <jrb@expunge.us>
To: 
Cc: Jared Baldridge <jrb@expunge.us>,
	Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: cdc_acm: Add quirk for Uniden BC125AT scanner
Date: Sat, 30 May 2026 18:19:48 -0400
Message-ID: <20260530221959.612526-1-jrb@expunge.us>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[expunge.us,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[expunge.us:s=fm1,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38187-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jrb@expunge.us,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[expunge.us:+,messagingengine.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,expunge.us:email,expunge.us:mid,expunge.us:dkim,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 3293C613AA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Uniden BC125AT radio scanner has a USB interface which fails to work
with the cdc_acm driver:
 usb 1-1: new full-speed USB device number 2 using uhci_hcd
 cdc_acm 1-1:1.0: Zero length descriptor references
 cdc_acm 1-1:1.0: probe with driver cdc_acm failed with error -22
 usbcore: registered new interface driver cdc_acm

Adding the NO_UNION_NORMAL quirk for the device fixes the issue:

 usb 1-1: new full-speed USB device number 2 using uhci_hcd
 cdc_acm 1-1:1.0: ttyACM0: USB ACM device
 usbcore: registered new interface driver cdc_acm

`lsusb -v` of the device:

 Bus 001 Device 002: ID 1965:0017 Uniden Corporation BC125AT
 Negotiated speed: Full Speed (12Mbps)
 Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            2 Communications
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x1965 Uniden Corporation
   idProduct          0x0017 BC125AT
   bcdDevice            0.01
   iManufacturer           1 Uniden America Corp.
   iProduct                2 BC125AT
   iSerial                 3 0001
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0030
     bNumInterfaces          2
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         2 Communications
       bInterfaceSubClass      2 Abstract (modem)
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x87  EP 7 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0008  1x 8 bytes
         bInterval              10
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass        10 CDC Data
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x02  EP 2 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
 Device Status:     0x0000
   (Bus Powered)

Signed-off-by: Jared Baldridge <jrb@expunge.us>
---
 drivers/usb/class/cdc-acm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index ddf0b5963859..3cb372721282 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1810,6 +1810,9 @@ static const struct usb_device_id acm_ids[] = {
 	{ USB_DEVICE(0x1901, 0x0006), /* GE Healthcare Patient Monitor UI Controller */
 	.driver_info = DISABLE_ECHO, /* DISABLE ECHO in termios flag */
 	},
+	{ USB_DEVICE(0x1965, 0x0017), /* Uniden BC125AT */
+	.driver_info = NO_UNION_NORMAL, /* has no union descriptor */
+	},
 	{ USB_DEVICE(0x1965, 0x0018), /* Uniden UBC125XLT */
 	.driver_info = NO_UNION_NORMAL, /* has no union descriptor */
 	},
-- 
2.54.0



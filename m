Return-Path: <linux-usb+bounces-38210-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMr1CejzHGrxUQkAu9opvQ
	(envelope-from <linux-usb+bounces-38210-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 04:52:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74451618E82
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 04:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 367813016915
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 02:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D52822F74A;
	Mon,  1 Jun 2026 02:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCFxPQ3Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAB81DED63;
	Mon,  1 Jun 2026 02:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780282324; cv=none; b=LPbjzxQIl1bSzgLcY/ez3gbgS4VwBcu3qLicVwX1l7cc1bBapT28tQIQ/Y/oRQvYGU17FegKXLIFum12nQNmHWW8+zcQoGXlGvmhuyoZM594Np2HuIolDJb84WQfxYYMO7KAoBzig+gjXRsL8Rk5BYEenYSlPWx0hHnnhrSullM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780282324; c=relaxed/simple;
	bh=gFx0CXu6EGFMy8QGSKa/fPMUv8w8pD+02r4pN8tto4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PzBD9egqswwIZ68CamBY78L/vGiZ1kG8CMowIMlKOok5CTG4sps3eBdXwiCrwLNjBQSZTRx469cM3CRgXu9BLyathdcD6qMeJkhYgruXAHuVhykjC2wSU3KDEnfcZK3NsOmoM7+Zr3UxGdVGJ5RnL4nFAwkMhodrV0NoT7UkqJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCFxPQ3Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95D7DC2BCB4;
	Mon,  1 Jun 2026 02:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780282323;
	bh=gFx0CXu6EGFMy8QGSKa/fPMUv8w8pD+02r4pN8tto4Y=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=VCFxPQ3YwQYBKdGzDvTvKNpi6qHKUSjVufjqSiN0zOPFUO1R/455CTPh/Eyb97XYk
	 ofhq31K2+emU7hyVfqWJV5osSIcDklKHiZoHbfHf54Pu5KYKtKh/eGeCJRSYX+Tqbq
	 lW0JgJB1sS259xI3fW8FiJmeQctKD0XKjVkE1gY/HCMrCqjY2XWZlTdSOolYTvj+gI
	 dGSDabvzAPo2+Jg96yki0WPHsjEvNgUU5hL2fbs5wNFHbwLatPVuxXtoHq++806iv5
	 QSVx0xPGVgx/iwClehTgriat8hGU4J1d+j5zbyQhk3EAYqECV3q4uZe7KeEZPiB/Aw
	 AF7iNqy+eA5Kg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C9ACD6E55;
	Mon,  1 Jun 2026 02:52:03 +0000 (UTC)
From: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Date: Mon, 01 Jun 2026 10:52:01 +0800
Subject: [PATCH] USB: serial: option: add new usb-id for Dell Wireless
 DW5826e-m
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-dw5826e-option-driver-v1-1-e0a0a72cfe1b@compal.com>
X-B4-Tracking: v=1; b=H4sIANDzHGoC/yXMwQqDMBCE4VeRPXchphhsX6X0YJJR14PKRm1Bf
 Pemevxg5t8pQQWJnsVOik2STGNGeSso9M3YgSVmkzXWGWdKjp+qtg48zUueclTZoIyHb4K517C
 +ovydFa18z+7rfTmtfkBY/jE6jh95huZpeQAAAA==
X-Change-ID: 20260601-dw5826e-option-driver-e9bac038e2b5
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jack Wu <jackbb_wu@compal.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780282322; l=2993;
 i=jackbb_wu@compal.com; s=20260526; h=from:subject:message-id;
 bh=oLGr2MBmaHaVF3yGoDC09WgaV1UaQJ2oj62gl0Nv3Vk=;
 b=U9qVeaGN82mBG+a8oU//dTL8mbR9c27hVxQSQkmt4+mJ/Y2QR9I+D+69G3FSCK6N7Ux98uO9h
 3u0vcLSvAYRCoZQ/b6DVSrPQxj8zeHcsiWxH44TE2hPoQu+oVK/BO7I
X-Developer-Key: i=jackbb_wu@compal.com; a=ed25519;
 pk=VH1prTWixNl8OEUPPSfII3p46MzJpQN8J3+ecE1tZXg=
X-Endpoint-Received: by B4 Relay for jackbb_wu@compal.com/20260526 with
 auth_id=793
X-Original-From: Jack Wu <jackbb_wu@compal.com>
Reply-To: jackbb_wu@compal.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38210-lists,linux-usb=lfdr.de,jackbb_wu.compal.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[jackbb_wu@compal.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,compal.com:replyto,compal.com:mid,compal.com:email]
X-Rspamd-Queue-Id: 74451618E82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jack Wu <jackbb_wu@compal.com>

Add support for Dell DW5826e-m with USB-id 0x413c:0x81ea

T:  Bus=03 Lev=01 Prnt=01 Port=04 Cnt=01 Dev#=  8 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=413c ProdID=81ea Rev= 5.04
S:  Manufacturer=DELL
S:  Product=DW5826e-m Qualcomm Snapdragon X12 Global LTE-A
S:  SerialNumber=358988870177734
C:* #Ifs= 7 Cfg#= 1 Atr=a0 MxPwr=500mA
A:  FirstIf#=12 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:* If#=12 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#=13 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
I:* If#=13 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
 drivers/usb/serial/option.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 48ae0188f2e9..e37013a6956a 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -203,6 +203,8 @@ static void option_instat_callback(struct urb *urb);
 #define DELL_PRODUCT_5829E_ESIM			0x81e4
 #define DELL_PRODUCT_5829E			0x81e6
 
+#define DELL_PRODUCT_DW5826E_ESIM	0x81ea
+
 #define DELL_PRODUCT_FM101R_ESIM		0x8213
 #define DELL_PRODUCT_FM101R			0x8215
 
@@ -1125,6 +1127,7 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(0) | RSVD(6) },
 	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R, 0xff) },
 	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R_ESIM, 0xff) },
+	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_DW5826E_ESIM, 0xff) },
 	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_E100A) },	/* ADU-E100, ADU-310 */
 	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_500A) },
 	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_620UW) },

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260601-dw5826e-option-driver-e9bac038e2b5

Best regards,
--  
Jack Wu <jackbb_wu@compal.com>




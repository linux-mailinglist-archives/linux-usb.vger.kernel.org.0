Return-Path: <linux-usb+bounces-37086-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGR2E6+e/GkMSAAAu9opvQ
	(envelope-from <linux-usb+bounces-37086-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 16:16:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B52864E9F47
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 16:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23401303FF2C
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 14:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6602F3F9F27;
	Thu,  7 May 2026 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWffYkB1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90A640DFB3;
	Thu,  7 May 2026 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163113; cv=none; b=SYZDakbM+k5I52ISi1zu+aRW2r9If3PuOwQOlR/h8acnP7Sn6ge2Om1TLKaHZHHmCg3Ypuy2Ms6DwRILOpEsV38iy65se3T4n71LJb8uTBN53p91230iGVqxu3jpvdLuNWcuG5xh7jCrSKEF18pQ5iTUEbIydIJNSSSXwZ9djNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163113; c=relaxed/simple;
	bh=+bgSjFqMXDTOl/1zkD+RBAeEvUEOm8x+Vr7Sja+psWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UDfyBSgVroNIPKZ4VHFNkewc7cfnf23RR6wpB9flAWmRjxRTg86UuWhYJlx/QJ3PtLDPWy71GJmgA5BFzhCCe9UBwB1T5W2SUXIOnTk0oWm12iqMRXkfpA8er4GTcM+EtcoB936skLd9vEThK4A8Y8IhpzhfZN2w8BPp2ZcgjDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWffYkB1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7643DC2BCB2;
	Thu,  7 May 2026 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778163112;
	bh=+bgSjFqMXDTOl/1zkD+RBAeEvUEOm8x+Vr7Sja+psWY=;
	h=From:To:Cc:Subject:Date:From;
	b=YWffYkB1YbAPn/F7sOD1vWwdNKe0rDEcbPEboGE3lutmd+w8OxJTa595z/GnDXCq6
	 c2OjkAEP9OaImOTpCO1FPHD60AGeZEyr/1aj+3LeaQj8qeCxsuoF5h5z8Q81aB4DUk
	 ohRu8eMuyesELYReAs/jgTB2TcTpvFHlCemLYlHMhS0gNcj6W0jrKA+wYzMiWuQDjn
	 DCpWvIZ18tul7Fh/WDirtYJEYNjWDhy3kqaG/MCO0BdERsXLv64TmvOIOjrhhrvt9n
	 yYH8H7W+Re+JsKnaPONRLc/0dlTTpmkL35/WCAFRWj9Xo34tuDM76uUZXU69pVs09W
	 6JkB8jEEMq1lg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wKzSA-00000001C0n-0RBa;
	Thu, 07 May 2026 16:11:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Crescent Hsieh <crescentcy.hsieh@moxa.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: mxuport: update number-of-ports encoding
Date: Thu,  7 May 2026 16:11:14 +0200
Message-ID: <20260507141114.284470-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B52864E9F47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37086-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

In preparation for adding support for 3, 5, 6 and 7 port devices, replace
the current one-bit-per-type encoding of the number of ports with a more
compact four bit encoding (2..16 ports or undefined).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mxuport.c | 38 +++++++++++++++---------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index ad5fdf55a02e..591be1fe3737 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -146,11 +146,6 @@
 #define MX_WAIT_FOR_LOW_WATER		0x0040
 #define MX_WAIT_FOR_SEND_NEXT		0x0080
 
-#define MX_UPORT_2_PORT			BIT(0)
-#define MX_UPORT_4_PORT			BIT(1)
-#define MX_UPORT_8_PORT			BIT(2)
-#define MX_UPORT_16_PORT		BIT(3)
-
 /* This structure holds all of the local port information */
 struct mxuport_port {
 	u8 mcr_state;		/* Last MCR state */
@@ -159,26 +154,31 @@ struct mxuport_port {
 	spinlock_t spinlock;	/* Protects msr_state */
 };
 
+/* Encode number of ports (2..16 or undefined) */
+#define MX_PORTS_MASK			GENMASK(3, 0)
+#define MX_PORTS_OFFSET			1
+#define MX_PORTS(n)			(((n) - MX_PORTS_OFFSET) & MX_PORTS_MASK)
+
 /* Table of devices that work with this driver */
 static const struct usb_device_id mxuport_idtable[] = {
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1250_PID),
-	  .driver_info = MX_UPORT_2_PORT },
+	  .driver_info = MX_PORTS(2) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1251_PID),
-	  .driver_info = MX_UPORT_2_PORT },
+	  .driver_info = MX_PORTS(2) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1410_PID),
-	  .driver_info = MX_UPORT_4_PORT },
+	  .driver_info = MX_PORTS(4) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1450_PID),
-	  .driver_info = MX_UPORT_4_PORT },
+	  .driver_info = MX_PORTS(4) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1451_PID),
-	  .driver_info = MX_UPORT_4_PORT },
+	  .driver_info = MX_PORTS(4) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1618_PID),
-	  .driver_info = MX_UPORT_8_PORT },
+	  .driver_info = MX_PORTS(8) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1658_PID),
-	  .driver_info = MX_UPORT_8_PORT },
+	  .driver_info = MX_PORTS(8) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1613_PID),
-	  .driver_info = MX_UPORT_16_PORT },
+	  .driver_info = MX_PORTS(16) },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1653_PID),
-	  .driver_info = MX_UPORT_16_PORT },
+	  .driver_info = MX_PORTS(16) },
 	{}			/* Terminating entry */
 };
 
@@ -942,14 +942,8 @@ static int mxuport_calc_num_ports(struct usb_serial *serial,
 	int num_ports;
 	int i;
 
-	if (features & MX_UPORT_2_PORT) {
-		num_ports = 2;
-	} else if (features & MX_UPORT_4_PORT) {
-		num_ports = 4;
-	} else if (features & MX_UPORT_8_PORT) {
-		num_ports = 8;
-	} else if (features & MX_UPORT_16_PORT) {
-		num_ports = 16;
+	if (features & MX_PORTS_MASK) {
+		num_ports = (features & MX_PORTS_MASK) + MX_PORTS_OFFSET;
 	} else {
 		dev_warn(&serial->interface->dev,
 				"unknown device, assuming two ports\n");
-- 
2.53.0



Return-Path: <linux-usb+bounces-37358-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOPnJUTkA2oRAAIAu9opvQ
	(envelope-from <linux-usb+bounces-37358-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 04:39:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F1F52C4A9
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 04:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D85A33038A57
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 02:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1FD38F931;
	Wed, 13 May 2026 02:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oes.ch header.i=@oes.ch header.b="oKNVEwJu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEB138E8A8
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 02:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778639913; cv=none; b=mT2Cuxlb2ozrxZyOhl61AkR1IQgf3NELdHctuiQZd9Krqiw7D+rRUd8dC1OZHAKBTFfxzG2XILMA5FJ/b47+NYl9Z7G5N0NvN3+SiXxmnSh6dKdX26typMeXlA+57chh/9XspL6KPY7lCkqkkdCnEOk8Kr+O5+Yuepxa4R6whTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778639913; c=relaxed/simple;
	bh=PACgyRDHY8+p2IqJDyyFDxhAY/5G5muP957NySbjyv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X02T51iRUrwMfP6+Ig6OF0F9Or5gnoyGhXQJJ2a9NKk+oyHj81bdBBaPdlnbbjXTp233XXhidX6VbkKuQ6f1eifBGDyxBiNz11E8cJ8SymiEd2Wkor+RC2XsrN/kEeL4pDWTQmuA2GTh45LGkRhWyFgOsiFTeVMzJg9K+3DLsLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oes.ch; spf=pass smtp.mailfrom=oes.ch; dkim=pass (2048-bit key) header.d=oes.ch header.i=@oes.ch header.b=oKNVEwJu; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oes.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oes.ch
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36523acb0c1so4436010a91.0
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 19:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oes.ch; s=google; t=1778639908; x=1779244708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+qUGTPmf2JaFyRhBX/Sm1elkBeMqWvLUvWhaNkiQMI=;
        b=oKNVEwJuWxGwagbCrak1VETVFdM/Bgga6DS+UDdwiJ7+3yR6YQ0ft0108g38riG8oF
         J6hkkt69AyAm5SdRcJIF6xaRdgqMiub9+8HD2Po2OiWA6XMSNgXKxRbnlZqIYX1pkexu
         B6vjnQ8sdkTIfzI11bNg1EAE8ujjyb/A3/GeCCcuwt6dj8dS2KSv7bM7CCV9cDwijX9M
         KVsvONLgkVQHBXHpH6/+2SM4a3EneSuXIyWrOOXMyrCCOJTtfuMcitXcgrTSZmTZkXTt
         i7e5zAhmgY/VznhGSo02Pl7leI+9QbwsAx2zWtnwcppOGlgR1qD4eGvenRATaVLCQL+U
         VmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778639908; x=1779244708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+qUGTPmf2JaFyRhBX/Sm1elkBeMqWvLUvWhaNkiQMI=;
        b=NdkWpX2ovbcgj5PiHUltEYzWEAZkcz+kWHuAJpfE8fiem+Pe4C79ZyX8xHMDwCEE76
         lgvoT+zkHshIyhgsWW/phpuPtr9GCw/TqEfHRcKDxXFdccetPaGRycem+D/JEdab5f9H
         13nYDUQNtn8eS8QKGFovBGptuOU6BcgcIb6Sqv/AuQqT1ozs58ic7Jt+wgeEBdxWAqYg
         wjMyDsvWPEN/SAqdhQEsBNqECNBjVGVmJYlUXC1FAcgPrB0+RfDmxkyz0HMwPC6CAyHU
         WSQkY7yeFMneO2Lc06+w+VancRDgJd1mQdMvQo6EyCcPZlGWCb16e7gkiGOPTENADYjv
         cMMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8f/2jofgnMnb1cBopiuNYtnfiWaiuNF9SlYsSHBz+gas4jAmRsSCGB4BbdkFlBMRjm5/88lsGC4SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBqjsb/CSVD3xGFUVp9Cj3lRr/sBTbQZWGiuwBvK/BELTuW85I
	BzvOtZvTez7MApFQ2YM2NhO5WosBT/Wib0FjsBE9DmA44MUyZpsz4WfFEjhObTYEXw==
X-Gm-Gg: Acq92OG1FvMtbtfMGQA6GDPYhxkNOZ24lZtfzedmvcwP6cTC0rbzrXBNFOkT+qp4n7h
	PCZMgzJeINknLwNrfsB+866dXi0MmSPTvT1gmGDHch47mjcN980ae/1YJdqBqhpXGpJ4xrJeujA
	oYis1je8uKcTFHi68cQOUjOHVGCoyJLhKURbqjHvSb8MzOTmEvEcfRvOWYOcs4kINexpBG7/tKO
	Gn3W/QE/XTYzPBsvT5aQBL5Q6XZLUhI98JXKAnYazekQz5i4sH3EtJHJZVwFXtU4OmhoB1U8+hF
	lTt6ePaYDE1cZMukp5M47jSTBqkR3ysdRKNNTp3geTqmTusIZznbdKhDr7xajqTTBX7cw0bkAF5
	feN3WfEspyau/BARYIqaF3b5E01T3Ggx5JLTI77Kcx0d7S8L41WjTRBoSoA+XtU9sYUTyJdHvxH
	O2A2wJuc+xPu3WyTif1QNUL+LsPEdwVvBprXBJpfwHlBrrD4gLa7/wK6uepr4WQdOQv6pt+JltA
	U+vebfJjcN0rafCFWTeu+iKts0eLE90VMDVXSFAmH5U8Q+gOt+4wjk=
X-Received: by 2002:a17:903:4b03:b0:2ba:99a2:c44e with SMTP id d9443c01a7336-2bd275c6b33mr14897575ad.21.1778639908456;
        Tue, 12 May 2026 19:38:28 -0700 (PDT)
Received: from cosinus.tail5d817.ts.net ([118.148.153.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bc83101ee1sm116597975ad.79.2026.05.12.19.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 19:38:27 -0700 (PDT)
From: Julian Oes <julian@oes.ch>
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Oes <julian@oes.ch>
Subject: [PATCH] USB: serial: generic: recover from bulk-in endpoint stall
Date: Wed, 13 May 2026 14:37:28 +1200
Message-ID: <20260513023728.55557-1-julian@oes.ch>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F2F1F52C4A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[oes.ch,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[oes.ch:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37358-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julian@oes.ch,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[oes.ch:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oes.ch:email,oes.ch:mid,oes.ch:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,j5create.com:url]
X-Rspamd-Action: no action

A USB-serial device can go permanently silent when its bulk-in
endpoint gets stalled (-EPIPE).

In my case, disconnecting a CDC ACM device causes my USB hub to stall
the bulk-in endpoint of an FTDI adapter on a sibling port: the FTDI's
bulk-in URB completes with -EPIPE and no further data arrives.
Recovery requires userspace to close and reopen the tty.

usb_serial_generic_read_bulk_callback() treats -EPIPE as fatal and
abandons the URB. My assumption is that for a halted bulk endpoint,
recovery is CLEAR_FEATURE(ENDPOINT_HALT) followed by resubmission.

The fix follows the pattern used in cdc-acm: On -EPIPE, defer recovery
to the existing per-port work, which clears the endpoint halt and
resubmits the read URBs.

With this patch, data from the FTDI adapter keeps arriving after the
unrelated CDC ACM device is unplugged.

Fixes: fc11efe2800f ("USB: serial: continue to read on errors")
Signed-off-by: Julian Oes <julian@oes.ch>
Tested-by: Julian Oes <julian@oes.ch>

---

Reproducer hardware:
- CDC ACM device: PX4 Pixhawk 6X (NuttX, 3185:0035)
- FTDI device: SiK telemetry radio (FTDI FT231X, 0403:6015)
- Hub: j5create JUH377 7-port hub.
       https://info.j5create.com/products/juh377

Tested on Linux 7.1-rc3 on Linux Mint 22.3 x86_64.

Debugging and patch authoring were assisted by AI.

usbmon traces of broken and fixed behaviour available on request.
---
 drivers/usb/serial/generic.c    | 12 ++++++++----
 drivers/usb/serial/usb-serial.c | 13 +++++++++++++
 include/linux/usb/serial.h      |  1 +
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index 757f0a586ddb..7f58ea55507b 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -371,6 +371,7 @@ void usb_serial_generic_read_bulk_callback(struct urb *urb)
 	struct usb_serial_port *port = urb->context;
 	unsigned char *data = urb->transfer_buffer;
 	bool stopped = false;
+	bool stalled = false;
 	int status = urb->status;
 	int i;
 
@@ -395,9 +396,10 @@ void usb_serial_generic_read_bulk_callback(struct urb *urb)
 		stopped = true;
 		break;
 	case -EPIPE:
-		dev_err(&port->dev, "%s - urb stopped: %d\n",
-							__func__, status);
-		stopped = true;
+		dev_err(&port->dev, "%s - urb stalled: %d\n",
+			__func__, status);
+		set_bit(USB_SERIAL_RX_STALLED, &port->flags);
+		stalled = true;
 		break;
 	default:
 		dev_dbg(&port->dev, "%s - nonzero urb status: %d\n",
@@ -420,7 +422,9 @@ void usb_serial_generic_read_bulk_callback(struct urb *urb)
 	 */
 	smp_mb__after_atomic();
 
-	if (stopped)
+	if (stalled)
+		schedule_work(&port->work);
+	if (stopped || stalled)
 		return;
 
 	if (test_bit(USB_SERIAL_THROTTLED, &port->flags))
diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 0e072fd87c3d..383ff1d2fc35 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -629,6 +629,19 @@ static void usb_serial_port_work(struct work_struct *work)
 	struct usb_serial_port *port =
 		container_of(work, struct usb_serial_port, work);
 
+	if (test_and_clear_bit(USB_SERIAL_RX_STALLED, &port->flags)) {
+		int i;
+
+		for (i = 0; i < ARRAY_SIZE(port->read_urbs); ++i)
+			usb_kill_urb(port->read_urbs[i]);
+
+		usb_clear_halt(port->serial->dev,
+			       usb_rcvbulkpipe(port->serial->dev,
+					       port->bulk_in_endpointAddress));
+
+		usb_serial_generic_submit_read_urbs(port, GFP_KERNEL);
+	}
+
 	tty_port_tty_wakeup(&port->port);
 }
 
diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 75b2b763f1ba..64dadb2cb7ea 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -20,6 +20,7 @@
 /* USB serial flags */
 #define USB_SERIAL_WRITE_BUSY	0
 #define USB_SERIAL_THROTTLED	1
+#define USB_SERIAL_RX_STALLED	2
 
 /**
  * usb_serial_port: structure for the specific ports of a device.
-- 
2.43.0



Return-Path: <linux-usb+bounces-35908-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIKMI7O1zmlVpgYAu9opvQ
	(envelope-from <linux-usb+bounces-35908-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 20:30:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE5F38D1DF
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 20:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31B283046D2D
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 18:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1293379EEC;
	Thu,  2 Apr 2026 18:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jj76FLMP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D45370D72
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 18:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154604; cv=none; b=KaO2stHF3vaKYcdokRTdlPmZAZbYUgcAgYuxwfDda1FUTpoGzhpJlytIZyOV7Yn//Lx7bJQKRSVN7QCvzK7RkX0GNN9afRKLcrF5rUvi4P/UO5i9kX+vZKVmxCCbRgtPnWZwlp1tHo1auPaMoMo8WTTW9/+l4sdLlv6r0vdk7qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154604; c=relaxed/simple;
	bh=DvqNfMAlcitmhGBcbtnBF01Zx2ZcpE4CrNZVy68rm4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=doBrkq7vCUWcFFxT+74UzEdyRrhNyns2xLJbMpjuBvnvdc48AP1VYbyxw/NNIrPyMVF6EkU09gYFzzmQUTF5Ndx9P++9PCC02M6jqnLzVHtDcDAN6DMyu26hXkkmsyd1uP3oBkHFoRtyVnwqENSJ9oPt+T9BpLdh9FC7aph2mew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jj76FLMP; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-506362ac5f7so10032801cf.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 11:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775154600; x=1775759400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dLel0edgFVWLHzeO67CzLVLJkUJgZaH6amipswMrBIQ=;
        b=jj76FLMPj5ALsMMp42jH4nuNp8t7/idvJeQcAE9hqnvE8kFnu+xKCVbP7Ry8F2mmRy
         1fTtj0oLWBIprba51eJ6ZVT8LMCqsfkf3oYuBgDt0lsonZ4BA4srL2gLtjUUC0axuJUC
         9bHusvwpLMJmDPMwVl3U3ie3IcLF6G3N9OSEJHRX7doFm+vup67u1/i/8eIwT3SqQVeb
         /yg/pTBIt/HnL7/MYNkdIdCdoOJulWdZKXEE997XP1RNo9FdOIMuk4ZjgeuNbzk/svQ7
         Pp5E5qZPEbLyCr3Ghtc6k0d/2G3k1iVzxZDE6MiIv9KQVqlsrHZ1wMQWNFZ5IYUTYJQT
         QIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154600; x=1775759400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLel0edgFVWLHzeO67CzLVLJkUJgZaH6amipswMrBIQ=;
        b=SN9PyDBVAatEtq2UnEp2guvy2o5VGc7pfRXA1DFqOSKfvv6sfSolaZcBlboKC83H9J
         pER91wWNfLQ5PW9S3ZPQRq7ySVhsNN3n9ECYE2DwG/8UPyM2yYzUBkwud+pPIzsX7+Jf
         OFTzCEJ3qu4hL0MHSYJrLfCHALYP4brQRwtngPJ8IezRg5jntvD9Xo8er3hW+O2NFfA+
         4V3N8SzaWu3kC7AGKh3wD5JDBRuVzYh04nN5H9wp0IpCCCNLTo97Qkyv5XbGCmYwQjBy
         4n4ZQfxqXzmOKCmX8r3ITzRxepcOu0CCSg6UrCEwvOkd9sRHGD4nttTX+ZQZLn1nLLO/
         C8VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDNwCl/agOwpDvWAla0WE2UvXLKE4WSadBPhE5Z1Ozk1MAcpg9DRlnHy6cBuHcfe2/3FjugFw2x5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjY8oxUvaZK+XSyv2fKjFFxhm2FbZNUbqtonmZsqUN/IKTRniI
	hY+3elMz/9jK9NWTrOQwL8KJ/j0gzVSHz3WReO0yyozizL32om2qg1FawFeLhyWw
X-Gm-Gg: ATEYQzwbWyFXTYma1eU5TC77liptvDYvlQyMKCaK0BFkJxjJKhA4DWi2Jyvl7zfvvhr
	3IyC40OYvEDb4LxC3wr6n2lxFwJle2H3MdM40jcqElirPAPdjJBouKAXe6kbR9HbAM85/ow3UpR
	9nHS2V3u5QkQnOLIBOF64PCaSIDWXqJNlNpfLQ7kmTOoH9KwkVv9LzFMV6IE3atWtzbLuJk9emA
	P4S/ITzqDkbis0bFp8rgZsavy10bfyWB/iHpTBh8Sk8Cs5UtkRCMFf0+XAqlCbA6iUAFcz0wijj
	B4deO+1uAeHjAezTdTPMIJE7WmLDB6LUU0cda27SF7lvvyEMzwI9Or7ktAmJCKOoxTr1ZlE4XtQ
	p6eCHTPWgsAlCn9jm+Y2uwwN8ggdH4adwGeBTIb5pj23jcBY2X/oqn44fI3I8i1dP0w8CQ3tubL
	XNn0Ue6FkzSHUCT+Ey/Aqd
X-Received: by 2002:a05:622a:11c4:b0:509:e68:22de with SMTP id d75a77b69052e-50d62a70514mr6135601cf.32.1775154600463;
        Thu, 02 Apr 2026 11:30:00 -0700 (PDT)
Received: from fedora ([2600:382:6114:1b06:cf32:7ce8:f756:4daf])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5977dac0esm27904286d6.46.2026.04.02.11.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:30:00 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: oneukum@suse.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH] USB: cdc-acm: Add quirks for Yoga Book 9 14IAH10 INGENIC touchscreen
Date: Thu,  2 Apr 2026 14:29:50 -0400
Message-ID: <20260402182950.389016-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35908-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[carvsdriver@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2FE5F38D1DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Lenovo Yoga Book 9 14IAH10 (83KJ) has a composite USB device
(17EF:6161) that controls both touchscreens via a CDC ACM interface.
Interface 0 is a standard CDC ACM control interface, but interface 1
(the data interface) incorrectly declares vendor-specific class (0xFF)
instead of USB_CLASS_CDC_DATA. cdc-acm rejects the device at probe with
-EINVAL, leaving interface 0 unbound and EP 0x82 never polled.

With no consumer polling EP 0x82, the firmware's watchdog fires every
~20 seconds and resets the USB bus, producing a continuous disconnect/
reconnect loop that prevents the touchscreens from ever initialising.

Add two new quirk flags:

VENDOR_CLASS_DATA_IFACE: Bypasses the bInterfaceClass check in
acm_probe() that would otherwise reject the vendor-class data
interface with -EINVAL.

ALWAYS_POLL_CTRL: Submits the notification URB at probe() rather than
waiting for a TTY open. This keeps EP 0x82 polled at all times,
permanently suppressing the firmware watchdog. The URB is resubmitted
after port_shutdown() and on system resume. SET_CONTROL_LINE_STATE
(DTR|RTS) is sent at probe and after port_shutdown() to complete
firmware handshake.

Note: the firmware performs exactly 4 USB connect/disconnect cycles
(~19 s each) on every cold boot before stabilising. This is a fixed
firmware property; touch is available ~75-80 s after power-on.

Signed-off-by: Dave Carey <carvsdriver@gmail.com>
Tested-by: Dave Carey <carvsdriver@gmail.com>
---
 drivers/usb/class/cdc-acm.c | 53 ++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 7ede29d4c..568f0c479 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -114,6 +114,8 @@ static int acm_ctrl_msg(struct acm *acm, int request, int value,
 	int retval;
 
 	retval = usb_autopm_get_interface(acm->control);
+#define VENDOR_CLASS_DATA_IFACE		BIT(9)  /* data interface uses vendor-specific class */
+#define ALWAYS_POLL_CTRL		BIT(10) /* keep ctrl URB active even without an open TTY */
 	if (retval)
 		return retval;
 
@@ -710,12 +712,14 @@ static int acm_port_activate(struct tty_port *port, struct tty_struct *tty)
 	set_bit(TTY_NO_WRITE_SPLIT, &tty->flags);
 	acm->control->needs_remote_wakeup = 1;
 
-	acm->ctrlurb->dev = acm->dev;
-	retval = usb_submit_urb(acm->ctrlurb, GFP_KERNEL);
-	if (retval) {
-		dev_err(&acm->control->dev,
-			"%s - usb_submit_urb(ctrl irq) failed\n", __func__);
-		goto error_submit_urb;
+	if (!(acm->quirks & ALWAYS_POLL_CTRL)) {
+		acm->ctrlurb->dev = acm->dev;
+		retval = usb_submit_urb(acm->ctrlurb, GFP_KERNEL);
+		if (retval) {
+			dev_err(&acm->control->dev,
+				"%s - usb_submit_urb(ctrl irq) failed\n", __func__);
+			goto error_submit_urb;
+		}
 	}
 
 	acm_tty_set_termios(tty, NULL);
@@ -788,6 +792,14 @@ static void acm_port_shutdown(struct tty_port *port)
 
 	acm_unpoison_urbs(acm);
 
+	if (acm->quirks & ALWAYS_POLL_CTRL) {
+		acm->ctrlurb->dev = acm->dev;
+		if (usb_submit_urb(acm->ctrlurb, GFP_KERNEL))
+			dev_dbg(&acm->control->dev,
+				"ctrl polling restart failed after port close\n");
+		/* port_shutdown() cleared DTR/RTS; restore them */
+		acm_set_control(acm, USB_CDC_CTRL_DTR | USB_CDC_CTRL_RTS);
+	}
 }
 
 static void acm_tty_cleanup(struct tty_struct *tty)
@@ -1322,6 +1334,9 @@ static int acm_probe(struct usb_interface *intf,
 			dev_dbg(&intf->dev,
 				"Your device has switched interfaces.\n");
 			swap(control_interface, data_interface);
+		} else if (quirks & VENDOR_CLASS_DATA_IFACE) {
+			dev_dbg(&intf->dev,
+				"Vendor-specific data interface class, continuing.\n");
 		} else {
 			return -EINVAL;
 		}
@@ -1516,6 +1531,9 @@ static int acm_probe(struct usb_interface *intf,
 	acm->line.bDataBits = 8;
 	acm_set_line(acm, &acm->line);
 
+	if (quirks & ALWAYS_POLL_CTRL)
+		acm_set_control(acm, USB_CDC_CTRL_DTR | USB_CDC_CTRL_RTS);
+
 	if (!acm->combined_interfaces) {
 		rv = usb_driver_claim_interface(&acm_driver, data_interface, acm);
 		if (rv)
@@ -1537,6 +1555,13 @@ static int acm_probe(struct usb_interface *intf,
 
 	dev_info(&intf->dev, "ttyACM%d: USB ACM device\n", minor);
 
+	if (acm->quirks & ALWAYS_POLL_CTRL) {
+		acm->ctrlurb->dev = acm->dev;
+		if (usb_submit_urb(acm->ctrlurb, GFP_KERNEL))
+			dev_warn(&intf->dev,
+				 "failed to start persistent ctrl polling\n");
+	}
+
 	return 0;
 
 err_release_data_interface:
@@ -1663,7 +1688,7 @@ static int acm_resume(struct usb_interface *intf)
 
 	acm_unpoison_urbs(acm);
 
-	if (tty_port_initialized(&acm->port)) {
+	if (tty_port_initialized(&acm->port) || (acm->quirks & ALWAYS_POLL_CTRL)) {
 		rv = usb_submit_urb(acm->ctrlurb, GFP_ATOMIC);
 
 		for (;;) {
@@ -2007,6 +2032,20 @@ static const struct usb_device_id acm_ids[] = {
 	/* CH343 supports CAP_BRK, but doesn't advertise it */
 	{ USB_DEVICE(0x1a86, 0x55d3), .driver_info = MISSING_CAP_BRK, },
 
+	/*
+	 * Lenovo Yoga Book 9 14IAH10 (83KJ) — INGENIC 17EF:6161 touchscreen
+	 * composite device.  The CDC ACM control interface (0) uses a standard
+	 * Union descriptor, but the data interface (1) is declared as vendor-
+	 * specific class (0xff) with no CDC data descriptors, so cdc-acm would
+	 * normally reject it.  The firmware also requires continuous polling of
+	 * the notification endpoint (EP 0x82) to suppress a 20-second watchdog
+	 * reset; ALWAYS_POLL_CTRL keeps the ctrlurb active even when no TTY is
+	 * open.  Match only the control interface by class to avoid probing the
+	 * vendor-specific data interface.
+	 */
+	{ USB_DEVICE_INTERFACE_CLASS(0x17ef, 0x6161, USB_CLASS_COMM),
+	  .driver_info = VENDOR_CLASS_DATA_IFACE | ALWAYS_POLL_CTRL },
+
 	/* control interfaces without any protocol set */
 	{ USB_INTERFACE_INFO(USB_CLASS_COMM, USB_CDC_SUBCLASS_ACM,
 		USB_CDC_PROTO_NONE) },
-- 
2.53.0



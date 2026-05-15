Return-Path: <linux-usb+bounces-37515-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGbFNNAkB2oEsQIAu9opvQ
	(envelope-from <linux-usb+bounces-37515-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 15:51:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A53550C67
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 15:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D564E314F20B
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 13:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62A22D0C79;
	Fri, 15 May 2026 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHatwiJf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A762C027C
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778850444; cv=none; b=HmNuTAir0fIn78h64b4NQL9namLY7Y4UeHH+8uCdJrV4uu2MdWIVtjT3njxHgArx2IcG+zxaElrAzSL5Qiwcc3qJWwmacW03B2KD14yTaNaIT16fL2w+tCW5XL0DdYEHx3VBwNdBzHE3hr+0ysqnHCuGE/laFC6TnqcbGVCtIes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778850444; c=relaxed/simple;
	bh=cofI7NJVAquViJ0qiCgIhK+PbsvdfIANKyA1Rgf6hrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kBqJD4KmvNZkVruQuPeKJ4Ma7fK/yT4wblGzWr8RZwbRliuOR8WS0qZjw9rlTu+4rsHZWxhTs7iYdYa8vpqWwDEGtv7eozDt2cq7F62dSSjfAlQ4dewWx6sNO6+M31a2YDybTogWqTymtEDMJ3R0qOPlA7OTo/IuuN937CU9BX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHatwiJf; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6314adf187fso2595326137.0
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 06:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778850442; x=1779455242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=totgehLncZIaYpY/6W97Pa96WTd7yttCZe+aEfblS7E=;
        b=IHatwiJfg+fS9vOeOQ7xNi79QERXxxcVHXBbSLshUFlEP6RyJih5mFsAUZkyGBVQVk
         RKxbBZoM8RwStwhRTBhNpIMmJ2KU7QV3dMz9j5Kx9mgmE7MbA5B3SOuD61jssskMZn58
         4WcxZyeJAYcMKs91dh5sCarMvcytQS4ZtGhtmg3MA0K0eyfIwf6GiPmR35x+dOT08jlg
         3fJ9Afcfivgtyxo41he9Tb0IOvFULJw13FNYzRKrr4Ktxd4+v8PNBI02jxR8YIHmjxWQ
         bYVzW6U/5TybMZWHXGwFOmEHVFpaV15DzX7q2yk8ujNSKQBB6KxwibJv4iOW78j5NNJ9
         E4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778850442; x=1779455242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=totgehLncZIaYpY/6W97Pa96WTd7yttCZe+aEfblS7E=;
        b=blR6mX29nk6d7b1raipsrp+cwLIhS6j5iVOGBbbbR61PpC1ipApm1Yb6Jvgmel1UoQ
         OcFqPybP5IGmLxUacaPy1LqqXWlXKpo22nDIzBz7vCxAUkZwcR7sg2a+udyIPZbzMg1E
         grjX71NODIxNZeHtiI/eOvsMEKfggZv6gf4sQ7JCPLXSWmRsAHnTPdxzDDmHaB4vW9QN
         Hj2UzqBlF2OkeHCQaZNMaW85n7lTeT5MampYjtyI05XCqev9rJaTNs4s8Qa7riafdGHR
         mHHA+U66+V1iX34pNFJpW5OTH4YzfN5eJnKX0EJ9KQnjknq8T0nXgZ9WDTmjDcTLsM7K
         kvmw==
X-Gm-Message-State: AOJu0Ywd3ejl8qbbUlAtPDktHqdlRc298zS+KBpEQzhCeX0u2NWUAuaZ
	I/nD0PF2UqJ9PAM6T+z4Cjxj8+rjnNT5kFj2w2w5KQpPX7ZtTZgzI8V6d/ih4ZXY
X-Gm-Gg: Acq92OEYolOWa0NzUCUkwsxUyTD3BeamQjz6EBE2buuR9YZ0llV+M3QnKrR7mNx1Mco
	hXrMW/71WDl9g/d+arvLekOXOOvscsivjJuahoXwBokSsTqWQMHMwz+wwGbztisnAiiPkYJehN8
	DkqeljSjLcJSFEtsuPA6/SCqUOzRySWF75jdxMJm92qYc5kEYvsBqqKRJVTjBekjfTWbJgo3AY0
	u3UJ6hZm0ZvtGn/6OAE9dXMpAkRT6JsbfHM7yDvYNrER1V9dSyxsw+9ymhlCMmzSXLpc3QxyjFs
	O37YQQiTK5QNko+PjU0S7kX2F3LDacVczGf9YozLmF5YSCmblmBP275+go2VOQ8vzbFYbyaFKA1
	eqPfQrq/+rB4DZrRgGj53Yx0udxdBvwjgrs7HFiz23/VJazI9f0ccHYAxQ+Q0NqyQUxp0gX6VHn
	qE4PIRYK2mbYjf0XLeEmRMuDjZOhYLDJzRecZhJrLM4RRFqAJxNorRWuDfc37scggSa/g8
X-Received: by 2002:a05:6102:32c1:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-63a3e86debemr1656690137.19.1778850441761;
        Fri, 15 May 2026 06:07:21 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bc83f926sm547840085a.30.2026.05.15.06.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:07:21 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	oneukum@suse.com,
	guanwentao@uniontech.com,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH] USB: cdc-acm: start bulk-IN polling when ALWAYS_POLL_CTRL is set
Date: Fri, 15 May 2026 09:04:32 -0400
Message-ID: <20260515130432.714861-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D8A53550C67
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,suse.com,uniontech.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-37515-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[carvsdriver@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The INGENIC 17EF:6161 touchscreen composite device has a ~55-second
watchdog that resets the USB device if the bulk-IN endpoint on the CDC
data interface goes unread.  The existing ALWAYS_POLL_CTRL quirk keeps
the notification endpoint (ctrlurb / EP 0x82) polling continuously, but
that alone is insufficient: the firmware monitors bulk-IN activity, not
just notification-endpoint activity.

Add acm_submit_read_urbs() calls to the two ALWAYS_POLL_CTRL paths that
already restart the ctrlurb:

  1. acm_probe(): start bulk reads at probe time alongside the ctrlurb,
     so the watchdog is satisfied from first bind without requiring a
     userspace process to open /dev/ttyACMn.

  2. acm_port_shutdown(): restart bulk reads after port close alongside
     the ctrlurb restart, so the watchdog keeps running when the last
     TTY user closes the port.

acm_read_bulk_callback() already resubmits each URB unconditionally on
normal completion, so once submitted the reads remain active until an
explicit kill (disconnect, suspend).  acm_submit_read_urb() is a no-op
for URBs that are already in flight (read_urbs_free bit clear), so the
existing acm_port_activate() call remains correct and races are avoided.

Tested on Lenovo Yoga Book 9 14IAH10 (83KJ): without this patch the
device resets every ~55 s when no TTY is open; with it the device
remains stable indefinitely.

Signed-off-by: Dave Carey <carvsdriver@gmail.com>
Tested-by: Dave Carey <carvsdriver@gmail.com>
---
This follows commit f58752ebcb35 ("USB: CDC-ACM: add INGENIC 17EF:6161
quirk for Yoga Book 9 14IAH10"), which added ALWAYS_POLL_CTRL to keep
the ctrlurb active.  That commit addressed the notification-endpoint
watchdog (~20 s).  This patch addresses a second watchdog that fires
when bulk-IN data goes unread for ~55 s.

This patch is based on top of Wentao Guan's pending fix
("USB: cdc-acm: fix misplaced quirk defines and BIT(9) collision") which
moves VENDOR_CLASS_DATA_IFACE and ALWAYS_POLL_CTRL from inside
acm_ctrl_msg() to cdc-acm.h and reassigns them to BIT(10)/BIT(11) to
avoid the NO_UNION_12 collision.  The bulk-IN additions here are
independent of that renumbering and apply cleanly to either base, but
the combined tree is the correct target once Wentao's fix merges.

 drivers/usb/class/cdc-acm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -797,6 +797,9 @@ static void acm_port_shutdown(struct tty_port *port)
 			"ctrl polling restart failed after port close\n");
 		/* port_shutdown() cleared DTR/RTS; restore them */
 		acm_set_control(acm, USB_CDC_CTRL_DTR | USB_CDC_CTRL_RTS);
+		if (acm_submit_read_urbs(acm, GFP_KERNEL))
+			dev_dbg(&acm->control->dev,
+				"read urb restart failed after port close\n");
 	}
 }

@@ -1564,6 +1567,9 @@ static int acm_probe(struct usb_interface *intf,
 		if (usb_submit_urb(acm->ctrlurb, GFP_KERNEL))
 			dev_warn(&intf->dev,
 				 "failed to start persistent ctrl polling\n");
+		if (acm_submit_read_urbs(acm, GFP_KERNEL))
+			dev_warn(&intf->dev,
+				 "failed to start persistent bulk read polling\n");
 	}

 	return 0;
--
2.47.0


Return-Path: <linux-usb+bounces-35530-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TckPLlMIxmkZFgUAu9opvQ
	(envelope-from <linux-usb+bounces-35530-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 05:32:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B86FA33F1CE
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 05:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B77B33035C56
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 04:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B360288522;
	Fri, 27 Mar 2026 04:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H34odUv0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7034B7080E
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 04:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774585931; cv=none; b=hwC7TvLCzPPwZ1Sx7rZw8KWkAyfEiCj68/v9ErDyAbfGTx8pIzO2fg1CX4hXMCTCTsgt7W6+dhdRUfjdn5YHBYJNMKCJlTOy+m+eUMUIZT6FUaLgdEYk6lXOzIN5QBh42bLrdbhR/FT85qOcFDnY0ys+wxhcbAso0Wj8yHaDqK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774585931; c=relaxed/simple;
	bh=F5cSSUQ5ScI9usug6ghpzO/EvR/MEXEZd3O8MknV7a4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aktqp9+vm+72lo4MJMnTy9aO55tk6eAptYHsltEFmICXllq5z8en+F04t46SnA5AQ/+MQNisAf+hRmHGa8o9TZA0DF6+25yuipFW35x8JBMV+xXBoknOzwloqK6vg8UtzV7+xZARZAHBkiKR925FogUEcx5+Z35lViDXTAHb0vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H34odUv0; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56b7e5dfd25so2103043e0c.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 21:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774585928; x=1775190728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJCG/E4E1MJbOLSLRfoDYOXDOrja4FqKPSO9JWbnNaY=;
        b=H34odUv0mq2cRjgNCcWn3Bhi+3ZB0lV/BH2WJTTm3goPZ4eKg6rbDZx/t+1b2pU5YV
         jQn2UJOQ5vNJOYUg7BWD1RMvqvcn3vrNGFzm0aP6681jXFTN+O+l/hEO6jBwQYuMBrow
         aaDXcEZEc5UpfRdcnV/thTdt+Y7baRB3y/481UJchPLLfPtHV3I2cxDcbCWKTT7xUDVY
         hYLSnV68ajYMXibmaXZw7Qd4W1uBUqbc3S1BoPrzuuWcOBddJdCvVLqBLN9ERtuws9Qt
         aDzrzdPYlXYDLJbhBgh4Q1FXlG4lHbjoQMOn3WuMEABAhVPOWX7qCCzgU3pyPGzv96ED
         EUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774585928; x=1775190728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJCG/E4E1MJbOLSLRfoDYOXDOrja4FqKPSO9JWbnNaY=;
        b=gdzg4XjxaW9YTAg9UtsNbRdt0s2Iwhmp1A6MS2/qzIJ+Sbksm6H/6p3lmIxuZKXgQC
         6xf8J2Q3BIk+XK3qx+36JjUa1LmE+VzHGzDGCPBpMK3I33nukV4IrNdQpW7AxXhSaPip
         PGlsMR/rZrNhEzFqSR8RWWo35Y9KyFYijJedVMSltkAxE/m3qsGwrhDpi3h9e3eTVnAr
         gkVS0NGgB3cHfdv5gQyIn0snwlHpcjqprDLgzCk8yUDfwo6RtBAefLU5k2aKWjXjOnxv
         d/BI8KwRja4F2zCye2tB59SbDRYDbC6ceRLDE00Daj/w0roKKTiQRsssWu+EqWF7GD7M
         wbQQ==
X-Gm-Message-State: AOJu0YzzQqh9akgT3R8NXPO30tbkPCbJBkWL7sVr96nH3GYQQQJSXAfH
	/fd0ReYZw7PZtDQpnT7ljS/Tmk492k93wJwuUk5Wtbyq+TXu91EfoeejuV4TqCL3
X-Gm-Gg: ATEYQzxGKUNSUQvlmBgoOseWESUdtl11vIu8t+2VNfRBl4fIDUY7Z0A9BJuxiKzPDrq
	OWS2p8h8UStgyfmBHbwsuhwQxbvenuJhBJWUZ68HR6zCrrQpq2hDXTrkgwUuUzSXHK3eUsQflRc
	pa7hjiGK+9gXu2z3N38usM3XP1eWE4QkBMDJzs6P+vovFpnDkF6YAdkXnJ2sgJl6l09Qo6pzWT4
	uytuvfbgBYlLTHWOFaEr+RHnkcS7V4SWr1OgPAzM7Jvfpy1Cocm+WiPFq1vQKwQEhX93t/cVP+v
	VSwJ8jdwX+hzTA7ozpAPdOVhMICkf3ydgLJHMpdkdJhA94sDqcNzoc9F/AFeSzpUYJzuAS9H6in
	DaRf9Ascayak0AkmafAaWebJnHloxB2rGhNsXI4tiH/W6JdPdxRREkNQDaMF4fEvDXqN3OaQmYE
	6lakmBwagrG1s63OitHazEnDALn+W/OtIU7BVbpX0WQVlyTYpz/kGUfWVa12gmQyhCbFtm67zAU
	ONLc+PjJ7dsquyYjkgRz31rWuL4HLlJ+n46n3H4Az2e1m3S3m+HG7IvmHcaZYNSHV4Q85YQPw1p
	ykE=
X-Received: by 2002:a05:6122:4d12:b0:56d:3451:4cc0 with SMTP id 71dfb90a1353d-56d4bb837a2mr285314e0c.7.1774585928258;
        Thu, 26 Mar 2026 21:32:08 -0700 (PDT)
Received: from localhost.localdomain (2603-900b-5c40-0017-3433-631f-7c6a-3c94.inf6.spectrum.com. [2603:900b:5c40:17:3433:631f:7c6a:3c94])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31c3097fsm7386395e0c.7.2026.03.26.21.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 21:32:06 -0700 (PDT)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: linux-usb@vger.kernel.org
Cc: addcontent08@gmail.com,
	gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	kyungtae.kim@dartmouth.edu
Subject: Re: [PATCH v2 1/3] usb: usbip: fix integer overflow in usbip_recv_iso()
Date: Fri, 27 Mar 2026 00:31:53 -0400
Message-ID: <20260327043153.643-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20260325104841.8282-1-addcontent08@gmail.com>
References: <20260325104841.8282-1-addcontent08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	BROKEN_CONTENT_TYPE(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35530-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,dartmouth.edu];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B86FA33F1CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kelvin,

Your series hardens usbip_recv_iso() and usbip_pad_iso() against
malicious number_of_packets values, but the bad value still lands in
urb->number_of_packets via usbip_pack_ret_submit() before those
checks run.

The patch below validates at the source — in usbip_pack_ret_submit()
before the overwrite — and checks against the original
urb->number_of_packets (the actual allocation bound) rather than
USBIP_MAX_ISO_PACKETS. This is a tighter check because the URB may
have been allocated for far fewer than 1024 packets.

This could complement your series as an additional layer, or stand
alone. Would be glad to rework this however the maintainers see fit —
whether folded into your series or submitted separately.

---

From: Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: [PATCH] usbip: vhci: reject RET_SUBMIT with inflated
 number_of_packets

When a USB/IP client receives a RET_SUBMIT response,
usbip_pack_ret_submit() unconditionally overwrites
urb->number_of_packets from the network PDU. This value is
subsequently used as the loop bound in usbip_recv_iso() and
usbip_pad_iso() to iterate over urb->iso_frame_desc[], a flexible
array whose size was fixed at URB allocation time based on the
*original* number_of_packets from the CMD_SUBMIT.

A malicious USB/IP server can set number_of_packets in the response
to a value larger than what was originally submitted, causing a heap
out-of-bounds write when usbip_recv_iso() writes to
urb->iso_frame_desc[i] beyond the allocated region.

KASAN confirmed this with kernel 7.0.0-rc5:

  BUG: KASAN: slab-out-of-bounds in usbip_recv_iso+0x46a/0x640
  Write of size 4 at addr ffff888106351d40 by task vhci_rx/69

  The buggy address is located 0 bytes to the right of
   allocated 320-byte region [ffff888106351c00, ffff888106351d40)

The server side (stub_rx.c) and gadget side (vudc_rx.c) already
validate number_of_packets in the CMD_SUBMIT path since commits
c6688ef9f297 ("usbip: fix stub_rx: harden CMD_SUBMIT path to handle
malicious input") and b78d830f0049 ("usbip: fix vudc_rx: harden
CMD_SUBMIT path to handle malicious input"). The server side validates
against USBIP_MAX_ISO_PACKETS because no URB exists yet at that point.
On the client side we have the original URB, so we can use the tighter
bound: the response must not exceed the original number_of_packets.

This mirrors the existing validation of actual_length against
transfer_buffer_length in usbip_recv_xbuff(), which checks the
response value against the original allocation size.

Fix this by checking rpdu->number_of_packets against
urb->number_of_packets in usbip_pack_ret_submit() before the
overwrite. On violation, clamp to zero so that usbip_recv_iso() and
usbip_pad_iso() safely return early.

Fixes: 0775a9cbc798 ("staging: usbip: vhci extension: modifications to the client side")
Cc: stable@vger.kernel.org
Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
---
 drivers/usb/usbip/usbip_common.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -470,7 +470,18 @@ static void usbip_pack_ret_submit(struct usbip_header *pdu, struct urb *urb,
 		urb->status		= rpdu->status;
 		urb->actual_length	= rpdu->actual_length;
 		urb->start_frame	= rpdu->start_frame;
-		urb->number_of_packets = rpdu->number_of_packets;
+		/*
+		 * The number_of_packets field determines the length of
+		 * iso_frame_desc[], which is a flexible array allocated
+		 * at URB creation time. A response must never claim more
+		 * packets than originally submitted; doing so would cause
+		 * an out-of-bounds write in usbip_recv_iso() and
+		 * usbip_pad_iso(). Clamp to zero on violation so both
+		 * functions safely return early.
+		 */
+		if (rpdu->number_of_packets < 0 ||
+		    rpdu->number_of_packets > urb->number_of_packets)
+			rpdu->number_of_packets = 0;
+		urb->number_of_packets = rpdu->number_of_packets;
 		urb->error_count	= rpdu->error_count;
 	}
 }


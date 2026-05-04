Return-Path: <linux-usb+bounces-36905-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMr6Cs4s+Wkq6QIAu9opvQ
	(envelope-from <linux-usb+bounces-36905-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 01:33:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C654C4D87
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 01:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B553D300AC99
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 23:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA683DD514;
	Mon,  4 May 2026 23:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECKpI/ne"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA253E51DC
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 23:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937609; cv=none; b=IRFEFYCJkL41YFcYKxYPvU0k/ExhwlpGaUv1cfqmbkw4imwsGEGj0MXlygQbmMPdED9x+T/BXUVHD5HQgmDNDfVdtlPc4TrXt4v3Ltp2Wj633k7O2NWpltK6djNhMqfImsw/9HAQHDoITduvRh2cSPEYOyfGxTbFj5mewRvXQec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937609; c=relaxed/simple;
	bh=wBRGmUyg6AVY/P/huNlzwdKpZmMnbjemwy3fA1SZKVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmOtVF9Ad6n1lgQsozpKOCxjrmxIsdcxRB8lqEczsXKt7lYx6NMfFc3q1RNoBQypdxgEbE76Ig6PZCo106ob2AtMzZhCfJ7HbVmiHLtPWg87WlS43+pFZBl3vPbL54sIzGbpDmt14ykDdlrJPHJK7FS1App33E4hq1EE1PT11vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECKpI/ne; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ba67b332bbaso660477066b.0
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 16:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777937606; x=1778542406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wK3MLCAgm2Nv519XuQTCTxz0g9HZ6PHRaUPNahte4HE=;
        b=ECKpI/ne7BFTLK4kNG4w63dUIxnrBi21N5D602gk95IfpGlkm0xLGZ7Xz73/LlNRV+
         woh9vJQMmKFteMkivOraGc+mrqOHNXW8WpNIfF9cswK8doq2iFE5JGd6yX2pugDfnbc/
         7UZIKl1MVvFouxyeicsFVSKJT8vPURaLUFMC468Ay57NerpW0Py50Mb8Mu9Ke900YWXe
         I066ItEjjYWH+530e7gOqcVr+cyxI5br+++xQCF+aAyZZ2EfQM3AIgokVMMCPnR5HkVp
         K1yiXjIGFszocfbQWe71hnrIG1//AjBf0H1JzhHFEQCRD/xok9cT05wOrVA3zk4FwA0L
         z6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777937606; x=1778542406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wK3MLCAgm2Nv519XuQTCTxz0g9HZ6PHRaUPNahte4HE=;
        b=c8UhZyF9cIXQJRU/4MUBxmm/nqIzDALPZY/uU3QqTCk7MoxPclM4zueo9QqZzmx+PJ
         B7q10DzDnQOvpsD5vVfsWNnxO4y01k4VPVblBDNG1h8+uIrSBqo3otjzIoskNntqzWae
         TXa8pzEjPmq5Z+4bqIA1/+SX36nOKbXr2ODc6we9smC1pomKDl9PDKJ416wHzUgsckYb
         JNj4eNy69Y6jC3AxjZqpaC7lzKKisF6wudXZUAypwQVonZ+GDoOGG+tbNbkBKUnG/MZH
         OCwFsXCkga+PgPvlApTKG2W4pUIKm7oMXXe9cyK82y3NuIFIPnQmqzwzTp/lGfetC1fX
         YJAA==
X-Gm-Message-State: AOJu0Yz90baLUiAtLWM5RAESPKBfiyc3D+w8+3Y+LE9fqOAggP7ouMzz
	Vm3hf0CLsl9KRPcP2bnUTAvplZ0NdhXacgfwBPbbzYR2XuAGppY91qvxb/DmNOlMQaY=
X-Gm-Gg: AeBDievcQi5JT/2z1JdYUSmrgr52/m/jJi2TGqzd5LQIwsScf+tYFxcRNGoZ18XOEQk
	/XagBxAD7D4ta+kvWhwiMlQMHgH1hok3bVpLEHGVN4AwX35xm6pXWkyUY5TwE2PRMBLuheTFJp4
	71PMOkDcA2uIl+8epku+Aesm8jlUfzcQr7Veek5oH9JNu2Z8lX2XPRK4HeVjFG46Esffgy/MijJ
	bj8yJNyVrXtKPUhqxzKoP0eIo8BOaqucrVAT8dQvpfH4ZZI6IoDTCjV/LQmZxzISugalw/PTaSh
	0M6+VU8ZYXwo24LO+/7p8LA+jl8UJTUpQKyGnOMrAUzXzgpUfQu8gMAZfcIxElDz1CPIt5eqZVE
	nwZ7UYo8bz4rGKXUqKONleGg4ow01RAndC4w51G1Hhx7z+z3rn9enEfkyzmZDJYu52A3pHEi+Yl
	bz+T9achDstdZaDjnpVEyPQrjw2mvdx5Ai78Kl0APVd6j+zaC53okXn2rbBjPj//waYdJpBi+fi
	3nAGSixX/pF9PS4aCLBzBYNSFxFA/E4zNhlzyxMHz59oHSaEgDXYcqmtJYsILq2GggT
X-Received: by 2002:a17:907:a394:b0:bc1:6ec9:453a with SMTP id a640c23a62f3a-bc16ec95251mr420905366b.20.1777937606009;
        Mon, 04 May 2026 16:33:26 -0700 (PDT)
Received: from nick-GTR-Pro.arnhem.chello.nl (2001-1c00-3281-1680-7a55-36ff-fe02-cdba.cable.dynamic.v6.ziggo.nl. [2001:1c00:3281:1680:7a55:36ff:fe02:cdba])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6aa4d524sm445224366b.26.2026.05.04.16.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:33:25 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: mathias.nyman@intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nicola Lunghi <nick83ola@gmail.com>
Subject: [PATCH 1/2] usb: xhci: fix isoc silent reschedule creating stream gap on CFC controllers
Date: Tue,  5 May 2026 01:31:43 +0200
Message-ID: <20260504233143.10242-3-nick83ola@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504233143.10242-2-nick83ola@gmail.com>
References: <20260504233143.10242-2-nick83ola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C0C654C4D87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36905-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,gmail.com,linux.intel.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nick83ola@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

xhci_get_isoc_frame_id() silently rescheduled the first TRB to
start_frame_id+1 when the requested start frame was out of the valid
scheduling window or landed exactly on its boundary. This creates an
explicit one-frame hole in the isochronous stream.

Most USB audio devices tolerate a brief gap with a small glitch and
recover automatically. However, some devices assume that once
isochronous packets start streaming they flow continuously until the
stream is explicitly stopped. Any gap causes the device firmware to
permanently lose channel synchronization — subsequent packets are
routed to the wrong output channels until the device is reset.

This was observed with the MOTU 1248 (USB ID 0x07fd:0x0005), where
after a gap the 24-channel output stream shifts by a fixed number of
channels, mapping audio intended for ch1/ch2 onto ch7/ch8 or other
channel pairs depending on timing.

Return -EINVAL instead so the caller falls back to TRB_SIA (Schedule
Immediately After), which lets the hardware place the TRB right after
the previous one without introducing a frame-aligned gap.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220748
Assisted-by: Claude:claude-sonnet-4-6 sparse checkpatch
Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e47e644b296e..03e47db82092 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -4030,15 +4030,21 @@ static int xhci_get_isoc_frame_id(struct xhci_hcd *xhci,
 			ret = -EINVAL;
 	}
 
+	/*
+	 * If the first TRB's start frame is out of the scheduling window or
+	 * lands exactly on its boundary, fall back to SIA (Schedule Immediately
+	 * After) rather than forcing start_frame_id+1. A forced +1 creates an
+	 * explicit one-frame hole that audio devices with strict continuity
+	 * requirements cannot recover from. The caller handles -EINVAL by
+	 * leaving sia_frame_id as TRB_SIA.
+	 */
 	if (index == 0) {
 		if (ret == -EINVAL || start_frame == start_frame_id) {
-			start_frame = start_frame_id + 1;
-			if (urb->dev->speed == USB_SPEED_LOW ||
-					urb->dev->speed == USB_SPEED_FULL)
-				urb->start_frame = start_frame;
-			else
-				urb->start_frame = start_frame << 3;
-			ret = 0;
+			xhci_dbg(xhci, "isoc: start frame %d %s window [%d, %d], using SIA\n",
+				 start_frame,
+				 ret == -EINVAL ? "behind" : "at boundary of",
+				 start_frame_id, end_frame_id);
+			return -EINVAL;
 		}
 	}
 
-- 
2.51.0



Return-Path: <linux-usb+bounces-38275-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCAJG3V7HmrejQkAu9opvQ
	(envelope-from <linux-usb+bounces-38275-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 08:43:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6D0629205
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 08:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10F77303C675
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2026 06:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD652EAD1B;
	Tue,  2 Jun 2026 06:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDdYOCdX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB4B2D5412
	for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2026 06:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780382543; cv=none; b=DL1WD5dX/HKUnxpqO75VbqO4BviQI5DQ8eNIxCoDVZWvFS8hTF9u4MKR7IHJfiBTUU0CHzUAG7oS302mOuqWtezMBVxmQvMvbzDqdSJ8WRosWJuGaNmO49E3bZgEaRoPxqYMzdBUOawzUmO9c9R+MqSBWVnzs87k8ztso6N9c4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780382543; c=relaxed/simple;
	bh=HhWRCRbx0987uV0XD73BqOE4dStg+ejf9FCb0MaMfFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rD6uDXf/IO4VnvqZd3LuXnQcnmus9/BW/9OsHmCp0BnusPo5GPTTwJJLgZP+LBZFtWHG4Pvqxis/K9QPjLzN5ZAu/0xD2s0GaI+p893akXXQXsCEyBrFmtylIOlCas94QNAWbcww8+Fm5tgnXMgnmgzt/Mzzm+mSQmZo9FXZ+nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDdYOCdX; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4864a5c83f1so72274b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 23:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780382540; x=1780987340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGvZmsudN/chKH2NlJtnFBo+hdFQzq54JCMaW4zpAjM=;
        b=kDdYOCdX2ovpEPAMdKYTfxt+WPWroEocSWBIEfaQrbj/XeLy7SpGPKOYvy9k50IvLq
         RNaonDrdw+pUEJw3E/C7u/eiJt27zL+h4oJPIAjTWts8+KaEXmSGdKeWJuQ6etj42bBx
         AF+pdhl5XdUO1mDWlK5BBD6Po5jzTGZuBOWpm7tnSOyZVM7DFr5z26P9W5X7jwI4xj0+
         Jde5Y3LmQqB0IyATh3GyYf6v40ZVl26C0BLEcQynU85RgiSwtG+6zUU4kah7euHYLMob
         LcVhCYAL4TkHOhKVO5X6lBbu7L//XBEXnX2HBWCrkOVRk9iH+b/r2iKwSnzLhXslAd4Z
         bZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780382540; x=1780987340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MGvZmsudN/chKH2NlJtnFBo+hdFQzq54JCMaW4zpAjM=;
        b=s55qoWnOeuFipih/3JL7usp4a9xQYPrkrqmeEGZ1hUwgn7kN34Cnfv1EEIr98psBj0
         w8G2pcaSF2SrkN50KGGdCLl8GoDlWd6d4NjZ76srN/EyJHhIq1B1TtmylclT5ig4zafo
         Ur5ZXbDjdoe1RMGIoSxLitvzHlY8kHx4pfYxprA9WbempB7NQIb3ZUCfFImV5/6LXuf5
         Eq3AihDQ2TEjJ/xA0Mn9iwF/hbCmWnEFGn1oZ0SC7wb0jsuczfJvM9cKGUqtmBrYjs3f
         PdCTrEx/vHddks2b9ETcr/H0uAX0YnG74iGermjm3ae2jZxGr8WuL5LClzj5JxtEpCvh
         JDKA==
X-Gm-Message-State: AOJu0Yx+XT/qid6RJ9e1PmpAqVTPIsHMOPeY7C0E1WbQ+PFIUJXFFMwV
	NTW94r/KL6M69EOQqUnEEKy3VC0TD7I1soJcJ+SJhCsPtrLxusso/Cy+urQETw==
X-Gm-Gg: Acq92OE2Vy3slIjrtBmCdveAP/TS+gVQk/PgSbF202c3lvVP08jvMlsW06AtqSGzPws
	mIHABSRoWRtqjeBS33Q+oJ/iKbDW21usK2WU+H1t7CE6wpBJ/OAKKW7MOfUT9iv0uiGjDj+9Cb+
	BYyVTFGen5Ys4qexx82Q3qocHXFgZHNbWM5/Y9I9uNaPvR+kObiuyn+Lqha2+IztT40wXnFcJYf
	BuENTHKP4r8KnjwkDjsCJgHD061IoGv3YtZ8DM67UeAwLtnngoXDQQZftHP4tGHDOu8ZML7GC8g
	BpAD1E7I54exXMkrYC4RUPHJM9UffyBz2pWHVd2S9OYLqKaPvRzHJspJLHGrl7h89Z3E2AogWCP
	1J9d2IhGZGVXwprbXcRUGtrsPbUC6slWKulGqlLqgm7BrJ9X0HwnBrJdodwl7KsE0lxitXd5zlN
	dITD+jOUHLle7aQ2GuD/jQrDJnkigkB22EqC+2q9oY531ndfIwBsEcfppRfIsPr4ePWbAwToz5Z
	9+DqIlNiuoeGEx9VXJSKi4PfEI0e87PBoVvLJPfb4toYghUXe1PmwKKbHKCe2Ba5VU=
X-Received: by 2002:a05:6808:192a:b0:484:d5a3:996c with SMTP id 5614622812f47-485fb63f633mr8008419b6e.17.1780382540197;
        Mon, 01 Jun 2026 23:42:20 -0700 (PDT)
Received: from instance-20260601-172014.us-central1-b.c.nleo-meows.internal (105.107.28.34.bc.googleusercontent.com. [34.28.107.105])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48605fb0158sm6126743b6e.7.2026.06.01.23.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 23:42:19 -0700 (PDT)
From: Brent Page <brentfpage@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Brent Page <brentfpage@gmail.com>
Subject: [PATCH] inflate max_tt_usecs and implement sitd backpointers
Date: Tue,  2 Jun 2026 06:42:01 +0000
Message-Id: <20260602064201.84065-1-brentfpage@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <bfdd7729-be9a-4014-87bc-7b7a5b393980@rowland.harvard.edu>
References: <bfdd7729-be9a-4014-87bc-7b7a5b393980@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-38275-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brentfpage@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0C6D0629205
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---
This is a version of the patch with new formatting; the content
otherwise is equivalent to the combination of the two prior patches in
this thread.  I ran a number of tests of the patch's functionality for
iso-in transfers from a full-speed peripheral with a single endpoint
with a wMaxPacketSize of 1023.  The transfers themselves were 1000
bytes.  I tried bIntervals of both 1 frame as well as 2 frames.
  Setup 1:
- configure this "main" peripheral to send (48x 1s followed by 32x 0s)
  repeated 100 times in each transfer (1000 total data bytes)
    - "transfer" here means the data that is sent in one frame
    - the 48x 1s will require substantial bit stuffing, and the 32x 0s
      will require none; the actual number of bytes will be something
      like (7/6*48 + 32)/80 * 1000 = 1100 bus bytes
- on a single USB 2 port going in to the computer, plug in a USB 2
  one-to-four splitter
- plug in the main peripheral along with a wireless mouse receiver,
  wireless keyboard receiver, and a high-speed webcam
- Result: for both bInterval=1 frame and bInterval=2 frames for the main
  peripheral, all four connected devices function well
- notes: the main peripheral has to be plugged in before the wireless
  mouse and keyboard receivers; otherwise the main peripheral's
  1023-byte endpoint is rejected
  Setup 2:
- same as Setup 1, except configure the main peripheral to send (72x 1s
  followed by 8x 0s) repeated 100 times in each transfer
    - ~(7/6*72 + 8)/80 * 1000 = 1150 bus bytes
- Result: for both bInterval=1 frame and bInterval=2 frames, the main
  peripheral's 1023-byte endpoint is accepted by the computer, but all
  attempts by user space to retrieve urbs (ioctl-REAPURBNDELAY sys
  calls) yield error code -11, EAGAIN (instructing the caller to try
  again).
- notes: if the data transfers are instead configured to be (64x 1s
  followed by 16x 0s) repeated 100 times, then an occasional urb is
  successfully retrieved.  So, it does seem like the bit-stuffing
  requirements are an influential factor
  Setup 3:
- same data for the main peripheral as in the first bullet of Setup 2 
- don't use a splitter; plug the main peripheral directly into the
  computer's USB port
- Result: for both bInterval=1 frame and bInterval=2 frames, the main
  peripheral's usb connection is robust

Test summary: the patch works for iso-in transfers that are
- 1150 bus bytes in a frame if the associated peripheral is plugged
  directly into a USB port
- 1100 bus bytes in a frame alongside transfers from two full-speed
  interrupt devices and a high-speed webcam, with all devices plugged
  into the same USB port via a splitter

Weak point: The patch doubles the number of sitds that are allocated for
any given urb.  This is true regardless of whether the urb's transfers
require frame-hopping CSPLITS.  I figured that the memory in these
structs was negligible, but I actually get ENOMEM from line ~1400 of
drivers/usb/core/devio.c in kernel version 3.18.120 when I tried to submit
4x urbs with 33 transfers each (requiring 4*33*2=264 sitds for this
patch's code) on my 2017 Android tablet.  Things work if I only submit
100 iso transfers instead.  Also, submitting 120 transfers doesn't cause
any issues on my 2022 Android smartphone.  Maybe the extra sitd
allocation should be done on-demand instead of by default?  So, start
off by allocating an sitd for each transfer, and only add an extra sitd
if a transfer has frame-hopping CSPLITS?


 drivers/usb/host/ehci-sched.c | 152 +++++++++++++++++++++++++++-------
 drivers/usb/host/ehci.h       |   9 +-
 2 files changed, 131 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
index a241337c9..9fdfdb5fe 100644
--- a/drivers/usb/host/ehci-sched.c
+++ b/drivers/usb/host/ehci-sched.c
@@ -285,13 +285,14 @@ static void compute_tt_budget(u8 budget_table[EHCI_BANDWIDTH_SIZE],
 			for (uf = ps->phase_uf; uf < 8; ++uf) {
 				x += budget_line[uf];
 
-				/* Each microframe lasts 125 us */
-				if (x <= 125) {
+				/* Cumulative tt_usecs can be as large as 145
+				 * us */
+				if (x <= 145) {
 					budget_line[uf] = x;
 					break;
 				}
-				budget_line[uf] = 125;
-				x -= 125;
+				budget_line[uf] = 145;
+				x -= 145;
 			}
 		}
 	}
@@ -313,7 +314,12 @@ static int __maybe_unused same_tt(struct usb_device *dev1,
 #ifdef CONFIG_USB_EHCI_TT_NEWSCHED
 
 static const unsigned char
-max_tt_usecs[] = { 125, 125, 125, 125, 125, 125, 30, 0 };
+/*
+ * tt_usecs includes worst-case bit stuffing time, so the transactions
+ * budgeted for a given 125 us uframe can have cumulative tt_usecs as large
+ * as 145 us and still possibly fit into the uframe.
+ */
+max_tt_usecs[] = { 145, 145, 145, 145, 145, 145, 35, 0 };
 
 /* carryover low/fullspeed bandwidth that crosses uframe boundries */
 static inline void carryover_tt_bandwidth(unsigned short tt_usecs[8])
@@ -378,13 +384,13 @@ static int tt_available(
 		if (max_tt_usecs[uframe] <= tt_usecs[uframe])
 			return 0;
 
-		/* special case for isoc transfers larger than 125us:
+		/* special case for isoc transfers larger than max_tt_usecs:
 		 * the first and each subsequent fully used uframe
 		 * must be empty, so as to not illegally delay
 		 * already scheduled transactions
 		 */
-		if (usecs > 125) {
-			int ufs = (usecs / 125);
+		if (usecs > 145) {
+			int ufs = (usecs / 145);
 
 			for (i = uframe; i < (uframe + ufs) && i < 8; i++)
 				if (tt_usecs[i] > 0)
@@ -1388,19 +1394,42 @@ sitd_slot_ok(
 	struct ehci_tt		*tt
 )
 {
-	unsigned		mask, tmp;
+	unsigned		mask, c_mask2, tmp;
 	unsigned		frame, uf;
 
 	mask = stream->ps.cs_mask << (uframe & 7);
+	c_mask2 = mask >> 16;
+	mask = mask & 0xffff;
+	if((c_mask2 & 1) && (c_mask2 & 1<<1) && (c_mask2 & 1<<2)) {
+		/* if BuFrame6 is the last uframe in which a transaction is
+		 * budgeted, the transaction will initially be configured to
+		 * have CSPLITS in BuFrame7 as well as BuFrames 0 and 1 of
+		 * the following frame (HuFrames 0,1,2)
+		 */
+		/* below: usb2 spec 11.18.4.3.c paragraph 2 */
+		if(mask & 1) {
+			c_mask2 = 1; 
+		} else {
+			c_mask2 = (1<<2)-1;
+		}
+	} else if ((c_mask2 & 1) && (c_mask2 & 1<<1)) {
+		/* if BuFrame5 is the last uframe in which a transaction is
+		 * budgeted, the transaction will initially be configured to
+		 * have CSPLITS in BuFrames 6 and 7 as well as BuFrame 0 of
+		 * the following frame (HuFrames 7,0,1)
+		 */
+		/* below: usb2 spec 11.18.4.3.c paragraph 1 */
+		if(mask & 1) {
+			c_mask2 = 1;
+		}
+	}
+	if((c_mask2 & mask & 1<<1))
+		return 0; /* ehci1 4.12.3.1 */
 
 	/* for OUT, don't wrap SSPLIT into H-microframe 7 */
 	if (((stream->ps.cs_mask & 0xff) << (uframe & 7)) >= (1 << 7))
 		return 0;
 
-	/* for IN, don't wrap CSPLIT into the next frame */
-	if (mask & ~0xffff)
-		return 0;
-
 	/* check bandwidth */
 	uframe &= stream->ps.bw_uperiod - 1;
 	frame = uframe >> 3;
@@ -1450,8 +1479,11 @@ sitd_slot_ok(
 		uframe += stream->ps.bw_uperiod;
 	} while (uframe < EHCI_BANDWIDTH_SIZE);
 
-	stream->ps.cs_mask <<= uframe & 7;
+	stream->ps.cs_mask = mask;
+	stream->ps.c_mask2 = c_mask2 << 8;
 	stream->splits = cpu_to_hc32(ehci, stream->ps.cs_mask);
+	stream->c_splits2 = cpu_to_hc32(ehci, stream->ps.c_mask2);
+
 	return 1;
 }
 
@@ -2049,11 +2081,13 @@ sitd_urb_transaction(
 
 	/* allocate/init sITDs */
 	spin_lock_irqsave(&ehci->lock, flags);
-	for (i = 0; i < urb->number_of_packets; i++) {
-
-		/* NOTE:  for now, we don't try to handle wraparound cases
-		 * for IN (using sitd->hw_backpointer, like a FSTN), which
-		 * means we never need two sitds for full speed packets.
+	for (i = 0; i < 2 * urb->number_of_packets; i++) {
+		/* use 2 * number_of_packets to accommodate frame-hopping
+		 * CSPLITS. if there are no such CSPLITS OR if the packet
+		 * interval is 1 frame (meaning frame-hopping CSPLITS don't
+		 * require an extra sitd, ehci spec 1.0 4.12.3.4), then more
+		 * sitds than needed are allocated by this loop.  Excess
+		 * sitds are added to the free list later
 		 */
 
 		/*
@@ -2107,12 +2141,25 @@ sitd_patch(
 {
 	struct ehci_iso_packet	*uf = &iso_sched->packet[index];
 	u64			bufp;
+	__hc32			transaction;
 
 	sitd->hw_next = EHCI_LIST_END(ehci);
 	sitd->hw_fullspeed_ep = stream->address;
-	sitd->hw_uframe = stream->splits;
-	sitd->hw_results = uf->transaction;
-	sitd->hw_backpointer = EHCI_LIST_END(ehci);
+	sitd->hw_backpointer = cpu_to_hc32(ehci, sitd->backpointer_sitd_dma); 
+	transaction = uf->transaction;
+
+	if(sitd->backpointer_sitd_dma==1) { /* null backpointer */
+		sitd->hw_uframe=stream->splits;
+	} else {
+		if(stream->ps.period==1) {
+			sitd->hw_uframe=stream->splits|stream->c_splits2;
+		} else  {
+			sitd->hw_uframe=stream->c_splits2;
+		}
+		/* start in Do Complete Split mode, ehci1 4.12.3.3.2.1*/
+		transaction |= SITD_STS_STS;
+	}
+	sitd->hw_results = transaction;
 
 	bufp = uf->bufp;
 	sitd->hw_buf[0] = cpu_to_hc32(ehci, bufp);
@@ -2149,13 +2196,19 @@ static void sitd_link_urb(
 	unsigned		next_uframe;
 	struct ehci_iso_sched	*sched = urb->hcpriv;
 	struct ehci_sitd	*sitd;
+	struct ehci_sitd	*sitd_before;
 
 	next_uframe = stream->next_uframe;
 
-	if (list_empty(&stream->td_list))
+	if (list_empty(&stream->td_list)) {
 		/* usbfs ignores TT bandwidth */
 		ehci_to_hcd(ehci)->self.bandwidth_allocated
 				+= stream->bandwidth;
+		sitd_before = NULL;
+	} else {
+		sitd_before = list_last_entry(&sched->td_list,
+				struct ehci_sitd, sitd_list);
+	}
 
 	if (ehci_to_hcd(ehci)->self.bandwidth_isoc_reqs == 0) {
 		if (ehci->amd_pll_fix == 1)
@@ -2165,9 +2218,9 @@ static void sitd_link_urb(
 	ehci_to_hcd(ehci)->self.bandwidth_isoc_reqs++;
 
 	/* fill sITDs frame by frame */
-	for (packet = sched->first_packet, sitd = NULL;
-			packet < urb->number_of_packets;
-			packet++) {
+	for (int i = sched->first_packet, sitd = NULL;
+			i < 2 * urb->number_of_packets;
+			i++) {
 
 		/* ASSERT:  we have all necessary sitds */
 		BUG_ON(list_empty(&sched->td_list));
@@ -2176,15 +2229,51 @@ static void sitd_link_urb(
 
 		sitd = list_entry(sched->td_list.next,
 				struct ehci_sitd, sitd_list);
+		if((i>=urb->number_of_packets)&&
+			(stream->ps.period==1 || !stream->ps.c_mask2)) {
+			/* 
+			 * no frame-hopping CSPLITS OR the period is 1, so
+			 * such CSPLITS are put into the sitd for the next
+			 * transfer ; in both cases #sitds=#transfers, so
+			 * move the surplus sitd to the free list
+			 */
+			list_move_tail(&sitd->sitd_list, &stream->free_list);
+			continue;
+		}
+		if(stream->ps.c_mask2 && !list_empty(&stream->td_list) &&
+				((stream->ps.period==1)||(i%2==1)) ) {
+			sitd->backpointer_sitd_dma = sitd_before->sitd_dma;
+		} else {
+			sitd->backpointer_sitd_dma = 1;
+		}
+
 		list_move_tail(&sitd->sitd_list, &stream->td_list);
 		sitd->stream = stream;
 		sitd->urb = urb;
 
+		if(stream->ps.c_mask2 && (stream->ps.period!=1)) {
+			packet = i/2;
+			sitd->last_in_urb = i==(2*urb->number_of_packets - 1);
+		} else {
+			packet = i;
+			sitd->last_in_urb = i==(urb->number_of_packets-1);
+		}
+
 		sitd_patch(ehci, stream, sitd, sched, packet);
 		sitd_link(ehci, (next_uframe >> 3) & (ehci->periodic_size - 1),
 				sitd);
 
-		next_uframe += stream->uperiod;
+		if(stream->ps.c_mask2 && (stream->ps.period!=1)) {
+			if((i%2)==0) {
+				/* next sitd only has frame-hopping CSPLITS */
+				next_uframe += 8;
+			} else if ((i%2)==1) {
+				next_uframe += stream->uperiod - 8;
+			}
+		} else {
+			next_uframe += stream->uperiod;
+		}
+		sitd_before = sitd;
 	}
 	stream->next_uframe = next_uframe & (mod - 1);
 
@@ -2219,13 +2308,18 @@ static bool sitd_complete(struct ehci_hcd *ehci, struct ehci_sitd *sitd)
 	int					urb_index;
 	struct ehci_iso_stream			*stream = sitd->stream;
 	bool					retval = false;
+	bool					has_ssplits;
 
 	urb_index = sitd->index;
 	desc = &urb->iso_frame_desc[urb_index];
 	t = hc32_to_cpup(ehci, &sitd->hw_results);
+	has_ssplits = hc32_to_cpu(ehci, sitd->hw_uframe) & 0x00ff;
 
 	/* report transfer status */
-	if (unlikely(t & SITD_ERRS)) {
+	if(!has_ssplits) { /* just contains frame-hopping CSPLITS */
+		/* actual completion status reported by previous sitd */
+		desc->status = 0;
+	} else if (unlikely(t & SITD_ERRS)) {
 		urb->error_count++;
 		if (t & SITD_STS_DBE)
 			desc->status = usb_pipein(urb->pipe)
@@ -2245,7 +2339,7 @@ static bool sitd_complete(struct ehci_hcd *ehci, struct ehci_sitd *sitd)
 	}
 
 	/* handle completion now? */
-	if ((urb_index + 1) != urb->number_of_packets)
+	if (!sitd->last_in_urb)
 		goto done;
 
 	/*
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index d7a3c8d13..cb91fc5e3 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -51,6 +51,8 @@ struct ehci_per_sched {
 	struct list_head	ps_list;	/* node on ehci_tt's ps_list */
 	u16			tt_usecs;	/* time on the FS/LS bus */
 	u16			cs_mask;	/* C-mask and S-mask bytes */
+	u8			c_mask2;	/* C-mask for frame-hopping CSPLITS */
+
 	u16			period;		/* actual period in frames */
 	u16			phase;		/* actual phase, frame part */
 	u8			bw_phase;	/* same, for bandwidth
@@ -489,7 +491,8 @@ struct ehci_iso_stream {
 	/* output of (re)scheduling */
 	struct ehci_per_sched	ps;		/* scheduling info */
 	unsigned		next_uframe;
-	__hc32			splits;
+	__hc32			splits;		/* C-mask and S-mask */
+	__hc32			c_splits2;	/* C-mask for frame-hopping CSPLITS */
 
 	/* the rest is derived from the endpoint descriptor,
 	 * including the extra info for hw_bufp[0..2]
@@ -579,7 +582,11 @@ struct ehci_sitd {
 
 	/* the rest is HCD-private */
 	dma_addr_t		sitd_dma;
+	dma_addr_t		backpointer_sitd_dma;
+
 	union ehci_shadow	sitd_next;	/* ptr to periodic q entry */
+	bool			last_in_urb;
+
 
 	struct urb		*urb;
 	struct ehci_iso_stream	*stream;	/* endpoint's queue */
-- 
2.39.5



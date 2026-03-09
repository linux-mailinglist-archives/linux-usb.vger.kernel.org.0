Return-Path: <linux-usb+bounces-34316-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM//Hd/srmkWKQIAu9opvQ
	(envelope-from <linux-usb+bounces-34316-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 16:53:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 604F723C218
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 16:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC6CF3004DF1
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 15:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD37B23AB88;
	Mon,  9 Mar 2026 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVo3Z8C1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8316138F948
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 15:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071580; cv=none; b=tw/JQ4ePEC3oWYeJvx/BnXwVbkEzIyMNlcV18FXlhJJ+1noUmih0AvNkfqPv91uYyPr6olrG4f/Rly7Hu0Z0c/O7sQ0cjmV5mZfm1OMRPcnb2/ikQe3TasLYUEhdbc+VJ4I/F8TUQSVLy71WRugPJHXUTtnOeOBtOObYakjr738=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071580; c=relaxed/simple;
	bh=iWVCH2yklbl9N7AcxKQ+vGMdANbmkzkqn9Aa+siws5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BqDwRhekJa+9TWwG5Y1QpAhr87zg5tSyJtasVbHCuzLOhfHC08omzD9F2tJaO/YztF6kYQwHWpZGGjpX4PKmckupxjPU6NkVmr8luNrm+RrJ3BHTMCfK6Fp9Y5oRxpzHUfgD7xig9IVWmUV8NtbD6RgNJJBU0SWDKAFtiCL8Vaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVo3Z8C1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439c9eb5d36so4856949f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 08:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773071576; x=1773676376; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IhpgDcAFUhFb6KTnVULUhmATOOLbhT8RuXZbX1GI4fU=;
        b=YVo3Z8C1BMSXK0iJoj9zWD5eiLaVdVmGB/QMYkWt/jfbvjN6RdhrHo9NweEAjnxesK
         7x41IMubrY1IS7Rl6Mh1Zvr5yxd9XDxoln5L2xbXFCEDta98/U4gP80Uplpf71oKZb33
         BJp6PE9AsrAlfdgg+q+XT7+2ch6IrM03+DInhcl1KRVochnZoVRlhJIpQw6aGlx7bUCE
         rwpYr/Tz4bOugrEnafxxQJ9Oso9qLeFjRStc/YkAnf2taxFmBB3QuCGRp6h99G1cK8Gk
         qrIU4EwA2egMDLPw9GodcgLITkHkNm/qNZ8e1ChO+siEj35WJ2eYktV3CSgzWznDZ4lH
         aUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773071576; x=1773676376;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhpgDcAFUhFb6KTnVULUhmATOOLbhT8RuXZbX1GI4fU=;
        b=Jbfe8M5Mkewcgcat0Ueyl96cT1E01on7OZrokjBNa+3QGqm65t3d/EgCmfOk08d+w2
         0/PqUvyF4M8JuyzX+hqWBkxU4Zv3AdH9O+CKCpoJXj1Pts4EAj/7TugRd/yuFACayKyM
         XTEjfqCeV/lhTRD1+mRq6lEJBsQzjBz40rRtjIP3wV396z+Cz6nSTCH0hhvyvTEg/gIM
         uXZwflIt86p1ERm699LiuDLppCRyMAF++kUI04TVKxVz1BsMTTPryViX678Qly6XmRHv
         pWpHH1jPqUdk1GvOLMV1Y/Oe0Uh7hA2vrpY2tUAguUVAECRxl3Olec3K2McoGS+QqLnP
         y5gA==
X-Forwarded-Encrypted: i=1; AJvYcCUL133zHfCjI8/HwFihBUT28t1vpelyHaPrMbB0D8iq859lA+IIX2jVcBs0JZRa0WsXmS7vBQN0Fn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJeg+xbjBRtPI/pEeBbXKvAbuSo5goLeWcpUKv7dMcblb5iPEG
	UuL+8lCpVvKYT+PULd+2Lk2VziLperSRn3hI70qAs1t1mnz5lptoaOJM
X-Gm-Gg: ATEYQzwuVKPmYvn/cY4wM1iDMF2ccW+oJN0ClSj47nXI2Vd+psIvbbLi/thvUgAX/gO
	hOUiz5OvJVBFe+1A1xeezUJmpwNlM944ftyqDikB2sOwK99RXnUE1Ht13XcjL9AJkCEO6+8EqB3
	Y24OIm7kKyAKrv/u7SDmu55Y8BO7qiZ2o7HSfpOT6ST3HAA8Mq49yK015wLTjD5f3xekoS+D2MN
	WKWrkWbwygvqsxB4h/4i9NRfpix8n/J0ZkuEaTh905eS3WZ8ibRrg7JDP2eoyB+VI0CoB1H9+E4
	Z78azFg5gbG3pxgdFJ/ez58+wxSnn1L0h0j9hQkLyzTLxMysn3fE3EQHiB5aU0QtRI/30PbJZAA
	E48yir38FZyxPQXIoEhy4YPiJCwjoX6Hcik7hDfy6vccb6z9KfrCYgRe8xMdcshs5LZu6/euFFr
	UGssvK8G7TcX1c3F+KLoKpgzeavIZsAKcbj5FW
X-Received: by 2002:a05:6000:3108:b0:439:ad3a:b737 with SMTP id ffacd0b85a97d-439da35f75amr21842270f8f.35.1773071575494;
        Mon, 09 Mar 2026 08:52:55 -0700 (PDT)
Received: from [192.168.178.21] ([2001:9e8:fbbc:100:22c9:d0ff:fe7b:79cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2ba66sm24243288f8f.20.2026.03.09.08.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:52:54 -0700 (PDT)
From: Liam Mitchell <mitchell.liam@gmail.com>
Date: Mon, 09 Mar 2026 16:52:29 +0100
Subject: [PATCH v3] usbhid: tolerate intermittent errors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-usbhid-eproto-v3-1-23bd841dfc91@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOwQ6CMBAFf4X0bE27WKie/A/joS0rbCKUtNhoC
 P9u4aIx8TgvmcmbWcRAGNmpmFnARJH8kKHcFcx1ZmiRU5OZgYBKgND8EW1HDccx+MlzqcDVxjo
 rtWLZGQPe6Ln1LtfMHcXJh9eWT3Jd/5WS5JIrXYOTojkKa89tb+i+d75naynBxy5F/WtDtlEZn
 b/goVLwbS/L8gZe6XHS6AAAAA==
X-Change-ID: 20260208-usbhid-eproto-152c7abcb185
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
 Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Liam Mitchell <mitchell.liam@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773071574; l=7440;
 i=mitchell.liam@gmail.com; s=20260207; h=from:subject:message-id;
 bh=iWVCH2yklbl9N7AcxKQ+vGMdANbmkzkqn9Aa+siws5o=;
 b=9e9bCq0SwuHrS13t56iVkRSO+65jnshIMHN6EgjL3eUUIQxm4shkucwvwQj1CLvaPVKPqjTBD
 fg/m17pp276AV9E8O4Vu/8g+CfMMHtQtTkwr/DKom7N8kPo/bOYipym
X-Developer-Key: i=mitchell.liam@gmail.com; a=ed25519;
 pk=Y9mPqBk1OuHZ0OaUZ5a8Nc5X7YHs7+SKiNwUfcLfPmg=
X-Rspamd-Queue-Id: 604F723C218
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[rowland.harvard.edu,suse.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34316-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitchellliam@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.977];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Modifies usbhid error handling to better tolerate intermittent
errors, reducing URB resubmission delay and device resets.

---
Protocol errors like EPROTO can occur randomly, sometimes frequently and
are often not fixed by a device reset.

The current error handling will only resubmit the URB after at least 13ms
delay and may reset the USB device if another error occurs 1-1.5s later, 
regardless of error type or count.

These delays and device resets increase the chance that input events will be
missed and that users see symptoms like missed or sticky keyboard keys.

This patch reduces the threshold used to assume device is working after
discussion in V2. Truly disconnected devices should error after 3 polling
intervals.

It allows single protocol errors to be retried immediately for minimal
downtime.

It changes the retry timeout to be relative to the last input URB
submission so time spent active counts towards the delay.
This makes it more likely that subsequent intermittent errors can be
retried on the next tick.

It only tries reset after 20 errors, roughly about 2s, longer than the
previous time based threshold of 1-1.5s.

Signed-off-by: Liam Mitchell <mitchell.liam@gmail.com>
Link: https://lore.kernel.org/linux-input/CAOQ1CL6Q+4GNy=kgisLzs0UBXFT3b02PG8t-0rPuW-Wf6NhQ6g@mail.gmail.com/
---
Changes in v3:
- uses shorter threshold to assume device is working
- stop_retry & retry_delay -> error_count & last_in
- retry after 20 errors
- includes running time in retry timeout calc
- immediate retry case is integrated with other error logic
- shortens initial retry delay to 1ms
- changes max delay to 128ms
- Link to v2: https://lore.kernel.org/r/20260307-usbhid-eproto-v2-1-e5a8abce4652@gmail.com

Changes in v2:
- revert changes to hid_io_error
- add more specific fix in hid_irq_in
- Link to v1: https://lore.kernel.org/r/20260208-usbhid-eproto-v1-1-5872c10d90bb@gmail.com
---
 drivers/hid/usbhid/hid-core.c | 44 ++++++++++++++++++++++++++++---------------
 drivers/hid/usbhid/usbhid.h   |  4 ++--
 2 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 758eb21430cd..233c1950632a 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -70,6 +70,12 @@ MODULE_PARM_DESC(quirks, "Add/modify USB HID quirks by specifying "
 		" quirks=vendorID:productID:quirks"
 		" where vendorID, productID, and quirks are all in"
 		" 0x-prefixed hex");
+
+/* Threshold at which we can assume a device is working correctly.
+ * A disconnected device should fail within 3 polling intervals.
+ * Most HID devices poll 8ms or faster. */
+#define HID_ASSUME_WORKING msecs_to_jiffies(100)
+
 /*
  * Input submission and I/O error handler.
  */
@@ -90,6 +96,7 @@ static int hid_start_in(struct hid_device *hid)
 	    !test_bit(HID_DISCONNECTED, &usbhid->iofl) &&
 	    !test_bit(HID_SUSPENDED, &usbhid->iofl) &&
 	    !test_and_set_bit(HID_IN_RUNNING, &usbhid->iofl)) {
+		usbhid->last_in = jiffies;
 		rc = usb_submit_urb(usbhid->urbin, GFP_ATOMIC);
 		if (rc != 0) {
 			clear_bit(HID_IN_RUNNING, &usbhid->iofl);
@@ -154,19 +161,13 @@ static void hid_io_error(struct hid_device *hid)
 		goto done;
 
 	/* If it has been a while since the last error, we'll assume
-	 * this a brand new error and reset the retry timeout. */
-	if (time_after(jiffies, usbhid->stop_retry + HZ/2))
-		usbhid->retry_delay = 0;
-
-	/* When an error occurs, retry at increasing intervals */
-	if (usbhid->retry_delay == 0) {
-		usbhid->retry_delay = 13;	/* Then 26, 52, 104, 104, ... */
-		usbhid->stop_retry = jiffies + msecs_to_jiffies(1000);
-	} else if (usbhid->retry_delay < 100)
-		usbhid->retry_delay *= 2;
+	 * this a brand new error and reset the error count. */
+	if (time_after(jiffies, usbhid->last_in + HID_ASSUME_WORKING))
+		usbhid->error_count = 0;
 
-	if (time_after(jiffies, usbhid->stop_retry)) {
+	usbhid->error_count++;
 
+	if (usbhid->error_count >= 20) {
 		/* Retries failed, so do a port reset unless we lack bandwidth*/
 		if (!test_bit(HID_NO_BANDWIDTH, &usbhid->iofl)
 		     && !test_and_set_bit(HID_RESET_PENDING, &usbhid->iofl)) {
@@ -176,8 +177,13 @@ static void hid_io_error(struct hid_device *hid)
 		}
 	}
 
-	mod_timer(&usbhid->io_retry,
-			jiffies + msecs_to_jiffies(usbhid->retry_delay));
+	/* Retry time is relative to the last start time and increases
+	 * with error count: 1, 2, 4, 8, 16, 32, 64, 128, 128... ms.
+	 * By including running time in the backoff, it should be possible
+	 * to retry many intermittent errors in the next tick. */
+	mod_timer(&usbhid->io_retry, usbhid->last_in +
+			msecs_to_jiffies(1U << (min(usbhid->error_count, 8U) - 1)));
+
 done:
 	spin_unlock_irqrestore(&usbhid->lock, flags);
 }
@@ -278,7 +284,7 @@ static void hid_irq_in(struct urb *urb)
 
 	switch (urb->status) {
 	case 0:			/* success */
-		usbhid->retry_delay = 0;
+		usbhid->error_count = 0;
 		if (!test_bit(HID_OPENED, &usbhid->iofl))
 			break;
 		usbhid_mark_busy(usbhid);
@@ -312,6 +318,13 @@ static void hid_irq_in(struct urb *urb)
 	case -EPROTO:		/* protocol error or unplug */
 	case -ETIME:		/* protocol error or unplug */
 	case -ETIMEDOUT:	/* Should never happen, but... */
+		/* Allow first error to retry immediately */
+		if (usbhid->error_count == 0 ||
+		    time_after(jiffies, usbhid->last_in + HID_ASSUME_WORKING)) {
+			dev_dbg(&usbhid->intf->dev, "retrying intr urb immediately\n");
+			usbhid->error_count = 1;
+			break;
+		}
 		usbhid_mark_busy(usbhid);
 		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
 		hid_io_error(hid);
@@ -321,6 +334,7 @@ static void hid_irq_in(struct urb *urb)
 			 urb->status);
 	}
 
+	usbhid->last_in = jiffies;
 	status = usb_submit_urb(urb, GFP_ATOMIC);
 	if (status) {
 		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
@@ -1504,7 +1518,7 @@ static void hid_restart_io(struct hid_device *hid)
 
 	if (clear_halt || reset_pending)
 		schedule_work(&usbhid->reset_work);
-	usbhid->retry_delay = 0;
+	usbhid->error_count = 0;
 	spin_unlock_irq(&usbhid->lock);
 
 	if (reset_pending || !test_bit(HID_STARTED, &usbhid->iofl))
diff --git a/drivers/hid/usbhid/usbhid.h b/drivers/hid/usbhid/usbhid.h
index 75fe85d3d27a..b5dbfa588dc8 100644
--- a/drivers/hid/usbhid/usbhid.h
+++ b/drivers/hid/usbhid/usbhid.h
@@ -84,8 +84,8 @@ struct usbhid_device {
 	spinlock_t lock;						/* fifo spinlock */
 	unsigned long iofl;                                             /* I/O flags (CTRL_RUNNING, OUT_RUNNING) */
 	struct timer_list io_retry;                                     /* Retry timer */
-	unsigned long stop_retry;                                       /* Time to give up, in jiffies */
-	unsigned int retry_delay;                                       /* Delay length in ms */
+	unsigned int error_count;                                       /* Number of consecutive errors */
+	unsigned long last_in;                                          /* Time of last in URB submission */
 	struct work_struct reset_work;                                  /* Task context for resets */
 	wait_queue_head_t wait;						/* For sleeping */
 };

---
base-commit: b91e36222ccfb1b0985d1fcc4fb13b68fb99c972
change-id: 20260208-usbhid-eproto-152c7abcb185

Best regards,
-- 
Liam Mitchell <mitchell.liam@gmail.com>



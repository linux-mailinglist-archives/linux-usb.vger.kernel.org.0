Return-Path: <linux-usb+bounces-34187-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WENkCiJ1rGlCpwEAu9opvQ
	(envelope-from <linux-usb+bounces-34187-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 19:57:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD2022D4D7
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 19:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68F6A3009F13
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 18:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0E73921FF;
	Sat,  7 Mar 2026 18:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NP6dHp/2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFB438F231
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 18:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772909849; cv=none; b=VA7LiJL8sL0Fw+E9ta0OA+pHjgbdq9E6k13fZEV0cHDZJFpHt9lyyUa/VhuOc9dsZ9/1SpGIwRfaH1nkRo4GXy08rLHqgIYxJik/iw1Mo6WAcPYXJ8/EGKFBsh4ILbTwG+/uXjnY/zscVlwDuGZXijWj7XJsdc3HIf63Hmmg8yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772909849; c=relaxed/simple;
	bh=ohZWnTOgcHl6b5ydSuDEJoSGGZ+o1J4dHKqpIcEFxd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j/cf3NJL7QL3bmfuG8OhJcPHRxjs5iqmOM5NEDtPRWZF88ctghePlGMtZ2JVXNQEj6alzNXTks9xUJplYkBpj+w9HyRc+SmdVcKuFBd7VY+G3v5PfMqtcGkMFAsyiZCA5FkomkSGgjuJbeOcnJr/ih/HgtWzAgCMLYzuIzFYzhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NP6dHp/2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439d8df7620so1238164f8f.0
        for <linux-usb@vger.kernel.org>; Sat, 07 Mar 2026 10:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772909847; x=1773514647; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jVKa9KQkK+sGb14EixM9ppAv5O/LJIHEZ/73SrIqbWo=;
        b=NP6dHp/2PPWnuARwla3VWPq0wD2pzD9Q137+o15rxoP3ux2a2mcf2l4WXOvbkE3Kug
         HfM870ZnBfIG2O3uASNir6tRMPfLufZqQFtUWx/HFcSJNptQLU0+rx/Hbq1svthfYcF1
         ppoE+ElorhPjc7ZByIWBMSSd2oTiLFe6XO/ucDMmqTLMb3n2Z11oCnOzhhCZEJBmFvOr
         hgku8MIFb1Irax0Jen7S9KvFPu7167MOF9QKELCfseFPDqPi4t6dTr2uQZRZ0VhthwuT
         fFaODcd+t8jZA4e/+vcyX7xEqIzdt88vB8ndvT2zPafemVUdgliSTXDN1gchFwz9etEa
         whcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772909847; x=1773514647;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVKa9KQkK+sGb14EixM9ppAv5O/LJIHEZ/73SrIqbWo=;
        b=HSstiPdzRDjiYMJmbuV/e0sKOD5JCAAi97g+XJxK08j68UbdFdsu5uCgWBpF+U/kmr
         D2j7jxnFzYQWra1CrqEyw1zGiIRFJpqkFlTuROIzgJwJXVB6xGed0UT7arNflH7PMcqh
         OF3zhq41m9jAPWePWp3aZPgdXCQchghgH8WrSdeIZXXRISSjRXQFiwve932tDWIqqj3Q
         v6f/bQUwu5P2VUTouSR1lQub2deV8EbW4RU010voTiuJbFuQZipXqt+3d0M/9kMYambO
         j7tvTnt36CKZ9v/ADQVofiRcFChEsG/M/8kdy/cXvDoWYpbi0sDa7hKmHlk54h3n6ccJ
         0HDg==
X-Forwarded-Encrypted: i=1; AJvYcCWp8su0jeW2PwC0l67n/P5D0xwHIbP7cVMir09ldntpdnWkqGMWwRD1Bh00DSHSV5FZYAblwpDKjj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YznVJofwCVEYMLoCSFrPwtQ7OiNyKRzQlm76OfwD0T9M2AI2GiB
	+2eo8lSNT64MBE0mtKSf3x+WEb8xP6YTEG2drNal9Cso53Jz9ufS6u0amLx3PQCQ
X-Gm-Gg: ATEYQzw32dCKocMuI9ilRe8RgVBZT1ZWT41QVMjIJKZX9e7hQ6rOg8/4/PP68LN55ZL
	jRWLbcbts1LcBCURnXD6G3u6uHEq36UVvZ1ejOkxC/gS03EiKFc10sm5hSyQKcC1oSQbCkoQkHV
	PwaHr1FFZ2XHt3T/ZfEhyJoSjsKDyp6qCFyfb5zBh9XVEISkcwjf4BbrEt4IrH19/S4Icu7zs7T
	wiqbnAWE/jy/B9heBrcJWiVAvPy4N+l+ZkhrCYyxTXXgmgnUaIVagTtzc/8FajyOw+JFSV9Y/9s
	U9HLH+NpQFmgYJbCbmF30ICo1ZxZMAXqIK6NtiH6Vsj93cBankWoyDGtxEN/hAIzW+bwDYW2rdb
	WsJZzyr+iDLC1kn3qGTzOnqPQqmCLd5RetTx0ST31C1Gj8izimyDAS/PnxL2BdSxuFbNICgdkEc
	BaBd5cRCyW4ZcyH9TCH6jpUk3hkqEamofLw/UcmLL1lrdhksRz
X-Received: by 2002:a05:6000:3112:b0:439:b4c5:cef1 with SMTP id ffacd0b85a97d-439da65bc86mr10783110f8f.13.1772909846734;
        Sat, 07 Mar 2026 10:57:26 -0800 (PST)
Received: from [192.168.178.21] ([2001:9e8:fba0:be00:22c9:d0ff:fe7b:79cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9fbsm12530995f8f.23.2026.03.07.10.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 10:57:25 -0800 (PST)
From: Liam Mitchell <mitchell.liam@gmail.com>
Date: Sat, 07 Mar 2026 19:57:09 +0100
Subject: [PATCH v2] usbhid: tolerate intermittent errors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-usbhid-eproto-v2-1-e5a8abce4652@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMSw7CIBSF4a00dyyGS4JFR+6j6YCX5Sa2NFCJp
 mHvYucO/5Ocb4fsE/kMt26H5AtliksLcerABr1MnpFrDYKLCxdcsVc2gRzza4pbZCiF7bWxBpW
 E9lmTf9D78IaxdaC8xfQ5+IK/9Z9UkCGTqhcWubtyY+7TrOl5tnGGsdb6BQ1V1KKqAAAA
X-Change-ID: 20260208-usbhid-eproto-152c7abcb185
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
 Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Liam Mitchell <mitchell.liam@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772909845; l=2884;
 i=mitchell.liam@gmail.com; s=20260207; h=from:subject:message-id;
 bh=ohZWnTOgcHl6b5ydSuDEJoSGGZ+o1J4dHKqpIcEFxd0=;
 b=wvPQ9LTVGcnBcWJBP1UX/KdL/QZgvPr/b6Fgb3fA6Vc0X4SE1j62vfkLgfNVzakCUCNGfALum
 vddJfzfWKYKD9iWoYUqCmU8MOs//fhGIrqsBTzeig53A0CiCVt078vC
X-Developer-Key: i=mitchell.liam@gmail.com; a=ed25519;
 pk=Y9mPqBk1OuHZ0OaUZ5a8Nc5X7YHs7+SKiNwUfcLfPmg=
X-Rspamd-Queue-Id: 2CD2022D4D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[rowland.harvard.edu,suse.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34187-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitchellliam@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.977];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Modifies usbhid error handling to tolerate intermittent protocol
errors, avoiding URB resubmission delay and device reset.

---
Protocol errors like EPROTO can occur randomly, sometimes frequently and are often not fixed by a device reset.

The current error handling will only resubmit the URB after at least 13ms delay and may reset the USB device if another error occurs 1-1.5s later, regardless of error type or count.

These delays and device resets increase the chance that input events will be missed and that users see symptoms like missed or sticky keyboard keys.

This patch allows one protocol error per 500ms to be tolerated and have the URB re-submitted immediately.

500ms was chosen to be well above the error rate of a malfunctioning
device but low enough to be useful for users with devices noisier than
mine.

Signed-off-by: Liam Mitchell <mitchell.liam@gmail.com>
Link: https://lore.kernel.org/linux-input/CAOQ1CL6Q+4GNy=kgisLzs0UBXFT3b02PG8t-0rPuW-Wf6NhQ6g@mail.gmail.com/
---
Changes in v2:
- revert changes to hid_io_error
- add more specific fix in hid_irq_in
- Link to v1: https://lore.kernel.org/r/20260208-usbhid-eproto-v1-1-5872c10d90bb@gmail.com
---
 drivers/hid/usbhid/hid-core.c | 5 +++++
 drivers/hid/usbhid/usbhid.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 758eb21430cd..939e095eddfe 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -313,6 +313,11 @@ static void hid_irq_in(struct urb *urb)
 	case -ETIME:		/* protocol error or unplug */
 	case -ETIMEDOUT:	/* Should never happen, but... */
 		usbhid_mark_busy(usbhid);
+		/* Tolerate intermittent protocol errors */
+		if (time_after(jiffies, usbhid->last_proto_error + msecs_to_jiffies(500))) {
+			usbhid->last_proto_error = jiffies;
+			break;
+		}
 		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
 		hid_io_error(hid);
 		return;
diff --git a/drivers/hid/usbhid/usbhid.h b/drivers/hid/usbhid/usbhid.h
index 75fe85d3d27a..6aab9101fe34 100644
--- a/drivers/hid/usbhid/usbhid.h
+++ b/drivers/hid/usbhid/usbhid.h
@@ -86,6 +86,7 @@ struct usbhid_device {
 	struct timer_list io_retry;                                     /* Retry timer */
 	unsigned long stop_retry;                                       /* Time to give up, in jiffies */
 	unsigned int retry_delay;                                       /* Delay length in ms */
+	unsigned long last_proto_error;					/* Last protocol error time, in jiffies */
 	struct work_struct reset_work;                                  /* Task context for resets */
 	wait_queue_head_t wait;						/* For sleeping */
 };

---
base-commit: b91e36222ccfb1b0985d1fcc4fb13b68fb99c972
change-id: 20260208-usbhid-eproto-152c7abcb185

Best regards,
-- 
Liam Mitchell <mitchell.liam@gmail.com>



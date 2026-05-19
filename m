Return-Path: <linux-usb+bounces-37692-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK0sEy5HDGoMdAUAu9opvQ
	(envelope-from <linux-usb+bounces-37692-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:19:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E4157D65C
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6AD4F3036703
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 11:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60EC48C8B1;
	Tue, 19 May 2026 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip5jYDrI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424FA370AE0
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189125; cv=none; b=IYZxr9J/qN1YeyeWeBr9cZ1dyP5gyYSPebvbcipxG8ZmPfbfBGEihVc9KFc6Wy1Snu6g9ZIhyK/0nXNjp2nZfMG0FFVHAJlo0FUDO8yveuVTGi8fm7tN0gwFzu7+MKru0IdFj6nR2skZf9Kivqxv9MHQUSMEZtJlF9miNWQUAzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189125; c=relaxed/simple;
	bh=5iSgd3tv+dVvOUKz65tylGgonMmJAdjSoAG/9e1p/OE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GEpkLbaXs5Kse9ZOCNlMIks6dJEReMH0RIy4tl0qs1b2IQaI95gWmmZ9PlMhOWzoTxbdSecX2Plvd9zfZpER8TBjMNKmlw+y3RwYTvTHj45yBMk6hSUaDoZ332dya86RdfAXsAmu79NpOc5ImnbKy7HlcwRJldHtdiBEZtn2baI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip5jYDrI; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c8173b2af32so2649574a12.0
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 04:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779189123; x=1779793923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2IFAcx0DbZumq9/olV6xC3aeSPRYxGST6sCT2oqEP/g=;
        b=ip5jYDrIjjodJ2WsMCPmVWDfN8ywlRTPEb/od6u9k3weeFdtWlo7DYZ+ANFH5Fc0+Z
         n5XAEQnSk082lQyG/LFZ7ipYO/IhiDsu09onB9jHk2fRkZ6opKe/PbByWmreeR81wBXn
         ActKB6f8yMCd7IJhhOxSSlLF/qKflzEbq78tn98eY0/qPiNB2soKgc0/BBTBp03gcybO
         sTi7BjvWBZmZq0ZvW2pMx+4bl5UkqJ2NgDP/TvZ0rVNHaQRiSIa0KC6Xc1cD4xvYdBPR
         ZCMJBW82YQ6a6J1tnRQeefwwBFk/Uv9BrD5/qL/fnMK9aP2GiVe+DZx/PlOmQQ++N7XV
         0LQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189123; x=1779793923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IFAcx0DbZumq9/olV6xC3aeSPRYxGST6sCT2oqEP/g=;
        b=M0kwB44VK/x7fSvwf9vEkTLn4EqJKLg2yDeQNX7i2xaFZvT93QZRUU8Du0ClLUUQui
         mOu0kcAjfUalHIqY4mgr5pr9iyR0ENqkyf2drpE6RVh1gCCw1QWZbaQkmzvNKoUk69zu
         t2kGv0S/embTRraXLBWKn0Fb1uhkhZprVJ6iDbIIICHAnStlGLW8ccll4uZkVJnr+T+h
         tCTs7L094WtqPQ1XH01l6CFQ0ioybvU4ELoNAMncUVoHyTPigY03oN6QGDoUIuCZketF
         /YIWjcgG3wbD8FNs8QnrZml9534kl87IzziiOceBER3zz7B4eynLLed0i22TlrywDebE
         4bkw==
X-Gm-Message-State: AOJu0YxSSjlY/ry7SEnEE7qr2v16WFUbUq037GuHM+AV49QbDAna3uIY
	mPqhMo8/R1oDz0znXrTGEis94eVLUu88P4vYLteiQbsVUL2z8HPnHOJB
X-Gm-Gg: Acq92OHomcfkdzbaStUgbu/FoEDX6O/iSSHUc0Ps0d7niLhNYnCl9biCehoN8m89F5R
	IFZ+U2Er0tlC8ezblBrF3bLCd0LZLjgpfnsrV18W83zsj4IdfiLuDTqvubVfJKfG9vs3Xyd1DQr
	SNDY7w+P/hQ4Dxp3d9w9jOq8TCRdHV9EcrMu6yXmUSBBsWX8f7dXIXqrFA8GM7i/xge/gsNGuRp
	FMJF4lqDBaKvz0JL9c7Dp1hON6WiRvtr+GUYd+2/DV+FlMxVXVWWNLjvUPrZs9bQqCmi05wOPJ6
	+VE9nHYZpm3zp6erz1CVlgEUPslWDoIOilYVzNY4QQklVOr1J47K89SrnbfCg99zjNtEemJrk0o
	9NtJgN8S9wmiifx61JQamu++2tyU9yH9SKvl0lPfgl/iDzI24mYK5eOFKztY+QSTsECOuExzLu1
	h/QZnlLU9NrA0aWwFVyPOioKNe8pfjM9n4hYym2+uK6A==
X-Received: by 2002:a17:903:1b4e:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2bd7e7b58a8mr207656095ad.9.1779189123474;
        Tue, 19 May 2026 04:12:03 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0f94c6sm186505855ad.56.2026.05.19.04.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:12:02 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com,
	Zhang Cen <rollkingzzc@gmail.com>
Subject: [PATCH v2] USB: serial: belkin_sa: validate interrupt status length
Date: Tue, 19 May 2026 19:11:50 +0800
Message-Id: <20260519111150.3583363-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37692-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 14E4157D65C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Belkin interrupt callback treats interrupt data as a four-byte
status report and reads LSR/MSR fields at offsets 2 and 3. The
interrupt-in buffer length is derived from endpoint wMaxPacketSize, and
short interrupt transfers may complete successfully with a smaller
actual_length.

Check the completed interrupt packet length before parsing status
fields so short interrupt endpoints and short successful packets are
ignored instead of causing out-of-bounds or stale status-byte reads.

KASAN report as below:

BUG: KASAN: slab-out-of-bounds in belkin_sa_read_int_callback()
Read of size 1
Call trace:
  belkin_sa_read_int_callback() (drivers/usb/serial/belkin_sa.c:202)
  __usb_hcd_giveback_urb() (drivers/usb/core/hcd.c:1630)
  dummy_timer() (?:?)
  __hrtimer_run_queues() (kernel/time/hrtimer.c:1968)
  hrtimer_run_softirq() (kernel/time/hrtimer.c:2001)
  handle_softirqs() (kernel/softirq.c:579)

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
---
v2:
- Drop the transfer_buffer_length check; urb->actual_length is bounded
  by the URB transfer buffer length.
- Add the KASAN validation report.
- Add Assisted-by tag.

 drivers/usb/serial/belkin_sa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/belkin_sa.c b/drivers/usb/serial/belkin_sa.c
index 38ac910b1082d..1e0d9041969b3 100644
--- a/drivers/usb/serial/belkin_sa.c
+++ b/drivers/usb/serial/belkin_sa.c
@@ -193,6 +193,8 @@ static void belkin_sa_read_int_callback(struct urb *urb)
 	}
 
 	usb_serial_debug_data(&port->dev, __func__, urb->actual_length, data);
+	if (urb->actual_length < BELKIN_SA_MSR_INDEX + 1)
+		goto exit;
 
 	/* Handle known interrupt data */
 	/* ignore data[0] and data[1] */
-- 
2.43.0


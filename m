Return-Path: <linux-usb+bounces-35743-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMdFLiEXzGkeOQYAu9opvQ
	(envelope-from <linux-usb+bounces-35743-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 20:49:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2701E370322
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 20:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0048A3027D88
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 18:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4F63A1A55;
	Tue, 31 Mar 2026 18:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHlQ5yIC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A1338B13E
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 18:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982935; cv=none; b=KoH4PbzOZFsyhvclC311eiOyref+o7E47SXrANveGSKGAyv23WC4cbQYHje96/tz2mTMxZZUvBScbZaU+0lYVTuAktNVI2/DHx5C9s3a3CYF436jRoLf8S0eJhcaVy59DKmTg46b7KwNU0bYdFGkTVxdDPijZlPW2J7v6q1TJe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982935; c=relaxed/simple;
	bh=5JbE6jefY687MMjL40pD4pcEGJW9XrtiRSZzHPD8v9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BQ9ugrqTPhqU5Z9pIj/2Saj2BR0cD0UtEGKQRPxPQeyDGvyWfMu0H+TadcVoNEBCve4UU3TfjFO9V8bUU0ufttzGNFMk2iFnuHCZO/sRNhgfnszvcKt5k52t1Hd2hU4x1xd/1Os+CzgOG2MfJ3DzwNKo0wF+dVAzGAxyt7o7MFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHlQ5yIC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so3859115e9.0
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 11:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774982933; x=1775587733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k3jBPBKWUkAe3aZwB1cI7MtT5GZiZL2spoEeWYwX3yI=;
        b=LHlQ5yICzNykXmUSYY1XGRAjeAE1rf5qjEN80UDvvZ4Y1Ty6dqyLdcuI/7y2y+d39q
         lK0oV34oXS48rt3dP9OlzSIWL6hSZbQXQ3Z4JXVsWAZWRcmvzXw5fJpqsOAShMoKrc6z
         3l8PBYUsYEAMAqs+9CwVlJpCJxq4TeYL5fBvjOqEuAhkSTmhaZTYi53+wj6ePQrjt1XN
         DaY50KY5cA1B6jlLHlPTBVTwU1Sw/o9zaHt1P2OeAKNCJqXQHyFQtXPvzYUWeZXh3y7L
         ubkyXBFdDciQxZ5eRv/JukN+u95bHq6qg8+Qj/weeiCwTUD0pJ8ViOkN3Gx4pswT4fjB
         IXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982933; x=1775587733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3jBPBKWUkAe3aZwB1cI7MtT5GZiZL2spoEeWYwX3yI=;
        b=ZprjC5c/oTaX1FovbMKk01JZeo/k/5jJ+v9zF5rZB1y3CBPRfSyFg4dQEKInaqYJP7
         BvKrxh2u1ZvHgELEBxvI9moaP/UgM/3AcBt+K6Lsuu5ST91ZaABVm05RgxhDuvATe3OG
         +DnwC9ZU0b8fOGIM+6l0JUXXiDP9XHlRsJHYq5yAEPABt45UZIqxhNRtsQWKY8HnOLen
         ejjzIFMlpabvtNoLq96W1I7H9iGfHRyqfEiwwQTgM2cImiqQsbA9flnfTNSdpXtCBW1S
         ZRnGDenvMKGYAL+Crq0ZgcGj6QpvVs/RizpsxRMhGGsEzBmPjTY2Ysd3cA1pxZZYIoUt
         EK5A==
X-Gm-Message-State: AOJu0YykJ2QVqYNGp3yiILwkDvlpzl0yGVlI+wM07+hB1WSZLG5yO56r
	PHbknh4hmyevOJsPnbdD8TSOh3lVJeAzZhYC/gVrrsijbar2rbJLJTUU
X-Gm-Gg: ATEYQzxcEXnTPZ7jzEHGKo+2Kb17nrXzm4hI5tm0K0mUUTAiE5qqQZARdgfossOvrtd
	bu4TIjZ/6Q/0Ec/qUAWFMgIkg9/PII96arIpGOGES1G1FdHE/QBnvM71X/QiP18PgvFT8vnkXeG
	mbiK0J8W2zxQWGpzKKXgC3l6ZXijugCngb8qyYRnwmrbyOlXdn0IX0/KHxre7G+LC7pblXth46U
	Y4L5R3US/7EYV0MHYmLmqQN8tKuves6eUi0TMfnOIfsCSDAL7juJuoxUQaJT/SqQfk7U4EhXcHG
	gc4wC8NjdXnvg3b+1D9+gn/IheXbtVwPdE2gmE3WpT5hV2gvnPUEPKL2VfcCNcDiuwfKp/F4BEJ
	FjUa+e8uujH0jKTsxySNnm3oZn7WR+rpjMC689uTikEKaDB0Pu3+DRx2WIB1Nca0P1v27OATpQA
	qiWgS+M5MrieevIR3jJ9lYCHryHHzkwUpHfojGRsrvDFstufsD+mNwhYt+v0IJtYl9PvuwzhCXw
	J7Bcgp8lu+wv/QV2A0jx0HzUxBPuxWbFoTRtCm7n/RBNCtfHll75f9VRwECHIqFlaFZUcsdx3iP
	xtLUARSTM6kK8pg=
X-Received: by 2002:a05:600c:8819:b0:486:fa9c:185 with SMTP id 5b1f17b1804b1-488835e311bmr8274885e9.31.1774982932467;
        Tue, 31 Mar 2026 11:48:52 -0700 (PDT)
Received: from toolbox.fritz.box (p200300c717487f00c8918a114afa5d8c.dip0.t-ipconnect.de. [2003:c7:1748:7f00:c891:8a11:4afa:5d8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887a633f23sm23935075e9.0.2026.03.31.11.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:48:51 -0700 (PDT)
From: Michael Zimmermann <sigmaepsilon92@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Michael Zimmermann <sigmaepsilon92@gmail.com>
Subject: [PATCH] usb: gadget: f_hid: move list and spinlock inits from bind to alloc
Date: Tue, 31 Mar 2026 20:48:44 +0200
Message-ID: <20260331184844.2388761-1-sigmaepsilon92@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-35743-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sigmaepsilon92@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2701E370322
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There was an issue when you did the following:
- setup and bind an hid gadget
- open /dev/hidg0
- use the resulting fd in EPOLL_CTL_ADD
- unbind the UDC
- bind the UDC
- use the fd in EPOLL_CTL_DEL

When CONFIG_DEBUG_LIST was enabled, a list_del corruption was reported
within remove_wait_queue (via ep_remove_wait_queue). After some
debugging I found out that the queues, which f_hid registers via
poll_wait were the problem. These were initialized using
init_waitqueue_head inside hidg_bind. So effectively, the bind function
re-initialized the queues while there were still items in them.

The solution is to move the initialization from hidg_bind to hidg_alloc
to extend their lifetimes to the lifetime of the function instance.

Additionally, I found many other possibly problematic init calls in the
bind function, which I moved as well.

Signed-off-by: Michael Zimmermann <sigmaepsilon92@gmail.com>
---
 drivers/usb/gadget/function/f_hid.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 8812ebf33d14b..e5ccaec7750cd 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1262,17 +1262,8 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	if (status)
 		goto fail;
 
-	spin_lock_init(&hidg->write_spinlock);
 	hidg->write_pending = 1;
 	hidg->req = NULL;
-	spin_lock_init(&hidg->read_spinlock);
-	spin_lock_init(&hidg->get_report_spinlock);
-	init_waitqueue_head(&hidg->write_queue);
-	init_waitqueue_head(&hidg->read_queue);
-	init_waitqueue_head(&hidg->get_queue);
-	init_waitqueue_head(&hidg->get_id_queue);
-	INIT_LIST_HEAD(&hidg->completed_out_req);
-	INIT_LIST_HEAD(&hidg->report_list);
 
 	INIT_WORK(&hidg->work, get_report_workqueue_handler);
 	hidg->workqueue = alloc_workqueue("report_work",
@@ -1608,6 +1599,16 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 
 	mutex_lock(&opts->lock);
 
+	spin_lock_init(&hidg->write_spinlock);
+	spin_lock_init(&hidg->read_spinlock);
+	spin_lock_init(&hidg->get_report_spinlock);
+	init_waitqueue_head(&hidg->write_queue);
+	init_waitqueue_head(&hidg->read_queue);
+	init_waitqueue_head(&hidg->get_queue);
+	init_waitqueue_head(&hidg->get_id_queue);
+	INIT_LIST_HEAD(&hidg->completed_out_req);
+	INIT_LIST_HEAD(&hidg->report_list);
+
 	device_initialize(&hidg->dev);
 	hidg->dev.release = hidg_release;
 	hidg->dev.class = &hidg_class;
-- 
2.53.0



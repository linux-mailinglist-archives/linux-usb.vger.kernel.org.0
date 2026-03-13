Return-Path: <linux-usb+bounces-34754-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL4rDzM0tGn4igAAu9opvQ
	(envelope-from <linux-usb+bounces-34754-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 16:58:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D52867BA
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 16:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17186302A43F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 15:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184621A681C;
	Fri, 13 Mar 2026 15:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TDyB/+rn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7C4379EFD
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417343; cv=none; b=Vmp/fPFhJfz1mZf56URHL/X3rrNAWIXfMHvZQ8KgavtmK+X/32rphF773HUr+5T+pdyUE9RhG0JnoZzJeKLGVLFi8qRbq2QQF13xopWI+fFMHNIHPdY8558NPWJBah4oCMM6MOjCXKQAkrq6SqZncMwM27+rvc69kbGv2+IWlMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417343; c=relaxed/simple;
	bh=fr4IVjNPf2Eeer6PP5mDcnQz6+gULEMSleWbr5WJIdc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=K9gU3Kze1HtE1fcRQ0zmnYLZ75JWGnvTvcfBfmrppWzcFOK9jVy5Yl3pAxQo+d7nEmuEEqWSHb6cifAOCp0gA8Q4q4UtQUAUjmLqtkTXMaM7pIZaZSzlQHo1BZCxdovoHuEHLpdHnKAguvmQ/Ju25PpjJyQ3VXEFh9S9I6KA0Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TDyB/+rn; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4852fbfc379so28036235e9.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773417338; x=1774022138; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/2njJFxnimdUchpgiiU3jhGWTXD4ortpxvxhrp4ZuJY=;
        b=TDyB/+rnZboOsHtYK6A8MLCwzgOJE8SqNmoz9rpcv3rCM5YUTrZS1cyMyAZ49CIe+e
         8ik+dFsqh4vsVesWLso1rmu/z58UlqHWMjhl9K92og7Tf0izMLGhCqCImIOkJ4egi8jw
         yQh9l5C4piD0uvpLyg+sYJBUu9gOHksSdZ7FQoWZCv3lxL6rlKbn9BQQEOeQ6B7c/FFC
         KaoWtZLugFakCCyDtgpPMi0QXElPxblDaXSR7w3vltLRLJLKbE/BulS+h6ggBtYWicTa
         xjxw4iaol6FJtyrbxylPpfer/ZGuER8auI5oe1GQ3waDxfVwGLdGjUEG4Q68G6KZb17V
         XZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417338; x=1774022138;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2njJFxnimdUchpgiiU3jhGWTXD4ortpxvxhrp4ZuJY=;
        b=oZ8X1ChzlFFQ7IN/ycE8v7UJiCHXnfWzml1BgR1p5XImBxudqQKEMiYrU9QIm3jNSE
         i0qfY9c1MjdH31BrSD2MUATsaBm/wbbIXaZ5z5N0mt4nY+p0FN5FlQ8M8PQoymjnh060
         yh0Bh3Nm7DDGWWHtsUSfGKFK6VPFLZ2MJra0RFjxi8umMYm4HycfIe3ZAv/tD5eGMAyk
         HSw18eFKL0ohbb1HS+dv2iP3+iUwrZ3x5CFfmDueKz327ze/MX9Ey5jT8D2o0rlyJcGn
         hm+VjlvYDc6mwKnwMaLu0JU5+J2gcEpoVMrtMH3bN7rrsxyJfq+01NpXTSGKxEUJ6+r6
         X08Q==
X-Gm-Message-State: AOJu0YxAGi1e7+94oJGo9v8h5p5opSXWJzC98S1OveOJpLPgtPb5LNYz
	wPuIHQ4XQIPD4reNVfFti4UAjFIg66KRJ1sB4fjZPSvTIJkK1ohJMDbaCi14wbvxgRnpFfLYYP/
	Yfx1m5FiiGKSBisNCcW5FtoXTALaxXcjciAA8zVg9BZgQ/jWiMHWDcVCNoVywB8G4RpbMV4HkhH
	m0zlBI5Aq5FOXmFytbZn3D5Dm76hGKt5e1A43onvRqjlK8xumtdpg=
X-Received: from wmqj8.prod.google.com ([2002:a05:600c:1908:b0:485:1ee9:c5de])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f8d:b0:485:4278:24fb with SMTP id 5b1f17b1804b1-48556711dfcmr61632175e9.32.1773417337265;
 Fri, 13 Mar 2026 08:55:37 -0700 (PDT)
Date: Fri, 13 Mar 2026 15:55:34 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260313155534.1916773-1-smostafa@google.com>
Subject: [PATCH] usb: typec: ps883x: Fix Oops at unbind
From: Mostafa Saleh <smostafa@google.com>
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	konrad.dybcio@oss.qualcomm.com, jack.pham@oss.qualcomm.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34754-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[smostafa@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 429D52867BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When trying to unbind a device in order to bind to it vfio-platform as:

  echo bc0000.geniqup  > /sys/bus/platform/devices/bc0000.geniqup/driver/unbind

I get the following Oops:

[  436.478639] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
[  436.487762] Mem abort info:
[  436.490716]   ESR = 0x0000000096000004
[  436.494595]   EC = 0x25: DABT (current EL), IL = 32 bits
[  436.500071]   SET = 0, FnV = 0
[  436.503250]   EA = 0, S1PTW = 0
[  436.506505]   FSC = 0x04: level 0 translation fault
[  436.511533] Data abort info:
[  436.514558]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[  436.520215]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[  436.525436]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[  436.530918] user pgtable: 4k pages, 48-bit VAs, pgdp=00000008861a9000
[  436.537554] [0000000000000020] pgd=0000000000000000, p4d=0000000000000000
[  436.544548] Internal error: Oops: 0000000096000004 [#1]  SMP
[  436.550374] Modules linked in:
[  436.553542] CPU: 2 UID: 0 PID: 671 Comm: bash Tainted: G        W           7.0.0-rc3-g56fcdd0911a5-dirty #2 PREEMPT
[  436.564440] Tainted: [W]=WARN
[  436.567515] Hardware name: LENOVO 91B6CTO1WW/3796, BIOS O6NKT3BA 05/02/2025
[  436.574675] pstate: 21400005 (nzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[  436.581841] pc : ps883x_retimer_remove+0x14/0x94
[  436.586605] lr : i2c_device_remove+0x28/0x84
[  436.591017] sp : ffff8000847137c0

That's because the ps883x_retimer_remove() retrieves the driver data
from i2c_get_clientdata() which was never set at probe. So, add
i2c_set_clientdata() at the end of the probe.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/usb/typec/mux/ps883x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
index 5f2879749769..1256252eceed 100644
--- a/drivers/usb/typec/mux/ps883x.c
+++ b/drivers/usb/typec/mux/ps883x.c
@@ -444,6 +444,7 @@ static int ps883x_retimer_probe(struct i2c_client *client)
 		goto err_switch_unregister;
 	}
 
+	i2c_set_clientdata(client, retimer);
 	return 0;
 
 err_switch_unregister:
-- 
2.53.0.851.ga537e3e6e9-goog



Return-Path: <linux-usb+bounces-38054-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGYlF2pHFWqLUAcAu9opvQ
	(envelope-from <linux-usb+bounces-38054-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 09:10:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D665D185E
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 09:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01E44300B13B
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 07:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F423C4B93;
	Tue, 26 May 2026 07:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CDPmq9uW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D573B813C
	for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779203; cv=none; b=asDlSp1Ul3e0MoFkHH7IUxKkHEqhYpyzK5AoK8Ricj8TaZzXueFP37KxKnt5do/qB+2wQFZpsWB+GS+0WPzct+RDk/Nhq/WtLMdLLuDOAFw3uE9Dk++IIksnxedixIUg2ioGEo8giGOGwL1or6BLxeRzIWrN2p2QltPhsBXwLh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779203; c=relaxed/simple;
	bh=JDU+r+4eAFHPbUpIU0DFrV5eLnEjfElHbf2/4HA8k0Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NCVIfpgl2imkfPvZdGQVg8ZrqiyHcK81jlC177Go5Tc8u2etskdREC3KR+sfXXMDTb40aVAXPjsq7Nf3stLFWGm4oNgI856VU1nrLMtNzPfKeoERG6F5pxcLTpfJlZJJJk3kXKnEU1U4aESBzg28aVI6eP8KtFfL99mDo4febgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hhhuuu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CDPmq9uW; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hhhuuu.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-837d43e9ff3so6643576b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 00:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779779200; x=1780384000; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DmSH083zLCvpnjRw/E18mHYgSCn8sHqasuCuNLVFOPM=;
        b=CDPmq9uW3U2EawacsSfQUsmJNtCYNwTdzQC5unwVYfZX02ceHDkv/XdVavnZxa7grV
         TFjw7lwN6w+QyQyXQBTSqUEjAfb2PGXkaGb7uJckc2s3lPQplP/2WzgRjxvC69BEvAe5
         qPnEAbagwtRwZFZtjACzNDCngZMjglFOCJFIAPBXVjoOkSadjytzyyzfwRfBj6ZxgzUd
         J3s39/wZUXDxGMRg1vyOL+htXjxhIsgAf9iS9VcfSfOxDQcYDqeWdgHUJVQkhtTyVJZz
         FIas6+JX5MfwvLsPX7SyfqaMdVJVQTZD8vOOxFwKgdgN1LCFkUtJFt8qI2YXWpzfSuJS
         0giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779200; x=1780384000;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DmSH083zLCvpnjRw/E18mHYgSCn8sHqasuCuNLVFOPM=;
        b=bXRFqpcE2Zg8Ni/oLNq+Ts4rj6JZoEjJAV+1O6Gy2lg+O9bK1hBNHwdV17WYtsFVlK
         Uf9zHSmkiOUTQ7QRSOw3hW2JJfASt0ynqnGDQGkwxZfLmUATmsOvHYFHDu5aH8U1DjQr
         Ntc1URS7wZ91t727/pbQNT35L6s19ULUPvP1nNX4XKHyydWqOCtwDWTOHCyRD6RDu1YD
         MzJZX3VOUWPC38YztcecqmTJzhTyr79XbIoJN00kI9Iuq/c41rZNDWWKEd9qtOcEGn49
         E7pTAgr4pvPF6oM7QMS1BhlYpXYQGFIAL10eTQpMJCC70M6TJr+sjynbJZoU/TFDsfWH
         9QAw==
X-Forwarded-Encrypted: i=1; AFNElJ90iNK60FMHs5h+o2kpJrWVLWruS724OEYytCG0Nz9W0ZZR4pLIEw9+MyuHsZesp7d5bFEGJCrWKBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXcmrqKiPFeH1fn/FAlqOvvSn4trFni6WBPzmRGj3rowNxovH0
	ZR8OWrHruo7JGPZu9jzPF2s4SF1WJybVBKHTGGN/ZuMjMS1iLkcyEkrQwrnFhQXqa2VUu9newWD
	HyafaUQ==
X-Received: from pfny9.prod.google.com ([2002:aa7:8549:0:b0:838:f05:69ac])
 (user=hhhuuu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a08:b0:82f:2226:5aeb
 with SMTP id d2e1a72fcca58-8415f426d0bmr15966910b3a.20.1779779200135; Tue, 26
 May 2026 00:06:40 -0700 (PDT)
Date: Tue, 26 May 2026 15:06:35 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526070635.839701-1-hhhuuu@google.com>
Subject: [PATCH] usb: gadget: udc: Fix NULL pointer dereference in gadget_match_driver
From: Jimmy Hu <hhhuuu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jimmy Hu <hhhuuu@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38054-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hhhuuu@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B7D665D185E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A NULL pointer dereference occurs in gadget_match_driver() because a
race condition exists between the DRD mode-switch work and the
configfs UDC write path:

1. The DRD mode-switch work invokes __dwc3_set_mode(), which calls
   dwc3_gadget_exit() and subsequently frees the UDC device name via
   device_unregister(&udc->dev).
2. The configfs UDC write path invokes gadget_dev_desc_UDC_store(),
   which calls usb_gadget_register_driver() and subsequently
   compares the UDC device name via gadget_match_driver().

If gadget_match_driver() runs concurrently during UDC unregistration, it
may access the freed UDC device name. Once the freed memory is zeroed,
dev_name(&udc->dev) returns NULL, causing a panic in strcmp().

[39430.908615][ T1171] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[39430.911397][ T1171] pc : __pi_strcmp+0x20/0x140
[39430.911441][ T1171] lr : gadget_match_driver+0x34/0x60
...
[39430.911890][ T1171]  usb_gadget_register_driver_owner+0x50/0xf8
[39430.911910][ T1171]  gadget_dev_desc_UDC_store+0xf4/0x140
[39430.931308][ T1171]  configfs_write_iter+0xec/0x134
...
[39430.957058][ T1171] Workqueue: events_freezable __dwc3_set_mode
[39430.957287][ T1171]  dwc3_gadget_exit+0x34/0x8c
[39430.957304][ T1171]  __dwc3_set_mode+0xc0/0x664
[39430.957341][ T1171]  worker_thread+0x244/0x334

Fix this by checking dev_name(&udc->dev) before calling strcmp().

Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
Cc: stable@vger.kernel.org
Signed-off-by: Jimmy Hu <hhhuuu@google.com>
---
 drivers/usb/gadget/udc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index e8861eaad907..79baed640428 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1594,7 +1594,7 @@ static int gadget_match_driver(struct device *dev, const struct device_driver *d
 			struct usb_gadget_driver, driver);
 
 	/* If the driver specifies a udc_name, it must match the UDC's name */
-	if (driver->udc_name &&
+	if (driver->udc_name && dev_name(&udc->dev) &&
 			strcmp(driver->udc_name, dev_name(&udc->dev)) != 0)
 		return 0;
 

base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.54.0.746.g67dd491aae-goog



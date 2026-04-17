Return-Path: <linux-usb+bounces-36296-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEWsKg5i4mnI5QAAu9opvQ
	(envelope-from <linux-usb+bounces-36296-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 18:38:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4406641D37B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 18:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0851E300D145
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 16:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA98F344D92;
	Fri, 17 Apr 2026 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEntKqes"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B38F33F597
	for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 16:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443774; cv=none; b=rBTXUGsRyWlRXAeTsYn+UW8c81rg4yDUGLyfqzJARMhgZSgZv23OIv0vGDhIPKvlELjpmx34VsGWmztIDDnRkVw+4UFklhjAY7P6WlBru1k027lQ4dXJvTOI68vMWxr9kzoKYh8IVVXwZO5eSTWExPqWuo/kMbxNTHMFuuamUnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443774; c=relaxed/simple;
	bh=KAs88uHTE14MRAYoEKY8DFLOyG48VCAjPNlpeXcNYu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0BIzfZQW5hFx/aYnod76IZC/ddjOoioSKcjC9zF7z/svClMF57EIP0ESsFLUgJxMDdZ0LU7qt+e0kppa+IyN17BE3iGxekdJ/unPNkboO2H/YrXKaXUtuT/RtsUWkwRAuLE5mcPWKshgaPyKYhzgRZCHzLpO9dwZgC+jOMHJDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEntKqes; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50d59d249fbso10031001cf.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 09:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776443769; x=1777048569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlYN800oL5Qo0D04TytfVm2TB7ydD9/Sl/xB4/ECVhY=;
        b=SEntKqesNfcoS2GIqtohlFLLLrUo9JkTJYkfd0wpwN/opju1tyMGalwzxriKQhpJss
         sjwvHUgKILLOifZacZYfj24aqK7qu+ky1zcSF21QLYgjpozvqZ0goLFl/LSHm5h3MJop
         6Y6PBu8iSfue2CBVRsjdRFAu6T6TG4Eqa4XWezMwTCo24DuaRbyJQ7c7Y0u1+Dh3UeML
         lrqO1uRQZPGVEhvJBtFQNDdhNe+fYZPoc1fl6QqV0tzWziPZcb7KKakd9txm7eMVAXne
         c72Fl9t5XTJQTe75deCGYRLpX9FB3hgbLYbKQXNvSdYCaABdyUJuoaUZPMfdG791bOqe
         nRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776443769; x=1777048569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GlYN800oL5Qo0D04TytfVm2TB7ydD9/Sl/xB4/ECVhY=;
        b=Y6hW0Lth7qy1SM1iBQvpE1lQE3pe4u8iCMIKBWVWfIk/phs6kIUrqLTUS8tagmqn4T
         NqH2jOKFvunEeQHqcsY7dg0Ghqu//VHt9BFjn0OKYkNxj9Yt35klt4s4Vxa4mzHwLIYV
         RYCih2hdlDwFb/2wgfxDUp3Bb5DroDX7y/cizPboCILMZQnDd7Jczs9h9XcY8dxDUQWd
         LFi0yDvVEM5Em1+a8A00/bBWEAlfh6mylI7RPxTY4105uWYCrDVeT2x27fnAcXVnseLJ
         p8o5NErr1rLb53JnjpcsKPS5RCkyLpl6J6PnLjhvlzOsjQ3Im8MI1hU3lyAKHSanVInd
         oprQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xAOcafmRcQX/nH22RrHToDhTgiuivDjH7QUSv35BFEq3kqWSw3CuDbVGpVlDyY2qB2AVO8chgWak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9iUVFXgyDFBM9if1hEfYcc92HQlR8pZpf43PeW8eL1H+rqpcg
	5rcP4HkZcuDTqX43eKVjnEJtRb32+Hb8Vf0rwttOFwZnSIhGTTBPbMENzXygCmVt
X-Gm-Gg: AeBDietbZFrbNn9Ti0fiKZS1vcJNfzJiOQYy9YlaVIIpGJHu3dWWDo5mNz93DlesnCP
	W07fhTA1bclH8PgoQBenXFC+tD9YWonX13/h3pzh+5rRBfKC7g8GOsXrzLRvJZaLJXM1oOpI4ot
	khw1xt7eFZfeCFHiqtFZO45SCYbaRPmsll2WIRwcosWEjV1bNdDl+z2zsmPT+kAfGa5JqJ9I7Iy
	PnYe76AzTkhTHhS3thDmIZA7XgayInkPWtcboX+50ZQFSsYHsi5XR0P7GDRhZWBhP1ULT0izc9S
	SUyLayYjkig6JZqbqvCy+wWbIy0rfstFvyTLSr38bPm533YzLJQELiQw+nxTihoYony9fyGAwsm
	jttvmYQxWYYTB/myP2fJdQzTa3WABsUbE6pWD25R5rOzjBeLkD1GqPnJKw7U5cP4y74L4JQmcgi
	G1g4INw1ufEtJufveL6zDJfahe3jyIg4yess1hh4ow6Igxy6t8FCye827QNA1ZQFWkY4BGhjWOL
	DDqX7vTo7PNiIQXNZAvAouC5aUYrh9ND0vr9vPX04bYeH9mJQABgQ==
X-Received: by 2002:ac8:5cd2:0:b0:50d:8656:3e60 with SMTP id d75a77b69052e-50e36c66084mr51747901cf.50.1776443768951;
        Fri, 17 Apr 2026 09:36:08 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e392c859asm19169381cf.1.2026.04.17.09.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:36:08 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Zheng Wang <zyytlz.wz@163.com>,
	Zheng Hacker <hackerzheng666@gmail.com>
Subject: [PATCH] usbip: vudc: Fix use after free bug in vudc_remove due to race condition
Date: Fri, 17 Apr 2026 12:35:52 -0400
Message-ID: <20260417163552.807548-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20230317100954.2626573-1-zyytlz.wz@163.com>
References: <20230317100954.2626573-1-zyytlz.wz@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36296-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4406641D37B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch follows up Zheng Wang's 2023 report of a use-after-free in
vudc_remove(). The original thread stalled on Shuah Khan's request for
runtime testing of the unplug/unbind path. This patch supplies that
testing and keeps Zheng's original fix shape.

In vudc_probe(), v_init_timer() binds udc->tr_timer.timer to v_timer().
usbip_sockfd_store() starts the timer via v_start_timer()/v_kick_timer().
vudc_remove() can then free the containing struct vudc while the timer is
still pending or executing.

KASAN confirms the race on an unpatched x86_64 QEMU guest with
CONFIG_KASAN=y, CONFIG_USBIP_VUDC=y, CONFIG_USB_ZERO=y, and a tight loop
that repeatedly writes a socket fd to usbip_sockfd, closes the socket
pair, and unbinds/rebinds usbip-vudc.0:

  BUG: KASAN: slab-use-after-free in __run_timer_base.part.0+0x8ba/0x8e0
  Write of size 8 at addr ffff888001b80740 by task trigger_and_unb/239
  Allocated by task 239:
    vudc_probe+0x4d/0xaa0
  Freed by task 239:
    kfree+0x18f/0x520
    device_release_driver_internal+0x388/0x540
    unbind_store+0xd9/0x100

This lands in the timer core rather than v_timer() itself because the
embedded timer_list is being walked after its containing struct vudc has
already been freed. The underlying lifetime bug is the same one Zheng
reported.

With v_stop_timer() called from vudc_remove() and the timer deleted
synchronously, the same harness completed 5000 bind/unbind iterations
with no KASAN report.

Fixes: b6a0ca111867 ("usbip: vudc: Add UDC specific ops")
Reported-by: Zheng Wang <zyytlz.wz@163.com>
Closes: https://lore.kernel.org/linux-usb/20230317100954.2626573-1-zyytlz.wz@163.com/
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/usb/usbip/vudc_dev.c      | 1 +
 drivers/usb/usbip/vudc_transfer.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index 90383107b660..c5f079c5a1ea 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -632,6 +632,7 @@ void vudc_remove(struct platform_device *pdev)
 {
 	struct vudc *udc = platform_get_drvdata(pdev);
 
+	v_stop_timer(udc);
 	usb_del_gadget_udc(&udc->gadget);
 	cleanup_vudc_hw(udc);
 	kfree(udc);
diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc_transfer.c
index a4f02ea3e3ef..d4ce85c4c6a2 100644
--- a/drivers/usb/usbip/vudc_transfer.c
+++ b/drivers/usb/usbip/vudc_transfer.c
@@ -490,7 +490,8 @@ void v_stop_timer(struct vudc *udc)
 {
 	struct transfer_timer *t = &udc->tr_timer;
 
-	/* timer itself will take care of stopping */
+	/* Delete the timer synchronously before teardown frees udc. */
 	dev_dbg(&udc->pdev->dev, "timer stop");
+	timer_delete_sync(&t->timer);
 	t->state = VUDC_TR_STOPPED;
 }
-- 
2.53.0



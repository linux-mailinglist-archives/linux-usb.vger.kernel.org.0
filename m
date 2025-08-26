Return-Path: <linux-usb+bounces-27294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA67B35998
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 11:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FB557C296E
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 09:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C1C322C98;
	Tue, 26 Aug 2025 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XIySo/S+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3894527CB04
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202120; cv=none; b=cusAOXXI6/6SJYWfNZIPuHSd4DdEWukaKL6oQ8Aa2qLa0r88D1Iyq97cozYFbcJV9cQVYh4MCgYTQfL4VWCu8tHWmWVj7U0Cp5qDUJlmYemCWFqVPZ4yFSMqwWIIwSSlwfNS2qsMteFNGM8x332HsJKzQh3jmo1x+2VIGfc8P9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202120; c=relaxed/simple;
	bh=/KamFF7v9JJ5WxDuzMDW8sX//8QLtZvUWf+GC5NFMd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WMBfzRSMBKqwy29oVWy4CE6V6jGW0XYOqkAL08bEuLtVj/QIl13z8ath9MtDfnaUofrOOGf2klQak0dtTJhKVjA1hG+ApQYGkVV+fYE66lPO4lxTWVF4TfgrhDOmXWhWhIiBRjbEBBMmOgrFf7UPn3FpxiFAqPFKY4WiQb/XZ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XIySo/S+; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-771e15ce64eso1488126b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 02:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756202118; x=1756806918; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szROZRyhI9hXsWPq1WQvee2kIktLJLQmHspiv2yMqBw=;
        b=XIySo/S+HzI5hwWHr3Lz7eIG1bw7dTMXgcXy20XRDj/3KF9Iprl7IbBLwEFoQbmHam
         F3MkxSPsPEL6bKM5Of50rxG5fD5rY79GZ2tN3NZn5IevQ8HW8qS5ioVah41146ufhW2K
         +bDfd3zLVCgRT+rWfBMNMA7fHlC3fvOCG6OiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202118; x=1756806918;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szROZRyhI9hXsWPq1WQvee2kIktLJLQmHspiv2yMqBw=;
        b=sBtkSXUdB2IQ6gFyS1JfSNiaR+e3C4PfqIurVW3pnO8BcsRA5FRGlZV99WntCk4XWw
         f9U2rAtw6owjO2J8fD/qaJjUJPJq/q3zChmu6WJfkMUeaNCVI8htLdlTNKzjYXSqFwzi
         JoMMNErfPSV5kMSVmZn/Tztgru0vIqUlcHVlIiR/Tlz0qloQ33OKC55NRZx3IDha/o93
         ui2ZMQpF/7sPv+DnQqti49U9op9pj2QQZLSF+7Qm0mm61PIVYPTueqKOSOqdqSMoQk2Y
         GhEIEsKY5SxF/41DZ/ZqaYg1K6AtEdUgt9Y4E5WHabHhLRYqyvz6d9BrpO/0IFTGOgra
         keOg==
X-Gm-Message-State: AOJu0Yw0g6R1ThelB3BxgC0eknrwqgh688YhiDDmlHD1fNiCO5TGI09r
	7H9rCuygXzDAzVAC4kV2nhgZu5cFWksFgne59rhQmUWD4bSGTXp6IQjmNnbk3zpG0A==
X-Gm-Gg: ASbGncsOR409+bHI9rxevxUYxJ9TMDpx+Zztmr0KMKknsDQWfMesCZAUi+fkVV/xs5n
	Betieu8L0VHdqEDAfrokWdWzgxmr1pHFZNb8BBWtgnmBJzsFVMy92oBKcySUKDYf2/UtHCDL3nK
	iqbD5C4m0qa+yku1PYPBpG+Zt+nNBJQV774ciPSuItqmaQptSroihHLYi4PVn6idZRfyjOKMIwq
	cnKi9cqzPgS9OZ4nPn+v7D51IDzN32vWIcDSdNt6l9GqiDkMdK5lLb+IBuQ+ZfuUYDy67nR15DR
	vG6DiNCEvz1wa4aC4dHEXmKAAMJQHFYbepgGV9HrdpsFju3feP8G+LODogsFUADL+Dru9zHvyc1
	yzWqg+Ii0x0O8ctcsE6OEZidS2w==
X-Google-Smtp-Source: AGHT+IFpSusCymta7Xa0Hj6CEqxGV4UgBGfAM6Cm4lf4WK5uLu3LOYMNlFpWQTx4slJf/zJhBsAF6Q==
X-Received: by 2002:a05:6a00:99e:b0:76c:503:180d with SMTP id d2e1a72fcca58-7702f9e8eb1mr20040165b3a.8.1756202118421;
        Tue, 26 Aug 2025 02:55:18 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:6354:cca7:fc6e:caaf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401af16bsm9915487b3a.54.2025.08.26.02.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:55:17 -0700 (PDT)
Date: Tue, 26 Aug 2025 18:55:12 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Realtek linux nic maintainers <nic_swsd@realtek.com>, 
	Takashi Iwai <tiwai@suse.de>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: net: usb: r8152: resume-reset deadlock
Message-ID: <a4pjgee3vncuqw5364ajocuipnfudkjnguwmmvjzz3ee3yjxzs@zxldhr5x7dkk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm looking into the following deadlock

<4>[ 1596.492101] schedule_preempt_disabled+0x15/0x30
<4>[ 1596.492170] __mutex_lock_common+0x256/0x490
<4>[ 1596.492209] __mutex_lock_slowpath+0x18/0x30
<4>[ 1596.492249] __rtl8152_set_mac_address+0x80/0x1f0 [r8152 (HASH:ce6f 4)]
<4>[ 1596.492327] dev_set_mac_address+0x7d/0x150
<4>[ 1596.492395] rtl8152_post_reset+0x72/0x150 [r8152 (HASH:ce6f 4)]
<4>[ 1596.492438] usb_reset_device+0x1ce/0x220
<4>[ 1596.492507] rtl8152_resume+0x99/0xc0 [r8152 (HASH:ce6f 4)]
<4>[ 1596.492550] usb_resume_interface+0x3c/0xc0
<4>[ 1596.492619] usb_resume_both+0x104/0x150
<4>[ 1596.492657] ? usb_dev_suspend+0x20/0x20
<4>[ 1596.492725] usb_resume+0x22/0x110
<4>[ 1596.492763] ? usb_dev_suspend+0x20/0x20
<4>[ 1596.492800] dpm_run_callback+0x83/0x1d0
<4>[ 1596.492873] device_resume+0x35f/0x3d0
<4>[ 1596.492912] ? pm_verb+0xa0/0xa0
<4>[ 1596.492951] async_resume+0x1d/0x30
<4>[ 1596.493019] async_run_entry_fn+0x2b/0xd0
<4>[ 1596.493060] worker_thread+0x2ce/0xef0
<4>[ 1596.493101] ? cancel_delayed_work+0x2d0/0x2d0
<4>[ 1596.493170] kthread+0x16d/0x190
<4>[ 1596.493209] ? cancel_delayed_work+0x2d0/0x2d0
<4>[ 1596.493247] ? kthread_associate_blkcg+0x80/0x80
<4>[ 1596.493316] ret_from_fork+0x1f/0x30

rtl8152_resume() seems to be tricky, because it's under tp->control
mutex, when it can see RTL8152_INACCESSIBLE and initiate a full
device reset via usb_reset_device(), which eventually re-enters rtl8152,
at which point it calls __rtl8152_set_mac_address() and deadlocks on
tp->control (I assume) mutex.

__rtl8152_set_mac_address() has in_resume flag (added by Takashi in
776ac63a986d), which is set only in "reset_resume" case, wheres what
we have is "resume_reset".  Moreover in_resume flag is not for tp->control
mutex, as far as I can tell, but for PM lock.  When we set_mac_address
from resume_reset, we lose in_resume flat, so not only we deadlock on
tp->control mutex, but also we may (I guess) deadlock on the PM lock.

Also, we still call rtl8152_resume() even in reset_resume, which I
assume still can end up resetting device and hence in set_mac_address()
in non-in_resume mode, potentially triggering the same deadlock that
Takashi fixed.  Well, unless I'm missing something.

So I don't think I want to add another flag to mark "current owns tp->control
mutex" so that we can handle re-entry.  How about moving usb reset
outside of tp->control scope?  Is there any harm in doing that?

---

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 44cba7acfe7d..7b4324c99869 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -8535,19 +8535,6 @@ static int rtl8152_system_resume(struct r8152 *tp)
 		usb_submit_urb(tp->intr_urb, GFP_NOIO);
 	}
 
-	/* If the device is RTL8152_INACCESSIBLE here then we should do a
-	 * reset. This is important because the usb_lock_device_for_reset()
-	 * that happens as a result of usb_queue_reset_device() will silently
-	 * fail if the device was suspended or if too much time passed.
-	 *
-	 * NOTE: The device is locked here so we can directly do the reset.
-	 * We don't need usb_lock_device_for_reset() because that's just a
-	 * wrapper over device_lock() and device_resume() (which calls us)
-	 * does that for us.
-	 */
-	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
-		usb_reset_device(tp->udev);
-
 	return 0;
 }
 
@@ -8671,6 +8658,19 @@ static int rtl8152_resume(struct usb_interface *intf)
 
 	mutex_unlock(&tp->control);
 
+	/* If the device is RTL8152_INACCESSIBLE here then we should do a
+	 * reset. This is important because the usb_lock_device_for_reset()
+	 * that happens as a result of usb_queue_reset_device() will silently
+	 * fail if the device was suspended or if too much time passed.
+	 *
+	 * NOTE: The device is locked here so we can directly do the reset.
+	 * We don't need usb_lock_device_for_reset() because that's just a
+	 * wrapper over device_lock() and device_resume() (which calls us)
+	 * does that for us.
+	 */
+	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+		usb_reset_device(tp->udev);
+
 	return ret;
 }
 


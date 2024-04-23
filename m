Return-Path: <linux-usb+bounces-9656-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2FE8AF4F2
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 19:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F7AD1C21DF7
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 17:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67F213DDDF;
	Tue, 23 Apr 2024 17:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wh7azEsE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950281411F4
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 17:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713891862; cv=none; b=P2iGviF1ey2lrbGdJpALQ87v/99Nx50f552CVXRkSMNWWUQq0R3Jwd7GxSUfHzhvwTwfheIULNBykEAlywtWldJ4nNnb9+UIU/jLzAi3epAsNyl6QQn92JzQXXSj1L/0wvOatosDHODlz7uFDuO+3hHkWgLNiccObvvI90UVtK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713891862; c=relaxed/simple;
	bh=t0Nd3XqdKOMx+Uwl8w+wtEyYR8rsAJTB/EFiBUB87DA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QbHeDCwuuK8FpJjLusSNmJ3vhn/whR2erMPrZXzBDjHxwOX3vEPEGibZYnrLS5BnGngpeqzQA8rYef8XSRlHUAlRqY4NM1WOkH0fzcTKx/C+th3crhBJ9VHYAmwNKyp8xC15edoh69wXKhChLUMM3Ikp5sBSiQ7OeyyboiQPv3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wh7azEsE; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6eddff25e4eso5029451b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713891860; x=1714496660; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pHqxdX0YvtEsoi1Rs3ueWXjO84yq8D38zpVlIYbumb0=;
        b=Wh7azEsErJQu4cFZ4idLUMPJWw6Q6QOvdyAJ6+2aR1HFdImq0oWc+ljUOb7TdRfg3D
         4gkcoLJhZ0vZd5Z1m2mIzeox1yUzPm6xOPx7jZi7zKMWuXxownQmR9vtBM8Qo3KVjMuy
         i4xR/Gt2GWObm20sbEZV4tt25PhRKOUb6nYpOhOtmQyJo4XmHY28bQKJkwlcrzJoYSxf
         Ir+mcqFdwp7T+/BBiEnjYolWPeSEUiiHIhQiJoL3DxnpVcLurbHqQjgRDrc22HIkmKoI
         2zBedh5mTqUJxJGDXLOjIJ0kJPLK43iabuzuAyoZVorLsWgCQbjeJ28PJ8VMjn6eY7zw
         GXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891860; x=1714496660;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHqxdX0YvtEsoi1Rs3ueWXjO84yq8D38zpVlIYbumb0=;
        b=qXxKd5nFtFKr045siGEC7vjvokW9ethzhK87EtcIERGWyhRlxRR28pnU/QU7Op9CyX
         lOiQXYaobeM5IlpeHkRID4IAORTykdRenwkMQ/IHbNbWpl4OQN/OzsKR6wzV6WzK/tMS
         BkFjOJTH18mfQZrthIPl+kwHdWdNeqog1UYty4T3Cn7I4xiQl3dkBZojWsjGB3DI2Fm7
         MWDKJySjktjlDjTzg+TZxlkKesFMYRGthTIN+a5IQZjBUk6cazxyD9f+EcC6g1M5Ksk3
         574fIt3O5hCxVT/E44o7hWpYjT7q1cujG/IAsS0O3nR6JsTJG0BpIk32rCdFJ/OGWLOX
         9rpw==
X-Forwarded-Encrypted: i=1; AJvYcCU6NNB3OPW7ZdGbqN6CcGvzeqONRwePq1GmxNgWj8Wl99B/6V7Y7M8TyUPRvH0Ub1UUHMxb+tVXju9eLv+iuVkRQtQO5aE++Q3M
X-Gm-Message-State: AOJu0YwJ/ZOZ6tGWpgjXuikzJkjb3kcBofea40PGulvQTCTXLGjJIz91
	PAd6guYbdoxp6wupAon9v01m66O4geHc80XBqkGM988whVqe+2/i
X-Google-Smtp-Source: AGHT+IExxiXD8KBtKwDmcZcDlgu3XgxY9OqQUa+zINLjizKRF7HM9y9/a2QPmno1yBMllHz7U//GrA==
X-Received: by 2002:a05:6a21:78a5:b0:1a9:c436:c904 with SMTP id bf37-20020a056a2178a500b001a9c436c904mr15816486pzc.10.1713891859642;
        Tue, 23 Apr 2024 10:04:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id kr3-20020a056a004b4300b006ed26aa0ae6sm9841652pfb.54.2024.04.23.10.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 10:04:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 23 Apr 2024 10:04:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: Problems (timeouts) when testing usb-ohci with qemu
Message-ID: <4664cf39-5dfe-4557-959d-149640ca36e1@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

when testing usb-ohci with qemu's pci-ohci emulation, I keep getting
random usb interface timeouts. Sometimes the usb_hub_wq times out.

[    9.555666] Waiting for root device /dev/sda...
[   62.452625] INFO: task kworker/0:2:42 blocked for more than 30 seconds.
[   62.453036]       Tainted: G                 N 6.9.0-rc1-00305-geae7a41d2233 #1
[   62.453393] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[   62.453778] task:kworker/0:2     state:D stack:0     pid:42    tgid:42    ppid:2      flags:0x00000000
[   62.454700] Workqueue: usb_hub_wq hub_event
[   62.455137] Call Trace:
[   62.455416] [<c0b47836>] __schedule+0x35c/0xe00
[   62.455708] [<c0b4830c>] schedule+0x32/0x178
[   62.455906] [<c07da782>] usb_kill_urb+0xa8/0xda
[   62.456220] [<c07db53c>] usb_start_wait_urb+0xca/0xe2
[   62.456441] [<c07db5ee>] usb_control_msg+0x9a/0x102
[   62.456648] [<c07d3970>] hub_port_init+0x5de/0xb40
[   62.456851] [<c07d67fe>] hub_event+0xb90/0x1364
[   62.457049] [<c002ead6>] process_one_work+0x200/0x564

Sometimes there is an i/o scheduling timeout such as

[    6.361811] Run /sbin/init as init process
[   93.167039] INFO: task kworker/u4:0:10 blocked for more than 30 seconds.
[   93.167715]       Tainted: G                 N 6.9.0-rc5-00036-gaece0dd54838 #4
[   93.168169] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[   93.168607] task:kworker/u4:0    state:D stack:0     pid:10    tgid:10    ppid:2      flags:0x00000000
[   93.169602] Workqueue: scsi_tmf_0 scmd_eh_abort_handler
[   93.170278] Call Trace:
[   93.170584] [<c0b3a70e>] __schedule+0x358/0xd4e
[   93.170904] [<c0b3b136>] schedule+0x32/0x166
[   93.171161] [<c0b41d6c>] schedule_timeout+0xd8/0x10a
[   93.171420] [<c0b3ba0e>] __wait_for_common+0xce/0x1ce
[   93.171604] [<c0b3bb2a>] wait_for_completion+0x1c/0x24
[   93.171716] [<c0810a70>] command_abort_matching.part.0+0x38/0x52
[   93.171841] [<c0810ac0>] command_abort+0x36/0x70
[   93.171946] [<c06970a4>] scmd_eh_abort_handler+0xa6/0x192
...

This is not a new problem; I have seen it forever. Recently I spent some
time trying to understand the problem and found that the linux driver does
not always handle all ohci interupts. Since the interrupt is shared and
thus level triggered, that means that interrupts are still pending when
ohci_irq() exits. The interrupt core in Linux does not re-enter the
interrupt handler, presumably because it is marked as shared interrupt
and returns that the interrupt has been handled.

I found two possible fixes for the problem. One essentially mirrors the
code from ehci_irq(), the other adds a (bad) kludge into qemu. Both "fix"
or work around the problem.

Question is: What is actually wrong ? Something in the generic interrupt
handling code in Linux, something in the Linux usb-ohci driver, or
something in qemu ? Any idea how a proper fix might look like ?

Thanks,
Guenter

---
Linux hack:

diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index 4f9982ecfb58..48d523e71ea0 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -883,6 +883,7 @@ static irqreturn_t ohci_irq (struct usb_hcd *hcd)
 	 * optimization of checking the LSB of hcca->done_head; it doesn't
 	 * work on all systems (edge triggering for OHCI can be a factor).
 	 */
+retry:
 	ints = ohci_readl(ohci, &regs->intrstatus);
 
 	/* Check for an all 1's result which is a typical consequence
@@ -982,6 +983,14 @@ static irqreturn_t ohci_irq (struct usb_hcd *hcd)
 	}
 	spin_unlock(&ohci->lock);
 
+	ints = ohci_readl(ohci, &regs->intrstatus);
+	ints &= ohci_readl(ohci, &regs->intrenable);
+	if (ints) {
+		pr_err("######## Interrupts still pending 0x%x mask 0x%x\n", ints,
+		       ohci_readl(ohci, &regs->intrenable));
+		goto retry;
+	}
+
 	return IRQ_HANDLED;
 }

---
qemu hack:

 hw/usb/hcd-ohci.c | 11 +++++++++++
 hw/usb/hcd-ohci.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index fc8fc91a1d..99e52ad13a 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -267,6 +267,10 @@ static inline void ohci_intr_update(OHCIState *ohci)
         (ohci->intr_status & ohci->intr))
         level = 1;
 
+    if (level && ohci->level)
+        qemu_set_irq(ohci->irq, 0);
+
+    ohci->level = level;
     qemu_set_irq(ohci->irq, level);
 }
 
diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
index e1827227ac..6f82e72bd9 100644
--- a/hw/usb/hcd-ohci.h
+++ b/hw/usb/hcd-ohci.h
@@ -52,6 +52,7 @@ struct OHCIState {
     uint32_t ctl, status;
     uint32_t intr_status;
     uint32_t intr;
+    int level;
 
     /* memory pointer partition */
     uint32_t hcca;
-- 
2.39.2



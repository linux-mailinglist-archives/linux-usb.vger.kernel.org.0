Return-Path: <linux-usb+bounces-11311-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB469080A4
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 03:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81EEF284317
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 01:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FD31822F9;
	Fri, 14 Jun 2024 01:30:54 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id ABD4829A2
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 01:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718328654; cv=none; b=HpgsdKJ0wtE3ZIPpTywpvE31Sias4rvWSkU2PgOsrpMIVmfamPYENg8m39uFfYkAcZt7aqEBBFuF+enrCRV6qCXo5YDpQSdZPPq3FdNt5gw8gy2CG3W33yMBXUGbdTi7S5xUyBRWxoBmyH1FVKP8sfPOI+j0IHqHRTNvV/nbzRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718328654; c=relaxed/simple;
	bh=NHfuDosNeZjSwPeDyy3cQ2MkLsMtVZXIVIVqodb7G6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LyKnf3Y+cmCJ2hBfbYB/kfv0H8uDyfZbGqYkJ+foXC7HrhLBz3FI9HB2mZntwjL2I6Si7uGtUM8TccBtEp5jAnjgimauqg2Y61ORvjfx7BMDqhoXJ71Rh7byP8bvsaPVegyI/H4oXbyDrf0ZHEpE0abOWUiiwqSRU9JTZthDEdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 282581 invoked by uid 1000); 13 Jun 2024 21:30:43 -0400
Date: Thu, 13 Jun 2024 21:30:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+1b2abad17596ad03dcff@syzkaller.appspotmail.com>,
  syzbot <syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com>,
  johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
  luiz.dentz@gmail.com, marcel@holtmann.org, syzkaller-bugs@googlegroups.com
Subject: [PATCH] USB: class: cdc-wdm: Fix CPU lockup caused by excessive log
 messages
Message-ID: <29855215-52f5-4385-b058-91f42c2bee18@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The syzbot fuzzer found that the interrupt-URB completion callback in
the cdc-wdm driver was taking too long, and the driver's immediate
resubmission of interrupt URBs with -EPROTO status combined with the
dummy-hcd emulation to cause a CPU lockup:


cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [syz-executor782:6625]
CPU#0 Utilization every 4s during lockup:
	#1:  98% system,	  0% softirq,	  3% hardirq,	  0% idle
	#2:  98% system,	  0% softirq,	  3% hardirq,	  0% idle
	#3:  98% system,	  0% softirq,	  3% hardirq,	  0% idle
	#4:  98% system,	  0% softirq,	  3% hardirq,	  0% idle
	#5:  98% system,	  1% softirq,	  3% hardirq,	  0% idle
Modules linked in:
irq event stamp: 73096
hardirqs last  enabled at (73095): [<ffff80008037bc00>] console_emit_next_record kernel/printk/printk.c:2935 [inline]
hardirqs last  enabled at (73095): [<ffff80008037bc00>] console_flush_all+0x650/0xb74 kernel/printk/printk.c:2994
hardirqs last disabled at (73096): [<ffff80008af10b00>] __el1_irq arch/arm64/kernel/entry-common.c:533 [inline]
hardirqs last disabled at (73096): [<ffff80008af10b00>] el1_interrupt+0x24/0x68 arch/arm64/kernel/entry-common.c:551
softirqs last  enabled at (73048): [<ffff8000801ea530>] softirq_handle_end kernel/softirq.c:400 [inline]
softirqs last  enabled at (73048): [<ffff8000801ea530>] handle_softirqs+0xa60/0xc34 kernel/softirq.c:582
softirqs last disabled at (73043): [<ffff800080020de8>] __do_softirq+0x14/0x20 kernel/softirq.c:588
CPU: 0 PID: 6625 Comm: syz-executor782 Tainted: G        W          6.10.0-rc2-syzkaller-g8867bbd4a056 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024


Testing showed that the problem did not occur if the two error
messages -- the first two lines above -- were removed; apparently adding
material to the kernel log takes a surprisingly large amount of time.

In any case, the best approach for preventing these lockups and to
avoid spamming the log with thousands of error messages per second is
to ratelimit the two dev_err() calls.  Therefore we replace them with
dev_err_ratelimited().

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Reported-and-tested-by: syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/00000000000073d54b061a6a1c65@google.com/
Reported-and-tested-by: syzbot+1b2abad17596ad03dcff@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/000000000000f45085061aa9b37e@google.com/
Fixes: 9908a32e94de ("USB: remove err() macro from usb class drivers")
Link: https://lore.kernel.org/linux-usb/40dfa45b-5f21-4eef-a8c1-51a2f320e267@rowland.harvard.edu/
Cc: stable@vger.kernel.org

---

 drivers/usb/class/cdc-wdm.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/usb/class/cdc-wdm.c
===================================================================
--- usb-devel.orig/drivers/usb/class/cdc-wdm.c
+++ usb-devel/drivers/usb/class/cdc-wdm.c
@@ -266,14 +266,14 @@ static void wdm_int_callback(struct urb
 			dev_err(&desc->intf->dev, "Stall on int endpoint\n");
 			goto sw; /* halt is cleared in work */
 		default:
-			dev_err(&desc->intf->dev,
+			dev_err_ratelimited(&desc->intf->dev,
 				"nonzero urb status received: %d\n", status);
 			break;
 		}
 	}
 
 	if (urb->actual_length < sizeof(struct usb_cdc_notification)) {
-		dev_err(&desc->intf->dev, "wdm_int_callback - %d bytes\n",
+		dev_err_ratelimited(&desc->intf->dev, "wdm_int_callback - %d bytes\n",
 			urb->actual_length);
 		goto exit;
 	}


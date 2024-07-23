Return-Path: <linux-usb+bounces-12359-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D113F93A3C4
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 17:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88FFB285341
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 15:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4FD157469;
	Tue, 23 Jul 2024 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BY/uJW1j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0096614F138
	for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2024 15:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721748610; cv=none; b=inEgxIHZn0u+xTimk+1FNWC0RLjd5NUAYVH0EUC8MKDH1qGZEE82y3XBIGZHdp9c91Vw95tO1M6pqHt2vDgHoDIubV+VRldxnzxjRNccymUDAcpoID6rCgi8nij+Pjd5bQRM0mggXnfQAisoDE2H59xFyUdXq8Y3u2kVrKJdkBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721748610; c=relaxed/simple;
	bh=78n0CA6Sch2qJqJKz+7NmOTfqyIFCxJ8DjlkzKp/aSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BH8WpCiXiKUOyC8gGGFSDimF28WY6TT/erJE9PypDK/pCSBfuPNliqzcSwYREXccAipBnNx7Jt9OJGsZm5bBtCJErcSS/sNuEckNfSLEywmwnOqw4xeyGO3/Sxsp2G8uVrjb9RKHyIlJtE7Olrz2lGaSdB4FA1QSpXFr2lIm6YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BY/uJW1j; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6b7a0ef0e75so33507906d6.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2024 08:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1721748608; x=1722353408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IEHcT8XxC0SlSjrExDMjr6SOkfXnLgP4pXm3ISl7TZk=;
        b=BY/uJW1jhzB0CA0DPBFcz4mHTB3qZ4YRltt6f9eP7X0SXLgQUUeu33G2DU4AeLi7/j
         gWU9GX/BxkE7kZ/xijZrLMv6eQZZ9RtwMEBa7SHs0aSvwuRlyFimvZZsUNpU/IyIrF0X
         UNrQ3GB9tu1K1eu1BnUibBhgaJ2ZjcEccrXHQR8mVi7psCMrquXVMvCibYQFUeIBRpwL
         kBtgwv7fP3a6QO+VaRt0GiIkkYrCsDN9DBXxyXIgjoQzeeSThwNWpzlhJXA/gyBaUxhx
         ZqAL2IjZ5ll36md8WWLwd4X+QFMD7/bXnzizkfcygTVBfH1/qM9BBqmyX+YSlr3EOaz1
         EUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721748608; x=1722353408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEHcT8XxC0SlSjrExDMjr6SOkfXnLgP4pXm3ISl7TZk=;
        b=Wsxfk2HJ4d5WVkdWnITKbhp1gFThmnwIHiBje/LAL9UxQNUORyOjVBtjd5fq9n392/
         3BiI1oGZ4FFXJMvsyQUlkr3TbMV4oWYyqiHgiL7fn6Kxr0AZst9E3dtCUGGEGBni9bWB
         kwPXSYxIXjLixQq7MQOKg3WJ92xpm5R8nhUDfhlVgnidlA16nsnByHpoF51lLQl8sR83
         EXlJD0Ama9XwsX15XcExlvOUOl14YQeUrTXvIeTuj/wTCO+sPOBlT3sT7rRrCS7A+P+e
         bicmOM8qFl69y3ttK76Ku1gosjnSdFAwdxmKuc8tQwyKumOcXJvezNwAVZ/0yt8ZHQBi
         sEhw==
X-Forwarded-Encrypted: i=1; AJvYcCV5kYCJ9kQa4sFp8yL4rubgkXikLLldn3Fc2AOzr2Hd3IXnHRFqiR2nCyDdeg/+fUah8+y6iCBUJsBrh9znuB8zwE5Al5Rlweam
X-Gm-Message-State: AOJu0YwpAc2AVryxUXscLLuNQ3LXSjwFAI0Fyf2K36Lna4bcWyFaFaLD
	Sr0rJrxZhQidlwiVBILuGuzV4SOo0++Rt/X8jspdO+7fxAhmVMSZkeijI5H8fQ==
X-Google-Smtp-Source: AGHT+IHp+SZ/H2ADfIqNtjyRXjOZOuded9Ph9BpuZgfIh/X3AngR6/rj9BD6WtS8E3ul0LOOux17xA==
X-Received: by 2002:a05:6214:3009:b0:6b7:ad32:3815 with SMTP id 6a1803df08f44-6b9610e3c60mr135237376d6.14.1721748607829;
        Tue, 23 Jul 2024 08:30:07 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7acae1c93sm47820276d6.108.2024.07.23.08.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 08:30:07 -0700 (PDT)
Date: Tue, 23 Jul 2024 11:30:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+edd9fe0d3a65b14588d5@syzkaller.appspotmail.com>
Cc: andriy.shevchenko@linux.intel.com, f.fainelli@gmail.com,
	fancer.lancer@gmail.com, gregkh@linuxfoundation.org,
	ilpo.jarvinen@linux.intel.com, jirislaby@kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, marcello.bauer@9elements.com,
	rafael@kernel.org, sylv@sylv.io, syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de
Subject: Re: [syzbot] [usb?] INFO: task hung in uevent_show
Message-ID: <ade15714-6aa3-4988-8b45-719fc9d74727@rowland.harvard.edu>
References: <000000000000dd5b9f061ab3d7a4@google.com>
 <0000000000006e5e08061dc2027e@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000006e5e08061dc2027e@google.com>

On Sun, Jul 21, 2024 at 06:36:01AM -0700, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit a7f3813e589fd8e2834720829a47b5eb914a9afe
> Author: Marcello Sylvester Bauer <sylv@sylv.io>
> Date:   Thu Apr 11 14:51:28 2024 +0000
> 
>     usb: gadget: dummy_hcd: Switch to hrtimer transfer scheduler
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12d54f2d980000
> start commit:   d35b2284e966 Add linux-next specific files for 20240607
> git tree:       linux-next
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=11d54f2d980000
> console output: https://syzkaller.appspot.com/x/log.txt?x=16d54f2d980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d8bf5cd6bcca7343
> dashboard link: https://syzkaller.appspot.com/bug?extid=edd9fe0d3a65b14588d5
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10905c26980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1122da8c980000
> 
> Reported-by: syzbot+edd9fe0d3a65b14588d5@syzkaller.appspotmail.com
> Fixes: a7f3813e589f ("usb: gadget: dummy_hcd: Switch to hrtimer transfer scheduler")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Let's try again to see if Marcello's patch fixes the problem.  The first 
try had a typo.

Alan Stern

#syz test: linux-next d35b2284e966

--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1304,7 +1304,7 @@ static int dummy_urb_enqueue(
 
 	/* kick the scheduler, it'll do the rest */
 	if (!hrtimer_active(&dum_hcd->timer))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS), HRTIMER_MODE_REL);
+		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS), HRTIMER_MODE_REL_SOFT);
 
  done:
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
@@ -1325,7 +1325,7 @@ static int dummy_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	rc = usb_hcd_check_unlink_urb(hcd, urb, status);
 	if (!rc && dum_hcd->rh_state != DUMMY_RH_RUNNING &&
 			!list_empty(&dum_hcd->urbp_list))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL);
+		hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
 
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
 	return rc;
@@ -1995,7 +1995,7 @@ static enum hrtimer_restart dummy_timer(struct hrtimer *t)
 		dum_hcd->udev = NULL;
 	} else if (dum_hcd->rh_state == DUMMY_RH_RUNNING) {
 		/* want a 1 msec delay here */
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS), HRTIMER_MODE_REL);
+		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS), HRTIMER_MODE_REL_SOFT);
 	}
 
 	spin_unlock_irqrestore(&dum->lock, flags);
@@ -2389,7 +2389,7 @@ static int dummy_bus_resume(struct usb_hcd *hcd)
 		dum_hcd->rh_state = DUMMY_RH_RUNNING;
 		set_link_state(dum_hcd);
 		if (!list_empty(&dum_hcd->urbp_list))
-			hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL);
+			hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
 		hcd->state = HC_STATE_RUNNING;
 	}
 	spin_unlock_irq(&dum_hcd->dum->lock);
@@ -2467,7 +2467,7 @@ static DEVICE_ATTR_RO(urbs);
 
 static int dummy_start_ss(struct dummy_hcd *dum_hcd)
 {
-	hrtimer_init(&dum_hcd->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	hrtimer_init(&dum_hcd->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
 	dum_hcd->timer.function = dummy_timer;
 	dum_hcd->rh_state = DUMMY_RH_RUNNING;
 	dum_hcd->stream_en_ep = 0;
@@ -2497,7 +2497,7 @@ static int dummy_start(struct usb_hcd *hcd)
 		return dummy_start_ss(dum_hcd);
 
 	spin_lock_init(&dum_hcd->dum->lock);
-	hrtimer_init(&dum_hcd->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	hrtimer_init(&dum_hcd->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
 	dum_hcd->timer.function = dummy_timer;
 	dum_hcd->rh_state = DUMMY_RH_RUNNING;
 
-- 
2.45.2



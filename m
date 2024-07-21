Return-Path: <linux-usb+bounces-12295-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B7D93851F
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jul 2024 17:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DEC61F21171
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jul 2024 15:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25AD167D83;
	Sun, 21 Jul 2024 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RXRJoE1k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D51C16088F
	for <linux-usb@vger.kernel.org>; Sun, 21 Jul 2024 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721575097; cv=none; b=drVSzkUnvWlSS+v1YgK/KE84TzqXdGGdfb0iu2wFPTbwukhafQI0X9ET3yom7enP5xK75PeKKaiSGlGwD0FsIUA7QAbVUHSs+6b857h4gHVIn/3cXlT66Z0T4JKCvKL+NSmtznA10ea4BDCSXA9MLDXNrjP8kgNlOFxtw08cpks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721575097; c=relaxed/simple;
	bh=CdQWHf4hkD0fmAoT9nMzSK3yD05Dqm2/b/9eF6VMnXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZC0ni/plOgnZmPT/W9TlbDRKprEboWw3uWok1CWP6V1f/hi6DBR8PGDLEJN2wz0qWpWxm/fgshJvVEivl8gPt9im/D/damuElJGWY7wO23q8ZB6ZO/lo1VXBY7P1RKq9pBvj9C3hFtuEkBPD/lhwRzh4s8ny0YdcLKCIoCjP4K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RXRJoE1k; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6b79fc76d03so20840366d6.1
        for <linux-usb@vger.kernel.org>; Sun, 21 Jul 2024 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1721575094; x=1722179894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NkQtiIgVJi6jMSABc3VvznjotS0ehP/XsEQpBgJ3FvQ=;
        b=RXRJoE1kpkOsLjwMblDEBdXmqbKwKsnujyIKObqetPrio0E9HmULpOm1GDHQpCzRg8
         ClKxXP2MGN9Hi6XobOx/pyol3WE+oFonZxQ+IYIalJ64w7sjiXLYOo85/8Futde81Rz6
         LzwQHI6KdCqQ/kGuPnvtViT8vsnMA/MrmDSeqLUKmyAZM7TNFwo9zFGlmBP5qxMVO7y3
         a29JUj+XbbfjT0aINMzqAw8R+KWzFZ09HVIXKECLmu3r7CdqatPn4eKt/E1waK5o7PSh
         4xz+POcfwbox+pUDWVLRPsEIvmliGGRS7P/Gwp0fLfPcq77oyRvgtqXTA8vKrXv6J8mN
         z/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721575094; x=1722179894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkQtiIgVJi6jMSABc3VvznjotS0ehP/XsEQpBgJ3FvQ=;
        b=MpPNik1EOQ+wRLjAkhhjTlYqx+Rbbhy5KYW1chmS7N2sZ7SOldXK1I0s2S6v3Iilrj
         io53jCROGBUsOoeYLzBbvA1PrtWJ+uszBGqYhm1hXhtmGF2xQDyTeq/JOltGnzBuiADd
         BZK4xuqa1uUF8lBptylNdN1YMa0AnCSrZ9ZfMDEWhcI01xN1Gw3uhDDWFgT4ELmE10qP
         jN/99rEnIrA7rGyaCcEWKUwSwMkkSnPE6Kc3hv/WaGRG97yRSbrFbC5GjC4YfwBYYd3E
         u3R95PIygAdja07hPAhwK9+2OQCkKWGA9JYrWU9dXztJM83NIY/21JSCz4bQQNAJSoK3
         t5sg==
X-Forwarded-Encrypted: i=1; AJvYcCVr0Vc9e7qNB/R5ZCRkNeIqtfnMRSj40TelzAXIxbLf0AtssjxL0cjC0Sg+x56Bp+V5RecHI/xwOlj9D2wUlR1IpnFbZ9dFSqen
X-Gm-Message-State: AOJu0Ywd9fS4ZWsW0XvsLdSTs9jG7KecpWUn3/Uhemd1vEuqq+DeKH8m
	3S5DqPHTuxNaBrP/GSEv26Yq9ya4J8z+8AeS0f00Aa1tFPH7s7V6aXiwT7u4SA==
X-Google-Smtp-Source: AGHT+IGwDmmrfeMNn/G+HDbvBapGq3MvadnbhUS7meurIStq7XQAyv86sr4pjmMNeF0NVxULOJG6Dw==
X-Received: by 2002:a05:6214:2406:b0:6b7:ab98:b8b4 with SMTP id 6a1803df08f44-6b96120b78cmr66746596d6.48.1721575093846;
        Sun, 21 Jul 2024 08:18:13 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::6658])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f9cd33335sm25894331cf.47.2024.07.21.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 08:18:13 -0700 (PDT)
Date: Sun, 21 Jul 2024 11:18:10 -0400
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
Message-ID: <961002f4-131c-4e15-bd7d-b2dafd76f047@rowland.harvard.edu>
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

Let's see if Marcello's patch fixes the problem.

Alan Stern

#sys test: linux-next d35b2284e966

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




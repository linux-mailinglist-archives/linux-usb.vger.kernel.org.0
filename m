Return-Path: <linux-usb+bounces-16151-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA3999B9C0
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 16:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF3FC281B4D
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 14:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C75146017;
	Sun, 13 Oct 2024 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Q+Nv4bS9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C441EB2E
	for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728829829; cv=none; b=KScsvldlJxUp/BhYM0bOA32ICq4fiA7ORyNg9MiuOZfK+J+NcRYZzFOVlYFb1zJ8oVGC7k3dcUtqL9thq0iJAWt5sOK65hQOzBT4zHn3Ji3wVqH55ghiVScLGLyUJfgZ1vLICfL4FpFfxIThNlL/w8gkpgu97dneK3pXlLAZKJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728829829; c=relaxed/simple;
	bh=KeXv3hCzSFiidY4IrwMesS2T/dxagoQkhkn6CIR4PMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVhWsEOgPvuATbu0c0uPsvew+LXqEairKEzkD+mWaupImbL/pqZ6rd1JHCA9FuGGAIBdKIWnQ7U8VKLLVbu0zjarKl9NnrFS7Ax0oUVljxGZ6YiL/DMUzV7N0j71v+8Vxx4xImzb0mshI0ZGsyCMR6CrW/oLz7Tn+3090/G1JPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Q+Nv4bS9; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6cbcd49b833so30141376d6.3
        for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1728829825; x=1729434625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uABAPjV9+/b3KG2CCvAjSvJfENsBnDWYVNvtO1z0LFc=;
        b=Q+Nv4bS9Atty4pfERk47aMaY6Wr/TQ030WufD787axiWPTcfPPDDnXOwcpMDJLUY54
         DVGXpGwZogfm4jR6aAio8zyxtw1xEtjUOy/GS0MkFfiMwttkab9ejbWNQZP1FdX3jS1I
         E1w0HzncYF2bimFZ6TioGipbQLyZPnuhneSVVXXAX9rl3z2btTTaCeVoyw7vF7NusTL4
         73hojoybn3YsbXoOzVa2jhQztynFxiJXKpTKFG9yt0H+JchBI6J244xDfI4sQMB0G3z5
         PBlaDuHQYqE0g64uyKQLjfzvXJec1op3Bbao4sMOzzeV+HhvVz1V05gBVwkMFk2FCHTX
         29iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728829825; x=1729434625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uABAPjV9+/b3KG2CCvAjSvJfENsBnDWYVNvtO1z0LFc=;
        b=pTyJ+PnI4g/pTIB+DRCzIxSr2hAb2eqi7p1/k/Uf0L1sS7Ww/Sf2Cg8z+SimNUhFxB
         XLr7fYtzPmFUrWhlP/FYN6udAecHDmVrlklnuqJQS4EC1TtCyAW8qBQ8eWaIi8dKbzuP
         IsqGVq8tURo/nc43oVYblb1WVoy7h1MPWOmBbrqSfSO8i8oNgecQYP5iyw9c9P9dLL2U
         lXxLnOjRvZ7fzHHX59RAUClQ4NLG5D5Fume+4Gg3CIHrwwN6cFQS8ZtJDOKYgT2+KaRK
         VvO43rKweHLa2iBvV/lhwGxdiH5IMso4AOiNCRMQLwl7u5ZByk/Ubwq36JYRklnBjJXt
         wmYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFh/kU1GqsgCqUPHYln4N9YY+2S+MicMeB2BVyVd7THmOVXEkpykA67dbJYSyZeaqn+6AY5m3j/Zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxGRc3j79MWgfzOr31r8kH2CcAIodv19IB0iw81Vpbg2ibTAbz
	wrsspnIFrefncIbOGPIuTPx884M2VgXcu5A6/A/Smyqz9dY4GFcyEEv79HUnITvKVqCo+EgLB3k
	=
X-Google-Smtp-Source: AGHT+IFl/5QKdPn+p65hu1eNNc2nrOM30wd1T0WBClKGGFxfpqpQH7woUzTY6u3DzdyX670dvk5t7w==
X-Received: by 2002:a05:6214:44a1:b0:6cb:9b65:5c75 with SMTP id 6a1803df08f44-6cbf9e76eb2mr89835136d6.32.1728829824934;
        Sun, 13 Oct 2024 07:30:24 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::267d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe85b7767sm35506776d6.34.2024.10.13.07.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 07:30:24 -0700 (PDT)
Date: Sun, 13 Oct 2024 10:30:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, sylv@sylv.io,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
Message-ID: <5d7f23a2-dd39-432c-9908-174f6fffda0b@rowland.harvard.edu>
References: <d6ec3898-b225-4c92-a381-46b111b6ddcf@rowland.harvard.edu>
 <670b38de.050a0220.3e960.0032.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670b38de.050a0220.3e960.0032.GAE@google.com>

On Sat, Oct 12, 2024 at 08:05:02PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> INFO: task hung in usb_register_dev

That wasn't particularly helpful.  In fact, it gives the impression
that the problem is caused by something else, not a bad dequeue.  None
of the tasks listed in the console log are waiting inside usb_kill_urb().

This time let's see all the enqueues, dequeues, and givebacks for
non-control URBs.  I don't know that the problem is related to a
non-control URB, but I do know that a bunch of control URBs succeed so
it might help to keep the focus away from them.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -50,7 +50,7 @@
 #define POWER_BUDGET	500	/* in mA; use 8 for low-power port testing */
 #define POWER_BUDGET_3	900	/* in mA */
 
-#define DUMMY_TIMER_INT_NSECS	125000 /* 1 microframe */
+#define DUMMY_INT_KTIME	ns_to_ktime(125000)	 /* 1 microframe */
 
 static const char	driver_name[] = "dummy_hcd";
 static const char	driver_desc[] = "USB Host+Gadget Emulator";
@@ -1301,10 +1301,12 @@ static int dummy_urb_enqueue(
 		dum_hcd->next_frame_urbp = urbp;
 	if (usb_pipetype(urb->pipe) == PIPE_CONTROL)
 		urb->error_count = 1;		/* mark as a new urb */
+	else
+		dev_info(dummy_dev(dum_hcd), "Enqueue %p\n", urb);
 
 	/* kick the scheduler, it'll do the rest */
 	if (!hrtimer_active(&dum_hcd->timer))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
 				HRTIMER_MODE_REL_SOFT);
 
  done:
@@ -1325,9 +1327,15 @@ static int dummy_urb_dequeue(struct usb_
 
 	rc = usb_hcd_check_unlink_urb(hcd, urb, status);
 	if (!rc && dum_hcd->rh_state != DUMMY_RH_RUNNING &&
-			!list_empty(&dum_hcd->urbp_list))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
-
+			!list_empty(&dum_hcd->urbp_list)) {
+		if (usb_pipetype(urb->pipe) != PIPE_CONTROL)
+			dev_info(dummy_dev(dum_hcd), "Dequeue restart %p\n", urb);
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
+				HRTIMER_MODE_REL_SOFT);
+	} else if (usb_pipetype(urb->pipe) != PIPE_CONTROL) {
+		dev_info(dummy_dev(dum_hcd), "Dequeue norestart: %d %p\n",
+				rc, urb);
+	}
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
 	return rc;
 }
@@ -1984,6 +1992,8 @@ return_urb:
 			ep->already_seen = ep->setup_stage = 0;
 
 		usb_hcd_unlink_urb_from_ep(dummy_hcd_to_hcd(dum_hcd), urb);
+		if (usb_pipetype(urb->pipe) != PIPE_CONTROL)
+			dev_info(dummy_dev(dum_hcd), "Giveback %p\n", urb);
 		spin_unlock(&dum->lock);
 		usb_hcd_giveback_urb(dummy_hcd_to_hcd(dum_hcd), urb, status);
 		spin_lock(&dum->lock);
@@ -1995,8 +2005,7 @@ return_urb:
 		usb_put_dev(dum_hcd->udev);
 		dum_hcd->udev = NULL;
 	} else if (dum_hcd->rh_state == DUMMY_RH_RUNNING) {
-		/* want a 1 msec delay here */
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
 				HRTIMER_MODE_REL_SOFT);
 	}
 
@@ -2391,7 +2400,8 @@ static int dummy_bus_resume(struct usb_h
 		dum_hcd->rh_state = DUMMY_RH_RUNNING;
 		set_link_state(dum_hcd);
 		if (!list_empty(&dum_hcd->urbp_list))
-			hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
+			hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
+					HRTIMER_MODE_REL_SOFT);
 		hcd->state = HC_STATE_RUNNING;
 	}
 	spin_unlock_irq(&dum_hcd->dum->lock);


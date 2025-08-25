Return-Path: <linux-usb+bounces-27263-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B494B34692
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 18:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9C5C3A2F3C
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 16:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CC31E9B37;
	Mon, 25 Aug 2025 16:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EMvFI8t7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA1A1E32DB
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756137629; cv=none; b=MFqSu9jcwviMsdTbfSSoGmZS+ciya8RGwwIyosBVDkoG8E1qVqN5YoY+nnYi8Evv5RFSoaC8IyPLpBzJnzysrJOFyuEErmDtxFJ6NnX4oTibVI+I1Ny1qdommr9Fc30qVQqWru3dCpbeFgOv5+BJjyLk9pqvhPP/jXWZfK+HVQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756137629; c=relaxed/simple;
	bh=Hy0wGiDo+bKCq4jLZKQQ0h09edDWE6osGvN+8inMYUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1QSIo4H9o1Y39Q/GypVAdUoWOqSTNnQQIalMleekQVoPsnZ6zTBp2iAoELgbg6wI/LcOFh2/uHdotd66kiK++rxxq19+6ktL5hldlznNpfeEbQuUvaalWLMLUWkvnu9t3UHZzTmw4CyAnZdtSQQ8/AV+QLZJSTJspquN+TpfOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EMvFI8t7; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e87063d4a9so524457585a.2
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 09:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756137627; x=1756742427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vh2bnZm5lGiADC/Jp4IzuzvCUyqVlJnewJ7GveeEWWI=;
        b=EMvFI8t71DTRLSxoKlx/VZmN49VFk4YnRnShpqUNYU6dgXplW0/w3uuoONYY3D8ftB
         jpVKu7zfhe3JOYxeHlkGhiISmN9IDxtIXRzYuXgRJiv2uw3ylwfCxss1W2u/8SKkqde+
         zKUsShdqOhwrIbqxez/h9/NzU77DEbWruvGWX/m63Z+fpyKCIDpq7PyFg/dDNqCzSdxZ
         8DgELfKDvyLQEX98T/6YdjbmZ3xi1cAzthm3AR682JZ3VHPoIaMwTuUXQeHoE4Tmeju6
         y+28uJj7t2pwkEI21X7nXV5x90PQGcMR6zc9K7xxoAZeBNiMCZ/ecFlKGg/sZY+U/SFL
         c69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756137627; x=1756742427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vh2bnZm5lGiADC/Jp4IzuzvCUyqVlJnewJ7GveeEWWI=;
        b=CF4I+JEPsdCoq0GxK1P9Yqc0xqQi4L/2aob/iM8WzG8CsqVO1jj5SHmynrUpCHKALc
         9do1A1s0L86k5JXPcbd1Mk+gOkM76UtE4Ciru8XRzaKCZm2ba1zhxngJMfMGH7B+K6/z
         MhoAbxU852AAQMJ+nJ224jwIDTI2ov0eYu8btkfgUVVSPBVaJI6mn2MF9guwIqznFjS/
         F4x9GIhUZuihJGWi+jM1oDLvqtCokPokSuWrFwAavL31O4cLt1Mx4PkOrHSXPZecBbNe
         bn5UNpV9wrQy0WF4eOBo2kGK2OzwVO7ZHnanKp5ffpKgMfj3EIIltdnWi6iKFxChPMmB
         nNHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLdWvxQOcRdWME4ssIgZspizt09XFYIGscZxMgCjYVcVtosMvJBIZp8koF+xQOuhKKYSc5mnNh5Gw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWlyoaIkFxp9XEeZfZX0Wgu/7Txl1fXzRnWBd78yfEYuQfaTHi
	B8ms16cG0GrUo0nckqFuFD+N7gbgYksO+Yv9jdvqnfHah4WGl02s0/tV/sfmP/W7rw==
X-Gm-Gg: ASbGncsqizHA9Fk41ZPCZU3OujpCZd1AYl9gdgDh6SzOOvhbL3F/YOVpZaVvpmWNQyo
	sRvL0mcR6bFNX7iVWY35KGIgTSV5drlVG7u+W96sh39MFxlvm7kHtJeBjBxuvp0lXV+AheMXeVU
	gIgE8BYzphcDQdM9Mc9W24aIAr6TVOvJIZC83ETEFwkDW2tvcUJKphh899L6Wxep2c6GrZeZTW1
	5CJqPvenLZCKCQji4xwGOchGjJjXbnCdGYp659jOTrRM//JrPtrcmvSnuKzQoqHU8yn1v+1Ze8x
	LY1p5z5qX/2ccM4dludgzAWzfM6Dir5fj0uQvn3C3uImszj6dDHBtmAe7k5jVF3hFym/BUW1T9j
	yOLUOnKqax7IyCXNEvYFsIpJH
X-Google-Smtp-Source: AGHT+IFC/2VToTJTB0jWiApGWNCuagW5UM2XuBLjed3+M+u7hzdQK7qfJoOF6vStDIX35DzVloj9Kw==
X-Received: by 2002:a05:620a:258d:b0:7e8:6364:2e6f with SMTP id af79cd13be357-7ea10f96b04mr1388416585a.2.1756137626034;
        Mon, 25 Aug 2025 09:00:26 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:156:8000:24f0::eb06])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebf2b505d3sm506626685a.37.2025.08.25.09.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 09:00:25 -0700 (PDT)
Date: Mon, 25 Aug 2025 12:00:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <greg@kroah.com>
Cc: syzbot <syzbot+8baacc4139f12fa77909@syzkaller.appspotmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Yunseong Kim <ysk@kzalloc.com>,
	USB mailing list <linux-usb@vger.kernel.org>,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] USB: gadget: dummy-hcd: Fix locking bug in RT-enabled kernels
Message-ID: <bb192ae2-4eee-48ee-981f-3efdbbd0d8f0@rowland.harvard.edu>
References: <0d6d8778-a45e-498f-9e31-1d926f582d7e@rowland.harvard.edu>
 <68ac790c.050a0220.37038e.0095.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68ac790c.050a0220.37038e.0095.GAE@google.com>

Yunseong Kim and the syzbot fuzzer both reported a problem in
RT-enabled kernels caused by the way dummy-hcd mixes interrupt
management and spin-locking.  The pattern was:

	local_irq_save(flags);
	spin_lock(&dum->lock);
	...
	spin_unlock(&dum->lock);
	...		// calls usb_gadget_giveback_request()
	local_irq_restore(flags);

The code was written this way because usb_gadget_giveback_request()
needs to be called with interrupts disabled and the private lock not
held.

While this pattern works fine in non-RT kernels, it's not good when RT
is enabled.  RT kernels handle spinlocks much like mutexes; in particular,
spin_lock() may sleep.  But sleeping is not allowed while local
interrupts are disabled.

To fix the problem, rewrite the code to conform to the pattern used
elsewhere in dummy-hcd and other UDC drivers:

	spin_lock_irqsave(&dum->lock, flags);
	...
	spin_unlock(&dum->lock);
	usb_gadget_giveback_request(...);
	spin_lock(&dum->lock);
	...
	spin_unlock_irqrestore(&dum->lock, flags);

This approach satisfies the RT requirements.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: b4dbda1a22d2 ("USB: dummy-hcd: disable interrupts during req->complete")
Reported-by: Yunseong Kim <ysk@kzalloc.com>
Closes: <https://lore.kernel.org/linux-usb/5b337389-73b9-4ee4-a83e-7e82bf5af87a@kzalloc.com/>
Reported-by: syzbot+8baacc4139f12fa77909@syzkaller.appspotmail.com
Closes: <https://lore.kernel.org/linux-usb/68ac2411.050a0220.37038e.0087.GAE@google.com/>
Tested-by: syzbot+8baacc4139f12fa77909@syzkaller.appspotmail.com
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <stable@vger.kernel.org>

---

 drivers/usb/gadget/udc/dummy_hcd.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -765,8 +765,7 @@ static int dummy_dequeue(struct usb_ep *
 	if (!dum->driver)
 		return -ESHUTDOWN;
 
-	local_irq_save(flags);
-	spin_lock(&dum->lock);
+	spin_lock_irqsave(&dum->lock, flags);
 	list_for_each_entry(iter, &ep->queue, queue) {
 		if (&iter->req != _req)
 			continue;
@@ -776,15 +775,16 @@ static int dummy_dequeue(struct usb_ep *
 		retval = 0;
 		break;
 	}
-	spin_unlock(&dum->lock);
 
 	if (retval == 0) {
 		dev_dbg(udc_dev(dum),
 				"dequeued req %p from %s, len %d buf %p\n",
 				req, _ep->name, _req->length, _req->buf);
+		spin_unlock(&dum->lock);
 		usb_gadget_giveback_request(_ep, _req);
+		spin_lock(&dum->lock);
 	}
-	local_irq_restore(flags);
+	spin_unlock_irqrestore(&dum->lock, flags);
 	return retval;
 }
 


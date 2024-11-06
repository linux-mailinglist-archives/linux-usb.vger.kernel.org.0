Return-Path: <linux-usb+bounces-17230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDAE9BF185
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 16:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FE5A1C2042B
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 15:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70FF202F6C;
	Wed,  6 Nov 2024 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="l9QiK9pb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645BB1D63D3
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730906669; cv=none; b=W8euWWfHwcZkODZvrtV47l0FKcrmCDv46MUosu+VNtA7LOue5QsPnagwaSWiMFvHa7IzO1t3cABMJDa4QbmTzBvTO3MAcRv5AMDUKwkhVYdQfJjLwK63KI4bWtEs8rwp2glUs/YXyf+Ep5VW+saiKEgcGKkfKqiURitBqbzL3aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730906669; c=relaxed/simple;
	bh=iWVoDSt16/6SO5SD84UmBUUnrUw2s3QZdnSOMTCJeEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TC0kq9APG6gQU6vYlwqX269aZDM3svEkB2DhQJ9a5I2pL//o3VOvLnMprMpDj1SRx87RWZsG9u4VHlMvZb7o8NRCb8s3chk05KzG/qaxTXi7kjKpsGRSjJrTgD2oEI1VguNl+bY8H6hau2iGEzBL7IgkdSW4dUJiwO345X9ouFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=l9QiK9pb; arc=none smtp.client-ip=209.85.219.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-yb1-f195.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso8634228276.1
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2024 07:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1730906666; x=1731511466; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fRspcGjZXal6pVniQMFb2Ir3HusABO8VA+M0NXCiYpo=;
        b=l9QiK9pb61EDbK+q40+lacw6OCQHJvHJpWYhMVMneOLECvV3+BiQVfOAT7RSuadXb9
         jIMRJ0j+BserF9oebGk4Hn5tPwd8KEu+3vbETjbehAJE7ZZ0LOC7TrXIwIBTK9lkwrKG
         /E93qQIryUg1tF+li6tSGnQPmBQBX9UHHdNvmUGpQdSDcJMxuBK/TMZCSbUBt3xy31Dg
         FI72vjCbHnOYe0QcP+E2jx61qCHshZFAa3zClCIUlQpNEUhMs4WuFA8RmBGXjmdMmwES
         0z6PaZMqsXTJVe+QpB8r9p0lne5lpnNenHGwIaJp2eOaXpg2bM2TN7Lbtew1hPlDBR16
         hKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730906666; x=1731511466;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRspcGjZXal6pVniQMFb2Ir3HusABO8VA+M0NXCiYpo=;
        b=QmmptnCP/AFpcEa/GEtqEdIFYxLy4tQ/aCLU6D2FNvszPElcw4YArbc1VHUWq5y/v2
         soKUtwRYA/QbIiOM20NkcGIx0p/EXdn9h3Hc+WyX86NKs6gVkpZxO9LoJeBkcQft9SzD
         VgHMnzuMJSePQ3db5ULIMLl3X13kPDo65MQi5bSbnfs9sbEI19xk2ibSdFXto9udII49
         z+8bQYMtkxOjdHmLtUHwyxw8PatDd8YW+S1jeTUt5qXej++B880OU/+sfECarcdGXSyE
         e7GI7VuHOHr+Vj1b/2XuLggXCqCN26NQpqjA24V6OmOX4vEJVrZfqRuWvv9LdHmuRtMU
         k2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJkng/05wxQwONGCDmGtIt0EfRr/wXR6fiCHVxPmW/O0zPMeiFbZ5PUl5ljoLASi/F4Dehj5pcO8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlIHLhnbYJtPgGX9bsmzCqoDjLRhnWMFxWvVvL8jJ/OKTSpSVR
	QwbgdgZDxP+bqPGlRJRKLzdGoXWhwxCQxUusxucKyh/oLCdIER38tBrbiRPvcA==
X-Google-Smtp-Source: AGHT+IGNIss1AEKTBNYwl9sR8shJAHZm84ppXhYfRfU/5Vn/q6gPrYZLUSgXJrtIV3Yu6ad0dHJMRw==
X-Received: by 2002:a05:6902:1083:b0:e30:e3f6:75ec with SMTP id 3f1490d57ef6-e30e3f676dbmr22722700276.17.1730906666231;
        Wed, 06 Nov 2024 07:24:26 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.12.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad19b328sm72514791cf.85.2024.11.06.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 07:24:25 -0800 (PST)
Date: Wed, 6 Nov 2024 10:24:23 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>, gregkh@linuxfoundation.org,
	viro@zeniv.linux.org.uk, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	syzbot+3e563d99e70973c0755c@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: raw_gadget: Add debug logs to a troubleshoot a
 double-free bug in raw_release.
Message-ID: <c616753b-2dfa-4d47-8e59-ae6fdf857708@rowland.harvard.edu>
References: <Zyrsg3bvNu1rswqb@gmail.com>
 <CA+fCnZeThG-J7kCraPbr4NCpys=jne3dD4sOLT_0h6iPw2YZEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZeThG-J7kCraPbr4NCpys=jne3dD4sOLT_0h6iPw2YZEw@mail.gmail.com>

On Wed, Nov 06, 2024 at 01:35:27PM +0900, Andrey Konovalov wrote:
> On Wed, Nov 6, 2024 at 1:11 PM Chang Yu <marcus.yu.56@gmail.com> wrote:
> >
> > syzkaller reported a double free bug
> > (https://syzkaller.appspot.com/bug?extid=3e563d99e70973c0755c) in
> > raw_release.
> >
> > From the stack traces it looks like either raw_release was invoked
> > twice or there were some between kref_get in raw_ioctl_run and
> > kref_put raw_release. But these should not be possible. We need
> > more logs to understand the cause.
> >
> > Make raw_release and raw_ioctl_run report the ref count before
> > and after get/put to help debug this.
> >
> > Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> > Reported-by: syzbot+3e563d99e70973c0755c@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=3e563d99e70973c0755c
> > ---
> >  drivers/usb/gadget/legacy/raw_gadget.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> > index 112fd18d8c99..ac4e319c743f 100644
> > --- a/drivers/usb/gadget/legacy/raw_gadget.c
> > +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> > @@ -194,6 +194,8 @@ static struct raw_dev *dev_new(void)
> >                 return NULL;
> >         /* Matches kref_put() in raw_release(). */
> >         kref_init(&dev->count);
> > +       dev_dbg(dev->dev, "%s kref count initialized: %d\n",
> > +               __func__, kref_read(&dev->count));
> >         spin_lock_init(&dev->lock);
> >         init_completion(&dev->ep0_done);
> >         raw_event_queue_init(&dev->queue);
> > @@ -464,13 +466,21 @@ static int raw_release(struct inode *inode, struct file *fd)
> >                         dev_err(dev->dev,
> >                                 "usb_gadget_unregister_driver() failed with %d\n",
> >                                 ret);
> > +               dev_dbg(dev->dev, "%s kref count before unregister driver put: %d\n",
> > +                               __func__, kref_read(&dev->count));
> >                 /* Matches kref_get() in raw_ioctl_run(). */
> >                 kref_put(&dev->count, dev_free);
> > +               dev_dbg(dev->dev, "%s kref count after unregister driver put: %d\n",
> > +                               __func__, kref_read(&dev->count));
> >         }
> >
> >  out_put:
> > +       dev_dbg(dev->dev, "%s kref count before final put: %d\n",
> > +                       __func__, kref_read(&dev->count));
> >         /* Matches dev_new() in raw_open(). */
> >         kref_put(&dev->count, dev_free);
> > +       dev_dbg(dev->dev, "%s kref count after final put: %d\n",
> > +                       __func__, kref_read(&dev->count));
> >         return ret;
> >  }
> >
> > @@ -603,8 +613,12 @@ static int raw_ioctl_run(struct raw_dev *dev, unsigned long value)
> >         }
> >         dev->gadget_registered = true;
> >         dev->state = STATE_DEV_RUNNING;
> > +       dev_dbg(dev->dev, "%s kref count before get: %d\n",
> > +                       __func__, kref_read(&dev->count));
> >         /* Matches kref_put() in raw_release(). */
> >         kref_get(&dev->count);
> > +       dev_dbg(dev->dev, "%s kref count after get: %d\n",
> > +                       __func__, kref_read(&dev->count));
> >
> >  out_unlock:
> >         spin_unlock_irqrestore(&dev->lock, flags);
> > --
> > 2.47.0
> >
> 
> Hi Chang,
> 
> This patch looks very specific to the bug we're trying to debug - I
> don't think it makes sense to apply it to the mainline.
> 
> What you can do instead is ask syzbot to run the reproducer it has
> with this patch applied via the #syz test command.
> 
> Thank you!

In addition you should change your dev_dbg() calls to dev_info(), 
because dev_dbg() output will not show up in the syzbot console log.

Alan Stern


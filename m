Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E214519F9A4
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2020 18:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729344AbgDFQFD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Apr 2020 12:05:03 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33826 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728879AbgDFQFD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Apr 2020 12:05:03 -0400
Received: by mail-pg1-f195.google.com with SMTP id l14so144291pgb.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Apr 2020 09:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FPRIe1QyVo9Qc6/s3jT3IG/6pg2ytWslzDkUx2tJfRs=;
        b=IeJLNp9DMDbVEgkPBLplvWvDEixsoER8nivtU46z00WGl3ZtYpnt5xJDWlki+/v0Ie
         OjCVVdNGcwNfCeo4RhD7IN4tMvMOBpuicE2QqFwO3cnDzVer21NSQXoNoYA+4GI8d+Pg
         8Akdh4dfTUECprp/zen1G5RTubopPkC8q4D6o3fUh4bkMsHRYsKfvfPW/3VKwpA3ayHA
         Lxz9SRVeRZaxiM6J7cJCb0d47f2qJVe95cMkOD8nnZUvGcSBqvifkRrhVcc69wmUm89T
         xmwghJqqqN0HinVTOSwxtR+u9xXY2OwWpz20YYsFd2fA4ArZh7PUX3MX8X79q1k4jPo9
         YxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FPRIe1QyVo9Qc6/s3jT3IG/6pg2ytWslzDkUx2tJfRs=;
        b=IVB0S17DccaEhOAg3FAx22VWfaD+eqlSJlprjEeo+TBsQ5dFS8VOkroPGUU58yFzn/
         josD3Sa6g5v6pW01nQSwEvfpJZH2qnKLBh9RqOLz8jYMIRYEn3ba0sW7XpuIba4qgJGN
         qsVfLFWLHj0cd8MtMk1+Oif5gtJtHtcjK9dLRD410/RiX60vlp64+Eci+QU+MEg6JOgM
         ETJ4ZMS7Zrl0xo8y90HCUAQCngsX7S7aAbbdS/JcehbRiUAPhoB5dqyZ5HiEfVsfY6FE
         6OAVZeRRBmyUUk2d/tKWKNULFQS+iN1lQd8MW6gBR7mPkkqsJdRr+9Y/wVlZRk/44aGi
         HD7Q==
X-Gm-Message-State: AGi0PubqOz4wFGN8erWIfE2A6Eky2+NSQA2SfJ4h8osL8g5p9iP505V8
        P4CWQ14JQeMYKIZG+8CQhW+uJELioGyHutElmF1hzw==
X-Google-Smtp-Source: APiQypLpuZN2yZSt9KiTc2zVF8DFesf6frCtcpaldy93b4oZw7s+cqT3fJqX5SNUTd/rMw0t8l+TILYTehxedxH7p+w=
X-Received: by 2002:a62:ce48:: with SMTP id y69mr184804pfg.178.1586189101918;
 Mon, 06 Apr 2020 09:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200406105545.GA35744@mwanda> <CAAeHK+xRnfxJwbPapPJv6LhE5xKiELEKc6ThTgSchkE+6y+wJw@mail.gmail.com>
 <20200406140726.GK2066@kadam>
In-Reply-To: <20200406140726.GK2066@kadam>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 6 Apr 2020 18:04:51 +0200
Message-ID: <CAAeHK+yFM=sSkoxQEXrUCY8tMdDoyJ8qXYm6bCTZLe+=0FLuzQ@mail.gmail.com>
Subject: Re: [bug report] usb: gadget: add raw-gadget interface
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 6, 2020 at 4:07 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Apr 06, 2020 at 03:06:12PM +0200, Andrey Konovalov wrote:
> > On Mon, Apr 6, 2020 at 12:55 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > Hello Andrey Konovalov,
> > >
> > > The patch f2c2e717642c: "usb: gadget: add raw-gadget interface" from
> > > Feb 24, 2020, leads to the following static checker warning:
> > >
> > >     drivers/usb/gadget/legacy/raw_gadget.c:102 raw_event_queue_fetch() warn: inconsistent returns 'queue->sema'.
> > >       Locked on  : 96,102
> > >       Unlocked on: 93
> > >
> > > drivers/usb/gadget/legacy/raw_gadget.c
> > >     81  static struct usb_raw_event *raw_event_queue_fetch(
> > >     82                                  struct raw_event_queue *queue)
> > >     83  {
> > >     84          unsigned long flags;
> > >     85          struct usb_raw_event *event;
> > >     86
> > >     87          /*
> > >     88           * This function can be called concurrently. We first check that
> > >     89           * there's at least one event queued by decrementing the semaphore,
> > >     90           * and then take the lock to protect queue struct fields.
> > >     91           */
> > >     92          if (down_interruptible(&queue->sema))
> > >     93                  return NULL;
> > >     94          spin_lock_irqsave(&queue->lock, flags);
> > >     95          if (WARN_ON(!queue->size))
> > >     96                  return NULL;
> > >
> > > I'm going to have investigate to see why Smatch doesn't complain that
> > > we have disabled IRQs on this path...  Anyway, this doesn't seem like it
> > > can be correct.  I get that this is a WARN_ON() path, but we're leaving
> > > the computer in a very screwed up state we don't at least enable IRQs.
> >
> > Hi Dan,
> >
> > Oh, right, I'll send a patch to add spin_lock_irqsave() there.
> >
> > I don't really get the warning about queue->sema though, is there
> > something wrong with it, or is it actually a warning about
> > queue->lock?
>
> The rule here is that we return NULL here and on line 93, so how does
> the caller know if we took that "queue->sema" lock?

OK, I see, will send a fix soon, thanks!

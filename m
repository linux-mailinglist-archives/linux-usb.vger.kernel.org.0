Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA94825BB4B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 08:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgICG5w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 02:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgICG5u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 02:57:50 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59735C061244
        for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2020 23:57:50 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id c8so1542132edv.5
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2020 23:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ElSU51EF/vvPpnVgy/1BgZ1pEy8JFaYcGJumBDA+jg0=;
        b=qSx2QCefg1X/IS4zACrtNCokU5UydymvSTQst+VUl/d4LwF8KzkBYZYOwnPpjhaIQE
         qRbbe57ujlZ+8Kys1x7xX6Gwwxth9fbGKeH7sLnICr2CYhYD0hVdsNCzqzKkNjDwsiTf
         oB+mAqXhpPBfsUni1TUKTwffQiQ26sdvKo6e/R5JmFPo+YyWDUK3XzJGnosmsDnrOXHn
         vwszsXCAWp6kepTPuFhJscvnpmyda1MzsM+Tguob7fYTbWSbtQIwckkX2TtXHYAl1Jmm
         VoA1EGDHBd23NUtKKdckOmnkxRLz1DJeesNvAmACiIPLz5o/m3zI+KckJtlxbhREBZ22
         y21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ElSU51EF/vvPpnVgy/1BgZ1pEy8JFaYcGJumBDA+jg0=;
        b=j1vtdIR5SYfLzp1PYGMbg1/AJUOa9Unuu3HxmskOiJrAPBKJHqsxjL/4NfgEfpv8cI
         uRFMbumztBknp9YrW024qXXL5TI7g4I5ZQG/9iHxXYwa8LDlcpQRr7lZqIRvBHmsFDk0
         4+1VrnDfgEx0pJWoTJlnqY7PNAaC30pOTwrB/Jzb6kLx/Vj4rfY3L01y/H4i6KtEtLjR
         AjD80K5A0xpdb++0cW3Dfhw06F1LAhExp8D4i3U7NS5hRNZbH7TDw7G3NjAChO8IxnMw
         uqGBvlIm/+1ktsybCQewHVhbdZ2WPpt9uQMfh+ltKTE68LTs8qUCvWJ9L2tqPYAHqPFr
         mvOg==
X-Gm-Message-State: AOAM532D0ODeEs0qVMushW+1lEL9pWtjYuV5L++O0Ph0BhKxRaF8qUwQ
        ZMKreFRO/nNwhr/DZE8X9gKNXPWM5SUrPtVOw2knl9sAjts=
X-Google-Smtp-Source: ABdhPJyE/vE98rSLn6CAlTyZ/h00944BqcHeMFxHemO6NH16Xd0J5xinrXDnhmkpVUncY2ZuCBRbefjNaM5K3+ZmHEQ=
X-Received: by 2002:a50:fb15:: with SMTP id d21mr1675636edq.150.1599116268940;
 Wed, 02 Sep 2020 23:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200901145535.GC587030@rowland.harvard.edu> <20200902000937.2204-1-tom.ty89@gmail.com>
 <20200902153008.GE624583@rowland.harvard.edu>
In-Reply-To: <20200902153008.GE624583@rowland.harvard.edu>
From:   Tom Yan <tom.ty89@gmail.com>
Date:   Thu, 3 Sep 2020 14:57:37 +0800
Message-ID: <CAGnHSE=4YNGTeoxQj+Hjy_EtRanhc-EEdiO_i8MRaLq1mKUCUw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] uas: bump hw_max_sectors to 2048 blocks for SS or
 faster drives
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        Arnd Bergmann <arnd@arndb.de>, cyrozap@gmail.com,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2 Sep 2020 at 23:30, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, Sep 02, 2020 at 08:09:36AM +0800, Tom Yan wrote:
> > There's no reason for uas to use a smaller value of max_sectors than
> > usb-storage.
> >
> > Also copying the dma max mapping size clamping from usb-storage.
> >
> > Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> > ---
> >  drivers/usb/storage/uas.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> > index 08f9296431e9..813c49914b9a 100644
> > --- a/drivers/usb/storage/uas.c
> > +++ b/drivers/usb/storage/uas.c
> > @@ -827,11 +827,6 @@ static int uas_slave_alloc(struct scsi_device *sdev)
> >        */
> >       blk_queue_update_dma_alignment(sdev->request_queue, (512 - 1));
> >
> > -     if (devinfo->flags & US_FL_MAX_SECTORS_64)
> > -             blk_queue_max_hw_sectors(sdev->request_queue, 64);
> > -     else if (devinfo->flags & US_FL_MAX_SECTORS_240)
> > -             blk_queue_max_hw_sectors(sdev->request_queue, 240);
> > -
> >       return 0;
> >  }
> >
> > @@ -839,6 +834,20 @@ static int uas_slave_configure(struct scsi_device *sdev)
> >  {
> >       struct uas_dev_info *devinfo = sdev->hostdata;
> >
> > +     struct us_data *us = host_to_us(sdev->host);
> > +     struct device *dev = us->pusb_dev->bus->sysdev;
>
> Yeah, this won't work.  The uas driver doesn't use struct us_data at
> all.  Instead you should have:
>
>         struct device *dev = devinfo->udev->bus->sysdev;
>
> except that now you probably don't need it.
>
> > +
> > +     if (devinfo->flags & US_FL_MAX_SECTORS_64)
> > +             blk_queue_max_hw_sectors(sdev->request_queue, 64);
> > +     else if (devinfo->flags & US_FL_MAX_SECTORS_240)
> > +             blk_queue_max_hw_sectors(sdev->request_queue, 240);
> > +     else if (us->pusb_dev->speed >= USB_SPEED_SUPER)
>
> Same thing here: devinfo->udev->speed.
>
> > +             blk_queue_max_hw_sectors(sdev->request_queue, 2048);
>
> Also, you might want to check before doing this.  If it would decrease
> the max_hw_sectors value, there's no point doing it.

It wouldn't. Current SCSI_DEFAULT_MAX_SECTORS (which is used for
"normal" uas drives) is 1024.

I'm not entirely sure if there's a point in doing more than that,
although BLK_DEF_MAX_SECTORS is 2560 (which originates from an odd
context: https://github.com/torvalds/linux/commit/d2be537c3ba3568acd79cd178327b842e60d035e).
It just seems odd to me that we do less for SS UAS drives anyway.
(Maybe it was never necessary to go up to 2048 for SS BOT drives, I
don't know.)

>
> > +
> > +     blk_queue_max_hw_sectors(sdev->request_queue,
> > +             min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
> > +                   dma_max_mapping_size(dev) >> SECTOR_SHIFT));
>
> And presumably this will be unnecessary.

It will still be. Whenever we change hw_max_sectors, it needs to be
clamped again afterwards, because the original clamping would be
invalidated.

>
> Alan Stern

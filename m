Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF84683205
	for <lists+linux-usb@lfdr.de>; Tue, 31 Jan 2023 16:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbjAaP7u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Jan 2023 10:59:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232009AbjAaP7t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Jan 2023 10:59:49 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45634E069
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 07:59:48 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id rm7-20020a17090b3ec700b0022c05558d22so14865021pjb.5
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 07:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=connectedcars.dk; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mjq3ycvzW+r8XyOXzsbiOu0Aq8niZyejQuvNArxzz1I=;
        b=m2In5rRtI50Xio7hNU+XLB+fY57Q23J/6zUiE1DghBdD7TjX8P+eixuGCifaakFB3m
         LevjZ6ngluOIHjEuxDDN30OZ9qUHFvN5IIZXY8E6Tht0fUUt1mG0NZKm7EBDW6jizkLM
         aiRFRHgeXKSuiySuo1xEEPrp6ppJG8XsJHwt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjq3ycvzW+r8XyOXzsbiOu0Aq8niZyejQuvNArxzz1I=;
        b=UqNCVHAPLZEEmfC6k1zYmIKK8Lg7LGHHeGM8sz1mfmT5/KjMZQybIrk7Y3hTCSzqO9
         r37E75qzdgy83nqIdmHMYMMEcxo+a32YhuI5KboiJivqPLbYFFXI5JGo7WT0LjcYvBrK
         q5BEkpFCu+bJI8wYZiDHiSkMlJ7ApmhDA4vECXQBHVhWinq6DkgsCp12WXn51Ifn5c7r
         m5TIGzn4c183yLyfA6VZq+z89tm2cYLG0BNw45JyHJULXQoxGpVHznP6aEUrpgAMNhh4
         +3wghvk11pA+rMEnrwY19OQyXW7VXUicx9WUzOIcBoqRSw4TRuSDs7zHj2RHFoH91SKL
         ssaw==
X-Gm-Message-State: AO0yUKXGnmwO4/s/fMdXw1XmPO6CJlX0/2zMCUO0nqA8vuPoALYVYtwm
        ath/pfle6oLvGcMzT8jFD0fuA+dZjxBfTtHbnIZ1VfAJdyoTFM0LVGM=
X-Google-Smtp-Source: AK7set9BiuARWWRBATbhdmTLq9YKcc9Wmi6cPbURNWQ+GRS9mKXkyn17Lqb7UaSpQ0WPrUEr2zXwmwu+v6lU1MPOJgA=
X-Received: by 2002:a17:902:bb88:b0:196:7eb6:8b25 with SMTP id
 m8-20020a170902bb8800b001967eb68b25mr1377237pls.15.1675180787626; Tue, 31 Jan
 2023 07:59:47 -0800 (PST)
MIME-Version: 1.0
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
 <Y9Jwv1ColWNwH4+0@kroah.com> <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
 <Y9J8VncWSJdVURgB@kroah.com> <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
 <Y9KnnH+5O6MtO6kz@rowland.harvard.edu> <CAHHqYPNtVkHoiX1LrxUDa32BgVsgymcPtKVODcVGxEh2f=tYRw@mail.gmail.com>
 <Y9P2tvPkdwHrbPXd@rowland.harvard.edu>
In-Reply-To: <Y9P2tvPkdwHrbPXd@rowland.harvard.edu>
From:   Troels Liebe Bentsen <troels@connectedcars.dk>
Date:   Tue, 31 Jan 2023 16:59:36 +0100
Message-ID: <CAHHqYPPWvxMvSU=HMS9C2aPk08j25MBKXS7XC6im5_oz_nXTuw@mail.gmail.com>
Subject: Re: All USB tools hang when one descriptor read fails and needs to timeout
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 27 Jan 2023 at 17:07, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, Jan 27, 2023 at 03:12:11PM +0100, Troels Liebe Bentsen wrote:
> > On Thu, 26 Jan 2023 at 17:17, Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Thu, Jan 26, 2023 at 02:59:35PM +0100, Troels Liebe Bentsen wrote:
> > > > It might be a special use case, for our automated hardware testing station
> > > > we know what goes into what port/hub so it would be nice to have an option
> > > > to lower the timeout in general or per hub or per port.
> > >
> > > There already is such an option.  It's named "early_stop" and it's
> > > described in Documentation/ABI/testing/sysfs-bus-usb.  You may not be
> > > aware of it because it was added after the 6.1 version of the kernel was
> > > released.
> >
> > Thanks, is it something that has to be enabled when compiling the kernel?
>
> No, it is always enabled.
>
> > Using Ubuntu mainline 6.1.4 and it does not seem to have this file in the
> > ports folder.
>
> Probably because it is still quite new.
>
> > > > Ahh, sorry I misunderstood but then it makes even less sense that the hub's
> > > > descriptors file blocks when the device hangs or am I missing something.
> > >
> > > Reading the file blocks because it has to be mutually exclusive with
> > > other parts of the kernel which can reallocate the buffers storing the
> > > descriptors.  This mutual exclusion is provided by a per-device lock,
> > > and for hubs this device lock is held while a child device is being
> > > probed.
> > >
> > I guess the reasoning for also holding a lock for the hubs is that there is some
> > accounting on the hub for the children. But the hub's descriptors file won't
> > change because a child device got enumerated right?
>
> That's true, and in principle a separate lock could be used.  But there
> never seemed to be any need for adding a second lock.  Until now.
>
> > Also if I understand it correctly based on your second email both the parsed
> > sysfs files(fx idProduct, idVendor, etc.) and the descriptors file won't change
> > for the lifetime of the hub. It's just that the descriptors file is backed by
> > buffers that need to be locked because they can be reallocated by the kernel.
>
> The files that export data from the device descriptor (idProduct etc.)
> might change during a device's lifetime, but the buffer they read from
> won't get reallocated.
>
> However, now that I look more closely I see that the buffers for the
> config descriptors won't get reallocated either!  Evidently this was
> changed back in 2014 by commit e50a322e5177 ("usb: Do not re-read
> descriptors for wired devices in usb_authorize_device()"), but nobody
> realized at the time that the locking for the descriptors sysfs could
> then be relaxed.
>
> > Why not store the descriptors file the same way as the parsed sysfs files,
> > etc. it seems fairly small and I guess it contains the same data that is found
> > in the sysfs folder for the hub?
>
> The buffer holding the device descriptor is fixed size, since all device
> descriptors are always 18 bytes long.  The configuration and interface
> descriptors are variable length, so their buffers have to be allocated
> on-the-fly.
>
> > I don't know how much work it would be to try to avoid locking the hub or if
> > it even makes sense. So maybe it would be better if we spent time trying to
> > workaround this in userspace, fx. by getting libusb to open the descriptors
> > file in non-blocking mode and falling back to reading the individual files in
> > sysfs if we get an EAGAIN. Would there be anything wrong with that
> > approach?
>
> Now that I know the config descriptors won't get reallocated after all,
> I can remove the locking from the descriptors file entirely.  A patch to
> do this is below.  It ought to fix your problem.  Try it and see.

Thank you very much, I built a new kernel with the patch and can confirm
that it fixes my issue.

Will the patch make it into any of the LTS kernels as it could seem like a
bugfix depending on how you look at it or is it only destined mainline, fx. 6.2
or 6.3?

>
> > Also in general thanks for the quick and detailed responses, it's a
> > pleasure writing on this mailing list.
>
> You're welcome.
>
> Alan Stern
>
>
>
> Index: usb-devel/drivers/usb/core/sysfs.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/sysfs.c
> +++ usb-devel/drivers/usb/core/sysfs.c
> @@ -869,11 +869,7 @@ read_descriptors(struct file *filp, stru
>         size_t srclen, n;
>         int cfgno;
>         void *src;
> -       int retval;
>
> -       retval = usb_lock_device_interruptible(udev);
> -       if (retval < 0)
> -               return -EINTR;
>         /* The binary attribute begins with the device descriptor.
>          * Following that are the raw descriptor entries for all the
>          * configurations (config plus subsidiary descriptors).
> @@ -898,7 +894,6 @@ read_descriptors(struct file *filp, stru
>                         off -= srclen;
>                 }
>         }
> -       usb_unlock_device(udev);
>         return count - nleft;
>  }
>
>

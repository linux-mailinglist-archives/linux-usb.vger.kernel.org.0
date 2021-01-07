Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7484C2ECD57
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jan 2021 10:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbhAGJwc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 04:52:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727353AbhAGJvm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jan 2021 04:51:42 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6AEC0612F9
        for <linux-usb@vger.kernel.org>; Thu,  7 Jan 2021 01:51:05 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id v126so4929181qkd.11
        for <linux-usb@vger.kernel.org>; Thu, 07 Jan 2021 01:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d5fb1hMn9hWlLGl5AFUhw7+QNqYR0IEfWwZ/cw7MuPI=;
        b=eiPUhaIuhBQm16VYQOXTp37xy4kP6bWufPGP7iUhYVOm5YG9RAyRekOxLHm2fIfVjg
         zgnfvPrAYCumeX50DEYeAPhnIJ0pqdqRHcvnx0tFGM9UWhhPQA03x/ZJ2JPiAL8rt8bG
         c9F+xq9CQEUloyCQcP6NW3T0l0apPkCXsqWTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d5fb1hMn9hWlLGl5AFUhw7+QNqYR0IEfWwZ/cw7MuPI=;
        b=exWFI1hbfzXyvZflth1YOU48a2uLtSNXS7qM7J/5ON27oSXf3XAyAFIE0GkDchX0aK
         JkJR2yMIlasJT6Ey6U23aCtx8VDLU13vb8Fv0rqwNrWYILGN8XVGFrmKZ+H94N7yL1Ah
         /ZiSIeOwtGVXq6/HNTiTioc0YGhz3cnY4XGfgUgN/0d7iJQmYxAYCm3JePBd7OiNJiRN
         xur9URH+4bWpBf2cPHEkjKXTkxmQ0A5tzYP7FmDq5+25Ut4BDCv6V1HT6P1YnbpgBXNt
         +PuLtdj5jT27s1IVWaYwZ14vWu/jxT6+UB9XNSHVwRrYIfQSN9PIXjvaS4tBBfcrjNRa
         8tXw==
X-Gm-Message-State: AOAM532SQ9rUjivyvCSpCHZ7HYFwsLuTNSQmDvrWQ2I6VPL9ghoFlnXG
        bmMIyhr+vHVA78cqrjIwBcxSkyKDpOYqWLWbJYNUoQ==
X-Google-Smtp-Source: ABdhPJyYIoIvWLG+rgf9qx0vOjomzvczhlgKeXwNK4TmWVyx01JLUFGD9kYqnv+Saw5oCeEuTJrUcGSGj1JUeeBSpy8=
X-Received: by 2002:a37:8fc3:: with SMTP id r186mr8245925qkd.228.1610013064877;
 Thu, 07 Jan 2021 01:51:04 -0800 (PST)
MIME-Version: 1.0
References: <20210107034904.4112029-1-pmalani@chromium.org> <X/bRstJuBYaLz4PK@kroah.com>
In-Reply-To: <X/bRstJuBYaLz4PK@kroah.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Thu, 7 Jan 2021 01:50:53 -0800
Message-ID: <CACeCKaediXs81OUTogTWrqoZViP5rLqodO6nngeY2PLnWw=t+w@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: Send uevent for num_altmodes update
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Thanks for taking a look at the patch.

On Thu, Jan 7, 2021 at 1:16 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 06, 2021 at 07:49:04PM -0800, Prashant Malani wrote:
> > Generate a change uevent when the "number_of_alternate_modes" sysfs file
> > for partners and plugs is updated by a port driver.
> >
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: Benson Leung <bleung@chromium.org>
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >  drivers/usb/typec/class.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index ebfd3113a9a8..8f77669f9cf4 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -766,6 +766,7 @@ int typec_partner_set_num_altmodes(struct typec_partner *partner, int num_altmod
> >               return ret;
> >
> >       sysfs_notify(&partner->dev.kobj, NULL, "number_of_alternate_modes");
> > +     kobject_uevent(&partner->dev.kobj, KOBJ_CHANGE);
>
> Shouldn't the sysfs_notify() handle the "something has changed" logic
> good enough for userspace, as obviously someone is polling on the thing
> (otherwise we wouldn't be calling sysfs_notify...)
>
> The kobject itself hasn't "changed", but rather an individual attribute
> has changed.  We don't want to create uevents for every individual sysfs
> attribute changing values, do we?

Fair point. I noticed other attributes in this source file use a
similar approach (sysfs_notify + kobject_uevent)
and took guidance from there in an attempt to remain consistent
(though, of course, your point still stands).

I'm guessing it is for processes that rely on udev events
(subsystem=typec) rather than polling.

>
> What is preventing a normal "monitor the sysfs file" logic from working
> here for anyone who wants to know that the alternate modes have changed?

One limitation I can think of is that this sysfs file is hidden till
it has a valid value (i.e >= 0), so a user-space process might not
be able to poll on the file till it is visible (I suppose even then
one could poll on the parent).

Kindly disregard the patch if you reckon it is unnecessary.

Best regards,

-Prashant

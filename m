Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E350768F902
	for <lists+linux-usb@lfdr.de>; Wed,  8 Feb 2023 21:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbjBHUqP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 15:46:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232215AbjBHUqO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 15:46:14 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58802B084
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 12:46:12 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id v3so764579pfn.6
        for <linux-usb@vger.kernel.org>; Wed, 08 Feb 2023 12:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=connectedcars.dk; s=google; t=1675889172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PcXoREPZZrSUkrNsdExtkkKISmSBSw6vmWzxBDUyoWU=;
        b=b4D0mD9yFZx5989NW4wT0Ats4BeRmh9PGkdgln6aYDKv7+naYGwi8OpzTU+Ohc432G
         AFW0+rFfVfZv+Bzgw11YFHtmD7eYf5j5lm47zjyFtugM+igveSPcKUTyEuaRYK0PP+1N
         eRgM0N3oy6e6g0xf0l447KMoKPPg5j3DrqBwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1675889172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcXoREPZZrSUkrNsdExtkkKISmSBSw6vmWzxBDUyoWU=;
        b=Uk1qyFKmMlCG9n9h9VrnbE3sZAng7y1AiZ13VEcECg++3DUZzNUnPVeIqLl/XKcWqi
         1FDLDCkQvlNr8WfCTynA/5Tovm5NALl4tPWRvp+nZbwDndDG85tznFzMBq+6f57Ny1I4
         eP0vKurVkc75TMBzRGLRmmfY69TXRarFXOIEVvwABbkliVOCk9hdQokcOkk8Bhx/yBCR
         Neg8U/I96ixhEkHhPq13joz0LUL+rqTblVgwcj2iT9vxN8rCq7mfgPeYnhspjOnlQ7xN
         03gJTLEIaDbfaS/i9MHoY1hVBiDLYEpb8qrSYGfTOfJbNdqVK1HSIf9Y4ecm7Fhsl5jW
         muFA==
X-Gm-Message-State: AO0yUKW08LO/YLwgKIuYfHYeNSPRBZD+LDO5IgyK0Q4vgciYPXclTMRj
        PSDQUbYuwY+e6/05EYfXEFIgcY0HJV4GM4pCmm0WY72KpzsnsGXlGK4=
X-Google-Smtp-Source: AK7set+nyW27NRfiswVEc3Me2LdP+fxDB2FzPFtDaiyNDyT8eNT3QpYz4t8l0aNrBp/M4LqliG3UsWvfsEsDRNNAlAM=
X-Received: by 2002:a62:30c4:0:b0:5a1:c313:3d2f with SMTP id
 w187-20020a6230c4000000b005a1c3133d2fmr1877115pfw.15.1675889172292; Wed, 08
 Feb 2023 12:46:12 -0800 (PST)
MIME-Version: 1.0
References: <Y9J8VncWSJdVURgB@kroah.com> <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
 <Y9KnnH+5O6MtO6kz@rowland.harvard.edu> <CAHHqYPNtVkHoiX1LrxUDa32BgVsgymcPtKVODcVGxEh2f=tYRw@mail.gmail.com>
 <Y9P2tvPkdwHrbPXd@rowland.harvard.edu> <CAHHqYPPWvxMvSU=HMS9C2aPk08j25MBKXS7XC6im5_oz_nXTuw@mail.gmail.com>
 <Y9l85PAcc/i/tgnS@rowland.harvard.edu> <Y9mAYH7L/CcTTSw6@kroah.com>
 <CAHHqYPOkj3oJseEwD3=66zck1LGJGo3DD77cG0E8_GNp3EEDUw@mail.gmail.com>
 <Y+KP0N73jE3PJVZ4@rowland.harvard.edu> <Y+PSQIiE5nhCZfoy@rowland.harvard.edu>
In-Reply-To: <Y+PSQIiE5nhCZfoy@rowland.harvard.edu>
From:   Troels Liebe Bentsen <troels@connectedcars.dk>
Date:   Wed, 8 Feb 2023 21:46:01 +0100
Message-ID: <CAHHqYPM6qb5iXqYYuru_MQDT6J+aMFyY9t+3tvzMeEw_Y1-wvA@mail.gmail.com>
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

On Wed, 8 Feb 2023 at 17:48, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, Feb 07, 2023 at 12:52:16PM -0500, Alan Stern wrote:
> > On Tue, Feb 07, 2023 at 09:25:55AM +0100, Troels Liebe Bentsen wrote:
> > > Hi again,
> > >
> > > Did a bit more testing and found another lock that would be nice to remove,
> > > the /dev/bus/usb/$BUS/$DEV file for the hub is also locked:
> > >
> > > Bus 003 Device 016: ID 1a40:0201 Terminus Technology Inc. FE 2.1 7-port Hub
> > >
> > > strace lsusb -v
> > > ...
> > > openat(AT_FDCWD, "/dev/bus/usb/003/016", O_RDWR|O_CLOEXEC...
> > >
> > > The openat can not be canceled from userspace and even kill -9 won't stop
> > > the process until the descriptor read times out.
> >
> > Yes, that really should be an interruptible lock.  In fact, all the
> > locks connected with usbfs should be interruptible.
> >
> > However, it can't be eliminated entirely.  This is a case where two
> > things end up being mutually exclusive with each other because they both
> > need to be mutually exclusive with a third thing.  In other words,
> > opening a hub's usbfs file and probing a hub's children both have to be
> > mutually exclusive with disconnecting the hub.  The three pathways all
> > use the device lock for this purpose, so they are all mutually exclusive
> > with each other.
> >
> > > Also managed to get "lsusb -v" to hang in an unkillable way even after
> > > I unplugged the device and hub:
> > >
> > > ) = 1 ([{fd=5, revents=POLLIN}])
> > > ioctl(8, USBDEVFS_DISCARDURB
> >
> > Making these lock calls interruptible should fix this problem, right?
>
> Here's a patch.  It should fix most of these problems.
>
> Alan Stern
>
Thanks, it will give the patches a try.

But I guess it still means that "lsusb -v" or other tools that try to
read the hub's usbfs file will block until the child device's descriptor read
has timed out as something in that code path takes the hub's device lock.

I tried following the code path up from the read descriptors error and it
looks like locking is done on port level with usb_lock_port until we hit
hub_event where usb_lock_device(hdev) is taken, being new to this
code base I'm not sure it's the same mutex we locked on in
read_descriptors, but do we need to hold it until the end of the
function or is the hub device lock taken somewhere else?

As a little side note we found a rather ugly workaround where we cp
the sysfs read by libusb to /tmp and bind mount them back to sysfs
and remove the read permission from the hubs usbfs file, this
effectively means our testing software won't get disturbed by
descriptor read timeouts happening on other ports.

The way we get the device out of the broken state is by power
cycling it rapidly until it boots up in flashing mode, it normally takes a
couple of seconds and after that we can remove the flashing
pins that cause it to sometimes go into the broken state.

Regards Troels
>
> Index: usb-devel/drivers/usb/core/devio.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/devio.c
> +++ usb-devel/drivers/usb/core/devio.c
> @@ -303,13 +303,15 @@ static ssize_t usbdev_read(struct file *
>  {
>         struct usb_dev_state *ps = file->private_data;
>         struct usb_device *dev = ps->dev;
> -       ssize_t ret = 0;
> +       ssize_t ret;
>         unsigned len;
>         loff_t pos;
>         int i;
>
>         pos = *ppos;
> -       usb_lock_device(dev);
> +       ret = usb_lock_device_interruptible(dev);
> +       if (ret < 0)
> +               return ret;
>         if (!connected(ps)) {
>                 ret = -ENODEV;
>                 goto err;
> @@ -1039,7 +1041,9 @@ static int usbdev_open(struct inode *ino
>         if (!dev)
>                 goto out_free_ps;
>
> -       usb_lock_device(dev);
> +       ret = usb_lock_device_interruptible(dev);
> +       if (ret < 0)
> +               goto out_put_device;
>         if (dev->state == USB_STATE_NOTATTACHED)
>                 goto out_unlock_device;
>
> @@ -1071,6 +1075,7 @@ static int usbdev_open(struct inode *ino
>
>   out_unlock_device:
>         usb_unlock_device(dev);
> + out_put_device:
>         usb_put_dev(dev);
>   out_free_ps:
>         kfree(ps);
> @@ -2591,14 +2596,17 @@ static long usbdev_do_ioctl(struct file
>         struct usb_dev_state *ps = file->private_data;
>         struct inode *inode = file_inode(file);
>         struct usb_device *dev = ps->dev;
> -       int ret = -ENOTTY;
> +       int ret;
>
>         if (!(file->f_mode & FMODE_WRITE))
>                 return -EPERM;
>
> -       usb_lock_device(dev);
> +       ret = usb_lock_device_interruptible(dev);
> +       if (ret < 0)
> +               return ret;
>
>         /* Reap operations are allowed even after disconnection */
> +       ret = -ENOTTY;
>         switch (cmd) {
>         case USBDEVFS_REAPURB:
>                 snoop(&dev->dev, "%s: REAPURB\n", __func__);
>

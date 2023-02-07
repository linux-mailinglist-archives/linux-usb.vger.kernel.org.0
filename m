Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36BD268D17D
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 09:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbjBGIeJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 03:34:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbjBGIeI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 03:34:08 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB62F2E80A
        for <linux-usb@vger.kernel.org>; Tue,  7 Feb 2023 00:34:06 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id g13so10107899ple.10
        for <linux-usb@vger.kernel.org>; Tue, 07 Feb 2023 00:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=connectedcars.dk; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uu/CEVeRemmyPoITJCRwWswH57KzgHvqBIxWLqX1GCM=;
        b=Wr8sMnnoK3LR1oPojmYKiWFuPX70/oPpsv8lBZK6E2KpnfRBL/b9PqqQ6tUPfPSkMD
         GRXnQkVYSe89Vk2nKudvm3d/oVI67kdyglzifJF99IbtxgQh9WXOVqj7jhxYy7j3CNIk
         mXHryRdt5/QE09Hn7hm0bRw77Edy6hIcvWl2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uu/CEVeRemmyPoITJCRwWswH57KzgHvqBIxWLqX1GCM=;
        b=jB7ch0URwKnS8KZTekYXbivdZp689r/EVh5887mtHSx45TC/SX/CeFMc2Y7PaEMmFS
         hYu9Ou7bjOK0Sf/lPrNXtXBcDLQAbGLV7A6InN0xE/xWqJsWy/cve0hvnAhI7j65JAo1
         GzY8VE7KvQEyT0arNMpZ121bzUeIca68LRPH1VjwRXVZJQ4TjNdLhiPVZhj/bJHr26a0
         elWqduChkg0MuE+JIdbo+P8zI03g95Cz+MkwyFrkOCA2D7jYYRn0AKUWF6tNuVW0Ptfa
         hQpz1TrnyOflaDalsRiTSQ5ceGDJ2R6B/SuSnKPVDQuXUQeSkjv93Bi6Dyrtoyq47whV
         eMhw==
X-Gm-Message-State: AO0yUKWS66fis7/hsw5t2tFgQ9nd/0DXjUxzejJRVT515NltoSP6vWnB
        1jG7XOBeqiq1+mEowI57+mdn/aYH+OYzAsuj2VbrATDVT+tFMAcWzfM=
X-Google-Smtp-Source: AK7set8CyjrP7rw8N+CmX/WlEmHxvAkQUHxAP0fX15mzlGsuf2gdi6xTzvIP4JpBiHNUWosnU1SkRPbAKJniMMDGvMU=
X-Received: by 2002:a17:90a:c504:b0:22b:fdac:6e02 with SMTP id
 k4-20020a17090ac50400b0022bfdac6e02mr3908411pjt.133.1675758846400; Tue, 07
 Feb 2023 00:34:06 -0800 (PST)
MIME-Version: 1.0
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
 <Y9Jwv1ColWNwH4+0@kroah.com> <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
 <Y9J8VncWSJdVURgB@kroah.com> <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
 <Y9KnnH+5O6MtO6kz@rowland.harvard.edu> <CAHHqYPNtVkHoiX1LrxUDa32BgVsgymcPtKVODcVGxEh2f=tYRw@mail.gmail.com>
 <Y9P2tvPkdwHrbPXd@rowland.harvard.edu> <CAHHqYPPWvxMvSU=HMS9C2aPk08j25MBKXS7XC6im5_oz_nXTuw@mail.gmail.com>
 <Y9l85PAcc/i/tgnS@rowland.harvard.edu> <Y9mAYH7L/CcTTSw6@kroah.com> <CAHHqYPOkj3oJseEwD3=66zck1LGJGo3DD77cG0E8_GNp3EEDUw@mail.gmail.com>
In-Reply-To: <CAHHqYPOkj3oJseEwD3=66zck1LGJGo3DD77cG0E8_GNp3EEDUw@mail.gmail.com>
From:   Troels Liebe Bentsen <troels@connectedcars.dk>
Date:   Tue, 7 Feb 2023 09:33:55 +0100
Message-ID: <CAHHqYPOkBbN+ymdwPASwwHzQxV4vghM2DgWAdb7hqCFnaRsh0w@mail.gmail.com>
Subject: Re: All USB tools hang when one descriptor read fails and needs to timeout
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Also managed to get "lsusb -v" to hang in an unkillable way even after
I unplugged the device and hub:

) = 1 ([{fd=5, revents=POLLIN}])
ioctl(8, USBDEVFS_DISCARDURB

Regards Troels

On Tue, 7 Feb 2023 at 09:25, Troels Liebe Bentsen
<troels@connectedcars.dk> wrote:
>
> Hi again,
>
> Did a bit more testing and found another lock that would be nice to remove,
> the /dev/bus/usb/$BUS/$DEV file for the hub is also locked:
>
> Bus 003 Device 016: ID 1a40:0201 Terminus Technology Inc. FE 2.1 7-port Hub
>
> strace lsusb -v
> ...
> openat(AT_FDCWD, "/dev/bus/usb/003/016", O_RDWR|O_CLOEXEC...
>
> The openat can not be canceled from userspace and even kill -9 won't stop
> the process until the descriptor read times out.
>
> Regards Troels
>
> On Tue, 31 Jan 2023 at 21:56, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jan 31, 2023 at 03:41:08PM -0500, Alan Stern wrote:
> > > On Tue, Jan 31, 2023 at 04:59:36PM +0100, Troels Liebe Bentsen wrote:
> > > > On Fri, 27 Jan 2023 at 17:07, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > > Now that I know the config descriptors won't get reallocated after all,
> > > > > I can remove the locking from the descriptors file entirely.  A patch to
> > > > > do this is below.  It ought to fix your problem.  Try it and see.
> > > >
> > > > Thank you very much, I built a new kernel with the patch and can confirm
> > > > that it fixes my issue.
> > > >
> > > > Will the patch make it into any of the LTS kernels as it could seem like a
> > > > bugfix depending on how you look at it or is it only destined mainline, fx. 6.2
> > > > or 6.3?
> > >
> > > I don't know.  I will submit it for the -stable kernels, but the
> > > decision on whether to accept it will be up to Greg KH.
> >
> > I'll backport it, as it can help out with systems as Troels said.  But
> > will wait until 6.3-rc1 is out as this should get some testing.
> >
> > thanks,
> >
> > greg k-h

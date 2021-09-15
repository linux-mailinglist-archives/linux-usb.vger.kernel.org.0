Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3D940C7BF
	for <lists+linux-usb@lfdr.de>; Wed, 15 Sep 2021 16:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237109AbhIOO4R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Sep 2021 10:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbhIOO4Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Sep 2021 10:56:16 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A77C061574
        for <linux-usb@vger.kernel.org>; Wed, 15 Sep 2021 07:54:57 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id v20-20020a4a2554000000b0028f8cc17378so992634ooe.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Sep 2021 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AXnoUZnX9K8Jhtgp+DkwEDwJ5ZLLpWofUK2pY6hDpAM=;
        b=LA7FPzs6pR84FmZNffrKtaJHU2md8KIPc7XAnKxXa+LpD6K0n0DBqCxCfLov688Pzc
         6xnlrcEH7LCJ8CXu9KLpQwLOviDdT1TLZspcF2xROvUwzg7V3YR0R+NzAAPG9WWrgbX6
         daV+xOgUwUXAfnsjqTJ0Tg2zPbv27hEOEi7+wV+5H0N+jLR4fJybXTF5xtmWQqjgADNz
         F0p0H6AtZl1GeJ0TRxDKKfXh7pUxA5OLLqCxzeNDj4G5o2hXhEs/JYkPv/ZVJJDv9fXh
         twrE98dGFWP8G5cDcWN2FWSzt5r4cvZgyapKB+1sG4/QqwizCs9O0CC9EHGLNhYWoJqp
         I4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AXnoUZnX9K8Jhtgp+DkwEDwJ5ZLLpWofUK2pY6hDpAM=;
        b=asjN+2ZmdKhvzm2yIdtgBudzxUuWA1CSexFJWtBA9PHz4vwOGsFZSoeaRpUz93EWty
         FSZebrsQGRV5CCuCay7NR2VhPtcuC3kZ1cSOvyYtdlGFTAtf/kEeOJ/MYQDY4uCGinS4
         Uid6HiGF3K0JlixdwTCpSkmtg8bydw+zoA+Hcek9W+0ga2DKk/wOJkyOt2Sij9jGmu0q
         3nmONUFTPqR5w+y7MKFJc+qT4b+03hLyTPitzsk6y0hEhUTT99JryvBEzpuljK0ooeiS
         ZGlycordIKSVHo3NA8ETSG4Q3nDlWpvndAUUIybUtmoFWZ0tgjMiDEECWDZtD1UEe1Fz
         p8/A==
X-Gm-Message-State: AOAM5326VLdgPpEc4+U/op38AYJ1SO4qbgcLS1ldinWRfFsMOwY1DHoH
        pSXmW1WNIHYTaQx/hC+OkpO9CFrD14hOWf0lyVcH9v1U8fE=
X-Google-Smtp-Source: ABdhPJzpZFdn092oNsC+zvyL8CJ0KIPVW8cpKj2vPvv3a2v2btOeLYqKZxc9SEuJLvXQVGdE9YkMPXLa1kz4gRUEOGI=
X-Received: by 2002:a4a:a40c:: with SMTP id v12mr166613ool.72.1631717697088;
 Wed, 15 Sep 2021 07:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAHP4M8Vc+0eChmJDnLLa3ibuzGLOnc5hJ1Nk09794RHEJ7tEPw@mail.gmail.com>
 <CE84D77A-93F8-43B2-A952-896D6BED2E6D@msweet.org> <CAHP4M8VYhUDzvXO35=urBsz0suTA+0eMQ34f6-v9D0zE9fvDgQ@mail.gmail.com>
In-Reply-To: <CAHP4M8VYhUDzvXO35=urBsz0suTA+0eMQ34f6-v9D0zE9fvDgQ@mail.gmail.com>
From:   Ajay Garg <ajaygargnsit@gmail.com>
Date:   Wed, 15 Sep 2021 20:24:44 +0530
Message-ID: <CAHP4M8VEiYLJQEFHpz8jSQOXYpwCw=bBUbYQ7mT5+A+P+xs2+w@mail.gmail.com>
Subject: Re: How to register a new "function" in configfs?
To:     Michael Sweet <msweet@msweet.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Any pointers, please?

On Sat, Sep 11, 2021 at 8:28 PM Ajay Garg <ajaygargnsit@gmail.com> wrote:
>
> Hi Michael,
>
> Thanks for the reply.
>
> I am a bit of old-school, and would prefer things in one place only
> (in the kernel) :)
> Thus :
>
> a)
> I wish to have all the endpoints configuration/management in the
> kernel only (like done in drivers/usb/gadget/function/f_serial.c,
> drivers/usb/gadget/function/u_serial.c).
>
> b)
> Only the attributes like vendorId/productId would be in configfs, to
> help setup the device.
>
> c)
> No user-space management of kernel objects.
>
>
> Either-way, I think that my issue of "function exposure" would remain
> the same, irrespective of whether we use configfs for managing the
> kernel-objects (please correct me if I am wrong).
>
>
> Thanks again for your time, look forward to listening back !
>
>
> Thanks and Regards,
> Ajay
>
> On Sat, Sep 11, 2021 at 8:01 PM Michael Sweet <msweet@msweet.org> wrote:
> >
> > Ajay,
> >
> > Quick question (as someone who has been down this road), do you need to=
 do a kernel driver or could you just use the functionfs support to impleme=
nt everything in userspace?  I found that path to be much easier and less e=
rror-prone (and one of these days I'm going to be contributing some documen=
tation changes to make some things clearer...) and I was able to get my IPP=
-USB implementation up and running very quickly.
> >
> >
> > > On Sep 11, 2021, at 1:43 AM, Ajay Garg <ajaygargnsit@gmail.com> wrote=
:
> > >
> > > Hi All.
> > >
> > > As a first step, I have been able to load a gadget on configfs, which
> > > binds to the function "gser" (thus loading up the usb_f_serial module
> > > when the gadget mounts). Things work well till here.
> > >
> > > Now, I have written a brand-new gadget-side device-driver, trying to
> > > create a new function "gusb", via DECLARE_USB_FUNCTION_INIT.
> > > However, now when I try to load the gadget for binding to "gusb", I
> > > get the error that the function cannot be found.
> > >
> > > Seems that firing up a new gadget-side driver, that registers a new
> > > function via DECLARE_USB_FUNCTION_INIT, is not enough to make the new
> > > function visible across the kernel.
> > >
> > > Kindly let know what I am missing.
> > > Will be grateful for pointers.
> > >
> > >
> > > Thanks and Regards,
> > > Ajay
> > >
> >
> > ________________________
> > Michael Sweet
> >
> >
> >

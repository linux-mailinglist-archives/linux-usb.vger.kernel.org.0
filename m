Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104992F2A36
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 09:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388563AbhALInw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 03:43:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387596AbhALInw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jan 2021 03:43:52 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D926C061786
        for <linux-usb@vger.kernel.org>; Tue, 12 Jan 2021 00:43:11 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id s26so2121498lfc.8
        for <linux-usb@vger.kernel.org>; Tue, 12 Jan 2021 00:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BxyNxMHElMXOOAgVPBeBSDS8pCNJP4Z5xG4TnIqGoYM=;
        b=JTQn+69sWYbhlKXZv3X4eZttY+X92QD+ZoyXuq4kWEGkHo/fyDd8HHd2PISdfK0Z1a
         MS/8FlL/xK8/fKHiDZa+zanBmmabQPFO2Dn51PewF0nLHo1ef0aDwE1tMISAqQ8QVJr/
         TjMg9cVbtURCRqXh/DmEc6XU9LrUJP2iW/L342RKuROqfW6fTdk4iWhUTJqY+B1dsd4c
         5JS58vNZBs3XRhfzNMV7c1wnwmO/1IlgVfBxWwL+B0nCQaFfghLKe5nZLVpaHcdNk9HP
         poHzrqV8ioa4A6LNQ+U2a+bdmai4+mfKUAveusYbvYWfqNnS47IE30icLf1Ihty92q/N
         3ULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BxyNxMHElMXOOAgVPBeBSDS8pCNJP4Z5xG4TnIqGoYM=;
        b=TBmDBooCgQyG8FU8i6tmandBVp+7RwSs7pvdIfPRmssFY6Fy1s5sc43pxStUgLCA70
         9fcy4z/8nchW/pYBRsT01EgjQUHieS+EshgjRCIN1UbtzDaUFQ8H8EJdX4lLMMtuz9Z6
         TwZvsZyAPZ8DlqJny9xcj8PqUCvArBSn1Y0wJWt0tsjk97HAhjuCzRMb10WWBB7Au/+9
         Z34+kOTSrXp4ldrrGvnUOi4c9KlX4Kts+5MgiP8WWCXFG1Lwaf940aWA0Err+lCgzKWT
         waY9syqW9ApiSC1CcbChHhzG0yJ/todrk1q1tMTnS8CcHa0mx0kNRFrhG7vA01oqkenB
         5zig==
X-Gm-Message-State: AOAM530Affb9+tEAWMjGTPiqUBxvp1qqt4IhG6d6LYiVq7OdxgPf5+T3
        /rh8EGqw2LtTcfulZp3Tp9PD5nG8+HcELl3ftbM=
X-Google-Smtp-Source: ABdhPJxg5i6Fw58/40Ny+C4udV5p6vdZtvz/0P6V0ljEK8NYpM0rGdZjCIukVcc0w0qq3Muvo+tLG6AB1knYVRAsLi0=
X-Received: by 2002:ac2:434a:: with SMTP id o10mr1623588lfl.247.1610440990002;
 Tue, 12 Jan 2021 00:43:10 -0800 (PST)
MIME-Version: 1.0
References: <CAMeQTsacNs-YVWeX6vFJyMBLeD_AX6imNQRodV_X-QS54wAREA@mail.gmail.com>
 <X/y1ekqBrjXK8lZO@kroah.com> <CAMeQTsaL0mx=WW2Ekr2gh_aCWKnumS4mSr5tTH_ac+cdarzxMA@mail.gmail.com>
 <CAOGqxeUkZ8VK-D3xutVvQk7e2t1=9GzLQL7oHz0GTj_FMdVeqw@mail.gmail.com>
In-Reply-To: <CAOGqxeUkZ8VK-D3xutVvQk7e2t1=9GzLQL7oHz0GTj_FMdVeqw@mail.gmail.com>
From:   Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Tue, 12 Jan 2021 09:42:58 +0100
Message-ID: <CAMeQTsZA7a9WcJq2tudWhaJbc6Z4vb4jtcUnHOCzg9u3oLxzbw@mail.gmail.com>
Subject: Re: Conflicting PCI ID in bdc driver
To:     Alan Cooper <alcooperx@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 12, 2021 at 2:06 AM Alan Cooper <alcooperx@gmail.com> wrote:
>
> This driver was written for a PCI FPGA development board used to
> verify the controller logic and to help with driver development before
> adding the logic to our SoC's. I'm not sure why the driver was pushed
> upstream but I'd like to remove it. I'm checking with a few other
> groups to make sure I'm not missing anything.

That would solve my problem. Is removing a driver acceptable for
stable submission? If not, it would be helpful to have a patch
suitable for stable that disables the driver before removal. I'm
somewhat tired of explaining to people how to blacklist bdc.

>
> Thanks
> Al
>
>
> On Mon, Jan 11, 2021 at 5:02 PM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
> >
> > On Mon, Jan 11, 2021 at 9:29 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Jan 11, 2021 at 08:34:01PM +0100, Patrik Jakobsson wrote:
> > > > Hi Al,
> > > > The PCI device ID of 0x1570 in the bdc driver (bdc_pci.c) is
> > > > conflicting with the Apple FacetimeHD webcam [1]. Is this caused by an
> > > > incorrect ID in the bdc driver or are there actually two devices with
> > > > the same ID in the wild? If we have a real conflict, how would we go
> > > > about solving this?
> > >
> > > Looks like someone at broadcom messed up :(
> > >
> > > Can you look for any other fields in the device other than just the
> > > vendor/device ids to verify that this really is a webcam so you can not
> > > bind to the same thing this driver wants to bind to?
> >
> > Right, we could check the class. But I suppose it must be fixed in
> > both drivers? bdc must not bind to the webcam and facetimehd must not
> > bind to the UDC. So which class is bdc reporting?
> > PCI_CLASS_SERIAL_USB_DEVICE?
> >
> > >
> > > thanks,
> > >
> > > greg k-h

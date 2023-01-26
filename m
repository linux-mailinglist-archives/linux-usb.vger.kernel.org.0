Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4665267D02A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 16:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbjAZP07 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 10:26:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbjAZP05 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 10:26:57 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B7D6A58
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 07:26:39 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id d10so1230573pgm.13
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 07:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=connectedcars.dk; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LoCCSwjV5JGT5vnEAKl4rfjVlRzbba59WLoTHaIVaFw=;
        b=OVbbL56Q2+zDJ85KKeLZ9oXkLtSwphlyCCRyfY7FYObGCr/3IhAFj5SXL8iHBzhinX
         zbJpqg7OSWKFiTgdkI5Npq8kvIeF4zcgHk5pUCRpBkZ59Z4i42a+VxOYv1gBcUgO12ws
         J0LC3UmNCBndBnjm3ObZLppoDMIe0S2kvvlKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoCCSwjV5JGT5vnEAKl4rfjVlRzbba59WLoTHaIVaFw=;
        b=EeWRvt+9fFKOG50tNwbKOH1GCJ7qY1KpMOxvGxpwb+qCUUSXFoqFxfkZ2ahK6zn66C
         PeBIhLB6KzUE5H8MD8ozPnEz9Eko/79fR9DtGs39xtQa1jVcW3jmIM2zQ7bF7z3j4udv
         HyfElmzYtXqhpO+eTZ4YJOq1a2hR7f9uHWxMaYWoThLPPLtt9a2q+YpyJr7J7DEnzlSp
         qDMd+uAkc/Bx9je1/Qjf3i2fn0IzXssodCInKq6TdwqS1JbDXaJoM3cVQGEJRqOYKTle
         rFsaTn4Ff2RiKgAqM3efyfpVP4GXmYgUmzJYlEK1E11WJ9tMP/rAaiuXce+fXepvDsDo
         m8Rg==
X-Gm-Message-State: AFqh2kq5iSuqwS99sGBTyYdE3eYCMuldAPTy0iTGxUQrmZ/yn7y9r81x
        HVTahxhPIQf7yIXnnnzDZFh5MOQeU6khQNyqci7BBwQJDAjkXWWOfk4=
X-Google-Smtp-Source: AMrXdXvHISo+gofCIljd5z4s5qlvYNm9Xiim1fBueWwkYy5eriSsSxoTCebGqM+ArnXz+SOQJDEVu9WBD3m2jWNi/nk=
X-Received: by 2002:a63:c052:0:b0:477:27f7:794a with SMTP id
 z18-20020a63c052000000b0047727f7794amr3640553pgi.58.1674746795603; Thu, 26
 Jan 2023 07:26:35 -0800 (PST)
MIME-Version: 1.0
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
 <Y9Jwv1ColWNwH4+0@kroah.com> <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
 <Y9J8VncWSJdVURgB@kroah.com> <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
 <236997e1-d2db-ad2d-7161-c9e3845318f6@selasky.org>
In-Reply-To: <236997e1-d2db-ad2d-7161-c9e3845318f6@selasky.org>
From:   Troels Liebe Bentsen <troels@connectedcars.dk>
Date:   Thu, 26 Jan 2023 16:26:24 +0100
Message-ID: <CAHHqYPPh43XccGvA6Dt9Ofy7PoXJsJxQvZDVima671Kq1bOn1Q@mail.gmail.com>
Subject: Re: All USB tools hang when one descriptor read fails and needs to timeout
To:     Hans Petter Selasky <hps@selasky.org>
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

On Thu, 26 Jan 2023 at 15:27, Hans Petter Selasky <hps@selasky.org> wrote:
>
> On 1/26/23 14:59, Troels Liebe Bentsen wrote:
> > On Thu, 26 Jan 2023 at 14:12, Greg KH <gregkh@linuxfoundation.org> wrote:
> >>>
> >>> I would like to change /sys/bus/usb/devices/usbX/descriptors so it never blocks.
> >>
> >> Patches gladly reviewed to do so :)
>
> Be careful. Been there done that for FreeBSD. You can cache the
> descriptor in memory - yes, but beware that the values inside the device
> descriptor may change after re-enumerating the device via software, like
> firmware upgrade, and that directly hits on the XHCI controller
> programming, that you need to load and configure the new bMaxPacketSize
> in there!
>
> And the same goes for the other fields in there :-)

It actually looks like a lot of the other files in sysfs are cached already, fx.
/sys/bus/usb/devices/x-x.x/manufacturer

We tried changing the manufacturer name after our hardware was booted and using
the Linux usb gadget driver and only libusb seemed to be able to see the change.

But that's another question, how do I get Linux to re-enumerating the
device and update the sysfs files?

>
> >
> > We will have a look and get back to you.
>
> It's probably best to find the undocumented bits of your USB peripheral
> controller first! With USB control transactions I've seen so much
> craziness over the years you won't believe it. The only ones that get it
> right, is the ones that lay out all USB control endpoint jobs in memory
> via DMA descriptors. All the ones that simply use a few registers to
> receive the SETUP packet, DATA and status ZLP, have undocumented races.
> By races I mean, what happens if you get SETUP and DATA interrupt bits
> at the same time, or maybe all three, what is the right order, or what
> about STALL conditions and short control transfers and blah blah blah.
> This thing can really blow your mind, but yeah, many device side
> programmers simply use the example code they get from the vendor and
> give a shit about anything that can later go wrong. That is my simple
> impression so far in the USB world.
>

It's an i.MX6 and built in microcode that runs the USB in flash mode, but
we are quite sure it's a power sequencing issue that hangs the CPU in
I.MX6. So bad hardware design and not NPX this time, we have had
plenty of other issues, but this time it does not seem to be their fault.
Also we have some other designs with i.MX6 and don't have
the issue there.

Regards Troels

> --HPS
>
> >
> >>
> >> thanks,
> >>
> >> greg k-h
> >
> > Regards Troels
>

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC728B97B
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 15:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbfHMNG6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 09:06:58 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33635 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbfHMNG6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Aug 2019 09:06:58 -0400
Received: by mail-pl1-f194.google.com with SMTP id c14so49174779plo.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2019 06:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jyY3MfJl8FHWs87KVz6Gcck19Yc4xnJRrDvM7iLe1po=;
        b=V2wIOoMzfdbOSzVvFJalHPeuLCmUN/1WJOQJCH3X3O3NOn4w27ghE/XQSIL7vNAqg9
         ADhKgFzgFPcD7ZNEswCJsfuxrhJuMgYzZpCnRcTzE6tR4VheltNQ0WM/+GAboscXbDYS
         Nxdx+Y/YegeOtkZ8V6JAiJyj4+x3aIYkRpukZcZ1Ta7bggn5or3m1UutZHDG0k0zfKbQ
         j1exN7RIm3YU+NgaG+6NVr0cJHBLrgYNCtnEO01uRTEchi3oHdLiHAVhT99mwWCNSaXK
         PLWykxkN4W4G0xclKG3bWOC7+EtIx3n6ygsd+GQFWBDfLLo04pymoHg/uB2rUkBgtYHC
         Jqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jyY3MfJl8FHWs87KVz6Gcck19Yc4xnJRrDvM7iLe1po=;
        b=JRoFt/BN/17hwKgJo95OgCnq8Tx6+ZO6grMUkITslLJlSCPrrZ54QSVDluvOw5GI7q
         2Yf7GqQRl3GQBcApFPslT0feT16097ZJEHEqof3QoTioQrZZgoyYXsVfZacFJ1i/BTMk
         AJTHhLlnoALBfBpQRhIZYe857PWpaES5/rHPPql+PeGcX4d21O9comOD7xwkGFOIRoZB
         osyrNbxsCHfbwp99WPIqYKT4uPJTngXSHKYDA7gorugyj5Ec27zBqls02K9JmEhRSIRw
         D5xqzQnX2O8swewbIFllqUCtF1ZCo1p+YD0+OllmCwzgTjHM8YCEKO6mCBDp7BM8QEdC
         Kl/Q==
X-Gm-Message-State: APjAAAUXf6h8I65iViKGo8Lu7I6eUUC6V+MchX/O7fzAGLwawdbkpidX
        YsENN081chbH7+uJ2HAJpIKISuyh9srzRbUKdMDYkQ==
X-Google-Smtp-Source: APXvYqzJPRYFUEADcX0YPrr5LS3CQWg7dYO4UK6MhWXEACXOIyLN0soXqapveapKklJhrzL29FgWFONs96RO8RN5S0Y=
X-Received: by 2002:a17:902:ab96:: with SMTP id f22mr31678443plr.147.1565701617350;
 Tue, 13 Aug 2019 06:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+z+d=Gh4j1VSsEtLuYUpd7-T3Cu1ww0-5otSE5kDTgMGA@mail.gmail.com>
In-Reply-To: <CAAeHK+z+d=Gh4j1VSsEtLuYUpd7-T3Cu1ww0-5otSE5kDTgMGA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 13 Aug 2019 15:06:46 +0200
Message-ID: <CAAeHK+zFrEhbAXzv=pwyMwMk1ABJR7Kdmz8Wb8-COvR6ocgSBA@mail.gmail.com>
Subject: Re: USB fuzzing with syzbot
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        Hillf Danton <hdanton@sina.com>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 17, 2019 at 6:33 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> Hi,
>
> As you might have noticed, syzbot has started reporting bugs in the
> USB subsystem that can be triggered externally by a malicious USB
> device. Right now the fuzzing is done via a GadgetFS-like interface to
> emulate USB devices through the USB Gadget subsystem and the Dummy
> HCD/UDC module to "loopback" connect those devices to the running
> kernel. There are more details in my OffensiveCon talk [1], [2].
>
> A few questions/comments:
>
> 1. Which tree should we use for testing?
>
> Right now we're targeting the upstream tree, but we can switch to some
> USB development tree, where the fixes are likely to end up earlier.
>
> 2. Is there an easy way to figure out which config options enable
> drivers reachable over USB?
>
> Right now our kernel config is based on one of the Debian kernel
> configs, that supposedly enables enough relevant USB drivers. At the
> same time it enables a lot of other unnecessary stuff, which makes the
> kernel big and long to compile. Ideally, we would to have a way to
> auto-generate a kernel config that enables all the relevant (enabled
> by at least one of the distros) USB drivers. I've looked at whether
> it's possible to figure out which particular options in some kernel
> config are related to USB, but it seems that neither the option names,
> nor the way they are grouped in the config file, are representative
> enough.
>
> 3. Regarding that GadgetFS-like interface.
>
> Initially I was using GadgetFS (together with the Dummy HCD/UDC
> module) to perform emulation of USB devices for fuzzing, but later
> switched to a custom written interface. This interface is essentially
> implemented in the following patch [3]. An example that emulates a USB
> keyboard through this interface can be found here [4]. And the
> syzkaller parts responsible for USB fuzzing are here [5], [6]. The
> incentive to implement a different interface was to provide a somewhat
> raw and direct access to the USB Gadget layer for the userspace, where
> every USB request is passed to the userspace to get a response.
>
> The main differences between this interface (referred to as usb-fuzzer
> for now) and GadgetFS are:
>
> 1) GadgetFS does some sanity checks on the provided USB descriptors,
> which is something we don't want for fuzzing. We want the descriptors
> to be as corrupted as they can.
>
> 2) GadgetFS handles some of the USB requests internally based on the
> provided device descriptor, which is also something we don't want. For
> example we may want to be able to provide differently corrupted
> responses to the same request.
>
> 3) usb-fuzzer has ioctl-based interface instead of a filesystem-based
> one. I wouldn't say it's that big of a deal, but it makes it somewhat
> easier to incorporate into a fuzzer.
>
> 4) Somewhat related to the previous point: usb-fuzzer uses predictable
> endpoint names across different UDCs.
>
> Right now each UDC driver defines endpoint names via EP_INFO() as it
> pleases. And GadgetFS uses those names to create file entries for each
> of the endpoints. As a result, endpoint names for different UDCs will
> be different and it requires more work to write a portable userspace
> gadget. The usb-fuzzer interface auto selects and assigns an endpoint
> based on the required features like the transfer type.
>
> 5) GadgetFS binds to the first available UDC, usb-fuzzer provides a
> way to select a UDC to bind to.
>
> Since the fuzzing happens in multiple processes each of which has its
> own Dummy UDC assigned, we want to have control over which UDC we bind
> to. This part is a bit confusing, but what I found out is that a UDC
> is selected based on two different identifying names. I call the first
> one "udc_device_name" and the second one "udc_driver_name".
> "udc_device_name" has to be assigned to usb_gadget_driver->udc_name
> when usb_gadget_probe_driver() is called, and "udc_driver_name" is
> what we have to compare usb_gadget->name with inside of the
> usb_gadget_driver->bind() callback. For example, Dummy UDC has
> "dummy_udc" as its "udc_driver_name" and "dummy_udc.N" as its
> "udc_device_name". At the same time the dwc2 driver that is used on
> Raspberry Pi Zero, has "20980000.usb" as both "udc_driver_name" and
> "udc_device_name".
>
> Overall, the usb-fuzzer interface implementation has a similar
> structure to that of GadgetFS, but looks way simpler (although that
> might be because I've missed to implement some functionality :).
>
> We'd like to get this upstreamed, but I'm not sure whether this should
> be a separate interface (which we can rebrand as a raw usb gadget
> interface or something like that) or we should try to make it a
> special mode of GadgetFS. I like the former approach more, as GadgetFS
> looks quite complicated from my point of view and making fundamental
> changes to it doesn't seem like an easy task. This is where we'd like
> to get your input.
>
> If you have any other questions or comments, please let us know.
>
> Alan, thanks a lot for answering to lots of my USB related questions
> while I was working on this, that helped tremendously!
>
> Thanks!
>
> [1] https://docs.google.com/presentation/d/1z-giB9kom17Lk21YEjmceiNUVYeI6yIaG5_gZ3vKC-M/edit#slide=id.g1925acbbf3_0_0
>
> [2] https://www.youtube.com/watch?v=1MD5JV6LfxA
>
> [3] https://github.com/google/kasan/commit/9a33b36996cb6138a806eab931ba43c63a836708
>
> [4] https://github.com/google/syzkaller/blob/usb-fuzzer/tools/usb/keyboard.c
>
> [5] https://github.com/google/syzkaller/blob/master/sys/linux/vusb.txt
>
> [6] https://github.com/google/syzkaller/blob/master/executor/common_usb.h

A small update: all bugs found on the USB fuzzing syzbot instance can
now be viewed here:

https://syzkaller.appspot.com/upstream?manager=ci2-upstream-usb

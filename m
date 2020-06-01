Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28791EA3CE
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2020 14:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgFAM0c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jun 2020 08:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgFAM0c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jun 2020 08:26:32 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F5EC061A0E
        for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2020 05:26:31 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id n2so50569pld.13
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2020 05:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8yVS/tOJsab2pxtqIMrdASCKG2RxxOw8JAd+uvwlp5k=;
        b=Mm1Mjo4ImwaG038saeueWX6FHH0z3Vu8ZGTAK84A58RRW4+rmStDelVY1ZyPjp7W6X
         DUTLW9iV8IenroEL9zevzhsabfHQ4D15jn3079WSV96RRq+SArxvkeyf+YOZrDk0uSwM
         fdWmJ1hQCT1BXcRDD2DiJhUaL84TIa9hJVmMweCX6FKJ7VTNZUAKBTvhLQtlmaNkZg+A
         Ry56tvk6QBE2IinxPqOJUjD1HfNwAEuPwXOkrm5B08sIFpQ7Csc9nm2DcAgfkQguOGoH
         WSPB/lvd6EDWNkVjUdVuqnAoxk4iUjnHdCCqkOa40ePh3eLYn1Lxriyl9QxYbx1jhnl8
         6ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8yVS/tOJsab2pxtqIMrdASCKG2RxxOw8JAd+uvwlp5k=;
        b=lQToK9EKTZ7E0VfU/A4r4Db8wscZOEdRh4JAtWEU8Sc/gtI/oxpOQqf9n3EDq8Z3tl
         dcSQf1Rn7aNjTF197M+Drqz/pugD5rvtg3HFZNBbMuVtSi1GhIS0xqZdqIBjQzJ4wheF
         FKAZ2snFGkIwP7vZIJ14Ed+9NWQSIBq/cZD/pDpK8T7DEjlR6siuMgbtoo3pSqTn0LBZ
         GsdAmsn21X0kv7u1oiyIzYto0sGEv42Zay/2kF6SqsOl5GuYX6p5VP4D42jN4NkQGWOq
         3m8MztChARs9RuyiAHZGMJvCMYUFC5fDexZ9vbXJgiqJ+JzlXUrEBfR7vFeXOvDDe/az
         Q81g==
X-Gm-Message-State: AOAM532XXthmmg6o+gbZZzypFqHkKdT593MmL5psYUyTuV1hdK5FCFa6
        xdBEKPP51guYlHW2l1le52Jt5q9vgGE6d/68FOp5zg==
X-Google-Smtp-Source: ABdhPJyb2PC8t7HPXlRD3oIBQpBH3g9Me491Xo1rK8U2mfypzJBOGGAyNGQu6eqRZbF90u/9R8ciK1+vXx2enXDbzwk=
X-Received: by 2002:a17:90a:2381:: with SMTP id g1mr14696107pje.166.1591014391143;
 Mon, 01 Jun 2020 05:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <1590134662.19681.12.camel@suse.com> <03894591-a1ac-496a-a35f-55953e5bcc06@i-love.sakura.ne.jp>
 <1590408381.2838.4.camel@suse.com> <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
 <20200528194057.GA21709@rowland.harvard.edu> <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
 <20200528205807.GB21709@rowland.harvard.edu> <CAAeHK+xx-uodQWBDA2pJ_Et26uBPb6J7fTwu4h6D1uUTv8t3HA@mail.gmail.com>
 <79ba410f-e0ef-2465-b94f-6b9a4a82adf5@i-love.sakura.ne.jp>
In-Reply-To: <79ba410f-e0ef-2465-b94f-6b9a4a82adf5@i-love.sakura.ne.jp>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 1 Jun 2020 14:26:20 +0200
Message-ID: <CAAeHK+xapQjmkFFK+MpTCZOUR5mXTmKHNuJUDApAehX-RyDdFw@mail.gmail.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE bit.
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 30, 2020 at 2:43 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2020/05/30 5:41, Andrey Konovalov wrote:
> > On Thu, May 28, 2020 at 10:58 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >>
> >> On Thu, May 28, 2020 at 09:51:35PM +0200, Andrey Konovalov wrote:
> >>> On Thu, May 28, 2020 at 9:40 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >>>>
> >>>> On Thu, May 28, 2020 at 09:03:43PM +0200, Andrey Konovalov wrote:
> >>>>
> >>>>> Ah, so the problem is that when a process exits, it tries to close wdm
> >>>>> fd first, which ends up calling wdm_flush(), which can't finish
> >>>>> because the USB requests are not terminated before raw-gadget fd is
> >>>>> closed, which is supposed to happen after wdm fd is closed. Is this
> >>>>> correct? I wonder what will happen if a real device stays connected
> >>>>> and ignores wdm requests.
> >>>>>
> >>>>> I don't understand though, how using wait_event_interruptible() will
> >>>>> shadow anything here.
> >>>>>
> >>>>> Alan, Greg, is this acceptable behavior for a USB driver?
> >>>>
> >>>> I don't understand what the problem is.  Can you explain in more general
> >>>> terms -- nothing specific to wdm or anything like that -- what you are
> >>>> concerned about?  Is this something that could happen to any gadget
> >>>> driver?  Or any USB class device driver?  Or does it only affect
> >>>> usespace components of raw-gadget drivers?
> >>>
> >>> So, AFAIU, we have a driver whose flush() callback blocks on
> >>> wait_event(), which can only terminate when either 1) the driver
> >>> receives a particular USB response from the device or 2) the device
> >>> disconnects.
> >>
> >> This sounds like a bug in the driver.  What would it do if someone had a
> >> genuine (not emulated) but buggy USB device which didn't send the
> >> desired response?  The only way to unblock the driver would be to unplug
> >> the device!  That isn't acceptable behavior.
> >
> > OK, that's what I thought.
>
> I believe that this is not a bug in the driver but a problem of hardware
> failure. Unless this is high-availability code which is designed for safely
> failing over to other node, we don't need to care about hardware failure.
>
> >
> >>
> >>> For 1) the emulated device doesn't provide required
> >>> responses. For 2) the problem is that the emulated via raw-gadget
> >>> device disconnects when the process is killed (and raw-gadget fd is
> >>> closed). But that process is the same process that is currently stuck
> >>> on wait_event() in the flush callback(), and therefore unkillable.
> >>
> >> What would happen if you unload dummy-hcd at this point?  Or even just
> >> do: echo 0 >/sys/bus/usb/devices/usbN/bConfigurationValue, where N is
> >> the bus number of the dummy-hcd bus?
> >
> > The device disconnects and flush() unblocks.
> >
> >>> This can generally happen with any driver that goes into
> >>> uninterruptible sleep within one of its code paths reachable from
> >>> userspace that can only be unblocked by a particular behavior from the
> >>> USB device. But I haven't seen any such drivers so far, wdm is the
> >>> first.
> >>
> >> Drivers should never go into uninterruptible sleep states unless they
> >> can guarantee that the duration will be bounded somehow (for example, by
> >> a reasonable timeout).  Or that cutting the sleep state short would
> >> cause the system to crash -- but that's not an issue here.
> >
> > OK, thank you, Alan!
> >
> > Tetsuo, could you clarify why you think that using
> > wait_event_interruptible() is a bad fix here?
> >
>
> If wait_event() in wdm_flush() were using timeout or interruptible, can the
> wdm driver handle that case safely? Since cleanup(desc) from wdm_release()
> might release "desc", wouldn't "not-waiting-for-completion" has a risk of
> "use-after-free write"? Please add comment block why it is safe if it is
> actually safe.

Oh, it might be that just replacing wait_event() with
wait_event_interruptible() can lead to other issues, and a more
involved fix is needed. The suggestion was rather to avoid blocking
flush() indefinitely.

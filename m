Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551CD1E8907
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 22:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgE2Ulb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 16:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbgE2Ula (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 16:41:30 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21DCC03E969
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 13:41:30 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d66so409132pfd.6
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 13:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LHzoaU/yKeUfvNQT2XKuvz8e6wSUd7aTVRlqk1Fyt4E=;
        b=R3EZG0HYqQEV7+ek8gWcKOFpRKEeDE9hQsYUcMgFUDmit/PkKtg/dDT5gNfJCfaxkw
         Q8Dvd/AtmF/gbEM8g+7DM2sh4tCBixzmfSTo3lr/Mm79tA2G2MCbX9XwoU5FzI5nJByQ
         oy53MUJlBOZjDr2lQlnzDxfY4XGPwqJ30UNh+XwcE8GUC6oIVvQRzD2jhWsdF6zDbNaX
         MssxIYZi2Ibc2wpctyl68cATMPaWLnZUs7BhXBuOUqeU0GRiuZ/YA+zK7ejfgXQSvewz
         KrpiOl4dvxMSmyoNRxxB6dX8+1HnQS8Q5jMjcveOjmGfUd5Mb/LQYe9oqCUwo39Mw0D4
         zkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LHzoaU/yKeUfvNQT2XKuvz8e6wSUd7aTVRlqk1Fyt4E=;
        b=WNpVGoTYlJfdEPW8U+st8jmUY8OF+/zEsBijPQ0/H7zf03fmLH96lQDqW4DQhD1ND2
         v9MOek0CUDOqrykiquUkSrIMvwVELRO0XxAW3UzvAft96+oB7vH61+1g5jux3wn1gYdh
         CcJnLW3eA5KiAd+otXo2DUXnobeourBZSpq0olAyBPD29600yoXor0ZEddBo2yqTLv0z
         zolaG5fsmZXg7yE4Me2v5zgTjg4uGBsIlkEas54CLcmbWC169mqUqmYQlBOnj6D/8n2M
         dEH7bde9iTen1Tpqski7a0AXgV9KsETKErtOSFo0N0ZigpvzdDr9ArK7+416pj+yhER/
         mz8w==
X-Gm-Message-State: AOAM53216NP1iQRybXmZJk2IGmsMsnfAcpoK8lGmfS+gHO7dt/w/3G+4
        yT2jmoJevytJ/xS9/k+dDCRqtuQuIu43Btg5pr+INg==
X-Google-Smtp-Source: ABdhPJznUXt8o9eNfkldxugaR6eeDjRjwiEPzAtCJkKyQhnXpFVQypOVUhDGARea2cSbqN4UFuNJOZyz6aUDDc9KYOA=
X-Received: by 2002:a63:e454:: with SMTP id i20mr9791426pgk.440.1590784889914;
 Fri, 29 May 2020 13:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <1590134662.19681.12.camel@suse.com> <03894591-a1ac-496a-a35f-55953e5bcc06@i-love.sakura.ne.jp>
 <1590408381.2838.4.camel@suse.com> <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
 <20200528194057.GA21709@rowland.harvard.edu> <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
 <20200528205807.GB21709@rowland.harvard.edu>
In-Reply-To: <20200528205807.GB21709@rowland.harvard.edu>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 29 May 2020 22:41:18 +0200
Message-ID: <CAAeHK+xx-uodQWBDA2pJ_Et26uBPb6J7fTwu4h6D1uUTv8t3HA@mail.gmail.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE bit.
To:     Alan Stern <stern@rowland.harvard.edu>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Thu, May 28, 2020 at 10:58 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, May 28, 2020 at 09:51:35PM +0200, Andrey Konovalov wrote:
> > On Thu, May 28, 2020 at 9:40 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Thu, May 28, 2020 at 09:03:43PM +0200, Andrey Konovalov wrote:
> > >
> > > > Ah, so the problem is that when a process exits, it tries to close wdm
> > > > fd first, which ends up calling wdm_flush(), which can't finish
> > > > because the USB requests are not terminated before raw-gadget fd is
> > > > closed, which is supposed to happen after wdm fd is closed. Is this
> > > > correct? I wonder what will happen if a real device stays connected
> > > > and ignores wdm requests.
> > > >
> > > > I don't understand though, how using wait_event_interruptible() will
> > > > shadow anything here.
> > > >
> > > > Alan, Greg, is this acceptable behavior for a USB driver?
> > >
> > > I don't understand what the problem is.  Can you explain in more general
> > > terms -- nothing specific to wdm or anything like that -- what you are
> > > concerned about?  Is this something that could happen to any gadget
> > > driver?  Or any USB class device driver?  Or does it only affect
> > > usespace components of raw-gadget drivers?
> >
> > So, AFAIU, we have a driver whose flush() callback blocks on
> > wait_event(), which can only terminate when either 1) the driver
> > receives a particular USB response from the device or 2) the device
> > disconnects.
>
> This sounds like a bug in the driver.  What would it do if someone had a
> genuine (not emulated) but buggy USB device which didn't send the
> desired response?  The only way to unblock the driver would be to unplug
> the device!  That isn't acceptable behavior.

OK, that's what I thought.

>
> > For 1) the emulated device doesn't provide required
> > responses. For 2) the problem is that the emulated via raw-gadget
> > device disconnects when the process is killed (and raw-gadget fd is
> > closed). But that process is the same process that is currently stuck
> > on wait_event() in the flush callback(), and therefore unkillable.
>
> What would happen if you unload dummy-hcd at this point?  Or even just
> do: echo 0 >/sys/bus/usb/devices/usbN/bConfigurationValue, where N is
> the bus number of the dummy-hcd bus?

The device disconnects and flush() unblocks.

> > This can generally happen with any driver that goes into
> > uninterruptible sleep within one of its code paths reachable from
> > userspace that can only be unblocked by a particular behavior from the
> > USB device. But I haven't seen any such drivers so far, wdm is the
> > first.
>
> Drivers should never go into uninterruptible sleep states unless they
> can guarantee that the duration will be bounded somehow (for example, by
> a reasonable timeout).  Or that cutting the sleep state short would
> cause the system to crash -- but that's not an issue here.

OK, thank you, Alan!

Tetsuo, could you clarify why you think that using
wait_event_interruptible() is a bad fix here?

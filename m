Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3925B4A24F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 15:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbfFRNe6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 09:34:58 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:41782 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727584AbfFRNe6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 09:34:58 -0400
Received: by mail-pg1-f177.google.com with SMTP id 83so7699964pgg.8
        for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2019 06:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xiHetppidLUlULRmkrbNpchAb+hFQaG/YbZIEEojv2A=;
        b=sh+xgqvoCkEnz2S1ZzOzwrlqJzrz+kA0pUEefRQePkeqH00TOW8sUhPt+70+dA2V+U
         vMxezZmDwP1VUTeaNTlC1z9/j58qXQSawb9eCFyYinw+aWfQ2u/BDw3zoBLCVWbtGWOt
         Mapjq/EygCZisUZyM8EwyeWS/oqHGf6EHn8vhyUEB/fmr7X+gHgcjKZHs5oOOc7PMv13
         Tkv1IeRh5lducbMd+gI7DlzSzgM2S69FvcG0t5Sv+dma2YkxzAN8NGMymV48uL5uckVU
         7pDtWPSL17i5R7ip4kS16B7mbobfHujCzQfSqAtlLTJWH7ay1v6TZ44LcVuseCWnR9Ba
         aDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xiHetppidLUlULRmkrbNpchAb+hFQaG/YbZIEEojv2A=;
        b=S2BuaHnrSDVkbuyubc1leibtJkCQ2EHT0Q6Bzzg/OiXpW8h+SlHJnpSsIonzhiKnFs
         cbvWWrOkviHQxeI31Z7HB44zrbmRlG7RhRKV3RtctdtYwcIZ85nhD9H8sXqMCWMB4bHo
         jKEDJFAIFuCWXu4/Lf7vW4WZybv3kUsOd7aK0PA7ggkcsQiKXv5otN/chmazC/j1tJPX
         wg1GJGLtTHpeb7F9hn7sooYUYJK/3hIih+ivuuHcfJJ87zlKrctu5U/93d17+kq5sFoE
         WoRLTjTjPLasOXDKEywiTJ6eeJCOhXLik1IrHis5qyWUYYPM2BjDV2yWOaKZGsKGyX95
         Vicg==
X-Gm-Message-State: APjAAAWORF0rPBHluw7NVApzBwTxgj74yT4D+LSB2DDgbg6yn8W7zxiQ
        jSE1z8ycy20rDqWu9/FtwSor1CvK3J4tOt3u2ZUqvA==
X-Google-Smtp-Source: APXvYqwUHaBkaUoMeB3ToUWqy/I09hsdqIo5YvYCqbI0LxVJmZ05i2gM6Kc5b3nc+UZwjNuO10gzzn7WJGUQQ91TZtQ=
X-Received: by 2002:a17:90a:a116:: with SMTP id s22mr5180253pjp.47.1560864896933;
 Tue, 18 Jun 2019 06:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+xxn1dSJBwBv7g=Mp3e9XARmJwb9JgjLjbDLx0rE+9tew@mail.gmail.com>
 <Pine.LNX.4.44L0.1906071056380.1612-100000@iolanthe.rowland.org>
 <CAAeHK+yoEVJDQJCp0gXjX2t+QT_c-CqR+NnhtTTYOg6aj=MhQA@mail.gmail.com> <CAAeHK+xDZEc_Qxfj8xoht0Tn-4ANVAtd=Xj-oYPU53EQq1J5Og@mail.gmail.com>
In-Reply-To: <CAAeHK+xDZEc_Qxfj8xoht0Tn-4ANVAtd=Xj-oYPU53EQq1J5Og@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 18 Jun 2019 15:34:45 +0200
Message-ID: <CAAeHK+y6W=w1_bJYa_T4SLYfZnRCKrtiz5o6Nvnmedq8Um2-LA@mail.gmail.com>
Subject: Re: Pass transfer_buffer to gadget drivers
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 18, 2019 at 3:31 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Fri, Jun 7, 2019 at 5:05 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Fri, Jun 7, 2019 at 5:02 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Fri, 7 Jun 2019, Andrey Konovalov wrote:
> > >
> > > > > > The problem is that I want to receive that data (from the data stage)
> > > > > > from within my gadget driver module. But it's not passed to the
> > > > > > setup() callback. And the question is: how do I do that then?
> > > > >
> > > > > I just caught up on this thread...
> > > > >
> > > > > The answer is simple: The gadget driver's setup() callback routine
> > > > > submits a request for endpoint 0.  The Data Stage data is sent or
> > > > > received (depending on the direction encoded in the Setup information)
> > > > > by this request.
> > > >
> > > > Ah, OK, got it, thanks!
> > > >
> > > > Although while looking at the dummy_hcd implementation, I saw that it
> > > > accesses usb->transfer_buffer in case USB_REQ_GET_STATUS in
> > > > handle_control_request(), which is called right before the setup()
> > > > callback is called. So the data already available there without any
> > > > additional requests. Is this an implementation detail that is specific
> > > > to dummy_hcd?
> > >
> > > Yes, it is.  dummy-hcd is unusual in that it combines both a USB host
> > > controller and a USB device controller in a single driver.
> > >
> > > Normal UDC drivers do handle USB_REQ_GET_STATUS on their own without
> > > requiring the use of an explicit usb_request, because they handle the
> > > entire transfer internally and don't involve the gadget driver.
> > > However, they don't have access to any transfer_buffer; all they can do
> > > is exchange packets with the host.
> >
> > OK, I see. Thanks a lot!
>
> Another question: do I understand correctly, that we only proceed with
> submitting an URB to get the data for the control OUT request
> (ctrl->bRequestType doesn't have the USB_DIR_IN bit set) if
> ctrl->wLength != 0?

Also, does the gadget subsystem guarantee, that we get the complete()
callback for the DATA stage of the OUT control request before we get a
setup() callback for the next control request if there's any?

>
> >
> > >
> > > Alan Stern
> > >

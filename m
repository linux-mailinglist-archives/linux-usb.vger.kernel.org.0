Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCFF3E4F8C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 00:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236894AbhHIWyc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 18:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbhHIWyb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Aug 2021 18:54:31 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BF5C0613D3
        for <linux-usb@vger.kernel.org>; Mon,  9 Aug 2021 15:54:10 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id n7so1062982ljq.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Aug 2021 15:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mo9sTPGJOqzFeMz9BuM1/7f023SwhVFLBwgC/tDCeG4=;
        b=H1MH0WQdrSqsAhvN6tM8XnVyFU8NIzsmtZXoCR3VncrWF//u+fqxKHHv4nsEtp3Msf
         +Ot1wq285rMUypYU8V24TiSrGriOHZEPA5TWuuojxKBdTl9fpQ3pNKalSqgpsTEtxZwv
         JqAQ7q1jya+7lph7N23aBf8FvXJwHqLYwfNVJWnCDuYjDv45XkzP5BkbOeFTQUM64HZT
         39OcMoB55J5/qO0VXySO1robXl9XgXjbbQuTTRfX66mYoAxywPIhl/AzX+/qVX3pwpwu
         rpT7mJ4OQ+9vv+1rWDkqDS7ffodBQHRHDZSmle+lo+lF7Jkzqge2b5O1fM61e984UH9W
         qxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mo9sTPGJOqzFeMz9BuM1/7f023SwhVFLBwgC/tDCeG4=;
        b=Q/aBLOnOTttGzOKOTMj73Du4yzgjfrUS8G8jUr43jaCO48kTR5IzSyzk/uiaugghY+
         5r5KjLIW0dD9+SS+cWEAlBC9gfx4HC84VJxC+wchLpq4K+rjrOR7B9AQQ+RZm1PLe4vR
         DgLsAbW0TuT/0I8pjkUVCgpzMp5Q9YY8bL7PSxk5FN1bzn4zdkdxl95lkFSxX89W59UH
         g0LY6AMxeWuCx/6v6FurzGq3+mwV5fN+tqaASiGeqWfOR2/WnE1LR7cN7X9ACKa6Bpdu
         TTCm09J7vsk712GkzwaDysomzAkuXmTrSIPhUYAN+bna5q5AnUHB/Cc3eZo0RoqPy0SX
         pzNw==
X-Gm-Message-State: AOAM532bcNf6Mb4Z84Bse9PzbcBwtmSIGqUnr77IM2mQKH426h1jgMJ8
        +UyAgr57xyZnbmT1xq1Uc8Fl9Jmf7d9L3R3oIEl9kw==
X-Google-Smtp-Source: ABdhPJyxwm+xxC4OgLqY7GZAH2a4/ycT9O3c0a/bKoMK3KYy1W/iRCsdHkXpNcu/Pg6Lt6g6wkOnUCP/15hHcZQilOQ=
X-Received: by 2002:a2e:bf09:: with SMTP id c9mr17209682ljr.128.1628549648846;
 Mon, 09 Aug 2021 15:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <CANcMJZCEVxVLyFgLwK98hqBEdc0_n4P0x_K6Gih8zNH3ouzbJQ@mail.gmail.com>
 <20210809223159.2342385-1-john.stultz@linaro.org> <4e1bef57-8520-36b9-f5cb-bbc925626a19@synopsys.com>
In-Reply-To: <4e1bef57-8520-36b9-f5cb-bbc925626a19@synopsys.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 9 Aug 2021 15:53:57 -0700
Message-ID: <CALAqxLXPGt69ceiXkGT-nDjeP72mmCUgEzDdMpXr=rSNwpespw@mail.gmail.com>
Subject: Re: [RFC][PATCH] dwc3: gadget: Fix losing list items in dwc3_gadget_ep_cleanup_completed_requests()
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <jackp@codeaurora.org>, Todd Kjos <tkjos@google.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Petri Gynther <pgynther@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 9, 2021 at 3:44 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>
> John Stultz wrote:
> > In commit d25d85061bd8 ("usb: dwc3: gadget: Use
> > list_replace_init() before traversing lists"), a local list_head
> > was introduced to process the started_list items to avoid races.
> >
> > However, in dwc3_gadget_ep_cleanup_completed_requests() if
> > dwc3_gadget_ep_cleanup_completed_request() fails, we break early,
> > causing the items on the local list_head to be lost.
> >
> > This issue showed up as problems on the db845c/RB3 board, where
> > adb connetions would fail, showing the device as "offline".
> >
> > This patch tries to fix the issue by if we are returning early
> > we splice in the local list head back into the started_list
> > and return (avoiding an infinite loop, as the started_list is
> > now non-null).
> >
> > Not sure if this is fully correct, but seems to work for me so I
> > wanted to share for feedback.
> >
> > Cc: Wesley Cheng <wcheng@codeaurora.org>
> > Cc: Felipe Balbi <balbi@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Cc: Jack Pham <jackp@codeaurora.org>
> > Cc: Thinh Nguyen <thinh.nguyen@synopsys.com>
> > Cc: Todd Kjos <tkjos@google.com>
> > Cc: Amit Pundir <amit.pundir@linaro.org>
> > Cc: YongQin Liu <yongqin.liu@linaro.org>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Petri Gynther <pgynther@google.com>
> > Cc: linux-usb@vger.kernel.org
> > Fixes: d25d85061bd8 ("usb: dwc3: gadget: Use list_replace_init() before traversing lists")
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> >  drivers/usb/dwc3/gadget.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index b8d4b2d327b23..a73ebe8e75024 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -2990,6 +2990,12 @@ static void dwc3_gadget_ep_cleanup_completed_requests(struct dwc3_ep *dep,
> >                       break;
> >       }
> >
> > +     if (!list_empty(&local)) {
> > +             list_splice_tail(&local, &dep->started_list);
> > +             /* Return so we don't hit the restart case and loop forever */
> > +             return;
> > +     }
> > +
> >       if (!list_empty(&dep->started_list))
> >               goto restart;
> >  }
> >
>
> No, we should revert the change for
> dwc3_gadget_ep_cleaup_completed_requests(). As I mentioned previously,
> we don't cleanup the entire started_list. If the original problem is due
> to disconnection in the middle of request completion, then we can just
> check for pullup_connected and exit the loop and let the
> dwc3_remove_requests() do the cleanup.

Ok, sorry, I didn't read your mail in depth until I had this patch
sent out. If a revert of d25d85061bd8 is the better fix, I'm fine with
that too.

thanks
-john

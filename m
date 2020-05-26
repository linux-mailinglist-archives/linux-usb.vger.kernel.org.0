Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430341B4CB0
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 20:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgDVScx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 14:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgDVScw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 14:32:52 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C91DC03C1AA
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2020 11:32:52 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id r1so732290oog.7
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2020 11:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QvB8fmypYguDVc+21daZnnUpCssV2+w3brEebxwhg7M=;
        b=c6SSxTop7JVBUJI7oh7NwYRuOqKjAbdRqAbx+5ZXjYoibOL8YJVkbI4sqG2kkrOE9+
         XWTyDH8DZxgVcwQxSlzSR8ju5DdnGnvN0e66zcKuTMoTc3sGPSXIIQ+KCR9lJRWGns0U
         BiOwzAhiPwoQkeZFkZG2n80uYAWTzVFeB2Zj0fkUnw0WPqlM00xxukSYctRauYVpqnuA
         iapk82I8gGdRhAowOyfNNozbURiDxc0D9AHNuK4fECzxTEaW1VTz3D5z/kp5teNws3t5
         gqVCct+vSADWHREi1e65hTcsvBWHraXWxjaNW7zzHykHYOshwhftIzcJyLp3QBqDjwQj
         yjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QvB8fmypYguDVc+21daZnnUpCssV2+w3brEebxwhg7M=;
        b=Dwfu7L2bNS52Fgtnfua3utBChox3IrEDVLTNBiYckpRX8v4ar3LpHopZuhWvpQczO0
         ztmh8A51PNZrlPQSK3Y7PLmocWpsGZkAy6F6EWKzV70O3d5Z6+7NNqAUE0pfmXJy/pos
         N4YYXDjUbbqR+DUHkbAwzMYJOYc6xoudbBSo3BkaTO/P5pdX38XCzSOprn9eLWfV+o2v
         +04VQnykTOToPUaj3TjV8psBqD8f6aEzBH0lDlKYlWn4vYKB38WjbEG9+nySysZj+MyO
         zgHqZTY9wRimqO+FFubiD+oDOfkzZ+zCcCPMA2gBrgbGhy2BaKUSIfJcqlAp3Amo5frW
         dBNA==
X-Gm-Message-State: AGi0PubgCRURVCwiuZGXSXJBLMSPQR7IhTpmxctb5T/2N+0wdPZpOf3e
        9qOVez9DLK1FYfyAQjrrlRUf0Cs11UqidD+la4TaXQ==
X-Google-Smtp-Source: APiQypJM+9aYBHboC37kRPVzSEldKwd8ylY8nZu8gciw8Cui08i5AG/0joAhIxeULQx6gI0FbOQLMMZ4EU9/r9z+pEY=
X-Received: by 2002:a4a:e7d3:: with SMTP id y19mr124836oov.88.1587580371827;
 Wed, 22 Apr 2020 11:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLW2R4d=Zm=TKbFprN-uYrerL1oCYsVC3VedEKtW0gCsyA@mail.gmail.com>
 <877dyfsv00.fsf@kernel.org> <CALAqxLUdzKRV6nrcLpWsykK+WPnqhUK4iwRe4_Xmo-TvEV5KOg@mail.gmail.com>
 <87blnkcb6i.fsf@kernel.org>
In-Reply-To: <87blnkcb6i.fsf@kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 22 Apr 2020 11:32:40 -0700
Message-ID: <CALAqxLXkY2veX7DKAhXn-uxtMYygfKrJQaPiSKKLbnDvQnHinA@mail.gmail.com>
Subject: Re: More dwc3 gadget issues with adb
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Josh Gao <jmgao@google.com>, YongQin Liu <yongqin.liu@linaro.org>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Yang Fei <fei.yang@intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Jack Pham <jackp@codeaurora.org>, Todd Kjos <tkjos@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 21, 2020 at 11:00 PM Felipe Balbi <balbi@kernel.org> wrote:
> John Stultz <john.stultz@linaro.org> writes:
> > On Thu, Apr 16, 2020 at 1:19 AM Felipe Balbi <balbi@kernel.org> wrote:
> >> One thing I noticed is that we're missing a giveback on ep1out. Here's a
> >> working case:
> >>
> >
> > Hey Felipe,
> >   So I found some time to dig around on this today and I started
> > trying to understand this issue that you've pointed out about missing
> > the giveback.
> >
> > It seems part of the issue is we get to a point where we have some req
> > where pending_sgs is more than one.
> >
> > We call dwc3_prepare_one_trb_sg() on it:
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/dwc3/gadget.c?h=v5.7-rc2#n1068
> >
> > And we process the sg list incrementing req->num_queued_sgs for each one.
> >
> > then later, dwc3_gadget_ep_cleanup_completed_request() is called on the request:
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/dwc3/gadget.c?h=v5.7-rc2#n2522
> >
> > We call dwc3_gadget_ep_reclaim_trb_sg()
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/dwc3/gadget.c?h=v5.7-rc2#n2470
> >
> > Where we iterate over the req->sg, ideally decrementing
> > num_pending_sgs each time and return.
> >
> > But back in dwc3_gadget_ep_cleanup_completed_request()  and there
> > we're hitting the:
> >   if (!dwc3_gadget_ep_request_completed(req) ||
> >       req->num_pending_sgs) {
> > case which causes us to skip the call to dwc3_gadget_giveback().
>
> This logic was modified recently. Can you check if today's linus/master
> works for you?

I was testing this against 5.7-rc2, but I updated to linus/master and
I'm not seeing any change.

> > Looking as to why the num_pending_sgs is non zero, that's because in
> > dwc3_gadget_ep_reclaim_trb_sg we're hitting the case where the trb has
> > the DWC3_TRB_CTRL_HWO ctrl flag set, which breaks us out of the loop
> > early before we decrement num_pending_sgs.
> >
> > For that trb, we're setting the HWO flag in __dwc3_prepare_one_trb()
> > (called from dwc3_prepare_one_trb_sg() back at the beginning):
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/dwc3/gadget.c?h=v5.7-rc2#n921
> >
> > I added logic showing every time we set or clear that flag, and it
> > seems like we're always setting it but never clearing it. And often
>
> HW clears HWO flag. We only have to manually clear in one or two cases.

I guess the bit that worries me with the current code is in
dwc3_gadget_ep_reclaim_completed_trb():
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/dwc3/gadget.c?h=v5.7-rc2#n2406

There is the logic:
  if (chain && (trb->ctrl & DWC3_TRB_CTRL_HWO))
           trb->ctrl &= ~DWC3_TRB_CTRL_HWO;

But that will never trip, as the only time we call
dwc3_gadget_ep_reclaim_completed_trb() with chain==true is from
dwc3_gadget_ep_reclaim_trb_sg():
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/dwc3/gadget.c?h=v5.7-rc2#n2470

Where if the trb->ctrl has the HWO flag set, we break out before
calling  dwc3_gadget_ep_reclaim_completed_trb().

So the logic quoted above seems to be effectively dead code (despite
the big comment as to why we need it)

That's why I suspected the HWO check in
dwc3_gadget_ep_reclaim_trb_sg() is problematic.


> > that's not an issue as we only have one sg entry. But if its set on a
> > trb in a request with multiple sgs, that's where it seems to be
> > causing the issue.
>
> The issue is completing with HWO set, which should never happen. Can you
> collect tracepoints with linus/master of this particular situation?

Will do, though again, its a little tough as often we hit the stall
state pretty quickly at bootup, before I can even try to enable
tracing, so it may take a few tries.

> >> One interesting thing is that TRB addresses are "odd". I can't find a
> >> proper lifetime for these TRBs. Do you have IOMMU enabled? Can you run
> >> without it? For example, nowhere in the log can I find the place where
> >> trb 0000000092deef41 was first enqueue. I'm assuming the log to be
> >> ordered, which means that trb is the same as 00000000f3db4076. But why
> >> are the addresses different?
> >>
> >> Another weird thing is that even though we CHN bit being set in
> >> 0000000092deef41, we don't see where the second trb (the one its chained
> >> to) was prepared. It seems like it was *never* prepared, what gives?
> >
> > I suspect these bits were due to the tracing happening after some
> > minor amount of initial adb traffic began at bootup? So the trace
> > isn't capturing all the events.
>
> No, no. That's more likely to be IOMMU mucking up the addresses. ADB is
> very sequential in its behavior and USB transfers requests in
> order. Please run linus/master without IOMMU.

So I didn't have any IOMMU support enabled in the config I was testing
with. I went through and added IOMMU options in my config with
linus/master as well and that didn't seem to change the behavior
either.

I'll get back to you with further trace logs.

thanks
-john

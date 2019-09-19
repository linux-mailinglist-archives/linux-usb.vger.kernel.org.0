Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11396B76C5
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 11:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388971AbfISJyj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 05:54:39 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45401 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388649AbfISJyi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 05:54:38 -0400
Received: by mail-io1-f66.google.com with SMTP id f12so6138106iog.12
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 02:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=06SZvgzdXOks25VF5C8zBO75e+mjEwq6bZ9qf1w1ELg=;
        b=JgJ233lAqVJLTigOY3JZLRKHrUOjb+hvtDe4+C91jIwrBNH/89jAUdkom9P+dor3PJ
         xHgCB+y7uF5g+wUM5UVCFYGDcOkA9GpR5zqQh7KPwPnefui7QwKfs+OW/GU+umVAbfAb
         4EuXW4rHTtHj2FeCzBciZvVWPP+e0iywbkw5aN7vIzPYWyFaekh5MFDZ/u9NQ9RswYfH
         MNRS0YGiIoCQiPaoiprHT9i4ngWxXNlQhzBuvoM8RLCqFKA+xGogOUvSM9XjXFQf4qO7
         +06jzqLsuoLraHY/v8IdCGGpv9W56+i7m7rjIDmWvsrWN/9AmwKm6RWDYwqQipKRkA1a
         RN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=06SZvgzdXOks25VF5C8zBO75e+mjEwq6bZ9qf1w1ELg=;
        b=p5VPGE2HCjOQYaCFOMMUYO+IFMmd9eH67IoboXH1hhY8KNY2mbKB/foki2AWviwsn0
         Kvw07tZl/hDumGDu4Kg3TYP2kroj0OjYEuox6vH5olntqzWSrwvIgqw/KSglFIo3NHYC
         nDKLfDB58Q0dknDtpZZ/gXYMusv+xsCxXLRmFZQEFTsBhHivVS5uZn0Pnl9HGpyg/6mf
         A2ShHgxQDCduUXU6DfZR4+Kk3lp1maJcjdS6tO7TpyHE2b+XLPIHYckViLiwEMQwEOO9
         RJsMvXt2cTKz/zihSPkuDak/5wIUmMlsYMqHWPqbUqxHseaO0Gp5DPcTtkDmcb1xtZyT
         65nw==
X-Gm-Message-State: APjAAAV7jKgessc7PMbH9ncD/XX2YqzHjkcJCVF+mtKtyYgIriQdcXJi
        oZLxVMmjm9sd6Bj97jSYmvq0/hywvXaDuSCY/NQ=
X-Google-Smtp-Source: APXvYqzCEqMX7n56omVAy2Mun9suCY4W5M+yOsSu2tFnnX6U/oJ9y7Zo7j2TQZhtL/36+OGgX3Ly1utUM7VoSnv433w=
X-Received: by 2002:a6b:7a42:: with SMTP id k2mr4747898iop.303.1568886877907;
 Thu, 19 Sep 2019 02:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190916094305.GB21844@b29397-desktop> <0aae13f2-04cf-f45a-e6ee-4bf9e515faba@linux.intel.com>
 <CAL411-oirjSLZzwoN8axqpfn-JQ8eEGMWD-w9p24Krap+dPs9g@mail.gmail.com> <92a09240-6489-b405-7916-26a77f2e0b06@linux.intel.com>
In-Reply-To: <92a09240-6489-b405-7916-26a77f2e0b06@linux.intel.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Thu, 19 Sep 2019 17:54:25 +0800
Message-ID: <CAL411-p5TPHtBTe2cVtPsX07LhjeHw19qLjxz_XOXigEfG7_DQ@mail.gmail.com>
Subject: Re: Event ring is full when do iozone test on UAS storage
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On 17.9.2019 12.55, Peter Chen wrote:
> >>>
> >>> I met "event ring full error" like below, this error is met when
> >>> I do iozone test on UAS storage at v4.19.35 kernel, but not meet
> >>> this error at linux-next tree (08/24). The same host and test
> >>> UAS storage device are used. This issue is due to xhci_handle_event
> >>> does not return 0 long time, maybe the xHC speed is fast enough
> >>> at that time. If I force the xhci_handle_event only run 100 times
> >>> before update ERST dequene pointer, it will not occur this error.
> >>> I did not  see any changes for xhci_handle_event at the latest code,
> >>> so in theory, it should have this issue too. Do you think if we need
> >>> to improve xhci_handle_event to avoid event ring?
> >>
> > The root cause is UAS protocol is very fast
> > protocol, the
> > other threads at non-CPU0 will add TRBs during we are handling event, so if
> > hardware (xHC) has always consumed TD the non-CPU0s are adding,
> > the ERST dequene pointer never get change to update, then this
> > "event ring full" error will occur.
> >
> > The one reason why v4.19 has this issue is the max request length is larger
> > than the latest kernel. At v4.19, it is 512KB, At the latest kernel,
> > it is 256 KB.
> > see /sys/block/sda/queue/max_sectors_kb.
> > When I change max_sectors_kb as smaller value, the test will be more smooth.
> > Besides, At v4.19, the UAS completion handler seems take more time
> > compares to the latest kernel.
> >
> > I suggest adding threshold flag for event ring when it closes to full
> > since we can't
> > avoid USB3 use cases when the throughput is high, but the system is a
> > little slow.
> > Do you agree?
>
> I agree that it makes sense to force a ERDP write after handling some amount
> of events, it can solve some event ring full issues, but not the fact that
> we spend a lot of time in the interrupt handler.

Ok, I will proposal one patch to fix event ring full issue.

>
> Your logs show that you have TDs containing up to 128 TRBs.
> When a TD like that finishes the driver will increase the sw dequeue pointer of the
> transfer ring one by one until we reach the end of the TD.
>
> This means we call inc_deq() function 128 times in interrupt context, and each time
> do a few comparisons. According to traces this takes ~120us. There might be some
> tracing overhead but this could anyway be done in a saner way.
>
> I'll look into this
>

Since we use hard irq for xHCI, for high performance protocol, it may hard to
reduce interrupt context time since we have lots of request handling,
cache operation,
and completion are interrupt context.

> Other things to consider in addition to writing ERDP and fixing the inc_dec() loop is
> increasing event ring size (adding more than current 1 segment), and support giving
> back URBs in tasklet by adding the HCD_BH flag to xhci hcd.
>

I tried to use 3 segments for event ring, still meet ring error.
During the iozone
test, the block layer produces data without stop, xHC will always be busy.
Using bottom half giveback helps this issue,  ehci has already used bottom
half giveback.

So, Mathias, which solutions do you prefer:
- One way to quit xhci_handle_event if there are enough events have handled
- Change giveback as bottom half

Thanks,
Peter

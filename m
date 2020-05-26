Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA811ACF43
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 20:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729691AbgDPSAn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 14:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727777AbgDPSAl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 14:00:41 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73692C061A0C
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 11:00:41 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id o25so17281302oic.11
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 11:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D9ZAMBg2vdwwpLVEuXAoTECtGhzfLx2qbHDWEvpNchU=;
        b=NPEwmfL1JMCaTWWUANGSj2blrmx0ViBkc2hFfZ8v1wD3cY1ONyJZ9azbaKuMfgAuDQ
         OtFdmHtsN74vHXcQMqt7tHIWcKFlXTbYBee4wUljV7x6bhuLjlcTzFeyXEHX1m5OkFcF
         Xd+a4RbYgyXuJ5cvk8ovXnZ1LoBpSaqvQ1DRdSfmYyDm2iPwutt2TITfXq2AsKLox+6y
         VVqKVjzsd89zTfGXqcutLPuvFX0Wsi4j9r+2ueSHqSnTOEBygbm6zHrKP1OKvLPobhzz
         1LSxDSQ2KVLF3el3/35KhJpjMhkU/40OBDq1/CPTAFLx5l0Jj18r6OIgunIOt3zInuBR
         OC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D9ZAMBg2vdwwpLVEuXAoTECtGhzfLx2qbHDWEvpNchU=;
        b=nCvH50Re43q5OarJQprX17P3fS34IFhVDkZU6RRMyaVkwJ4VpfuT+ptmrwSjXYhc1k
         /zr/V37CoOgBMeEnejTOi8DSLTHn69Dzm2NH+pQqy8a78133Jh5SRUf16+rEjL5uTwZZ
         kTdeqpJzPPyh6gcMc/T6z8vGi9YXboow/HCCIxhAOSh+shOkKEFqDlcu/4q2RQUEKJ5W
         zxhzTcOrr3R97sQ4Z/y4I0tAjY0EYtfHfXS2dIqQP+7XKJv2OSDoWsAUmih+6ILOpDWu
         07v+KFy+HNwfWV9nY5NtHHZfLtVVrvXeYIGJiSX3HH38f2OxUmKuk2/XY23z7asa08OY
         oe6A==
X-Gm-Message-State: AGi0PubE+kevFO7uqTEVjwWkCr4clLDAjINe1aqHPfgHnF7B+MxeZQBX
        J5rak5RevvEwtqmSg7gjzCDREJFYTrqMIxF8Xvp5KQ==
X-Google-Smtp-Source: APiQypIvdvp3OpPC+cD9y4/s6lTdKgfKrnT/fij55o0gBawWaBLry3JTHCVTYtJx71t0YCUq8QFFL7/5GxjkOVfCHxc=
X-Received: by 2002:aca:c311:: with SMTP id t17mr3523165oif.169.1587060039256;
 Thu, 16 Apr 2020 11:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLW2R4d=Zm=TKbFprN-uYrerL1oCYsVC3VedEKtW0gCsyA@mail.gmail.com>
 <877dyfsv00.fsf@kernel.org>
In-Reply-To: <877dyfsv00.fsf@kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 16 Apr 2020 11:00:29 -0700
Message-ID: <CALAqxLUgQHLf4C=+0f4T_WfKct10nS=4SJJsW4Q0S9T9tT=Qzw@mail.gmail.com>
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

On Thu, Apr 16, 2020 at 1:19 AM Felipe Balbi <balbi@kernel.org> wrote:
> John Stultz <john.stultz@linaro.org> writes:
> > Hey Felipe,
> >   Last week or so, a change[1] in AOSP to adbd seemingly uncovered
> > another issue with dwc3 gadget scatter-gather support on HiKey960.
> >
> > Interestingly it doesn't seem to affect the Dragonboard 845c, which
> > uses the same dwc3 driver and has had its own issues in the past.
> >
> > The behavior is the same as we saw last time around with both devices.
> > After booting the device, running "adb logcat -d" (or really any adb
> > command that transfers more than a trivial amount of data) on the host
> > will result in the adb output seeming to stall. Any further adb
> > invocations to the device will hang indefinitely.
> >
> > I've captured trace events for before the change (works), after the
> > change (broken), and after the change with the sg_enabled flag turned
> > off (which works around the problem).
> >
> > Let me know if there is anything else useful for me to share.
>
> First the obvious questions: Which kernel version is this?

Apologies. v5.7-rc1, though the same behavior was seen with v5.6 and
v5.4 kernels.

>  What does
> "before" and "after" refer to in our traces?

Before and after the userland changes to adb were made.


> What are first working and
> first failing versions? Can you run git bisect?

It's not directly a kernel regression. But it seems like an uncovered
issue by changes in userland.


> One thing I noticed is that we're missing a giveback on ep1out. Here's a
> working case:
>
>    UsbFfs-worker-580   [002] d..1    66.704886: dwc3_alloc_request: ep1out: req 0000000011c55648 length 0/0 zsI ==> 0
>    UsbFfs-worker-580   [002] d..2    66.704889: dwc3_ep_queue: ep1out: req 0000000011c55648 length 0/16384 zsI ==> -115
>    UsbFfs-worker-580   [002] d..2    66.704892: dwc3_prepare_trb: ep1out: trb 000000003559c11c (E27:D7) buf 000000008843b000 size 16384 ctrl 00000819 (HlcS:sC:normal)
>    UsbFfs-worker-580   [002] d..2    66.704897: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20007] params 00000000 00000000 00000000 --> status: Successful
>      irq/65-dwc3-522   [000] d..1    66.705053: dwc3_event: event (00006084): ep1out: Transfer In Progress [0] (SIm)
>      irq/65-dwc3-522   [000] d..1    66.705054: dwc3_complete_trb: ep1out: trb 000000008c350fb3 (E27:D8) buf 0000000089d6b000 size 16360 ctrl 00000818 (hlcS:sC:normal)
>      irq/65-dwc3-522   [000] d..1    66.705058: dwc3_gadget_giveback: ep1out: req 0000000001b9ed3f length 24/16384 zsI ==> 0
>    kworker/u16:2-260   [001] ....    66.705097: dwc3_free_request: ep1out: req 0000000001b9ed3f length 24/16384 zsI ==> 0
>
> and the failure point:
>
>    UsbFfs-worker-580   [002] d..1    66.705129: dwc3_alloc_request: ep1out: req 0000000067a34de4 length 0/0 zsI ==> 0
>    UsbFfs-worker-580   [002] d..2    66.705131: dwc3_ep_queue: ep1out: req 0000000067a34de4 length 0/16384 zsI ==> -115
>    UsbFfs-worker-580   [002] d..2    66.705134: dwc3_prepare_trb: ep1out: trb 00000000f3db4076 (E28:D8) buf 000000008843f000 size 16384 ctrl 00000819 (HlcS:sC:normal)
>    UsbFfs-worker-580   [002] d..2    66.705141: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20007] params 00000000 00000000 00000000 --> status: Successful
>      irq/65-dwc3-522   [000] d..1    66.705309: dwc3_event: event (00006084): ep1out: Transfer In Progress [0] (SIm)
>      irq/65-dwc3-522   [000] d..1    66.705310: dwc3_complete_trb: ep1out: trb 0000000092deef41 (E28:D9) buf 00000000ba8f1000 size 4072 ctrl 0000001c (hlCS:sc:normal)
>      irq/65-dwc3-522   [000] d..1    66.705318: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20007] params 00000000 00000000 00000000 --> status: Successful
>      irq/65-dwc3-522   [000] d..1    66.705323: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20007] params 00000000 00000000 00000000 --> status: Successful
>      irq/65-dwc3-522   [000] d..1    66.705329: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20007] params 00000000 00000000 00000000 --> status: Successful
>      irq/65-dwc3-522   [000] d..1    66.705334: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20007] params 00000000 00000000 00000000 --> status: Successful
>      irq/65-dwc3-522   [000] d..1    66.705339: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20007] params 00000000 00000000 00000000 --> status: Successful
>      irq/65-dwc3-522   [000] d..1    66.705344: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20007] params 00000000 00000000 00000000 --> status: Successful
>      irq/65-dwc3-522   [000] d..1    66.705349: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20007] params 00000000 00000000 00000000 --> status: Successful
>      irq/65-dwc3-522   [000] d..1    66.705354: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20007] params 00000000 00000000 00000000 --> status: Successful
>
> One interesting thing is that TRB addresses are "odd". I can't find a
> proper lifetime for these TRBs. Do you have IOMMU enabled? Can you run
> without it? For example, nowhere in the log can I find the place where
> trb 0000000092deef41 was first enqueue. I'm assuming the log to be
> ordered, which means that trb is the same as 00000000f3db4076. But why
> are the addresses different?
>
> Another weird thing is that even though we CHN bit being set in
> 0000000092deef41, we don't see where the second trb (the one its chained
> to) was prepared. It seems like it was *never* prepared, what gives?

I'll try to take a deeper look at these points and get back to you. I
really appreciate your eyes on this!

Thanks for the feedback!
-john

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62B2B1149D1
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 00:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfLEXYI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 18:24:08 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:32820 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbfLEXYH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 18:24:07 -0500
Received: by mail-qk1-f193.google.com with SMTP id c124so4963240qkg.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2019 15:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EwXWXF/Aa2ZOUht7Ynv0b7/RyyTkuJEnmNHrYGq1Crk=;
        b=CNb488X0D1yoPbCpt09Y7Y2C2vNdjvkKJxOygmbo4X7O+jY/7ZP4/eZ5nX0h7KVDnx
         bcL2GxqzdXC9VLKFcwKExaZlaCH4XUiChVYpcvRqd0XnJxg/gfI3YledyqwCzVZKUeb9
         FEXviYvBEn4pSS2eeSRLiUZbWKrxL+SGoDlj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EwXWXF/Aa2ZOUht7Ynv0b7/RyyTkuJEnmNHrYGq1Crk=;
        b=U/FmYN89qeQ/7X1WjD2tsmcDNwNWLbvowEL4UvNLlaxJ9Tsp4bvz2+OArQyIrd5FFp
         TW+kfq74rwk0tdZbkjOfcshnr/Js9QMJBCH11XIOLOg+HEElXAEZp5SB4+939yQ5XNcH
         lSMRBdC3XloP/rMcgXfLwstY0JCpZaiC0sTF2xFiw5ANOZIk4rTw2S86W3A9L3of91aw
         dAlbHCiMmCbzsQC8hM9JjMRbgkri2T1pRqFJETglveelJSZKLaw3z9ThAjNOxrXSEar0
         xoEUhJlgG1gvxEh4RU3Pt+H5fik5B6WFOexQYe8KnJOVbRa0sFTGRI32qXr764Uuy8xo
         1BMg==
X-Gm-Message-State: APjAAAWdlJ+vsEw2z7F9sutXQryBamod4Gfwr6BKLcUp5M3w3R7YACpi
        RIZyxr0A0PDTOQZ4UC1ycki7qa58bEaDkDpH6NmjCQ==
X-Google-Smtp-Source: APXvYqxrvwOC8hdAeBQTzBFvV+4m1/8LoI9OJycQvo2tlxRVMzOvea3iGYP0WphM2H7m5YLhZ0MY9JO/Av1tg6qTITA=
X-Received: by 2002:a37:6c6:: with SMTP id 189mr10426152qkg.179.1575588246451;
 Thu, 05 Dec 2019 15:24:06 -0800 (PST)
MIME-Version: 1.0
References: <3edaf835-7cde-37d9-5a0a-5a9b21a02968@gmx.at> <4dfc2bca-e333-4f05-e795-23cbe481d53e@linux.intel.com>
 <485bd962-2a2d-1e15-54c6-3685fb7597a3@gmx.at> <50ecb110-8ab6-929b-e33e-025e04a12bc8@linux.intel.com>
 <CACeCKaezMBWH+cnmOdOc+hizW3SNU+Sb5h5PWXdt9f2GcOVfFQ@mail.gmail.com> <7da29d7d-836a-8f37-5f07-e180bebcb1ca@gmx.at>
In-Reply-To: <7da29d7d-836a-8f37-5f07-e180bebcb1ca@gmx.at>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Thu, 5 Dec 2019 15:23:55 -0800
Message-ID: <CACeCKacMS1BEL1GLc1T5FcQBPULqyaM3C5cBrq=k31d1-tHDHw@mail.gmail.com>
Subject: Re: Regression: USB/xhci issues on some systems with newer kernel versions
To:     Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org, Hayes Wang <hayeswang@realtek.com>,
        Grant Grundler <grundler@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Bernhard,

Thanks for the response. I just checked and looks like we backported
that patch onto our 4.19 kernel, so it would explain why you aren't
seen the issue on 4.19.

On Thu, Dec 5, 2019 at 3:19 PM Bernhard Gebetsberger
<bernhard.gebetsberger@gmx.at> wrote:
>
> Hi,
>
> The issue I have hasn't been resolved. I'm currently running a custom kernel, with the
> commitf8f80be501aa2f10669585c3e328fad079d8cb3a reverted, which works fine for me. I'm not
> sure if the issue you have is related to mine, because I don't have any issues with 4.19,
> and I'm also using a different driver(rt2800usb).
>
> - Bernhard
>
> Am 05.12.19 um 21:34 schrieb Prashant Malani:
> > Hi Mathias and Bernhard,
> >
> > I was interested in knowing if this issue was resolved (sounded like
> > this was deemed to be a hardware error, but I'm not sure).
> > The reason I ask is that we've recently noticed a similar error
> > popping up while using Realtek rtl8153a-based ethernet USB dongles
> > (these use the r8152 driver) on kernel 4.19 :
> > " hci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to
> > incorrect slot or ep state."
> > This is generally followed by the dongle getting reset, and the
> > process repeats itself continuously.
> >
> > I can share more detailed logs if required. The specific dongle I used
> > was LinkSys USB3GIGV1 (I think the official link is :
> > https://www.linksys.com/us/support-product?pid=01t80000003fwbWAAQ)
> >
> > Some interesting data points:
> > - This issue doesn't manifest itself on kernel 4.4 or 4.14 but does
> > show up on 4.19
> > - This issue didn't manifest itself on 4.19 either before recent
> > changes were incorporated to patch the dongle firmware (commit
> > 9370f2d05a2a150b0aa719a3070b26d478180df3 on the linux mainline
> > branch). After the firmware patching changes went in, 4.19 started
> > exhibiting this issue (4.4 and 4.14 still don't exhibit it).
> >
> > Thanks and Best regards!
> >
> >
> > On Mon, Oct 14, 2019 at 6:01 AM Mathias Nyman
> > <mathias.nyman@linux.intel.com> wrote:
> >> On 3.10.2019 18.13, Bernhard Gebetsberger wrote:
> >>> I sent the instructions to one of the users in the bug tracker.
> >>> Here is the download link for his logs: https://www.sendspace.com/file/413hlj
> >>>
> >> Thanks.
> >> Traces show driver handles the Transaction error normally by issuing a endpoint reset,
> >> which is successful, but after that there is no activity on that endpoint even if there
> >> are over 120 transfers requests (TRB) pending.
> >> After over 40 seconds the class driver starts canceling the pending transfers.
> >>
> >> after soft retry the xhci driver should ring the doorbell of the endpoint, and hardware
> >> should start processing pending TRBs, but ring is not handling pending TRBs
> >> Looks like either driver or hardware fails to start the endpoint ring again
> >>
> >> I'll add some more tracing to check driver correctly rings the endpoint doorbell.
> >>
> >>
> >> Details of trace:
> >>
> >> -Several TRBs (over 120) queued for slot 4 ep 3 (ep1in-bulk), starting at 0xff2d1000, up to 0xff2d1800 (0x10 per TRB)
> >>
> >>    164.884097: xhci_urb_enqueue: ep1in-bulk: urb 000000005ebe7973 pipe 3221259648 slot 4 length 0/3860 sgs 0/0 stream 0 flags 00010200
> >>    164.884099: xhci_queue_trb: BULK: Buffer 00000000f9e2304c length 3860 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
> >>    164.884101: xhci_inc_enq: BULK 00000000be510b60: enq 0x00000000ff2d1010(0x00000000ff2d1000) deq 0x00000000ff2d1000(0x00000000ff2d1000)
> >>    ...
> >>    164.884304: xhci_urb_enqueue: ep1in-bulk: urb 00000000fee4e260 pipe 3221259648 slot 4 length 0/3860 sgs 0/0 stream 0 flags 00010200
> >>    164.884304: xhci_queue_trb: BULK: Buffer 00000000ff3a304c length 3860 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
> >>    164.884304: xhci_inc_enq: BULK 00000000be510b60: enq 0x00000000ff2d1800(0x00000000ff2d1000) deq 0x00000000ff2d1000(0x00000000ff2d1000)
> >>
> >> -Transaction error 3 seconds later for TRB at 0xff2d1000
> >>
> >>    167.578273: xhci_handle_event: EVENT: TRB 00000000ff2d1000 status 'USB Transaction Error' len 3860 slot 4 ep 3 type 'Transfer Event' flags e:c
> >>    167.578288: xhci_handle_transfer: BULK: Buffer 00000000f9e2304c length 3860 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
> >>
> >> -Soft retry by issuing a host side reset endpoint command,
> >>
> >>    167.578297: xhci_queue_trb: CMD: Reset Endpoint Command: ctx 0000000000000000 slot 4 ep 3 flags C
> >>    167.578416: xhci_handle_event: EVENT: TRB 00000000ffefe440 status 'Success' len 0 slot 4 ep 0 type 'Command Completion Event' flags e:c
> >>
> >> -Host side of endpoint reset successful, endpoint is in stopped state as it should
> >>
> >>    167.578417: xhci_handle_command: CMD: Reset Endpoint Command: ctx 0000000000000000 slot 4 ep 3 flags C
> >>    167.578419: xhci_handle_cmd_reset_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst
> >>
> >> -Driver should ring endpoint doorbell, and hardware should continue procressing TRBs
> >> No activity at all on slot 4 ep 3, other endpoints continue running normally.
> >> Check driver really rang ep doorbell
> >>
> >> A lot later class driver asks to cancel pending tranfer:
> >>
> >>    214.132531: xhci_urb_dequeue: ep1in-bulk: urb 000000005ebe7973 pipe 3221259648 slot 4 length 0/3860 sgs 0/0 stream 0 flags 00010200
> >>    214.132548: xhci_dbg_cancel_urb: Cancel URB 000000005ebe7973, dev 2, ep 0x81, starting at offset 0xff2d1000
> >>
> >> -xhci driver tries to stop endpoint to cancel transfer:
> >>
> >>    214.132555: xhci_queue_trb: CMD: Stop Ring Command: slot 4 sp 0 ep 3 flags C
> >>
> >> -but it fails as slot is not in a proper state to be stopped, ep is in halted state after failed stop attempt.
> >>
> >>    214.132679: xhci_handle_event: EVENT: TRB 00000000ffefe450 status 'Context State Error' len 0 slot 4 ep 0 type 'Command Completion Event' flags e:C
> >>    214.132680: xhci_handle_command: CMD: Stop Ring Command: slot 4 sp 0 ep 3 flags C
> >>    214.132682: xhci_handle_cmd_stop_ep: State halted mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 0 maxp 512
> >>
> >> -After this endpoint stays in halted state, xhci driver fails to recover from this while canceling the reset of the TRBs
> >>
> >> -Mathias

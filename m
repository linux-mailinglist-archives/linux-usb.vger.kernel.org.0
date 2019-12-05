Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7B1114823
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 21:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729154AbfLEUey (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 15:34:54 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:37870 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfLEUey (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 15:34:54 -0500
Received: by mail-qk1-f195.google.com with SMTP id m188so4545980qkc.4
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2019 12:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6gcGtnBlOf+ls3FzK3p7JaxUDQ5Arj8td1MhTaaQb1U=;
        b=dZ6GvyLYIaNi9W/NVFO2TzBdLoBewvA4AXmDU7FuJzWtoiKiWEKRflOwol3HOapgxi
         j3UFp2XvyVSPyT9/drA/CxOiOJkg5TKjszrSH4d3S09sesWwpwqNWkAzGKqkV1/U05ZL
         xylGSB8yhbUeZ2NjnaAAVaka0XRvPg77W8/W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6gcGtnBlOf+ls3FzK3p7JaxUDQ5Arj8td1MhTaaQb1U=;
        b=Aa0bmAAI/QuVfpIYbz295QmjXfN9Ocj4uzn/vhC/+H/9n/rTMs5a4tWiKdGq54iHk/
         8+pTDJWbfxGsZgvjU4Q7cJ58g6DwHDbaL3ZG1G+UxxflotEcsbVtYn3mQkUy2gHBbgC2
         tS+gQZbe4XHlJA1dhdXeYLcA3Nv/+g2goukC8anmx+E8Ym5tWVndaW9AOnlM0QVA9x1Q
         +89HRJ56KREhrEuUaqusZ9KUuy25BEPxy3RoHkyjyzUrp1Rhytqb7uUMIP99yqBUGE1P
         7Xc9CfHfpzO7xiO/1BWW8ssL3X8+GaoUWpUWo/x7xrqZiGaDZEsIPfEqrJ5tvyf/ypbc
         UQ5A==
X-Gm-Message-State: APjAAAWKXSvrYfFjqNQMo0ZWxub8lbaffTJRlAdGPLclk3s2+hnwoQ0c
        POvNjeNBZw9T5UFxucOQi5c3tTkUldO+3u4LgxXCq8yXaRY=
X-Google-Smtp-Source: APXvYqyBShjpTSpTKuGxMrsmeeoC47zG5vsU4sKPeJEUDCxd3LAUoUxyTQRH3a/DEvldyrtoqypREb5ZukQmYxOTruY=
X-Received: by 2002:a37:6c6:: with SMTP id 189mr9751515qkg.179.1575578092489;
 Thu, 05 Dec 2019 12:34:52 -0800 (PST)
MIME-Version: 1.0
References: <3edaf835-7cde-37d9-5a0a-5a9b21a02968@gmx.at> <4dfc2bca-e333-4f05-e795-23cbe481d53e@linux.intel.com>
 <485bd962-2a2d-1e15-54c6-3685fb7597a3@gmx.at> <50ecb110-8ab6-929b-e33e-025e04a12bc8@linux.intel.com>
In-Reply-To: <50ecb110-8ab6-929b-e33e-025e04a12bc8@linux.intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Thu, 5 Dec 2019 12:34:41 -0800
Message-ID: <CACeCKaezMBWH+cnmOdOc+hizW3SNU+Sb5h5PWXdt9f2GcOVfFQ@mail.gmail.com>
Subject: Re: Regression: USB/xhci issues on some systems with newer kernel versions
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>,
        linux-usb@vger.kernel.org, Hayes Wang <hayeswang@realtek.com>,
        Grant Grundler <grundler@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias and Bernhard,

I was interested in knowing if this issue was resolved (sounded like
this was deemed to be a hardware error, but I'm not sure).
The reason I ask is that we've recently noticed a similar error
popping up while using Realtek rtl8153a-based ethernet USB dongles
(these use the r8152 driver) on kernel 4.19 :
" hci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to
incorrect slot or ep state."
This is generally followed by the dongle getting reset, and the
process repeats itself continuously.

I can share more detailed logs if required. The specific dongle I used
was LinkSys USB3GIGV1 (I think the official link is :
https://www.linksys.com/us/support-product?pid=01t80000003fwbWAAQ)

Some interesting data points:
- This issue doesn't manifest itself on kernel 4.4 or 4.14 but does
show up on 4.19
- This issue didn't manifest itself on 4.19 either before recent
changes were incorporated to patch the dongle firmware (commit
9370f2d05a2a150b0aa719a3070b26d478180df3 on the linux mainline
branch). After the firmware patching changes went in, 4.19 started
exhibiting this issue (4.4 and 4.14 still don't exhibit it).

Thanks and Best regards!


On Mon, Oct 14, 2019 at 6:01 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 3.10.2019 18.13, Bernhard Gebetsberger wrote:
> > I sent the instructions to one of the users in the bug tracker.
> > Here is the download link for his logs: https://www.sendspace.com/file/413hlj
> >
>
> Thanks.
> Traces show driver handles the Transaction error normally by issuing a endpoint reset,
> which is successful, but after that there is no activity on that endpoint even if there
> are over 120 transfers requests (TRB) pending.
> After over 40 seconds the class driver starts canceling the pending transfers.
>
> after soft retry the xhci driver should ring the doorbell of the endpoint, and hardware
> should start processing pending TRBs, but ring is not handling pending TRBs
> Looks like either driver or hardware fails to start the endpoint ring again
>
> I'll add some more tracing to check driver correctly rings the endpoint doorbell.
>
>
> Details of trace:
>
> -Several TRBs (over 120) queued for slot 4 ep 3 (ep1in-bulk), starting at 0xff2d1000, up to 0xff2d1800 (0x10 per TRB)
>
>    164.884097: xhci_urb_enqueue: ep1in-bulk: urb 000000005ebe7973 pipe 3221259648 slot 4 length 0/3860 sgs 0/0 stream 0 flags 00010200
>    164.884099: xhci_queue_trb: BULK: Buffer 00000000f9e2304c length 3860 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
>    164.884101: xhci_inc_enq: BULK 00000000be510b60: enq 0x00000000ff2d1010(0x00000000ff2d1000) deq 0x00000000ff2d1000(0x00000000ff2d1000)
>    ...
>    164.884304: xhci_urb_enqueue: ep1in-bulk: urb 00000000fee4e260 pipe 3221259648 slot 4 length 0/3860 sgs 0/0 stream 0 flags 00010200
>    164.884304: xhci_queue_trb: BULK: Buffer 00000000ff3a304c length 3860 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
>    164.884304: xhci_inc_enq: BULK 00000000be510b60: enq 0x00000000ff2d1800(0x00000000ff2d1000) deq 0x00000000ff2d1000(0x00000000ff2d1000)
>
> -Transaction error 3 seconds later for TRB at 0xff2d1000
>
>    167.578273: xhci_handle_event: EVENT: TRB 00000000ff2d1000 status 'USB Transaction Error' len 3860 slot 4 ep 3 type 'Transfer Event' flags e:c
>    167.578288: xhci_handle_transfer: BULK: Buffer 00000000f9e2304c length 3860 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
>
> -Soft retry by issuing a host side reset endpoint command,
>
>    167.578297: xhci_queue_trb: CMD: Reset Endpoint Command: ctx 0000000000000000 slot 4 ep 3 flags C
>    167.578416: xhci_handle_event: EVENT: TRB 00000000ffefe440 status 'Success' len 0 slot 4 ep 0 type 'Command Completion Event' flags e:c
>
> -Host side of endpoint reset successful, endpoint is in stopped state as it should
>
>    167.578417: xhci_handle_command: CMD: Reset Endpoint Command: ctx 0000000000000000 slot 4 ep 3 flags C
>    167.578419: xhci_handle_cmd_reset_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst
>
> -Driver should ring endpoint doorbell, and hardware should continue procressing TRBs
> No activity at all on slot 4 ep 3, other endpoints continue running normally.
> Check driver really rang ep doorbell
>
> A lot later class driver asks to cancel pending tranfer:
>
>    214.132531: xhci_urb_dequeue: ep1in-bulk: urb 000000005ebe7973 pipe 3221259648 slot 4 length 0/3860 sgs 0/0 stream 0 flags 00010200
>    214.132548: xhci_dbg_cancel_urb: Cancel URB 000000005ebe7973, dev 2, ep 0x81, starting at offset 0xff2d1000
>
> -xhci driver tries to stop endpoint to cancel transfer:
>
>    214.132555: xhci_queue_trb: CMD: Stop Ring Command: slot 4 sp 0 ep 3 flags C
>
> -but it fails as slot is not in a proper state to be stopped, ep is in halted state after failed stop attempt.
>
>    214.132679: xhci_handle_event: EVENT: TRB 00000000ffefe450 status 'Context State Error' len 0 slot 4 ep 0 type 'Command Completion Event' flags e:C
>    214.132680: xhci_handle_command: CMD: Stop Ring Command: slot 4 sp 0 ep 3 flags C
>    214.132682: xhci_handle_cmd_stop_ep: State halted mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 0 maxp 512
>
> -After this endpoint stays in halted state, xhci driver fails to recover from this while canceling the reset of the TRBs
>
> -Mathias

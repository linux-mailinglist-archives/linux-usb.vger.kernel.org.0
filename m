Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E353FE28B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 20:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244634AbhIASxP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 14:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239574AbhIASxI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Sep 2021 14:53:08 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6FCC061764
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 11:52:07 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id 18so551054pfh.9
        for <linux-usb@vger.kernel.org>; Wed, 01 Sep 2021 11:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sbf/teTkcTse7KRUsjEqIHjpIzQLStMnWn28ldspcAs=;
        b=SIvdDffiIgZk4ci4f9wIl69Mcot7yqIpGiCvURLKYQ5QpxM5nwpwc4l9732E/qhQYd
         EJ+8viZ7H5Akdg4gf7efHvSvZZhf8H4DI+tHtu+OsZ+358DS1EDs5NLfrhzX/nmRiSV5
         JM88RALM61+C2aLH5Ok7Hx8HDA4ZElmC28evr0f4HI4XMKmcP+A7yxg5S//qzNgtLxiz
         Q8XPp1h+zYDIMwa7937oJ12nmWtvOHtsBwjL3F+QRnwntUOkzonp1qAHh2QTdqp1cclH
         pDx11btg8O1qoQH1Ck9rxvvoZNMEEAndOSl6TC0GM9jvPdcRhNrq1C9dnSaIR8UuQt4u
         mPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sbf/teTkcTse7KRUsjEqIHjpIzQLStMnWn28ldspcAs=;
        b=Z6L4Rb2DGC88WiWaL5fKmGMvgblXTnAJoV6el/fCAKAPiPIEHiUSscaE+TJAZebSAz
         tDki/7F4O0JqZlRgAmGadv5JzvrXP4wdSHvTboU/QmlfqYIEU5G38JlBjY7ZIdjfituf
         6vdpdxZnbTv6F9f+4Kudi/YZbeEEpE0eIrpZ36dp+x8KgpvlTdUgLjWyehYdY5/5475N
         wz8DIbvpmwrzaXcPnDwZb0+gNqbaLtZ96BE2hSW9gyCTpu5Z8x/em9iTmsnyhnwsXMXU
         xgXFrKxt2stMSp6n+qUIoo3szkDmDF4H0Dl4OjvVqnBRHWxCOiqGaH+g/3xgZ8m40FQr
         whOg==
X-Gm-Message-State: AOAM533B0oVE56Zey4oUv0J6IxO9YnmDa0bR2khtgPp9TT88Vgzkc7sw
        6928vuSYEASQeYYItJVDg8GRH9oH4PP5zV7amaJ+LrodD/4=
X-Google-Smtp-Source: ABdhPJxSRsvVVRAZC3F+OvzhtgcSVGQucahCWt94PfVjWkwm5HtxVw/ImnpyPUrX8kuzSjO91vcc3CcPmt0gxQqKoiE=
X-Received: by 2002:a63:3503:: with SMTP id c3mr458395pga.393.1630522327255;
 Wed, 01 Sep 2021 11:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210831160259.2392459-1-phil@raspberrypi.com>
 <3830571c-566c-ef13-bc08-60206a634253@linux.intel.com> <f2fa6738-29f1-3434-70f2-7fba0b1b2567@raspberrypi.com>
In-Reply-To: <f2fa6738-29f1-3434-70f2-7fba0b1b2567@raspberrypi.com>
From:   Jonathan Bell <jonathan@raspberrypi.com>
Date:   Wed, 1 Sep 2021 19:51:55 +0100
Message-ID: <CADQZjwee7Zupdd0LVxFBouoiME4t32v6Hr85EAouAvPXi_Targ@mail.gmail.com>
Subject: Re: [PATCH] xhci: guard accesses to ep_state in xhci_endpoint_reset()
To:     Phil Elwell <phil@raspberrypi.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 1 Sept 2021 at 14:15, Phil Elwell <phil@raspberrypi.com> wrote:
>
> Hi Mathias,
>
> On 01/09/2021 10:21, Mathias Nyman wrote:
> > On 31.8.2021 19.02, Phil Elwell wrote:
> >> From: Jonathan Bell <jonathan@raspberrypi.com>
> >>
> >> See https://github.com/raspberrypi/linux/issues/3981
> >
> > Thanks, so in a nutshell the issue looks something like:
> >
> > [827586.220071] xhci_hcd 0000:01:00.0: WARN Cannot submit Set TR Deq Ptr
> > [827586.220087] xhci_hcd 0000:01:00.0: A Set TR Deq Ptr command is pending.
> > [827723.160680] INFO: task usb-storage:93 blocked for more than 122 seconds.
> >
> > The blocked task is probably because xhci driver failed to give back the
> > URB after failing to submit a "Set TR Deq Ptr" command. This part should
> > be fixed in:
> > https://lore.kernel.org/r/20210820123503.2605901-4-mathias.nyman@linux.intel.com
> > which is currently in usb-next, and should be in 5.15-rc1 and future 5.12+ stable.
> >
> >>
> >> Two read-modify-write cycles on ep->ep_state are not guarded by
> >> xhci->lock. Fix these.
> >>
> >
> > This is probably one cause for the "Warn Cannot submit Set TR Deq Ptr A Set TR
> > Deq Ptr command is pending" message.
> > Another possibility is that with UAS and streams we have several transfer rings
> > per endpoint, meaning that if two TDs on separate stream rings on the same
> > endpoint both stall, or are cancelled we could see this message.
> >
> > The SET_DEQ_PENDING flag in ep->ep_state should probably be per ring, not per
> > endpoint. Then we also need a "rings_with_pending_set_deq" counter per endpoint
> > to keep track when all set_tr_deq commands complete, and we can restart the endpoint
>
> Jonathan, the author of the patch, may give some detailed feedback on these
> statements when he has a moment - "Well, sort of... it's complicated" was the
> summary.

The bug in this case was apparent only on usb-storage devices, so no streams.
The testcase in the linked github issue repeatedly invoked smartctl on
a device that didn't
support that particular ATA command so stalled the endpoint.

The unguarded read-modify-write raced with the completion of the Set
TR Deq command
being executed by the controller, and the SET_DEQ_PENDING flag would
get overwritten
with an invalid '1'.

I've not investigated how the xhci driver responds to stalls on stream
endpoints in detail
as I've not seen any user reports of uas active and this error message
appearing, but in
a wider context, getting a stall on a streaming endpoint on a Pi 4
seems to be generally
fatal until the device receives a reset and I've not determined which
of the HCD, controller,
or device is stuck.

Thanks
Jonathan

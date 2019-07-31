Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABEB7C8B2
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2019 18:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbfGaQbS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Jul 2019 12:31:18 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46150 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725209AbfGaQbS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Jul 2019 12:31:18 -0400
Received: by mail-qt1-f195.google.com with SMTP id h21so67155225qtn.13
        for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2019 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ZQklGxmENpxpvbvOZAaCvXzdSyYbTINAkcVFFGOErM=;
        b=S0RpV1lDgm7UVxxPRR6rNB2S7wDnyBoOUrpUYjSTiLFVg3WoUettXfqtVNBMG05uBw
         /6vV4vPCQd9d5g0gyjstjBFt7gjacKIjagRtURZtgvgP/XRCTUkF8R8iU7oztiACdKVI
         /icLHnSPXnW+BvCLXDeWEtJwo94WWy+h7uTadL673iVXcAttoZwxKsADEDCsejQlnt+i
         GX5rErY8QnXwOPvJbg0JENjdlFLPvAGCbminZwN0s+uYukKwhLGcUfKrYeeFYsTwUg2I
         BALfnEHvlFBZnAFXXzbPn8uPIGz8gNUNd3Qp8BE1O4DB991YYyiCIp/4f6zwr3B1x8/Z
         QecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ZQklGxmENpxpvbvOZAaCvXzdSyYbTINAkcVFFGOErM=;
        b=VhS37SSUO2IIqBLVS10usfl8mNK4/OhKNW4jqiMU4/Ex3aVF5amMHn4hfxUbLmB8H3
         EFCkdGPq7+sePW3mGKfHqeihHpPbXVAxzqBqlgfpGWWsvzNF0KCD+8jKlwgj69qm2uIT
         RNPub6yw7dqZG8Vi1PNw6TfrHLt5BvVnVXhLjkcJ0BNOd5qNRNw1BkHENEPvav5II/+g
         9JKaduMeku/J19KEhC2yT4nUp9O1gKMXTNuplLw1sgQLa/+Uvol0RXJH4FBqYYzusUql
         SLV7oO6IVrl4wftxDeqHaj0AGskVK9lSw1NQBcj0Dc1zxYLALt6PYU7Lsu3YTmZxanwn
         npKw==
X-Gm-Message-State: APjAAAWufavB9BKB6j6cLhPCcX5V7Itmk/N1i7RLA0VXaQ1HUR8b6bIP
        aFz/OJlaoqA8xMF3DggDrnBYiPhtSgwTfQJpPjE=
X-Google-Smtp-Source: APXvYqxozNTPxoaWOpHr2aZi78tk8r+9lAdBZVgpUIIeGq4F12GYErMUOkl9k16OrOFvTSFXoJDDiDtejMGXmoqYCyw=
X-Received: by 2002:ac8:2439:: with SMTP id c54mr85207947qtc.160.1564590677078;
 Wed, 31 Jul 2019 09:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <a24f7305-abcc-c2ff-bba0-a02b23e34434@bellsouth.net>
 <20190727105955.GE458@kroah.com> <bd443170-6886-df60-0d05-849fc7229cd7@bellsouth.net>
 <f2ad790f-6ff8-12dd-83fc-6eab89ea98df@linux.intel.com> <CAFqH_50B27aDDURHyoPvdreMUfbh=7cwwhN4AxKdaiZmp=vgdQ@mail.gmail.com>
 <febbec1d-c8e3-daef-6c90-5b1d3e8f06d6@linux.intel.com>
In-Reply-To: <febbec1d-c8e3-daef-6c90-5b1d3e8f06d6@linux.intel.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Wed, 31 Jul 2019 18:31:05 +0200
Message-ID: <CAFqH_53pKrXisvmV6i3LG37M7rdAGjEHy3EyhMC=1P7cE9EEvg@mail.gmail.com>
Subject: Re: Oops in xhci_endpoint_reset
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Bob Gleitsmann <rjgleits@bellsouth.net>,
        Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Missatge de Mathias Nyman <mathias.nyman@linux.intel.com> del dia dc.,
31 de jul. 2019 a les 16:16:
>
> On 31.7.2019 12.18, Enric Balletbo Serra wrote:
> > Hi Mathias,
> >
> > Thanks to look into this.
> >
> > Missatge de Mathias Nyman <mathias.nyman@linux.intel.com> del dia dt.,
> > 30 de jul. 2019 a les 21:39:
> >>
> >> On 27.7.2019 23.43, Bob Gleitsmann wrote:
> >>> OK, here's the result of the bisection:
> >>>
> >>> ef513be0a9057cc6baf5d29566aaaefa214ba344 is the first bad commit
> >>> commit ef513be0a9057cc6baf5d29566aaaefa214ba344
> >>> Author: Jim Lin <jilin@nvidia.com>
> >>> Date:???? Mon Jun 3 18:53:44 2019 +0800
> >>>
> >>> ?????? usb: xhci: Add Clear_TT_Buffer
> >>> ??????
> >>> ?????? USB 2.0 specification chapter 11.17.5 says "as part of endpoint halt
> >>> ?????? processing for full-/low-speed endpoints connected via a TT, the host
> >>> ?????? software must use the Clear_TT_Buffer request to the TT to ensure
> >>> ?????? that the buffer is not in the busy state".
> >>> ??????
> >>> ?????? In our case, a full-speed speaker (ConferenceCam) is behind a high-
> >>> ?????? speed hub (ConferenceCam Connect), sometimes once we get STALL on a
> >>> ?????? request we may continue to get STALL with the folllowing requests,
> >>> ?????? like Set_Interface.
> >>> ??????
> >>> ?????? Here we invoke usb_hub_clear_tt_buffer() to send Clear_TT_Buffer
> >>> ?????? request to the hub of the device for the following Set_Interface
> >>> ?????? requests to the device to get ACK successfully.
> >>> ??????
> >>> ?????? Signed-off-by: Jim Lin <jilin@nvidia.com>
> >>> ?????? Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> >>> ?????? Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>>
> >>> ??drivers/usb/host/xhci-ring.c | 27 ++++++++++++++++++++++++++-
> >>> ??drivers/usb/host/xhci.c?????????? | 21 +++++++++++++++++++++
> >>> ??drivers/usb/host/xhci.h?????????? |?? 5 +++++
> >>> ??3 files changed, 52 insertions(+), 1 deletion(-)
> >>>
> >>>
> >>
> >> Thanks, a quick look doesn't immediately open up the cause to me.
> >> Most likely an endpoint or struct usb_device got dropped and freed at suspend/resume,
> >> but we probably have some old stale pointer still in a a TD or URB to it.
> >>
> >> could you apply the hack below, it should show more details about this issue.
> >>
> >> grep for "Mathias" after resume, if you find it we just prevented a crash.
> >>
> >
> > With the below patch the oops disappears and the reason is
> >
> > root@debian:~# dmesg | grep "Mathias"
> > [   67.747933] xhci-hcd xhci-hcd.8.auto: Mathias: No vdev for slot id 0
> >
>
> Ok, thanks,
> When we free the xhci virt_dev the udev->slot_is set to zero as well.
> Looks like whole xHCI was reset are resume:
>
> [ 2994.539409] usb usb8: root hub lost power or was reset
> [ 2994.539411] usb usb9: root hub lost power or was reset
>
> This means that xHC controller was reset and xhci driver re-allocated everything.
>
> It makes sense to check that xhci virt_device exists in the endpoint reset callback.
> This will fix the oops, but I'm still missing the big picture, how we ended up here.
>
> Would it be possible for you to take traces and logs with the previous patch  that prevents
> the oops, but shows the "Mathias: No vdev for slot id 0" message?
>

Sure, here is:

dmesg: https://paste.debian.net/1093737/
traces: https://drive.google.com/open?id=1So-_zsu8ROtMH08hYVKIAZfr_51QLUPD

Thanks,
~ Enric




> -Mathias

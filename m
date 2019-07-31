Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7827BCC4
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2019 11:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbfGaJST (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Jul 2019 05:18:19 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:37878 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbfGaJSS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Jul 2019 05:18:18 -0400
Received: by mail-qk1-f194.google.com with SMTP id d15so48650958qkl.4
        for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2019 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q6nM4bcHDdyrDcCps2NAV5dG1yMeizGtYY0JY5qG8HQ=;
        b=b1/9CFCbIfdX0nOzRLYfsT1Y3Wg+HTtd+INVuUvmYArlPshmCi5xY1ftjUle1koDoL
         AKaB8PhJiXxrNU37+npfdNfH2nKUwLKfJNtv5Pci+Bhfwpv58kEKPbzBZgs5WkfhR0FT
         MmejJG9XUpiXQOnPKrz1DpXt+PZHaVO9ct0rBu4Y1Bxf0x9PK6FcSvCVLKAZLbpzRnxV
         1ZpkP++57GgdbFJQdtngEt3FR+2NR0ZncEC76zLhU9jEl1SMn45BFSMaUkcWGvf5ZplL
         kUVXiIwdrhey4/PXuG9QINW0rpiwqsLJOVdYpEbO9DXLp6zZFsdM0CHhka+0fCGwiGwU
         YuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q6nM4bcHDdyrDcCps2NAV5dG1yMeizGtYY0JY5qG8HQ=;
        b=rmSyJGNg8vnGyX7SkpGNLPMGpGFL2mPjybtDMJnw/DZXrh5p76iEFYKYT2vECJ1h4b
         uGyeK1IPtOH3hbjGIGp0Kx9NLqxul6Y6XZwn0up2HHgmONZfeKTIWdG4pmibxCZdPA5h
         csfpcSnSyC6uEdgFBu6hvFzSzU4AXUeYbbvARVsCdP16WUjUC3bFLfi8DJJ+cLO97FdH
         sztWLhFIbOUBvSekfQX9AJkczM7z3EAjxH27O7tiMRRUIp8x+VtY7Aew7z/86d7hv6Op
         JUgjqSfO5hEQB1R5fH9NutR6vkXQR0x+/kj+aKGWsUMBb0gPbInWS46Hbo0SFoIqQ0ZN
         Sv0g==
X-Gm-Message-State: APjAAAWrBWdnrJ4N1TahFYVoQuKzM3UCOcNQbXfWadr6ZKFDp8YJynpF
        6LVn2dUt3AeIE7mUEddxQZYLM4lfJIQlAvFxEk4=
X-Google-Smtp-Source: APXvYqwV72BdVY5G55vV1yOud7QOl0/1Bm9YmLCzMJX9J8kwqXvoO+R4L7860Q5TQrEjHX9IWBJl1SalLnu509+x7Vw=
X-Received: by 2002:a05:620a:15b3:: with SMTP id f19mr77598322qkk.314.1564564697638;
 Wed, 31 Jul 2019 02:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <a24f7305-abcc-c2ff-bba0-a02b23e34434@bellsouth.net>
 <20190727105955.GE458@kroah.com> <bd443170-6886-df60-0d05-849fc7229cd7@bellsouth.net>
 <f2ad790f-6ff8-12dd-83fc-6eab89ea98df@linux.intel.com>
In-Reply-To: <f2ad790f-6ff8-12dd-83fc-6eab89ea98df@linux.intel.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Wed, 31 Jul 2019 11:18:06 +0200
Message-ID: <CAFqH_50B27aDDURHyoPvdreMUfbh=7cwwhN4AxKdaiZmp=vgdQ@mail.gmail.com>
Subject: Re: Oops in xhci_endpoint_reset
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Bob Gleitsmann <rjgleits@bellsouth.net>,
        Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

Thanks to look into this.

Missatge de Mathias Nyman <mathias.nyman@linux.intel.com> del dia dt.,
30 de jul. 2019 a les 21:39:
>
> On 27.7.2019 23.43, Bob Gleitsmann wrote:
> > OK, here's the result of the bisection:
> >
> > ef513be0a9057cc6baf5d29566aaaefa214ba344 is the first bad commit
> > commit ef513be0a9057cc6baf5d29566aaaefa214ba344
> > Author: Jim Lin <jilin@nvidia.com>
> > Date:???? Mon Jun 3 18:53:44 2019 +0800
> >
> > ?????? usb: xhci: Add Clear_TT_Buffer
> > ??????
> > ?????? USB 2.0 specification chapter 11.17.5 says "as part of endpoint halt
> > ?????? processing for full-/low-speed endpoints connected via a TT, the host
> > ?????? software must use the Clear_TT_Buffer request to the TT to ensure
> > ?????? that the buffer is not in the busy state".
> > ??????
> > ?????? In our case, a full-speed speaker (ConferenceCam) is behind a high-
> > ?????? speed hub (ConferenceCam Connect), sometimes once we get STALL on a
> > ?????? request we may continue to get STALL with the folllowing requests,
> > ?????? like Set_Interface.
> > ??????
> > ?????? Here we invoke usb_hub_clear_tt_buffer() to send Clear_TT_Buffer
> > ?????? request to the hub of the device for the following Set_Interface
> > ?????? requests to the device to get ACK successfully.
> > ??????
> > ?????? Signed-off-by: Jim Lin <jilin@nvidia.com>
> > ?????? Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > ?????? Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > ??drivers/usb/host/xhci-ring.c | 27 ++++++++++++++++++++++++++-
> > ??drivers/usb/host/xhci.c?????????? | 21 +++++++++++++++++++++
> > ??drivers/usb/host/xhci.h?????????? |?? 5 +++++
> > ??3 files changed, 52 insertions(+), 1 deletion(-)
> >
> >
>
> Thanks, a quick look doesn't immediately open up the cause to me.
> Most likely an endpoint or struct usb_device got dropped and freed at suspend/resume,
> but we probably have some old stale pointer still in a a TD or URB to it.
>
> could you apply the hack below, it should show more details about this issue.
>
> grep for "Mathias" after resume, if you find it we just prevented a crash.
>

With the below patch the oops disappears and the reason is

root@debian:~# dmesg | grep "Mathias"
[   67.747933] xhci-hcd xhci-hcd.8.auto: Mathias: No vdev for slot id 0


> also adding more xhci debugging and tracing would help:
>
> mount -t debugfs none /sys/kernel/debug
> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> < suspend/resume >
> Send output of dmesg
> Send content of /sys/kernel/debug/tracing/trace
>

Unfortunately, when the oops happens the machine is unresponsive :-(

Thanks,
~ Enric


> 8<---
>
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 9741cde..98a515c 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -1809,14 +1809,33 @@ struct xhci_segment *trb_in_td(struct xhci_hcd *xhci,
>   static void xhci_clear_hub_tt_buffer(struct xhci_hcd *xhci, struct xhci_td *td,
>                  struct xhci_virt_ep *ep)
>   {
> +       struct usb_device *udev;
> +
>          /*
>           * As part of low/full-speed endpoint-halt processing
>           * we must clear the TT buffer (USB 2.0 specification 11.17.5).
>           */
> +
>          if (td->urb->dev->tt && !usb_pipeint(td->urb->pipe) &&
>              (td->urb->dev->tt->hub != xhci_to_hcd(xhci)->self.root_hub) &&
>              !(ep->ep_state & EP_CLEARING_TT)) {
> +               udev = td->urb->dev;
> +               if (!udev) {
> +                       xhci_err(xhci, "Mathias: missing udev\n");
> +                       return;
> +               }
> +               if (!udev->slot_id)  {
> +                       xhci_err(xhci, "Mathias: missing udev->slot_id\n");
> +                       return;
> +               }
> +
> +               if (!xhci->devs[udev->slot_id])  {
> +                       xhci_err(xhci, "Mathias: missing xhci->devs[udev->slot_id]\n");
> +                       return;
> +               }
>                  ep->ep_state |= EP_CLEARING_TT;
> +               xhci_err(xhci, "urb->ep->hcpriv %p,  urb->hcpriv %p\n",
> +                        td->urb->ep->hcpriv, td->urb->dev);
>                  td->urb->ep->hcpriv = td->urb->dev;
>                  if (usb_hub_clear_tt_buffer(td->urb))
>                          ep->ep_state &= ~EP_CLEARING_TT;
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 248cd7a..d7978e0 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -3090,8 +3090,19 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
>          udev = (struct usb_device *) host_ep->hcpriv;
>          vdev = xhci->devs[udev->slot_id];
>          ep_index = xhci_get_endpoint_index(&host_ep->desc);
> +
> +       if (!vdev) {
> +               xhci_warn(xhci, "Mathias: No vdev for slot id %d\n", udev->slot_id);
> +               return;
> +       }
>          ep = &vdev->eps[ep_index];
>
> +       if (!ep) {
> +               xhci_warn(xhci, "Mathias: No ep for slot %d ep_index %d\n",
> +                         udev->slot_id, ep_index);
> +               return;
> +       }
> +
>          /* Bail out if toggle is already being cleared by a endpoint reset */
>          if (ep->ep_state & EP_HARD_CLEAR_TOGGLE) {
>                  ep->ep_state &= ~EP_HARD_CLEAR_TOGGLE;
>

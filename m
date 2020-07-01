Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1817C21020B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 04:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgGAC1L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jun 2020 22:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGAC1K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jun 2020 22:27:10 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B83C061755
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2020 19:27:10 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id o3so2323381ilo.12
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2020 19:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9y5ChQXIg14Rw1nH836f+pZzZbc7BKn8u0EzY0RfquQ=;
        b=SwliL6X6yswoNNFxWZqpe7qc+t85LgeYUBM+oliAzMVDdKxydVkUZShl+UIFtjREG5
         HSKtqq3/Tztt1w4S/VeBnk1Mq5T616UQDbIziq1JRNFLNGlvfi/ERbPsRf2Eq0IOdv+Q
         b5fUr1KIAFCP0yVBMhzM2kjEAjoBsd/TcEdjSI0c/U4UG30PZGDJAd7w+DJAHYSJbYXQ
         BUNM39X9KiOkZGx3ucLPNzfZ14oo0N/UdLLgcSafk5aOKcZO9Nbx9xCyVD21iuWa/1fA
         LI/qhg+Ny5IN5FB7ezGv7vt/68e3GJ1jn+dbg8vKUJYhRY+X3yi3Dd5Gt/2NNTZ9oFk3
         dokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9y5ChQXIg14Rw1nH836f+pZzZbc7BKn8u0EzY0RfquQ=;
        b=seSBOCYFeO2RqPi19I3+mw+z89/xQYRh2eQndB+Lcchd9B/ewJWWAcKL2J8HAEa+Lo
         7fxbYsyCtJZE1Gr98W7uRdGaM9G3p0OI+bgybT4gZY9LQoKk71xre5+rVg3CznlNUHis
         MpvTzTcJJSDWdj5nriRoDi/JvbTSIlC74HhDZ8YNdKgyAgUNTAzKINZwxuAJOfDr0tx1
         5zPYJr6hCmzk9ri3jWwRQ+45NWZou2Y0WXflb2GQWr3E3JbiOuZuhD0H5W2k7ERiQ18G
         SS6rsWaWg/t5b1UWdQNA/vSpvH+rFVGC8PiE8KMwsW5QX9/lrVSZUb+bLsVY+m3XYeUW
         iw4A==
X-Gm-Message-State: AOAM5336YO5ANxE3rEhYtM4gt3AvPj98EOG3BSgwqLdub8+hCpfsCRLW
        ohPZoJJUZA5T/yuDLO4UMY0jjWth9wv2pDuGMoU=
X-Google-Smtp-Source: ABdhPJycZ212Z4ZTZrVQnBBjDruSU+29nclbIWgGYX3Ms9CdB2hIGcLDd9L86h0t8ISfeONkJctGpBuBZlDc9bUo0IQ=
X-Received: by 2002:a05:6e02:926:: with SMTP id o6mr5815434ilt.239.1593570429228;
 Tue, 30 Jun 2020 19:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200629132206.3914-1-m.grzeschik@pengutronix.de>
 <20200629132206.3914-2-m.grzeschik@pengutronix.de> <20d3ff88-b4df-91e7-aaa6-ec05917c32ab@synopsys.com>
 <20200630071337.GJ21325@pengutronix.de>
In-Reply-To: <20200630071337.GJ21325@pengutronix.de>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Wed, 1 Jul 2020 10:26:56 +0800
Message-ID: <CAL411-p19PX+utRb=x-pfBqXPjpHz54BO5OzdZVAuLQKjKxH5A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 30, 2020 at 3:15 PM Michael Grzeschik <mgr@pengutronix.de> wrote:
>
> On Mon, Jun 29, 2020 at 09:20:02PM +0000, Thinh Nguyen wrote:
> >Hi,
> >
> >Michael Grzeschik wrote:
> >> From: Michael Olbrich <m.olbrich@pengutronix.de>
> >>
> >> Currently __dwc3_gadget_start_isoc must be called very shortly after
> >> XferNotReady. Otherwise the frame number is outdated and start transfer
> >> will fail, even with several retries.
> >>
> >> DSTS provides the lower 14 bit of the frame number. Use it in combination
> >> with the frame number provided by XferNotReady to guess the current frame
> >> number. This will succeed unless more than one 14 rollover has happened
> >> since XferNotReady.
> >>
> >> Start transfer might still fail if the frame number is increased
> >> immediately after DSTS is read. So retries are still needed.
> >> Don't drop the current request if this happens. This way it is not lost and
> >> can be used immediately to try again with the next frame number.
> >>
> >> With this change, __dwc3_gadget_start_isoc is still not successfully in all
> >> cases bit it increases the acceptable delay after XferNotReady
> >> significantly.
> >>
> >> Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
> >> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> >> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> >>
> >> ---
> >> v1 -> v2: - removed last_frame_number from struct
> >>            - included rollover variable
> >> v2 -> v3: - moved the calculation before the retry loop
> >>            - skipping the calculation if bInterval > 14
> >>
> >>   drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++
> >>   1 file changed, 19 insertions(+)
> >>
> >> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> >> index 8de6f10d335e1c0..7ad85a7d06f70bf 100644
> >> --- a/drivers/usb/dwc3/gadget.c
> >> +++ b/drivers/usb/dwc3/gadget.c
> >> @@ -1463,6 +1463,7 @@ static int dwc3_gadget_start_isoc_quirk(struct dwc3_ep *dep)
> >>
> >>   static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
> >>   {
> >> +    const struct usb_endpoint_descriptor *desc = dep->endpoint.desc;
> >>      struct dwc3 *dwc = dep->dwc;
> >>      int ret;
> >>      int i;
> >> @@ -1480,6 +1481,24 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
> >>                      return dwc3_gadget_start_isoc_quirk(dep);
> >>      }
> >>
> >> +    if (desc->bInterval <= 14) {
> >> +            u32 frame = __dwc3_gadget_get_frame(dwc);
> >> +            bool rollover = frame < (dep->frame_number & 0x3fff);
> >> +
> >> +            /*
> >> +             * frame_number is set from XferNotReady and may be already
> >> +             * out of date. DSTS only provides the lower 14 bit of the
> >> +             * current frame number. So add the upper two bits of
> >> +             * frame_number and handle a possible rollover.
> >> +             * This will provide the correct frame_number unless more than
> >> +             * rollover has happened since XferNotReady.
> >> +             */
> >> +
> >> +            dep->frame_number = (dep->frame_number & ~0x3fff) | frame;
> >> +            if (rollover)
> >> +                    dep->frame_number += BIT(14);
> >> +    }
> >> +
> >>      for (i = 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
> >>              dep->frame_number = DWC3_ALIGN_FRAME(dep, i + 1);
> >>
> >
> >I think it's cleaner to create a mask for 0x3fff, but I can see how it
> >can arguably clearer for not using a macro also. It's fine to me either way.
>
> This mask is used on many usb controllers and
> everyone is defining their own.
>
> drivers/usb/gadget/udc/mv_udc.h
> 34:#define USB_FRINDEX_MASKS    0x3fff
>
> drivers/usb/gadget/udc/fsl_usb2_udc.h
> 116:#define     USB_FRINDEX_MASKS                       0x3fff
>
>
> Even other drivers using the mask without defining it:
>
> drivers/usb/misc/ftdi-elan.c
> 2224:   hc_fminterval &= 0x3fff;
> 2313:                              ((9 *hc_fminterval) / 10) & 0x3fff);
>
> drivers/usb/chipidea/udc.c
> 1634:   ret = hw_read(ci, OP_FRINDEX, 0x3fff);

Hi Michael,

I can't find the above code for chipidea, where did you get?
The frame index value register is a standard EHCI register,
but for UDC, it is not a common register. UDC design is varied
for vendors.

Peter

>
> drivers/usb/dwc3/gadget.c
> 1406:           test_frame_number = dep->frame_number & 0x3fff;
> 1453:   dep->frame_number &= 0x3fff;
>
> drivers/usb/host/ohci-hcd.c
> 557:            ohci->fminterval = val & 0x3fff;
>
> drivers/usb/host/xhci-ring.c
> 3980:   start_frame &= 0x3fff;
>
> drivers/usb/host/ohci-dbg.c
> 635:                    rdata & 0x3fff);
> 641:                    rdata & 0x3fff);
> 647:                    rdata & 0x3fff);
>
> drivers/usb/host/u132-hcd.c
> 1535:          ((9 * fi) / 10) & 0x3fff);
> 1605:           u132->hc_fminterval = temp & 0x3fff;
>
> drivers/usb/host/ohci.h
> 701:    ohci_writel (ohci, ((9 * fi) / 10) & 0x3fff,
>
> I could write a patch changing them all or at least
> make a common gadget define.
>
> What could be a common place for that?
>
> On device level only it could be include/linux/usb/gadget.h
> On whole usb level this could be include/uapi/linux/usb/ch9.h
>
> Ideas?
>
> >For both patches in this series:
> >Reviewed-by: Thinh Nguyen <thinhn@synopsys.com>
> >
> >Thanks,
> >Thinh
>
> Thanks!
> Michael
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

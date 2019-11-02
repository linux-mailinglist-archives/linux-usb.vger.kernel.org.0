Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8869ED042
	for <lists+linux-usb@lfdr.de>; Sat,  2 Nov 2019 19:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfKBSj7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Nov 2019 14:39:59 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:33427 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbfKBSj7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Nov 2019 14:39:59 -0400
Received: by mail-il1-f194.google.com with SMTP id m5so2257045ilq.0;
        Sat, 02 Nov 2019 11:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l2fsnuICpf2pNNr/nY6h2uctFmb9QvtxpW7xlEFudDU=;
        b=dkTpji8Cw4WXyrJP4yYJWQQFrK95lJn5Eu5PUGSLFhUZIQojew3wght6UOl/vrWlHR
         hDYSp/nv8EbyUmnPNkGgjPz9KmH7rlzw2AwrLlVDfiv36BvMXsacDE1p1OiRQViygjzY
         cnaSMggydoJvuAEtgFQg9Fu2huPvulr2qOWI/F2FRPU1EFEdC1WBECpn9RvR5ljxahE1
         lavNq+SHWrlIXsRlNNrI4yERoYjLxyarlanoGVYNbnWbvXLgCE0HmBvfUbQ+mKbYxMlQ
         aaaRI3iJZYQev4krI7RV41ID82tPnUd0PastOp9ANFy+lGsLvDqz9ZfKr8p1o6Ip/CAm
         6RgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l2fsnuICpf2pNNr/nY6h2uctFmb9QvtxpW7xlEFudDU=;
        b=i/tlB5orwqzOJlrPgpbhxzF1s4x4sf4KJUms//2AI47UgYVkFOo399WKzv7eYyh19V
         F51GTo0gtGwZ0faXd95AQQY4FjbJkPXEweC4EEfiyZScFZIKNhy064HrLvG5DVyNbtJ6
         cBWjiSBEbcQSpEv1nlh2El1ZOz9OqU2RFMEmtluuObNdxyXMLWxZB7eJfuxKxJ+S6A2M
         JjzmaNwAYE5ZyIkNJfBtJS0wzhCokMulxPwFLWwgHj4bOFVZovSLrIyZ7za6q6e4jWga
         Sk7IffL8VBoUCfHJi/wNpc8K7R9M31T3sBu4EqEGXvU7T6Nu/Pbod2x3qOS+97Si+pR1
         QioQ==
X-Gm-Message-State: APjAAAUNfzTrCdWvLE0WBYkhiOPzexwZiiPmDuPW5LeNw8xSWd8A1JYK
        zVs0txXj2MAacUaV8uzJopnrTCuUTh0Cmc0bN4k=
X-Google-Smtp-Source: APXvYqybbgLfcpLhrNmNbOgUk0sLsrbyBRobbpwCyWFxgd+8u2bZU+AJBu46b12talFHHzNQvJf7fVQ2MdkmJngC0kw=
X-Received: by 2002:a92:108f:: with SMTP id 15mr20341398ilq.250.1572719996909;
 Sat, 02 Nov 2019 11:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191102172606.26934-1-pbrobinson@gmail.com> <20191102174345.GB3862867@ulmo>
In-Reply-To: <20191102174345.GB3862867@ulmo>
From:   Peter Robinson <pbrobinson@gmail.com>
Date:   Sat, 2 Nov 2019 18:39:45 +0000
Message-ID: <CALeDE9PChT-A6JP6kZVmgSs9mHQtqUw0EPCGjQ-VK0arBjGBgg@mail.gmail.com>
Subject: Re: [PATCH] usb: host: xhci-tegra: set MODULE_FIRMWARE for tegra186
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 2, 2019 at 5:43 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Sat, Nov 02, 2019 at 05:26:06PM +0000, Peter Robinson wrote:
> > Set the MODULE_FIRMWARE for tegra186, it's registered for 124/210 and
> > ensures the firmware is available at the appropriate time such as in
> > the initrd, else if the firmware is unavailable the driver fails with
> > the following errors:
>
> So the MODULE_FIRMWARE macro alone does not ensure that the firmware is
> in the correct location, right? Rather, it's the tools that construct
> the initial ramdisk that make use of the information added by the
> MODULE_FIRMWARE macro to determine whether or not the firmware needs to
> be included in the initial ramdisk or not.

It works for tegra124 and tegra210, the patches for tegra194 have it
as well, I have no idea why it was left out for the tegra186. On
Fedora the 124/210 firmwares get pulled into the initrd when the
xhci_tegra and deps do but the 186 doesn't, if you "rmmod xhci_tegra;
modprobe xhci_tegra" once booted it works fine.

> > tegra-xusb 3530000.usb: Direct firmware load for nvidia/tegra186/xusb.bin failed with error -2
> > tegra-xusb 3530000.usb: failed to request firmware: -2
> > tegra-xusb 3530000.usb: failed to load firmware: -2
> > tegra-xusb: probe of 3530000.usb failed with error -2
> >
> > Fixes: 5f9be5f3f899 ("usb: host: xhci-tegra: Add Tegra186 XUSB support")
> > Fixes: 488a04d4bb2f ("arm64: tegra: Enable XUSB host controller on Jetson TX2")
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >  drivers/usb/host/xhci-tegra.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> The commit message is slightly misleading, but I guess it's ultimately
> correct if you run standard tools to generate the initial ramdisk, so:
>
> Acked-by: Thierry Reding <treding@nvidia.com>
>
> > diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> > index 2ff7c911fbd0..d25aba8fa219 100644
> > --- a/drivers/usb/host/xhci-tegra.c
> > +++ b/drivers/usb/host/xhci-tegra.c
> > @@ -1433,6 +1433,7 @@ static const struct tegra_xusb_soc tegra186_soc = {
> >       .scale_ss_clock = false,
> >       .has_ipfs = false,
> >  };
> > +MODULE_FIRMWARE("nvidia/tegra186/xusb.bin");
> >
> >  static const struct of_device_id tegra_xusb_of_match[] = {
> >       { .compatible = "nvidia,tegra124-xusb", .data = &tegra124_soc },
> > --
> > 2.23.0
> >

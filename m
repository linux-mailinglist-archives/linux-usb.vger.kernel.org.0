Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE4CD195FAD
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 21:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgC0U1h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 16:27:37 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34237 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbgC0U1h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Mar 2020 16:27:37 -0400
Received: by mail-ot1-f67.google.com with SMTP id j16so11193723otl.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2020 13:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u4TJK76BpSA9YI3cPtqJdIcnUuqOCgqs6v2serY2DbQ=;
        b=eb2Ch3P3hXfvuPO/NtXJdTY5EusAbCGvDa1iuIphw8sV6QM1Jm/ZXkV0u+5g4eIYRX
         O5tePhHcpDl/L8pHvBCqCkqWF61z6Np5o74RD9D9mb87qqwiBc73tQjy4rfU/0PU65M0
         E/CPRV1KKMV3jXBZMRDAHcrml/PEKjo/ud7/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u4TJK76BpSA9YI3cPtqJdIcnUuqOCgqs6v2serY2DbQ=;
        b=AmSwyJSFRRYkLlX4VLpmoIkPFQg5Q1fuy/HP76XX4XASLPQWbbso2ivHjyzFjDKnFm
         6g8Ds6FGlItMvbW3OvR09BvbwQ7wF5/Hv35PfDNoLYctm7No6LqyYbotHHcjgGPI9Xq0
         pA2jhQ/ypje9njNDRhKq6OKI5A+zsAHylvNU9sRSj0TrKagNA9REL/IQ/2LE1AtwLPSo
         JcG+vI32C3VOjbGDdU58NYnKNh2SlUTy1v4UnOlYimdasCdw0QSNxm4EhA53xFlzItHJ
         8Au8lrddpydIvq+QXQv1eMmVrM6mvCguOZAKZK45WRQs9gI2K1hZvOKjGBTQRmdl+hXY
         T10Q==
X-Gm-Message-State: ANhLgQ1y/Nhzlbahrrh0he/34ll6kO+7EE2LzHy9FAogepc5UAIdCMsH
        dOeMkCWK3vrRlaAs4g5xLhitB3l3k8HimGTOhJkw
X-Google-Smtp-Source: ADFU+vvWncgDuK7mqPalJMSuDUt36PZ7gzoGFMnanqWxRPIm3BvZ3agS44LW94H1HiN69BpTa9f9pXQyPI8ZhInKLEI=
X-Received: by 2002:a9d:1a3:: with SMTP id e32mr422856ote.206.1585340856370;
 Fri, 27 Mar 2020 13:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200313141545.31943-1-alcooperx@gmail.com> <20200313141545.31943-4-alcooperx@gmail.com>
 <20200313150850.GV1922688@smile.fi.intel.com>
In-Reply-To: <20200313150850.GV1922688@smile.fi.intel.com>
From:   Al Cooper <al.cooper@broadcom.com>
Date:   Fri, 27 Mar 2020 16:27:25 -0400
Message-ID: <CAGh=XAA-4b38ViF+7ibM+imUQ+RsaZT=gH9MNAL0ZfccsPc=EQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] usb: ehci: Add new EHCI driver for Broadcom STB SoC's
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        "David S. Miller" <davem@davemloft.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Andy,

I've addressed all you suggestions.
Thanks.

On Fri, Mar 13, 2020 at 11:08 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 13, 2020 at 10:15:44AM -0400, Al Cooper wrote:
> > Add a new EHCI driver for Broadcom STB SoC's. A new EHCI driver
> > was created instead of adding support to the existing ehci platform
> > driver because of the code required to workaround bugs in the EHCI
> > controller.
>
> I'm not sure this is the best approach, but I leave it to maintainers.
>
> By the way, can you list what exactly the difference to the (generic)
> ehci driver?
>
> ...
>
> > +#include <linux/acpi.h>
> > +#include <linux/clk.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/err.h>
> > +#include <linux/kernel.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
>
> ...
>
> > +/* ehci_brcm_wait_for_sof
> > + * Wait for start of next microframe, then wait extra delay microseconds
> > + */
>
> Style is inconsistent even inside this file.
>
> > +static inline void ehci_brcm_wait_for_sof(struct ehci_hcd *ehci, u32 delay)
> > +{
> > +     int frame_idx = ehci_readl(ehci, &ehci->regs->frame_index);
>
> This is not needed if you use do {} while approach.
>
> > +
>
> > +     while (frame_idx == ehci_readl(ehci, &ehci->regs->frame_index))
> > +             ;
>
> Busy loop without even power management taking into consideration?
>
> Infinite loop?
>
> > +     udelay(delay);
> > +}
>
> ...
>
> > +static const struct ehci_driver_overrides brcm_overrides __initconst = {
> > +
>
> > +     .reset =        ehci_brcm_reset,
>
> Indentation issue.
>
> > +     .extra_priv_size = sizeof(struct brcm_priv),
> > +};
>
> ...
>
> > +static int ehci_brcm_probe(struct platform_device *pdev)
> > +{
>
> > +     irq = platform_get_irq(pdev, 0);
> > +     if (irq < 0) {
>
> > +             dev_err(&pdev->dev, "no irq provided");
>
> Duplicate with core message.
>
> > +             return irq;
> > +     }
>
> > +     /* initialize hcd */
> > +     hcd = usb_create_hcd(&ehci_brcm_hc_driver,
> > +                     &pdev->dev, dev_name(&pdev->dev));
>
> At least this one will look much better (and fit one line) when you introduce
>
>         struct device *dev = &pdev->dev;
>
> in the definition block above.
>
> > +     if (!hcd)
> > +             return -ENOMEM;
>
> > +     return err;
> > +}
>
> ...
>
> > +static struct platform_driver ehci_brcm_driver = {
> > +     .probe          = ehci_brcm_probe,
> > +     .remove         = ehci_brcm_remove,
> > +     .shutdown       = usb_hcd_platform_shutdown,
> > +     .driver         = {
>
> > +             .owner  = THIS_MODULE,
>
> Do we need this?
>
> > +             .name   = "ehci-brcm",
> > +             .pm     = &ehci_brcm_pm_ops,
> > +             .of_match_table = brcm_ehci_of_match,
> > +     }
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

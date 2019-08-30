Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60189A3561
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2019 13:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbfH3LGM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Aug 2019 07:06:12 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40262 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbfH3LGM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Aug 2019 07:06:12 -0400
Received: by mail-io1-f67.google.com with SMTP id t6so13109271ios.7
        for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2019 04:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zwNhN1p6avAlABQ0FE3RzGWqr1EKAn8Ee3Sq+b9iapM=;
        b=Fdwy4WjscO6JMK19LicZEN8tlENGXzTGewvH5f2etd/GCjgEQx4txnK9PGiENOCFyx
         BlSxZK9zNyKkxdyrsU61uMtLU6lPRelnTWShqWsFRR4xujDkNSB2QG85UzRPppj4iR8n
         KEMJpDidPP3+uXyRySEdqs7VLty/sofsw0bA+NYTWUIPGvyWbm1IqZvzZVbhHYzffUqb
         Xqjx7BqA6KG3SltCy4IrrXsEEc0FIx+320Mr3UXDu++s4k0xkPy7TgM1dklf0PGxJ0W4
         kRHnrG7ZMO9p9VBe0lyZyFYdWCsVFJ2Qd4lm/IHa2ilgfe61Lknr0WvVcnehwnA0oPk/
         R2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zwNhN1p6avAlABQ0FE3RzGWqr1EKAn8Ee3Sq+b9iapM=;
        b=S/K7W9/gr+tQKLAKOmSmTLlg+uy6Nc3MWSjLhZ5yq7UJXYN+2nP2lelZM8NMjE7v7P
         8+EZnvN0S4RDOdmGjDiFmGw6YTHEhgOCLI6OYqARTt8qw12Mtg7clD9FGfgjlpuJfE6A
         7I2xFdXvql6mrsLiXLyUSec+80JXj5jB1cEy/4LJXpsAEnDFVA0OHYJ143rcnt6czBFi
         P64pARBzGxzS0rvvdalrTosmJNMITlpEcZZ7B9JSEs9+bajkLAG+bpCIcP2AjiH0F4M3
         rv1VNuSPOtDXyQRc5s9SCI8Uw1jgUDUYvjx6oJTHa3U3IpUl9MaqPWrbpigDfyD/wtiv
         qZwA==
X-Gm-Message-State: APjAAAXSL4bvpXOGOS021rJa0uHh/cxhynmAArMF3rRjW6v7fod+KPMF
        bL5eOAf3BHwWmFFEUGW4xM6aNe7eCgX17R8k6LPGJQ==
X-Google-Smtp-Source: APXvYqylm4Up8RXPIhWPT+SgfZH+oQfAZKwEGG5UEhfkqY+YKNGlk/9jA5jsCoU2dyy65GqCzf8nPI9kcZgA8mxnx6A=
X-Received: by 2002:a5d:9746:: with SMTP id c6mr16181879ioo.235.1567163171116;
 Fri, 30 Aug 2019 04:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190830071740.4267-1-brgl@bgdev.pl> <20190830081550.GA25502@ulmo>
In-Reply-To: <20190830081550.GA25502@ulmo>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 30 Aug 2019 13:06:00 +0200
Message-ID: <CAMRc=Mdy-MX6+hsrvErioUg=38s9Hspp7+2mT7nDYbjL9uQ9uQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] regulator: add and use a helper for setting supply names
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

pt., 30 sie 2019 o 10:15 Thierry Reding <thierry.reding@gmail.com> napisa=
=C5=82(a):
>
> On Fri, Aug 30, 2019 at 09:17:36AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > There are ~80 users of regulator bulk APIs that set the supply names
> > in a for loop before using the bulk helpers.
> >
> > This series proposes to add a helper function for setting supply names
> > and uses it in a couple tegra drivers. If accepted: a coccinelle script
> > should be easy to develop that would address this in other drivers.
> >
> > Bartosz Golaszewski (4):
> >   regulator: provide regulator_bulk_set_supply_names()
> >   ahci: tegra: use regulator_bulk_set_supply_names()
> >   phy: tegra: use regulator_bulk_set_supply_names()
> >   usb: host: xhci-tegra: use regulator_bulk_set_supply_names()
> >
> >  drivers/ata/ahci_tegra.c           |  6 +++---
> >  drivers/phy/tegra/xusb.c           |  6 +++---
> >  drivers/regulator/helpers.c        | 21 +++++++++++++++++++++
> >  drivers/usb/host/xhci-tegra.c      |  5 +++--
> >  include/linux/regulator/consumer.h | 12 ++++++++++++
> >  5 files changed, 42 insertions(+), 8 deletions(-)
>
> The diffstat here suggests that this isn't really helpful. Even if you
> subtract the regulator code that adds the new helper, you actually have
> a zero diffstat (and a positive one in one case).
>

You are right when it comes to LoC stats, but bloat-o-meter says it's
quite useful when it comes to actual code size.

This is what we're adding:

$ ./scripts/bloat-o-meter drivers/regulator/helpers.o.old
drivers/regulator/helpers.o
add/remove: 3/0 grow/shrink: 0/0 up/down: 72/0 (72)
Function                                     old     new   delta
regulator_bulk_set_supply_names                -      32     +32
__kstrtab_regulator_bulk_set_supply_names       -      32     +32
__ksymtab_regulator_bulk_set_supply_names       -       8      +8
Total: Before=3D4438, After=3D4510, chg +1.62%

And this is what we're removing just from one driver:

$ ./scripts/bloat-o-meter ./drivers/ata/ahci_tegra.o.old
./drivers/ata/ahci_tegra.o
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-52 (-52)
Function                                     old     new   delta
tegra_ahci_probe                            1688    1636     -52
Total: Before=3D3474, After=3D3422, chg -1.50%

> Instead, why don't we take this one step further and roll a bit more of
> the boilerplate into the new helper, something along these lines:
>
>         struct regulator_bulk_data *
>         devm_regulator_bulk_get_from_names(struct device *dev,
>                                            const char * const *supply_nam=
es,
>                                            unsigned int num_supplies)
>         {
>                 struct regulator_bulk_data *data;
>                 unsigned int i;
>                 int err;
>
>                 data =3D devm_kcalloc(dev, num_supplies, sizeof(*data));
>                 if (!data)
>                         return ERR_PTR(-ENOMEM);
>
>                 for (i =3D 0; i < num_supplies; i++)
>                         data[i].supply =3D supply_names[i];
>
>                 err =3D devm_regulator_bulk_get(dev, num_supplies, data);
>                 if (err < 0)
>                         return ERR_PTR(err);
>
>                 return data;
>         }
>
> That seems to be still a very common pattern and gets rid of a lot more
> boilerplate, so your diffstat will actually start to be negative at some
> point.
>

This looks like a good candidate for the next step, but I'd say this
change is still worth applying.

Bart

> I suppose one could add a non-managed variant for this as well, but I'm
> counting 6 uses of regulator_bulk_get() vs. ~140 uses of the managed
> variant, so I'm not sure it's worth it.
>
> Thierry

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54714C4A3D
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 11:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfJBJJg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 05:09:36 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34174 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfJBJJg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 05:09:36 -0400
Received: by mail-io1-f66.google.com with SMTP id q1so55244321ion.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 02:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hlThU/0+3HTSxVJIpbAfEl3+62sbcU01NeSU7eG4LqY=;
        b=IV1QR0NXPUhoMOjxwHh18ibizuWPQ+4/OYrnffr2ZXKuvvWAf9gmljv0v7HkbZEiVt
         zARhx2Xi6V3Nma7orMBFSNGs/EK8tnXF2zJKtrGR34m4X9Sia9oZtwTdZ9YW68LPKN7a
         sxBQJcC+4R6XsKKVlRNkM/0/FBQ7Y/7hFIrNmvYAlvyHYVprDoSwhQ4lMamuwfcnCAU6
         Fx1R6ch3q3XUxYYCKd5KWw5MceInpGHhV7byF+XrHXmBPIDopaGbx75hbB8VUd8ACpkp
         lgy4b+MOUeirAgVbku/LVB97akEMZURhy8bCooqQyQNd8UKbUVBLCisXuU4kzgw7Z/r0
         nIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hlThU/0+3HTSxVJIpbAfEl3+62sbcU01NeSU7eG4LqY=;
        b=EM95N5w/CuS2wnshq1GJNsQ330qmxfpwFrvy4U7K4Saf7m2kvMsNm/PPZbg+8TmmZe
         9Sfm7AtiecmlUeM90uSYua0vK8ghCThw4yEZepkbPH3/T8w67iVVMoPjHfB7DzW0+d9T
         NScsy+PSmVl9uGWRKL6SB3xjItOeB5w5MZ0oROVgBLXoNSroHoRvenWUZ+Uq183fhtf9
         EHn/hBm2qlHJD+qnAkKjyjtPbPXNfeieB8R4L+RM6D0suVeO0L1tZoYGjyc+zXE123ea
         LAkNqVOvY7nYSJxpd3ooQat5E7QMfPnEeQcCFzUbPxCLiQgVIlEL+g4WbONl7ULYArKv
         MgyQ==
X-Gm-Message-State: APjAAAW6mreok+1s3CdhOoJOWfDs/bM9WelbFr7xkLbTxwMpiyll6zb8
        jEbuN7KfDu+0HLBAO99DsAYRLXoKAwisFq9li4sQAw==
X-Google-Smtp-Source: APXvYqzIoyvaXbrjboO82pq9HbUiv4XbYQZhJ+E6TRlLc9GG+m0ukGOgfxcjEGQG58Y44wkqcLgO7h1hPaR44lh3y9I=
X-Received: by 2002:a02:b156:: with SMTP id s22mr2834772jah.102.1570007375665;
 Wed, 02 Oct 2019 02:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191001132333.20146-1-brgl@bgdev.pl> <20191001133807.GB3563296@ulmo>
In-Reply-To: <20191001133807.GB3563296@ulmo>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 2 Oct 2019 11:09:24 +0200
Message-ID: <CAMRc=Me5tC2pFc56oWrcdLqu3YULYWPFXLXLW6uciZ5OPO7_Ug@mail.gmail.com>
Subject: Re: [PATCH 0/3] tegra: use regulator_bulk_set_supply_names()
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
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

wt., 1 pa=C5=BA 2019 o 15:38 Thierry Reding <thierry.reding@gmail.com> napi=
sa=C5=82(a):
>
> On Tue, Oct 01, 2019 at 03:23:30PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > The regulator_bulk_set_supply_names() helper was merged upstream. Use i=
t
> > in a couple tegra drivers.
> >
> > Bartosz Golaszewski (3):
> >   ahci: tegra: use regulator_bulk_set_supply_names()
> >   phy: tegra: use regulator_bulk_set_supply_names()
> >   usb: host: xhci-tegra: use regulator_bulk_set_supply_names()
> >
> >  drivers/ata/ahci_tegra.c      | 6 +++---
> >  drivers/phy/tegra/xusb.c      | 6 +++---
> >  drivers/usb/host/xhci-tegra.c | 5 +++--
> >  3 files changed, 9 insertions(+), 8 deletions(-)
>
> I really don't see the point here. You've got a positive diffstat here,
> which means all that churn is without benefit.
>

A hand-coded for loop is replaced with a single function call. The
actual generated code is smaller - I posted bloat-o-meter results last
time. The only reason the number of lines of code doesn't really
change is because the line is broken due to the function and argument
names being too long.

> Is there some subsequent work based on this that will actually improve
> things?

I'd argue that replacing a common operation that's reimplemented
explicitly by hand in many places with a helper function is already an
improvement. Consolidation is almost always good.

That being said, I like your idea about the regulator_get_from_names
helper, but it will take more time as we have to cover optional
multiple regulators as well. In other words: it's on my TODO list, but
in the meantime there's no harm in using this since Mark decided to
make it a part of the regulator API anyway.

Bart

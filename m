Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31951E8501
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 19:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgE2RfT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 13:35:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:56382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727062AbgE2RfN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 May 2020 13:35:13 -0400
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2808A2158C;
        Fri, 29 May 2020 17:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590773712;
        bh=N+Un+BXPNCdwo4xJnKmNvAMc7B65G5dDUl6XlFJhboc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FC3K04+o4kotI0QdMdPXhWg/NrGqfBDvkybMPFFYhcROjhXFdhvHa2g/UMuaRQqe4
         0PXK7cz+RH1eDoNP8QxNY3rNcgGsseJCELbyZgsSzVIjNfuk4dHvCtCGqflCylK4jK
         2TJzKOFI4NdHk0vFqSZFwojvCm1olXIh9bODbUlM=
Received: by mail-oi1-f176.google.com with SMTP id r67so3313147oih.0;
        Fri, 29 May 2020 10:35:12 -0700 (PDT)
X-Gm-Message-State: AOAM532dp6rzP1uKWpfJEU6XO0c81OyZZOmeY2rQ1eJnDwovfyHadNWA
        YNnMUwwk9zdR2nFgd5vsYMU8afdq35lyhYxLuA==
X-Google-Smtp-Source: ABdhPJy67vCAsYB4Fd3qNuQ9AC0QhkVo349CUBfpkVbINCPQGDe2HpNRSlbYDZ1gs0sw/NCjOOh6RfVzTBK35dFAoUo=
X-Received: by 2002:a05:6808:7cb:: with SMTP id f11mr6993653oij.152.1590773711249;
 Fri, 29 May 2020 10:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200526191303.1492-1-james.quinlan@broadcom.com>
 <20200526191303.1492-10-james.quinlan@broadcom.com> <59a0b4e1454a8ef4d3e4ebaf55dcbf3dcd2d73a2.camel@suse.de>
 <CA+-6iNyOKvY-xNfXqDRa5_nJVJuqGKA-oe-ejNuJHUBt6ORu0A@mail.gmail.com>
In-Reply-To: <CA+-6iNyOKvY-xNfXqDRa5_nJVJuqGKA-oe-ejNuJHUBt6ORu0A@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 29 May 2020 11:34:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJsxxC6msUXBCa9naitMLfOcVZauk44gPJNGGe3iXRzsA@mail.gmail.com>
Message-ID: <CAL_JsqJsxxC6msUXBCa9naitMLfOcVZauk44gPJNGGe3iXRzsA@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] device core: Add ability to handle multiple dma offsets
To:     Jim Quinlan <james.quinlan@broadcom.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" 
        <linux-pci@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Corey Minyard <minyard@acm.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Saravana Kannan <saravanak@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 27, 2020 at 9:43 AM Jim Quinlan <james.quinlan@broadcom.com> wrote:
>
> Hi Nicolas,
>
> On Wed, May 27, 2020 at 11:00 AM Nicolas Saenz Julienne
> <nsaenzjulienne@suse.de> wrote:
> >
> > Hi Jim,
> > one thing comes to mind, there is a small test suite in drivers/of/unittest.c
> > (specifically of_unittest_pci_dma_ranges()) you could extend it to include your
> > use cases.
> Sure, will check out.
> >
> > On Tue, 2020-05-26 at 15:12 -0400, Jim Quinlan wrote:
> > > The new field in struct device 'dma_pfn_offset_map' is used to facilitate
> > > the use of multiple pfn offsets between cpu addrs and dma addrs.  It is
> > > similar to 'dma_pfn_offset' except that the offset chosen depends on the
> > > cpu or dma address involved.
> > >
> > > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > > ---
> > >  drivers/of/address.c        | 65 +++++++++++++++++++++++++++++++++++--
> > >  drivers/usb/core/message.c  |  3 ++
> > >  drivers/usb/core/usb.c      |  3 ++
> > >  include/linux/device.h      | 10 +++++-
> > >  include/linux/dma-direct.h  | 10 ++++--
> > >  include/linux/dma-mapping.h | 46 ++++++++++++++++++++++++++
> > >  kernel/dma/Kconfig          | 13 ++++++++
> > >  7 files changed, 144 insertions(+), 6 deletions(-)
> > >
> >
> > [...]
> >
> > > @@ -977,10 +1020,19 @@ int of_dma_get_range(struct device *dev, struct
> > > device_node *np, u64 *dma_addr,
> > >               pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
> > >                        range.bus_addr, range.cpu_addr, range.size);
> > >
> > > +             num_ranges++;
> > >               if (dma_offset && range.cpu_addr - range.bus_addr != dma_offset)
> > > {
> > > -                     pr_warn("Can't handle multiple dma-ranges with different
> > > offsets on node(%pOF)\n", node);
> > > -                     /* Don't error out as we'd break some existing DTs */
> > > -                     continue;
> > > +                     if (!IS_ENABLED(CONFIG_DMA_PFN_OFFSET_MAP)) {
> > > +                             pr_warn("Can't handle multiple dma-ranges with
> > > different offsets on node(%pOF)\n", node);
> > > +                             pr_warn("Perhaps set DMA_PFN_OFFSET_MAP=y?\n");
> > > +                             /*
> > > +                              * Don't error out as we'd break some existing
> > > +                              * DTs that are using configs w/o
> > > +                              * CONFIG_DMA_PFN_OFFSET_MAP set.
> > > +                              */
> > > +                             continue;
> >
> > dev->bus_dma_limit is set in of_dma_configure(), this function's caller, based
> > on dma_start's value (set after this continue). So you'd be effectively setting
> > the dev->bus_dma_limit to whatever we get from the first dma-range.
> I'm not seeing that at all.  On the  evaluation of each dma-range,
> dma_start and dma_end are re-evaluated to be the lowest and highest
> bus values of the  dma-ranges seen so far.  After all dma-ranges are
> examined,  dev->bus_dma_limit being set to the highest.  In fact, the
> current code -- ie before my commits -- already does this for multiple
> dma-ranges as long as the cpu-bus offset is the same in the
> dma-ranges.
> >
> > This can be troublesome depending on how the dma-ranges are setup, for example
> > if the first dma-range doesn't include the CMA area, in arm64 generally set as
> > high as possible in ZONE_DMA32, that would render it useless for
> > dma/{direct/swiotlb}. Again depending on the bus_dma_limit value, if smaller
> > than ZONE_DMA you'd be unable to allocate any DMA memory.
> >
> > IMO, a solution to this calls for a revamp of dma-direct's dma_capable(): match
> > the target DMA memory area with each dma-range we have to see if it fits.
> >
> > > +                     }
> > > +                     dma_multi_pfn_offset = true;
> > >               }
> > >               dma_offset = range.cpu_addr - range.bus_addr;
> > >
> > > @@ -991,6 +1043,13 @@ int of_dma_get_range(struct device *dev, struct
> > > device_node *np, u64 *dma_addr,
> > >                       dma_end = range.bus_addr + range.size;
> > >       }
> > >
> > > +     if (dma_multi_pfn_offset) {
> > > +             dma_offset = 0;
> > > +             ret = attach_dma_pfn_offset_map(dev, node, num_ranges);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > > +
> > >       if (dma_start >= dma_end) {
> > >               ret = -EINVAL;
> > >               pr_debug("Invalid DMA ranges configuration on node(%pOF)\n",
> > > diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> > > index 6197938dcc2d..aaa3e58f5eb4 100644
> > > --- a/drivers/usb/core/message.c
> > > +++ b/drivers/usb/core/message.c
> > > @@ -1960,6 +1960,9 @@ int usb_set_configuration(struct usb_device *dev, int
> > > configuration)
> > >                */
> > >               intf->dev.dma_mask = dev->dev.dma_mask;
> > >               intf->dev.dma_pfn_offset = dev->dev.dma_pfn_offset;
> > > +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> > > +             intf->dev.dma_pfn_offset_map = dev->dev.dma_pfn_offset_map;
> > > +#endif
> >
> > Thanks for looking at this, that said, I see more instances of drivers changing
> > dma_pfn_offset outside of the core code. Why not doing this there too?
> >
> > Also, are we 100% sure that dev->dev.dma_pfn_offset isn't going to be freed
> > before we're done using intf->dev? Maybe it's safer to copy the ranges?
> >
> > >               INIT_WORK(&intf->reset_ws, __usb_queue_reset_device);
> > >               intf->minor = -1;
> > >               device_initialize(&intf->dev);
> > > diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> > > index f16c26dc079d..d2ed4d90e56e 100644
> > > --- a/drivers/usb/core/usb.c
> > > +++ b/drivers/usb/core/usb.c
> > > @@ -612,6 +612,9 @@ struct usb_device *usb_alloc_dev(struct usb_device
> > > *parent,
> > >        */
> > >       dev->dev.dma_mask = bus->sysdev->dma_mask;
> > >       dev->dev.dma_pfn_offset = bus->sysdev->dma_pfn_offset;
> > > +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> > > +     dev->dev.dma_pfn_offset_map = bus->sysdev->dma_pfn_offset_map;
> > > +#endif
> > >       set_dev_node(&dev->dev, dev_to_node(bus->sysdev));
> > >       dev->state = USB_STATE_ATTACHED;
> > >       dev->lpm_disable_count = 1;
> > > diff --git a/include/linux/device.h b/include/linux/device.h
> > > index ac8e37cd716a..67a240ad4fc5 100644
> > > --- a/include/linux/device.h
> > > +++ b/include/linux/device.h
> > > @@ -493,6 +493,8 @@ struct dev_links_info {
> > >   * @bus_dma_limit: Limit of an upstream bridge or bus which imposes a smaller
> > >   *           DMA limit than the device itself supports.
> > >   * @dma_pfn_offset: offset of DMA memory range relatively of RAM
> > > + * @dma_pfn_offset_map:      Like dma_pfn_offset but used when there are
> > > multiple
> > > + *           pfn offsets for multiple dma-ranges.
> > >   * @dma_parms:       A low level driver may set these to teach IOMMU code
> > > about
> > >   *           segment limitations.
> > >   * @dma_pools:       Dma pools (if dma'ble device).
> > > @@ -578,7 +580,13 @@ struct device {
> > >                                            allocations such descriptors. */
> > >       u64             bus_dma_limit;  /* upstream dma constraint */
> > >       unsigned long   dma_pfn_offset;
> > > -
> > > +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> > > +     const struct dma_pfn_offset_region *dma_pfn_offset_map;
> > > +                                     /* Like dma_pfn_offset, but for
> > > +                                      * the unlikely case of multiple
> > > +                                      * offsets. If non-null, dma_pfn_offset
> > > +                                      * will be set to 0. */
> > > +#endif
> >
> > I'm still sad this doesn't fully replace dma_pfn_offset & bus_dma_limit. I feel
> > the extra logic involved in incorporating this as default isn't going to be
> > noticeable as far as performance is concerned to single dma-range users, and
> > it'd make for a nicer DMA code. Also you'd force everyone to test their changes
> > on the multi dma-ranges code path, as opposed to having this disabled 99.9% of
> > the time (hence broken every so often).
> Good point.

+1

> > Note that I sympathize with the amount of work involved on improving that, so
> > better wait to hear what more knowledgeable people have to say about this :)
> Yes, I agree.  I want to avoid coding and testing one solution only to
> have a different reviewer NAK it.

It's a pretty safe bet that everyone will prefer one code path over 2.

Rob

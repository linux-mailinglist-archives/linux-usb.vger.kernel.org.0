Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5B625A1E0
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 01:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgIAXY1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 19:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgIAXYY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 19:24:24 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF06C061244
        for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2020 16:24:23 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id a15so1362944ejf.11
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2020 16:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6nvYO83TuGyoqoEjxwK3HJvbFAyS+1kGkzEzB8i/fiw=;
        b=ouHQr8phdwKmipCzwFsEUpoRGmJ8DdK+/z0pujc+O8dzygl3W2jrb50djUI+q2ZF71
         fqBw4KAHVMF+eg4cWrsXLjR9m/8dcVi20/NjUHjHzgAIEzOCtsFbwTPQpib5ZUnHhmir
         2xvkXmoc1E4Hbpo3nZjo3Dfqc2QpDwM6drDeARxmEShUQuUeElPoVU5eyquNQAj71ALz
         F2DM/nq7Xhq7yAeDVggthENSH+ZmXgbeQHOlU+eXeyfGFDAaztBSBEkjVC/joKe/d3g1
         O5vToScQ+azkn5X6JOypQu+W4PpwDnJnmbu525qsDECBRQFhNz2h4k0Ki+FF9oCdjtl7
         Fhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6nvYO83TuGyoqoEjxwK3HJvbFAyS+1kGkzEzB8i/fiw=;
        b=FA9UtPMy+RZ7RkB1kXJiiTxQJht+AxyL/YAdbWjlZISbl+lNjBHGsX2gX8ELWQwZ2Y
         0xUC2wbcbk+bNGNQh0GwTBulFbFKShTad9cV6n3gdL6vHeUoG5npdWPsnhb/GIxRJMDz
         oaNw9upY677CMTF31W0xlezk1QptazTD7iNPFoQXx1BliFMD9Dn02R1gjKtiERcJ45IU
         nAQ1khlleO5se5utLG4C6Z2qdnaqAlZXrYmN39Wjomwa2VpYXSLZ0A1wvh+0tg/lgXwi
         N4LJj6VuWitzZ10hQt2IXTrPw5tp5X1EkeIe0VqMN46xuU5+Bj1tZd/nYtlsYBooysSC
         RCNA==
X-Gm-Message-State: AOAM532Z7IBlJ89SoeZYRVI7d1OXxWVmZTEm9TDcIpT8P7F20Jml53IY
        gQawuGBXCEgaPTn3Qgq7+e8dOAcYrSQe2PblrcM=
X-Google-Smtp-Source: ABdhPJxRzUQn1VMtYlq+NHSoL+G1OwMjzmpU01odaXrKFKIQ61+ckgZ74esHK8DxXKsf/QJeliLxW3Bb8l83/ru2GAg=
X-Received: by 2002:a17:906:5488:: with SMTP id r8mr573238ejo.483.1599002661950;
 Tue, 01 Sep 2020 16:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200901055417.1732-1-tom.ty89@gmail.com> <20200901145535.GC587030@rowland.harvard.edu>
In-Reply-To: <20200901145535.GC587030@rowland.harvard.edu>
From:   Tom Yan <tom.ty89@gmail.com>
Date:   Wed, 2 Sep 2020 07:24:10 +0800
Message-ID: <CAGnHSEnXyBXwdTxc-dxP_wSUdT-JuRwegtPmpXJNecOTDJR_+w@mail.gmail.com>
Subject: Re: [PATCH] usb-storage: always set hw_max_sectors in slave_configure
 to avoid inappropriate clamping
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        Arnd Bergmann <arnd@arndb.de>, cyrozap@gmail.com,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 1 Sep 2020 at 22:55, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> Patch submissions should have text lines limited to fewer than 80
> columns.
>
> On Tue, Sep 01, 2020 at 01:54:17PM +0800, Tom Yan wrote:
> > When the scsi request queue is initialized/allocated, the scsi driver
> > clamps hw_max_sectors against the dma max mapping size of
> > sdev->host->dma_dev. The clamping is apparently inappriorate to USB
> > drives.
>
> Wouldn't it be more accurate to say that the clamping _is_ appropriate,
> but it should be performed using the sysdev device rather than the
> nominal parent?  Thus the error lies in allowing shost->dma_dev to be
> set incorrectly.
>
> > Either way we are calling blk_queue_max_hw_sectors() in the usb
> > drivers for some (but not all) cases, which causes the clamping to be
> > overriden (inconsistently) anyway.
> >
> > Therefore the usb driver should always set hw_max_sectors and do the
> > clamping against the right device itself.
>
> How about fixing the dma_dev assignment instead?

That won't really help unless we also do the clamping on the USB side
*conditionally* (i.e. only after when we call
`blk_queue_max_hw_sectors()` again there). I'm not sure there's a good
reason for doing so.

Although this might seem a bit redundant/clumsy at first glance, it's
also much easier to follow (e.g. we don't have to dive into the SCSI
side to know where the hw_max_sectors came from).

Besides, the whole DMA thing is quite beyond my knowledge.

I'm going to fix the commit message, and use 2048 blocks for SS UAS drives.

>
> Alan Stern
>
> > Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> > ---
> >  drivers/usb/storage/scsiglue.c | 37 ++++++++++++++++------------------
> >  drivers/usb/storage/uas.c      | 23 ++++++++++++++++-----
> >  2 files changed, 35 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
> > index e5a971b83e3f..804cbc0ba4da 100644
> > --- a/drivers/usb/storage/scsiglue.c
> > +++ b/drivers/usb/storage/scsiglue.c
> > @@ -120,6 +120,23 @@ static int slave_configure(struct scsi_device *sdev)
> >                * better throughput on most devices.
> >                */
> >               blk_queue_max_hw_sectors(sdev->request_queue, 2048);
> > +     } else {
> > +         /*
> > +          * Some devices are known to choke with anything larger. It seems like
> > +          * the problem stems from the fact that original IDE controllers had
> > +          * only an 8-bit register to hold the number of sectors in one transfer
> > +          * and even those couldn't handle a full 256 sectors.
> > +          *
> > +          * Because we want to make sure we interoperate with as many devices as
> > +          * possible, we will maintain a 240 sector transfer size limit for USB
> > +          * Mass Storage devices.
> > +          *
> > +          * Tests show that other operating have similar limits with Microsoft
> > +          * Windows 7 limiting transfers to 128 sectors for both USB2 and USB3
> > +          * and Apple Mac OS X 10.11 limiting transfers to 256 sectors for USB2
> > +          * and 2048 for USB3 devices.
> > +          */
> > +             blk_queue_max_hw_sectors(sdev->request_queue, 240);
> >       }
> >
> >       /*
> > @@ -626,26 +643,6 @@ static const struct scsi_host_template usb_stor_host_template = {
> >       /* lots of sg segments can be handled */
> >       .sg_tablesize =                 SG_MAX_SEGMENTS,
> >
> > -
> > -     /*
> > -      * Limit the total size of a transfer to 120 KB.
> > -      *
> > -      * Some devices are known to choke with anything larger. It seems like
> > -      * the problem stems from the fact that original IDE controllers had
> > -      * only an 8-bit register to hold the number of sectors in one transfer
> > -      * and even those couldn't handle a full 256 sectors.
> > -      *
> > -      * Because we want to make sure we interoperate with as many devices as
> > -      * possible, we will maintain a 240 sector transfer size limit for USB
> > -      * Mass Storage devices.
> > -      *
> > -      * Tests show that other operating have similar limits with Microsoft
> > -      * Windows 7 limiting transfers to 128 sectors for both USB2 and USB3
> > -      * and Apple Mac OS X 10.11 limiting transfers to 256 sectors for USB2
> > -      * and 2048 for USB3 devices.
> > -      */
> > -     .max_sectors =                  240,
> > -
> >       /* emulated HBA */
> >       .emulated =                     1,
> >
> > diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> > index 08f9296431e9..cffa435afd84 100644
> > --- a/drivers/usb/storage/uas.c
> > +++ b/drivers/usb/storage/uas.c
> > @@ -827,11 +827,6 @@ static int uas_slave_alloc(struct scsi_device *sdev)
> >        */
> >       blk_queue_update_dma_alignment(sdev->request_queue, (512 - 1));
> >
> > -     if (devinfo->flags & US_FL_MAX_SECTORS_64)
> > -             blk_queue_max_hw_sectors(sdev->request_queue, 64);
> > -     else if (devinfo->flags & US_FL_MAX_SECTORS_240)
> > -             blk_queue_max_hw_sectors(sdev->request_queue, 240);
> > -
> >       return 0;
> >  }
> >
> > @@ -839,6 +834,24 @@ static int uas_slave_configure(struct scsi_device *sdev)
> >  {
> >       struct uas_dev_info *devinfo = sdev->hostdata;
> >
> > +     struct us_data *us = host_to_us(sdev->host);
> > +     struct device *dev = us->pusb_dev->bus->sysdev;
> > +
> > +     if (devinfo->flags & US_FL_MAX_SECTORS_64)
> > +             blk_queue_max_hw_sectors(sdev->request_queue, 64);
> > +     else if (devinfo->flags & US_FL_MAX_SECTORS_240)
> > +             blk_queue_max_hw_sectors(sdev->request_queue, 240);
> > +     else
> > +             blk_queue_max_hw_sectors(sdev->request_queue, SCSI_DEFAULT_MAX_SECTORS);
> > +
> > +     /*
> > +      * The max_hw_sectors should be up to maximum size of a mapping for
> > +      * the device. Otherwise, a DMA API might fail on swiotlb environment.
> > +      */
> > +     blk_queue_max_hw_sectors(sdev->request_queue,
> > +             min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
> > +                   dma_max_mapping_size(dev) >> SECTOR_SHIFT));
> > +
> >       if (devinfo->flags & US_FL_NO_REPORT_OPCODES)
> >               sdev->no_report_opcodes = 1;
> >
> > --
> > 2.28.0
> >

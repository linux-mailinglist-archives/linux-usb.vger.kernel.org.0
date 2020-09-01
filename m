Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3D725A202
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 01:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgIAXo4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 19:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgIAXoz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 19:44:55 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EACAC061244
        for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2020 16:44:55 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id w1so3129929edr.3
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2020 16:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=km9oM0pe55ofjC2uixwung26G67b/6eEfDJXPH7ONBc=;
        b=SBTGrQCTwLLtj+D2EKvCtXXlq1mENY4jLXrOFSbKJBz4NOcIgL3SGO0o9N8hpW5Ff4
         qPPjnXnwFZ/4dnbSQxDP5dh772bkCO6I9ri1kgz+9APYlGMg4vmarvQ2jyaBhlArZJ2f
         djLzUC2Wa3VrUJFo3nAsuWvUll/dZdAWmrqT1waZuCJfXppd5KLErKlfOGZjMOLgNeK0
         VrZ79z4h7/118UrmZ7zurikO8nd+NKIwOofDyT8NBucPrYm9cjrkNv59jgcN+loql9eR
         1yO6KqfoBg+7fWXTLeAFogEPEFkfWdgjLeNqmE3PSp0LQD3K39pSuxSLolAvHMe44+eI
         R/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=km9oM0pe55ofjC2uixwung26G67b/6eEfDJXPH7ONBc=;
        b=udMPAAyZI+N2wftHt1lfeadBRl12LUkPsY76qvy8go+v9KTPl8/Oy4ihH2XLSPuXj/
         BywHcptGmi25tyffdW77uAmlIRZNaxs39t9uYQR3v3lSEtCK2EJiGjkOHO072Mrap0TY
         W9U2erEILWqkwpM4T1Y/+gM0EVHYuP8p6kkuAz6MkyQIcmGbFYspgdI2ASC5PX3Khf8q
         Y+/Q1de+zylBP6OHvd520KxymeA/+DTEzNmJoSgGxsYPu27emErcT4zTdUAv/yGtiaM7
         MNTX2lgkPe5zkKPHn0PR/GujpvcXLqhxAqLlUTWIzycQesM4S87+dtgTLdn+KQfxELSQ
         1Vxg==
X-Gm-Message-State: AOAM5303tk8NDM2mEwhpUT+FTWsZloJLjDNY/Z38pzsXERdH88QIm+m7
        0C0700dtAM0jAi1OqZb+qactqDcBH2aQIf0bXQo=
X-Google-Smtp-Source: ABdhPJy3s31Jrh0syNp4YFpxsBPgZEcj9z5uTVjQTF3GJCdjIkmZKPpWEFzSc2dTYBhyP39JxejqYypU0JkqFyjaQjc=
X-Received: by 2002:a05:6402:1593:: with SMTP id c19mr4048374edv.33.1599003893869;
 Tue, 01 Sep 2020 16:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200901055417.1732-1-tom.ty89@gmail.com> <20200901145535.GC587030@rowland.harvard.edu>
 <CAGnHSEnXyBXwdTxc-dxP_wSUdT-JuRwegtPmpXJNecOTDJR_+w@mail.gmail.com>
In-Reply-To: <CAGnHSEnXyBXwdTxc-dxP_wSUdT-JuRwegtPmpXJNecOTDJR_+w@mail.gmail.com>
From:   Tom Yan <tom.ty89@gmail.com>
Date:   Wed, 2 Sep 2020 07:44:42 +0800
Message-ID: <CAGnHSE=rvBhAD3svNaVPoyKMi+tOO6X1vqdECMZooPX73KzfrQ@mail.gmail.com>
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

Oh I think I see your point now. If/When dma_dev is fixed / the same
as `bus->sysdev`, it wouldn't hurt / matter if the clamping is done
twice at different stages. max_sectors will be clamped to the same
value no matter if it's set on the SCSI side or the USB side.

But again, fixing the dma_dev is beyond my knowledge. Probably need
someone else to look into it.

On Wed, 2 Sep 2020 at 07:24, Tom Yan <tom.ty89@gmail.com> wrote:
>
> On Tue, 1 Sep 2020 at 22:55, Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > Patch submissions should have text lines limited to fewer than 80
> > columns.
> >
> > On Tue, Sep 01, 2020 at 01:54:17PM +0800, Tom Yan wrote:
> > > When the scsi request queue is initialized/allocated, the scsi driver
> > > clamps hw_max_sectors against the dma max mapping size of
> > > sdev->host->dma_dev. The clamping is apparently inappriorate to USB
> > > drives.
> >
> > Wouldn't it be more accurate to say that the clamping _is_ appropriate,
> > but it should be performed using the sysdev device rather than the
> > nominal parent?  Thus the error lies in allowing shost->dma_dev to be
> > set incorrectly.
> >
> > > Either way we are calling blk_queue_max_hw_sectors() in the usb
> > > drivers for some (but not all) cases, which causes the clamping to be
> > > overriden (inconsistently) anyway.
> > >
> > > Therefore the usb driver should always set hw_max_sectors and do the
> > > clamping against the right device itself.
> >
> > How about fixing the dma_dev assignment instead?
>
> That won't really help unless we also do the clamping on the USB side
> *conditionally* (i.e. only after when we call
> `blk_queue_max_hw_sectors()` again there). I'm not sure there's a good
> reason for doing so.
>
> Although this might seem a bit redundant/clumsy at first glance, it's
> also much easier to follow (e.g. we don't have to dive into the SCSI
> side to know where the hw_max_sectors came from).
>
> Besides, the whole DMA thing is quite beyond my knowledge.
>
> I'm going to fix the commit message, and use 2048 blocks for SS UAS drives.
>
> >
> > Alan Stern
> >
> > > Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> > > ---
> > >  drivers/usb/storage/scsiglue.c | 37 ++++++++++++++++------------------
> > >  drivers/usb/storage/uas.c      | 23 ++++++++++++++++-----
> > >  2 files changed, 35 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
> > > index e5a971b83e3f..804cbc0ba4da 100644
> > > --- a/drivers/usb/storage/scsiglue.c
> > > +++ b/drivers/usb/storage/scsiglue.c
> > > @@ -120,6 +120,23 @@ static int slave_configure(struct scsi_device *sdev)
> > >                * better throughput on most devices.
> > >                */
> > >               blk_queue_max_hw_sectors(sdev->request_queue, 2048);
> > > +     } else {
> > > +         /*
> > > +          * Some devices are known to choke with anything larger. It seems like
> > > +          * the problem stems from the fact that original IDE controllers had
> > > +          * only an 8-bit register to hold the number of sectors in one transfer
> > > +          * and even those couldn't handle a full 256 sectors.
> > > +          *
> > > +          * Because we want to make sure we interoperate with as many devices as
> > > +          * possible, we will maintain a 240 sector transfer size limit for USB
> > > +          * Mass Storage devices.
> > > +          *
> > > +          * Tests show that other operating have similar limits with Microsoft
> > > +          * Windows 7 limiting transfers to 128 sectors for both USB2 and USB3
> > > +          * and Apple Mac OS X 10.11 limiting transfers to 256 sectors for USB2
> > > +          * and 2048 for USB3 devices.
> > > +          */
> > > +             blk_queue_max_hw_sectors(sdev->request_queue, 240);
> > >       }
> > >
> > >       /*
> > > @@ -626,26 +643,6 @@ static const struct scsi_host_template usb_stor_host_template = {
> > >       /* lots of sg segments can be handled */
> > >       .sg_tablesize =                 SG_MAX_SEGMENTS,
> > >
> > > -
> > > -     /*
> > > -      * Limit the total size of a transfer to 120 KB.
> > > -      *
> > > -      * Some devices are known to choke with anything larger. It seems like
> > > -      * the problem stems from the fact that original IDE controllers had
> > > -      * only an 8-bit register to hold the number of sectors in one transfer
> > > -      * and even those couldn't handle a full 256 sectors.
> > > -      *
> > > -      * Because we want to make sure we interoperate with as many devices as
> > > -      * possible, we will maintain a 240 sector transfer size limit for USB
> > > -      * Mass Storage devices.
> > > -      *
> > > -      * Tests show that other operating have similar limits with Microsoft
> > > -      * Windows 7 limiting transfers to 128 sectors for both USB2 and USB3
> > > -      * and Apple Mac OS X 10.11 limiting transfers to 256 sectors for USB2
> > > -      * and 2048 for USB3 devices.
> > > -      */
> > > -     .max_sectors =                  240,
> > > -
> > >       /* emulated HBA */
> > >       .emulated =                     1,
> > >
> > > diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> > > index 08f9296431e9..cffa435afd84 100644
> > > --- a/drivers/usb/storage/uas.c
> > > +++ b/drivers/usb/storage/uas.c
> > > @@ -827,11 +827,6 @@ static int uas_slave_alloc(struct scsi_device *sdev)
> > >        */
> > >       blk_queue_update_dma_alignment(sdev->request_queue, (512 - 1));
> > >
> > > -     if (devinfo->flags & US_FL_MAX_SECTORS_64)
> > > -             blk_queue_max_hw_sectors(sdev->request_queue, 64);
> > > -     else if (devinfo->flags & US_FL_MAX_SECTORS_240)
> > > -             blk_queue_max_hw_sectors(sdev->request_queue, 240);
> > > -
> > >       return 0;
> > >  }
> > >
> > > @@ -839,6 +834,24 @@ static int uas_slave_configure(struct scsi_device *sdev)
> > >  {
> > >       struct uas_dev_info *devinfo = sdev->hostdata;
> > >
> > > +     struct us_data *us = host_to_us(sdev->host);
> > > +     struct device *dev = us->pusb_dev->bus->sysdev;
> > > +
> > > +     if (devinfo->flags & US_FL_MAX_SECTORS_64)
> > > +             blk_queue_max_hw_sectors(sdev->request_queue, 64);
> > > +     else if (devinfo->flags & US_FL_MAX_SECTORS_240)
> > > +             blk_queue_max_hw_sectors(sdev->request_queue, 240);
> > > +     else
> > > +             blk_queue_max_hw_sectors(sdev->request_queue, SCSI_DEFAULT_MAX_SECTORS);
> > > +
> > > +     /*
> > > +      * The max_hw_sectors should be up to maximum size of a mapping for
> > > +      * the device. Otherwise, a DMA API might fail on swiotlb environment.
> > > +      */
> > > +     blk_queue_max_hw_sectors(sdev->request_queue,
> > > +             min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
> > > +                   dma_max_mapping_size(dev) >> SECTOR_SHIFT));
> > > +
> > >       if (devinfo->flags & US_FL_NO_REPORT_OPCODES)
> > >               sdev->no_report_opcodes = 1;
> > >
> > > --
> > > 2.28.0
> > >

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0972925867C
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 05:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgIADt3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 23:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgIADt3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 23:49:29 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0933C0612FE
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 20:49:27 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id w14so48841eds.0
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 20:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yGnO401VJHee8tld9vBJFCvzyhmUXUCdoPGxNKVZlA4=;
        b=URABT8PmD9jvxsM4ZfwAqvdM4QNTeAHUaLoIcr4DTRGeIqIi72VctfX4RMUdAPy5ve
         WvIEZFwG7h5O+slzi4TrjmK+YIF6VKiIN+6fKim44q2w46UAVqjt1o49ce9hapP0CgVs
         4Z3YP43OxmInVJtVN/O7XTivWEh6Fa8KiQtATEJ8tw6JWtu5Nia5iWHKAf42lxAV7nnq
         8O4ApbdipmnulbF4NDi1DeV+Bm15+n4spy8A+We6koCLspYEJ84+6jwNdZb8/gsjyYcS
         iTOCU900vDhNmUTbEFvupBpJaUONpKpadUXY4322lgkGsb3XA6pP5NHpnAdjdxvblqnv
         to9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yGnO401VJHee8tld9vBJFCvzyhmUXUCdoPGxNKVZlA4=;
        b=S+ZuNJMrddJISFtlaEIPrWxTXTPvOKlxe/U8eWXnXcCKHUbr9P0dB5bUVaO7/VjlGb
         GECDu3wSmLWRKsaajFMMy0Pdt2KKcj/rBZBQqkXfUp4pmFL5QSe/7N0/qLIbGUQBamxe
         bljcK99noVV3EuPoaORgVhNPLCf5yxGcXU30Gx8WjoprJrgyKKvuX6kVB+nn4DvKw6Kv
         E5Hdw1a1k9eKNU2dj2kraTIk1Ejl7lvZ5Kg1StoD65juokWqDJM3Pg6zsqT9Y0tm7YMQ
         uwHKEGfwohPrQ6W8ZAkIcTaUgEHjHWE2MBmE3C6Gjjv/KqHvSFOx9o3StNlgt9egC8/y
         XGMg==
X-Gm-Message-State: AOAM530ScJ94jNu0q02OlHyld69DdkbWSfjlBhGO60kuHtjA3SwaukES
        4N4AmsZHXC4M2J03E5WGx6wqP/PJyXDfDRF/8Gw=
X-Google-Smtp-Source: ABdhPJyH+71h/9rE7aXIeKdqQjPLJfuEVqfB5evxT76m7wpyOWLlZNHYH/bwHg73hrimJ43B1I81hJub5i60qOXuZdQ=
X-Received: by 2002:aa7:d458:: with SMTP id q24mr55999edr.23.1598932166175;
 Mon, 31 Aug 2020 20:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAGnHSEnKNZFyjF6E+QCLESzuOX-Fz-4ejuhmZNnGRaN8GQbM7g@mail.gmail.com>
 <20200901020757.GC571008@rowland.harvard.edu>
In-Reply-To: <20200901020757.GC571008@rowland.harvard.edu>
From:   Tom Yan <tom.ty89@gmail.com>
Date:   Tue, 1 Sep 2020 11:49:15 +0800
Message-ID: <CAGnHSEkweSB6N5=mRtWWD_rtY+m=VuVx=NY-yzNKYWmF5+1MJQ@mail.gmail.com>
Subject: Re: About clamping max_sectors to (ambiguous) dma_max_mapping_size
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        cyrozap@gmail.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 1 Sep 2020 at 10:07, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, Sep 01, 2020 at 08:55:07AM +0800, Tom Yan wrote:
> > Hi,
> >
> > So a recent commit that disable 64 bit dma addressing for ASM1142:
> > https://github.com/torvalds/linux/commit/ec37198acca7b4c17b96247697406e47aafe0605
> >
> > I notice that it also causes (hw) max_sectors of uas drives connected
> > to the controller to drop from 1024 blocks (SCSI_DEFAULT_MAX_SECTORS)
> > to 512 blocks, because we clamp it against
> > dma_max_mapping_size($some_device).
> >
> > For uas drives, $some_device is `sdev->host->dma_dev`:
> > https://github.com/torvalds/linux/blob/v5.8/drivers/scsi/scsi_lib.c#L1778
> > (`shost` is `sdev->host`:
> > https://github.com/torvalds/linux/blob/v5.8/drivers/scsi/scsi_lib.c#L1873)
> >
> > But for bot/msc drives: $some_device is some other device:
> > https://github.com/torvalds/linux/blob/v5.8/drivers/usb/storage/scsiglue.c#L92
> >
> > In that case, max_sectors remains to be 2048 blocks for SS BOT drives
> > connected to the ASM1142 controller.
> >
> > I tried to change it to `sdev->host->dma_dev`. It lowered their
> > max_sectors to 512 blocks.
> >
> > So my questions are:
> > 1. Do we really need to do any clamping to max_sectors in either (uas/bot) case?
> > 2. If so, should we change the $some_device in either case?
> >
> > For the record, in the original commit (for BOT drives):
> > https://github.com/torvalds/linux/commit/d74ffae8b8dd17eaa8b82fc163e6aa2076dc8fb1
> > The commit message states that the clamping is needed because of some
> > other change, which is supposed to cause max_segment_size to raise
> > from 0x10000 to 0xffffffff, but when I check the sysfs files for both
> > kinds of drives, all of the values are 0x10000.
> >
> > Also see https://github.com/virtio-win/kvm-guest-drivers-windows/issues/498
>
> You should take a look at Arnd Bergmann's commit a8c06e407ef9 ("usb:
> separate out sysdev pointer from usb_bus"), which is what introduced
> this difference originally.
>
> As far as I know, both drivers (usb-storage and uas) should be using the
> bus->sysdev device for the purpose of clamping max_sectors.  If uas
> doesn't use that device then it should be fixed.

The uas driver relies on the scsi driver
(https://github.com/torvalds/linux/blob/v5.8/drivers/scsi/scsi_lib.c#L1796)
for max_sector setting and clamping (except when US_FL_MAX_SECTORS_64
or US_FL_MAX_SECTORS_240 is set, where the clamping will be
overridden):
https://github.com/torvalds/linux/blob/v5.8/drivers/usb/storage/uas.c#L816

They (uas and scsiglue/bot) call `blk_queue_max_hw_sectors` in
different functions btw (`uas_slave_alloc` vs `slave_configure`,
instead of `slave_alloc`, that is). I suppose we should do all the
clamping and setting in `uas_slave_configure` instead as well?

I faintly remember I asked about it but allow me to ask again, should
we really NOT raise max_sectors to 2048 blocks for **SS UAS** drives
like we do for SS BOT drives?

>
> And yes, the clamping is necessary.

As I mentioned, if the clamping is done against the max mapping size
of `bus->sysdev`, max_sectors will not be actually lowered in both
cases (XHCI_NO_64BIT_SUPPORT or not). So basically it does nothing, at
least on my devices. Allow me to confirm, is that a correct/expected
behaviour?

>
> Alan Stern

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93141259145
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 16:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgIAOtU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 10:49:20 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35019 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727778AbgIAOtR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 10:49:17 -0400
Received: (qmail 587937 invoked by uid 1000); 1 Sep 2020 10:48:22 -0400
Date:   Tue, 1 Sep 2020 10:48:22 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tom Yan <tom.ty89@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        cyrozap@gmail.com, gregkh@linuxfoundation.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: About clamping max_sectors to (ambiguous) dma_max_mapping_size
Message-ID: <20200901144822.GA587030@rowland.harvard.edu>
References: <CAGnHSEnKNZFyjF6E+QCLESzuOX-Fz-4ejuhmZNnGRaN8GQbM7g@mail.gmail.com>
 <20200901020757.GC571008@rowland.harvard.edu>
 <CAGnHSEkweSB6N5=mRtWWD_rtY+m=VuVx=NY-yzNKYWmF5+1MJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGnHSEkweSB6N5=mRtWWD_rtY+m=VuVx=NY-yzNKYWmF5+1MJQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[In your first email on this topic you identified commit d74ffae8b8dd as 
being relevant to the discussion.  You therefore should have CC'ed the 
commit's author, Yoshihiro Shimoda.]

On Tue, Sep 01, 2020 at 11:49:15AM +0800, Tom Yan wrote:
> The uas driver relies on the scsi driver
> (https://github.com/torvalds/linux/blob/v5.8/drivers/scsi/scsi_lib.c#L1796)
> for max_sector setting and clamping (except when US_FL_MAX_SECTORS_64
> or US_FL_MAX_SECTORS_240 is set, where the clamping will be
> overridden):
> https://github.com/torvalds/linux/blob/v5.8/drivers/usb/storage/uas.c#L816
> 
> They (uas and scsiglue/bot) call `blk_queue_max_hw_sectors` in
> different functions btw (`uas_slave_alloc` vs `slave_configure`,
> instead of `slave_alloc`, that is). I suppose we should do all the
> clamping and setting in `uas_slave_configure` instead as well?

The only difference is that in the slave_configure callback we know what 
type of device we're dealing with (the INQUIRY information is available) 
whereas in slave_alloc we don't.  So for example, the test in 
usb-storage's slave_configure for TYPE_TAPE could not be made in 
slave_alloc.

> I faintly remember I asked about it but allow me to ask again, should
> we really NOT raise max_sectors to 2048 blocks for **SS UAS** drives
> like we do for SS BOT drives?

There's no reason for uas to use a smaller value of max_sectors than 
usb-storage.

> > And yes, the clamping is necessary.
> 
> As I mentioned, if the clamping is done against the max mapping size
> of `bus->sysdev`, max_sectors will not be actually lowered in both
> cases (XHCI_NO_64BIT_SUPPORT or not). So basically it does nothing, at
> least on my devices. Allow me to confirm, is that a correct/expected
> behaviour?

Yes.  Although your devices and system are fine, others may encounter 
difficulty.

Alan Stern

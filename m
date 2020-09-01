Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F27A258586
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 04:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgIACH7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 22:07:59 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35973 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726020AbgIACH6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 22:07:58 -0400
Received: (qmail 571818 invoked by uid 1000); 31 Aug 2020 22:07:57 -0400
Date:   Mon, 31 Aug 2020 22:07:57 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tom Yan <tom.ty89@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        cyrozap@gmail.com, gregkh@linuxfoundation.org
Subject: Re: About clamping max_sectors to (ambiguous) dma_max_mapping_size
Message-ID: <20200901020757.GC571008@rowland.harvard.edu>
References: <CAGnHSEnKNZFyjF6E+QCLESzuOX-Fz-4ejuhmZNnGRaN8GQbM7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGnHSEnKNZFyjF6E+QCLESzuOX-Fz-4ejuhmZNnGRaN8GQbM7g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 01, 2020 at 08:55:07AM +0800, Tom Yan wrote:
> Hi,
> 
> So a recent commit that disable 64 bit dma addressing for ASM1142:
> https://github.com/torvalds/linux/commit/ec37198acca7b4c17b96247697406e47aafe0605
> 
> I notice that it also causes (hw) max_sectors of uas drives connected
> to the controller to drop from 1024 blocks (SCSI_DEFAULT_MAX_SECTORS)
> to 512 blocks, because we clamp it against
> dma_max_mapping_size($some_device).
> 
> For uas drives, $some_device is `sdev->host->dma_dev`:
> https://github.com/torvalds/linux/blob/v5.8/drivers/scsi/scsi_lib.c#L1778
> (`shost` is `sdev->host`:
> https://github.com/torvalds/linux/blob/v5.8/drivers/scsi/scsi_lib.c#L1873)
> 
> But for bot/msc drives: $some_device is some other device:
> https://github.com/torvalds/linux/blob/v5.8/drivers/usb/storage/scsiglue.c#L92
> 
> In that case, max_sectors remains to be 2048 blocks for SS BOT drives
> connected to the ASM1142 controller.
> 
> I tried to change it to `sdev->host->dma_dev`. It lowered their
> max_sectors to 512 blocks.
> 
> So my questions are:
> 1. Do we really need to do any clamping to max_sectors in either (uas/bot) case?
> 2. If so, should we change the $some_device in either case?
> 
> For the record, in the original commit (for BOT drives):
> https://github.com/torvalds/linux/commit/d74ffae8b8dd17eaa8b82fc163e6aa2076dc8fb1
> The commit message states that the clamping is needed because of some
> other change, which is supposed to cause max_segment_size to raise
> from 0x10000 to 0xffffffff, but when I check the sysfs files for both
> kinds of drives, all of the values are 0x10000.
> 
> Also see https://github.com/virtio-win/kvm-guest-drivers-windows/issues/498

You should take a look at Arnd Bergmann's commit a8c06e407ef9 ("usb: 
separate out sysdev pointer from usb_bus"), which is what introduced 
this difference originally.

As far as I know, both drivers (usb-storage and uas) should be using the 
bus->sysdev device for the purpose of clamping max_sectors.  If uas 
doesn't use that device then it should be fixed.

And yes, the clamping is necessary.

Alan Stern

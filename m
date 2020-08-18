Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2427C2480F5
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 10:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbgHRIyl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 04:54:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:43460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgHRIyk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 04:54:40 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 003F92067C;
        Tue, 18 Aug 2020 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597740879;
        bh=C4YeP6hh9hobYPjXooU0rTPs1EJ1Nod4DauDG+SueUQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2hZOVNutwpqCLH4aO5ksrVn0Hk06aY4Yg0UWe/M3xPuROl89w9v++A7l7JisQClAp
         2lZ27z38C6eCbsWqc701bWmStScXAtio4V/3u4tyumaWzFlaU67tfnO0ffQ7oGa8jR
         f04nrCE/iK93HwyPRyxhae3gvDsqS5kocEyu8zcI=
Date:   Tue, 18 Aug 2020 10:55:02 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Patrik Nilsson <nipatriknilsson@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: high speed data to usb disk makes the kernel think that is has
 been unmounted
Message-ID: <20200818085502.GB28036@kroah.com>
References: <a161e45d-6ce8-2077-c513-380b67c4dfd8@gmail.com>
 <20200811175655.GB828356@kroah.com>
 <47a5804c-835a-f1a2-abce-50b3531f2556@gmail.com>
 <20200811193150.GA344152@rowland.harvard.edu>
 <ef2937d6-f8a8-fbc6-decd-eeb4af94e863@gmail.com>
 <20200812061451.GE1299081@kroah.com>
 <95be674d-ee98-b904-6856-2f662ac7838f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95be674d-ee98-b904-6856-2f662ac7838f@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 16, 2020 at 05:31:09PM +0200, Patrik Nilsson wrote:
> [ 7981.203457] perf: interrupt took too long (3133 > 3132), lowering kernel.perf_event_max_sample_rate to 63750
> [ 8263.612587] usb 2-2: USB disconnect, device number 3

Your device disconnected itself from the bus, that is an electrical
thing that the kernel can not control/prevent/change.

> [ 8263.628508] blk_update_request: I/O error, dev sdb, sector 2678161400 op 0x1:(WRITE) flags 0x0 phys_seg 1674 prio class 0
> [ 8263.628515] Buffer I/O error on dev sdb, logical block 2678161400, lost async page write
> [ 8263.628519] Buffer I/O error on dev sdb, logical block 2678161401, lost async page write
> [ 8263.628521] Buffer I/O error on dev sdb, logical block 2678161402, lost async page write
> [ 8263.628524] Buffer I/O error on dev sdb, logical block 2678161403, lost async page write
> [ 8263.628526] Buffer I/O error on dev sdb, logical block 2678161404, lost async page write
> [ 8263.628528] Buffer I/O error on dev sdb, logical block 2678161405, lost async page write
> [ 8263.628530] Buffer I/O error on dev sdb, logical block 2678161406, lost async page write
> [ 8263.628533] Buffer I/O error on dev sdb, logical block 2678161407, lost async page write
> [ 8263.628538] Buffer I/O error on dev sdb, logical block 2678161408, lost async page write
> [ 8263.628541] Buffer I/O error on dev sdb, logical block 2678161409, lost async page write
> [ 8263.629271] blk_update_request: I/O error, dev sdb, sector 2678163074 op 0x1:(WRITE) flags 0x4000 phys_seg 2048 prio class 0
> [ 8263.630073] blk_update_request: I/O error, dev sdb, sector 2678165122 op 0x1:(WRITE) flags 0x0 phys_seg 6 prio class 0
> [ 8263.630146] blk_update_request: I/O error, dev sdb, sector 2678165128 op 0x1:(WRITE) flags 0x800 phys_seg 112 prio class 0
> [ 8263.630879] sd 4:0:0:0: [sdb] Synchronizing SCSI cache
> [ 8263.630912] sd 4:0:0:0: [sdb] Synchronize Cache(10) failed: Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK
> [ 8263.630974] scsi 4:0:0:0: rejecting I/O to dead device
> [ 8263.630980] blk_update_request: I/O error, dev sdb, sector 2678165240 op 0x1:(WRITE) flags 0x0 phys_seg 104 prio class 0
> [ 8275.232507] usb 2-2: new SuperSpeed Gen 1 USB device number 10 using xhci_hcd

And now it came back.

So I really think this device is just sucking up too much power and
eventually the hub disconnects it (or it disconnects itself by dropping
the voltage too low) and then adds itself again.

If you write data "slower" to it, it's fine, but by writing 0's to your
device, it's constantly hammered and that's the hardest thing for a
flash device to handle (flash starts out at all bits set and then drops
them as needed to 0, so you are asking for the most work possible to be
done by the flash chips.)

It might be better to just buy a different disk drive :)

sorry,

greg k-h

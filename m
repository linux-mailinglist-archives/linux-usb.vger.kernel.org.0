Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754E7225182
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jul 2020 13:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgGSLIt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jul 2020 07:08:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:39820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgGSLIt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Jul 2020 07:08:49 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 354992065F;
        Sun, 19 Jul 2020 11:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595156928;
        bh=vKIBDBZITX1JEmGwHaXGviLmV8U5kjSS4O62uNCHVuo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eKw+yQl7Tnb0QSlFCtqIxkylZSz4uyWfdvgtkLjWjXWJDeXWa28KA9ZYAjQ/tOgCD
         eEnrqbid63UDH+wCGw5ZwH+dl3t+jPehSAgniXh6rPSp3inylMkXVfIU7EsnE+9RGp
         oSC7zHIoMrav419eZ/TG8U8Mn5r2s5AWHYy6yKOE=
Date:   Sun, 19 Jul 2020 13:09:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Tj (Elloe Linux)" <ml.linux@elloe.vision>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: uas: bug: [sda] tag#21 uas_eh_abort_handler 0 uas-tag 6
 inflight: IN
Message-ID: <20200719110901.GE266150@kroah.com>
References: <9268a7b4-217e-e76d-af9a-9c5b4f6fe54a@elloe.vision>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9268a7b4-217e-e76d-af9a-9c5b4f6fe54a@elloe.vision>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 19, 2020 at 11:22:10AM +0100, Tj (Elloe Linux) wrote:
> With all kernels from 4.14 to 5.8.0-rc5 we're seeing failures with uas
> on a Turris Mox aarch64 Marvell Armada 3720 that we don't see on amd64.
> 
> The device that triggers them is:
> 
> Bus 003 Device 002: ID 152d:0562 JMicron Technology Corp. / JMicron USA
> Technology Corp.
> 
> These are USB3<>NVME adapters with 256GB NVME attached.
> 
> On advice from the Turris Mox developers we tried booting with and
> without "pci=nomsi".

That implies that the host controller, or the PCI controller code, is
not working on the arm system well?

> We have other similar JMicron devices but they use usb-storage instead
> and work fine.
> 
> Linked below is the complete output from dmesg, lspci -vvnnk, lsusb -v
> but here's a snapshot of the error messages:
> 
> ...
> [   13.601433] hub 2-1:1.0: 4 ports detected
> [   13.724437] usb 3-1: new SuperSpeed Gen 1 USB device number 2 using
> xhci_hcd
> [   13.784151] scsi host0: uas
> [   13.788820] scsi 0:0:0:0: Direct-Access     JMicron  Tech
> 0204 PQ: 0 ANSI: 6
> [   13.830081] sd 0:0:0:0: [sda] 500118192 512-byte logical blocks: (256
> GB/238 GiB)
> [   13.835692] sd 0:0:0:0: Attached scsi generic sg0 type 0
> [   13.840597] sd 0:0:0:0: [sda] 4096-byte physical blocks
> [   13.894211] sd 0:0:0:0: [sda] Write Protect is off
> [   13.904097] sd 0:0:0:0: [sda] Mode Sense: 5f 00 00 08
> [   13.907773] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
> enabled, doesn't support DPO or FUA
> [   13.944550] sd 0:0:0:0: [sda] Optimal transfer size 33553920 bytes
> not a multiple of physical block size (4096 bytes)
> ...
> [   15.390872] sd 0:0:0:0: [sda] Attached SCSI disk
> ...
> [   46.104025] sd 0:0:0:0: [sda] tag#21 uas_eh_abort_handler 0 uas-tag 6
> inflight: IN
> [   46.109072] sd 0:0:0:0: [sda] tag#21 CDB: opcode=0x28 28 00 1d cf 2f
> d8 00 00 28 00
> [   46.119512] sd 0:0:0:0: [sda] tag#20 uas_eh_abort_handler 0 uas-tag 5
> inflight: IN
> [   46.124842] sd 0:0:0:0: [sda] tag#20 CDB: opcode=0x28 28 00 1d cf 2f
> 28 00 00 a8 00
> [   46.152049] scsi host0: uas_eh_device_reset_handler start
> [   46.285155] usb 3-1: reset SuperSpeed Gen 1 USB device number 2 using
> xhci_hcd
> [   46.312219] scsi host0: uas_eh_device_reset_handler success
> [   76.827742] scsi host0: uas_eh_device_reset_handler start
> [   76.831151] sd 0:0:0:0: [sda] tag#21 uas_zap_pending 0 uas-tag 1
> inflight:
> [   76.837629] sd 0:0:0:0: [sda] tag#21 CDB: opcode=0x28 28 00 1d cf 2f
> d8 00 00 28 00
> [   76.845513] sd 0:0:0:0: [sda] tag#20 uas_zap_pending 0 uas-tag 2
> inflight:
> [   76.852678] sd 0:0:0:0: [sda] tag#20 CDB: opcode=0x28 28 00 1d cf 2f
> 28 00 00 a8 00
> [   76.992756] usb 3-1: reset SuperSpeed Gen 1 USB device number 2 using
> xhci_hcd
> ...

Where is an error here?  Those looks ok to me.

> If we try to read the device with, e.g:
> 
> $ sudo dd if=/dev/sda count=8 | hexdump -C
> 
> then we see I/O errors:
> 
> ...
> [  199.911106] blk_update_request: I/O error, dev sda, sector 500117288
> op 0x0:(READ) flags 0x80700 phys_seg 21 prio class 0
> [  199.922749] sd 0:0:0:0: [sda] tag#21 UNKNOWN(0x2003) Result:
> hostbyte=0x08 driverbyte=0x00 cmd_age=184s
> [  199.932074] sd 0:0:0:0: [sda] tag#21 CDB: opcode=0x28 28 00 1d cf 2f
> d8 00 00 28 00
> [  199.939976] blk_update_request: I/O error, dev sda, sector 500117464
> op 0x0:(READ) flags 0x80700 phys_seg 5 prio class 0

So only the block layer is reporting errors, not the USB layer?  Any usb
controller errors?

And what USB controller driver are you using here?

thanks,

greg k-h

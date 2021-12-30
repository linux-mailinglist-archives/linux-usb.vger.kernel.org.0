Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88213481C76
	for <lists+linux-usb@lfdr.de>; Thu, 30 Dec 2021 14:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239518AbhL3NaG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Dec 2021 08:30:06 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:47040 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239514AbhL3NaF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Dec 2021 08:30:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7BD8C616E2
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 13:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1240BC36AEA;
        Thu, 30 Dec 2021 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640871003;
        bh=dZR1KMvhALwjTC+ede6NlIB9hgP7/RFkFOjv88I65ZE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tto0HCPoZNeEXWrq6n5hCP0t8RTsTzdoinBmn7+i4itpix0GFiyayctbVzN9feMFf
         s/vmjZE3MC3CdlZ+jfciUrfcxYlZn+mp7p1zbp3T5gt2Rr6GefVFw9aW+CIRdXZsWO
         Wrf5tJZlscQA0ykGRZExH9EtNNDhRe7bZPjpSMAo=
Date:   Thu, 30 Dec 2021 14:30:00 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     youling257 <youling257@gmail.com>
Cc:     mathias.nyman@intel.com, william.allentx@gmail.com,
        linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
Message-ID: <Yc20WPbIad44/3rd@kroah.com>
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
 <20211230131014.21886-1-youling257@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211230131014.21886-1-youling257@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 30, 2021 at 09:10:14PM +0800, youling257 wrote:
> where i can find the series patch? https://patchwork.kernel.org/project/linux-usb/list/?series=427561

There is nothing at that link.

What is the lore.kernel.org link for the patch you are curious about?

> when i used maiwo k1690(10gbps) connect to ASM3242 Controller, only 500MB/s.
> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb3/speed, 480
> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/speed, 20000
> maiwo k1690 is on /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/4-1.
> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/4-1/speed, 5000
> 
> 
> 01:00.0 USB controller: ASMedia Technology Inc. ASM3242 USB 3.2 Host Controller (prog-if 30 [XHCI])
>         Subsystem: ASMedia Technology Inc. ASM3242 USB 3.2 Host Controller
> 
> [    0.359281] xhci_hcd 0000:01:00.0: xHCI Host Controller
> [    0.359283] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
> [    0.359285] xhci_hcd 0000:01:00.0: Host supports USB 3.2 Enhanced SuperSpeed
> 
> [ 1191.734123] usb 4-1: new SuperSpeed USB device number 2 using xhci_hcd
> [ 1191.794767] usb-storage 4-1:1.0: USB Mass Storage device detected
> [ 1191.795049] scsi host9: usb-storage 4-1:1.0
> [ 1051.051274] scsi 9:0:0:0: Direct-Access     Realtek  USB 3.2 Device   1.00 PQ: 0 ANSI: 6
> [ 1051.051442] sd 9:0:0:0: Attached scsi generic sg0 type 0
> [ 1051.054461] sd 9:0:0:0: [sda] 500118192 512-byte logical blocks: (256 GB/238 GiB)
> [ 1051.055068] sd 9:0:0:0: [sda] Write Protect is off
> [ 1051.055073] sd 9:0:0:0: [sda] Mode Sense: 37 00 00 08
> [ 1051.055716] sd 9:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [ 1051.072131]  sda: sda1 sda2
> 
> i don't have NVMe to USB 2x2 Enclosure (ASM2364 chipset), i have NVMe to USB 2x1 Enclosure (RTL9120B chipset), maiwo k1690, using it on PciExpress X4 add in card (ASM3242 chipset), it only 5Gbps speed, should be 10Gbps.
> 

Are you sure that your hardware can really support this?  Do you have
the right cable and the device will support this speed?

And most important, what kernel version are you using?

thanks,

greg k-h

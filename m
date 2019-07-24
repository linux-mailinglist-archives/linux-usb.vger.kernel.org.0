Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E70AD7319C
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 16:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbfGXO2r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 10:28:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:57764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfGXO2r (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jul 2019 10:28:47 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7322521738;
        Wed, 24 Jul 2019 14:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563978526;
        bh=aWQWMyrxFaNZnukpUqVt9YCh8eiZqFbM0c1U3ZY06xE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s+IRvM3aEp6vHTRGsA3GelyI2bUQashJ7yxh3Hilx62k0KBVql1md0Zo3xIfgdowo
         uFtasG4Yir0Cv6ItmpKVoV/VDd+dAVblCEVq+wg8MpBnPz6ZbIDvq9YVn3wQ2HPVGM
         CvBuLzIiDJcTf/v6ClH+UnFqrGzPdZ+X9aN7ukMY=
Date:   Wed, 24 Jul 2019 16:20:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Maik Stohn <maik.stohn@seal-one.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: KERNEL CRASH when using XHCI devices (affects any architecture,
 any USB device)
Message-ID: <20190724142031.GA3087@kroah.com>
References: <21B63064-BAD5-4DC3-8E1A-3986CD948A93@seal-one.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21B63064-BAD5-4DC3-8E1A-3986CD948A93@seal-one.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 24, 2019 at 03:27:51PM +0200, Maik Stohn wrote:
> KERNEL CRASH when using XHCI devices (affects any architecture, any USB device) 
> 
> This was already reported as a kernel bug in bugzilla (https://bugzilla.kernel.org/show_bug.cgi?id=204257) but I got told to report it here since it is usb related...
> 
> Affected kernels: 5.2, 5.2.1, 5.2.2, 5.3-rc1, ...
> 
> This bug is already causing real world problems with existing software and devices using SCSI BOT with raw SCSI commands and libusb software.
> 
> Reproduce (tested on several different machines with 5.2,5.2.1,5.2.2,5.3rc1):
> 
>  - usb flash drive attached to XHCI controller (e.g. USB3.0 flash drive attached to USB3.0 port)
>  - generic scsi module loaded (e.g. /dev/sg0 comes up when attaching the flash drive)
>  - command line tool "sg_raw" from "sg3-utils"
>  - execute: and press a key + return (-s1 sends one byte which is read from stdin)
>    $ sudo sg_raw -s1 /dev/sg0 00 00 00 00 00 00 00 00 00 00
>    
>  -> KERNEL Oops
>  
>  - same for -s2, -s3, ... up to -s8   (sending 1 to 8 bytes, exactly the maximum of bytes on my 64 bit machine where the "DMA bypass optimization / IDT" kicks in, see below)
>  
> Since this can be triggered by any normal user (without any special USB device needed) I think it is important enough to fix it for the existing 5.2 kernel as well.
> 
> ---
> 
> Patch introducing the crash:  https://patchwork.kernel.org/patch/10919167 / commit 33e39350ebd20fe6a77a51b8c21c3aa6b4a208cf - "usb: xhci: add Immediate Data Transfer support"
> 
> Reason: NULL pointer dereference
> 
> ---
> 
> I took me quite some time to find the cause of this.
> 
> I narrowed the crash down to the place inside of "xhci_queue_bulk_tx" in "xhci-ring.c" where the next SG is loaded
> 
> ...
>     while (sg && sent_len >= block_len) {
>       /* New sg entry */
>       --num_sgs;
>       sent_len -= block_len;
>       if (num_sgs != 0) {
>         sg = sg_next(sg);
>         block_len = sg_dma_len(sg);           <================= CRASH
>                                                                  The comment of "sg_dma_len" clearly states "These macros should be used after a dma_map_sg call has been done..." - which was 
>                                                                  omitted by the new "xhci_map_urb_for_dma" function since the transfer was considered suitable for IDT.
>         addr = (u64) sg_dma_address(sg);
>         addr += sent_len;
>       }
>     }
>     block_len -= sent_len;
>     send_addr = addr;
> ...
> 
> This only happens if the transfer was cosnideres suitable for IDT. 
> When I patched the function "xhci_urb_suitable_for_idt" to always return false (nothing suitable for IDT) everything was working fine. 
> 
> 
> Unfortunately I'm not deep enough into the inner workings of the kernel usb host driver to find a solution for this other than reverting the patch for IDT.

What patch did you find that caused this regression?  We can revert it
if that is the easiest thing to do.

thanks,

greg k-h

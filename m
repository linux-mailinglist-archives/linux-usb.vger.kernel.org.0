Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9BB4DB1F6
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 14:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbiCPN6k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 09:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232045AbiCPN6k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 09:58:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18DD941FBE
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 06:57:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A863D60B89
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 13:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC5BC340E9;
        Wed, 16 Mar 2022 13:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1647439045;
        bh=oTGDTnH+gyqwsFqS4dhnTLE6Ax6M6kRBrGpeINaWdOc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vs9IF4NgMfhQJHTz5qM4W3VQa9i6IX2Sc3KA3s3CHROEPKPkmcWT8icooaqojDaTL
         2gbcxnP9fozNpGn7I2N76/vsRmAh8coWoAnfbPQYS37lQm9TPt3A9so+mtcIoFZ7gl
         HxGAf3hajDtw5vG7EdxY7FjofYcNz9+KGzuTDteY=
Date:   Wed, 16 Mar 2022 14:57:22 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Trouble with Intenso FlashLine 32GB USB stick on Kernel 4.14
Message-ID: <YjHswpjToSM5Pr7n@kroah.com>
References: <1647437997247.23069@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647437997247.23069@mentor.com>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 16, 2022 at 01:39:57PM +0000, Schmid, Carsten wrote:
> Hi Greg, Mathias,
> 
> i have a USB stick that - when plugged in - forces a USB storage hang message.
> Prior to that message i can see USBDEVFS_CONTROL timeout messages.
> (BTW the stick works fine on a desktop system with a recent kernel)
> The stick is having  a USB-C connector, and is connected to a USB2 port through an adapter (that i also used on the Desktop system for a quick check, and it worked there on a USB2 port)
> 
> I built a reproducer and collected traces (see attachment).
> As there is no MAINTAINER given for drivers/usb/core, i send that to you and the USB mailing list to ask someone to look into that.
> 
> >From the kernel's dmesg, these are the entries when trace has been recorded.
> 
> [159909.172301] usb 1-1: new high-speed USB device number 13 using xhci_hcd
> [159909.314291] usb 1-1: New USB device found, idVendor=058f, idProduct=6387
> [159909.314299] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [159909.314303] usb 1-1: Product: Intenso Flash Line
> [159909.314306] usb 1-1: Manufacturer: ALCOR
> [159909.314310] usb 1-1: SerialNumber: E13DF681
> [159909.317093] usb-storage 1-1:1.0: USB Mass Storage device detected
> [159909.319468] scsi host2: usb-storage 1-1:1.0
> [159909.614535] usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd NmeDefaultPrio rqt 192 rq 51 len 2 ret -110
> [159909.665513] usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd NmeDefaultPrio rqt 192 rq 51 len 2 ret -110
> [159909.729510] usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd NmeDefaultPrio rqt 192 rq 51 len 2 ret -110
> [159909.780610] usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd NmeDefaultPrio rqt 192 rq 51 len 2 ret -110

Why is usbfs being used for a storage device?  What userspace program do
you have that is poking at the device?

> [159928.908633] INFO: task usb-storage:31868 blocked for more than 10 seconds.
> [159928.908638]       Tainted: P     U     O    4.14.244-apl #1
> [159928.908638] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [159928.908640] usb-storage     D    0 31868      2 0x80000080
> [159928.908644] Call Trace:
> [159928.908657]  __schedule+0x1c2/0x7b0
> [159928.908659]  schedule+0x2e/0x90
> [159928.908661]  schedule_timeout+0x230/0x470
> [159928.908672]  ? usb_hcd_submit_urb+0x98/0xbc0 [usbcore]
> [159928.908674]  ? schedule_timeout+0x230/0x470
> [159928.908679]  ? usb_hcd_submit_urb+0x98/0xbc0 [usbcore]
> [159928.908681]  ? __switch_to_asm+0x35/0x70
> [159928.908683]  ? __switch_to_asm+0x41/0x70
> [159928.908684]  ? __switch_to_asm+0x35/0x70
> [159928.908685]  ? __switch_to_asm+0x41/0x70
> [159928.908687]  wait_for_common+0xb5/0x170
> [159928.908689]  ? wait_for_common+0xb5/0x170
> [159928.908692]  ? wake_up_q+0x80/0x80
> [159928.908694]  wait_for_completion+0x18/0x20
> [159928.908699]  usb_sg_wait+0x114/0x170 [usbcore]
> [159928.908706]  usb_stor_bulk_transfer_sglist.part.3+0x62/0xb0 [usb_storage]
> [159928.908708]  usb_stor_bulk_srb+0x46/0x80 [usb_storage]
> [159928.908711]  usb_stor_Bulk_transport+0x123/0x390 [usb_storage]
> [159928.908712]  ? __switch_to_asm+0x35/0x70
> [159928.908714]  ? __switch_to_asm+0x41/0x70
> [159928.908716]  usb_stor_invoke_transport+0x3c/0x530 [usb_storage]
> [159928.908718]  ? wait_for_common+0xb5/0x170
> [159928.908720]  ? wait_for_common+0x149/0x170
> [159928.908722]  ? wake_up_q+0x80/0x80
> [159928.908724]  usb_stor_transparent_scsi_command+0x9/0x10 [usb_storage]
> [159928.908726]  usb_stor_control_thread+0x1eb/0x2d0 [usb_storage]
> [159928.908729]  kthread+0x122/0x140
> [159928.908732]  ? fill_inquiry_response+0x20/0x20 [usb_storage]
> [159928.908733]  ? kthread_create_on_node+0x60/0x60
> [159928.908735]  ret_from_fork+0x35/0x40
> [159931.594483] usb 1-1: reset high-speed USB device number 13 using xhci_hcd
> 
> Anyone from USB who can help with that?

4.14 is really old.  Does 5.16 resolve this?

thanks,

greg k-h

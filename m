Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47FF9128052
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 17:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbfLTQEk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Dec 2019 11:04:40 -0500
Received: from netrider.rowland.org ([192.131.102.5]:34565 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727359AbfLTQEk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Dec 2019 11:04:40 -0500
Received: (qmail 6058 invoked by uid 500); 20 Dec 2019 11:04:39 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 20 Dec 2019 11:04:39 -0500
Date:   Fri, 20 Dec 2019 11:04:39 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     it+linux-usb@molgen.mpg.de
cc:     linux-usb@vger.kernel.org
Subject: Re: No block device created for NVMe SSD attached to Lindy enclosure
In-Reply-To: <9d6c3b15-38ed-3558-8a44-b39b299e2a36@molgen.mpg.de>
Message-ID: <Pine.LNX.4.44L0.1912201059490.5210-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 20 Dec 2019, Paul Menzel wrote:

> Dear Linux folks,
> 
> 
> With Linux 5.4.2 and 5.5-rc2 (no USB_UAS selected), attaching the
> Lindy USB 3.1 M.2 / mSATA enclosure with a Samsung PM981 attached to
> the enclosure over USB 3, the Linux kernel says, a block device is
> created, but `lsblk` does not show it.
> 
> This is with Debian’s Linux 5.4.2 from Debian experimental, and
> systemd 244.

This may not be a USB problem; you could try posting on the linux-scsi
or linux-block mailing lists.

> ```
> $ dmesg
> […]
> [  457.016225] usb 3-2: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> [  457.037233] usb 3-2: New USB device found, idVendor=174c, idProduct=55aa, bcdDevice= 1.00
> [  457.037238] usb 3-2: New USB device strings: Mfr=2, Product=3, SerialNumber=1
> [  457.037242] usb 3-2: Product: ASM1351
> [  457.037244] usb 3-2: Manufacturer: Asmedia
> [  457.037247] usb 3-2: SerialNumber: 00000000000000000001
> [  457.038599] probe of 3-2 returned 1 after 1114 usecs
> [  457.064790] calling  usb_storage_driver_init+0x0/0x1000 [usb_storage] @ 790
> [  457.064840] usb-storage 3-2:1.0: USB Mass Storage device detected
> [  457.065548] usb-storage 3-2:1.0: Quirks match for vid 174c pid 55aa: 400000

That quirk flag tells the kernel to issue READ CAPACITY(10) before READ
CAPACITY(16).  It should not cause any problems.

What is the capacity of the disk in the enclosure?

> [  457.065578] scsi host2: usb-storage 3-2:1.0
> [  457.065668] probe of 3-2:1.0 returned 1 after 839 usecs
> [  457.065682] usbcore: registered new interface driver usb-storage
> [  457.065692] initcall usb_storage_driver_init+0x0/0x1000 [usb_storage] returned 0 after 871 usecs
> [  457.068240] calling  uas_driver_init+0x0/0x1000 [uas] @ 790
> [  457.068262] usbcore: registered new interface driver uas
> [  457.068265] initcall uas_driver_init+0x0/0x1000 [uas] returned 0 after 21 usecs
> [  458.088650] scsi 2:0:0:0: Direct-Access     ASMT     2135             0    PQ: 0 ANSI: 6
> [  458.088890] sd 2:0:0:0: Attached scsi generic sg1 type 0
> [  458.128750] sd 2:0:0:0: [sdb] Attached SCSI removable disk
> [  458.128774] probe of 2:0:0:0 returned 1 after 39976 usecs
> $ lsblk --version
> lsblk from util-linux 2.34
> $ lsblk
> NAME           MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
> sda              8:0    0 238,5G  0 disk  
> ├─sda1           8:1    0   128M  0 part  /boot/efi
> ├─sda2           8:2    0   128M  0 part  /boot
> └─sda3           8:3    0 238,2G  0 part  
>   └─sda3_crypt 254:0    0 238,2G  0 crypt /
> ```
> 
> Do you have an idea, why the block device is not created? Is a
> special udev rule needed?

No idea.  You can get more information by collecting a usbmon trace 
showing what happens when the USB cable is plugged in.

Alan Stern


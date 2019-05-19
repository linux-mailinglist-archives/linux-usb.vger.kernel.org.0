Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9CA227DC
	for <lists+linux-usb@lfdr.de>; Sun, 19 May 2019 19:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728418AbfESRfw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 May 2019 13:35:52 -0400
Received: from authsmtp15.register.it ([81.88.48.38]:48613 "EHLO
        authsmtp.register.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727130AbfESRfv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 May 2019 13:35:51 -0400
Received: from [192.168.1.1] ([93.41.32.9])
        by cmsmtp with ESMTPSA
        id SPirhyHDqXqWaSPirhz25S; Sun, 19 May 2019 19:35:45 +0200
X-Rid:  guido@trentalancia.com@93.41.32.9
Message-ID: <1558287345.31240.3.camel@trentalancia.com>
Subject: Re: JMicron JMS578 USB-to-SATA HDD enclosure not working
From:   Guido Trentalancia <guido@trentalancia.com>
To:     linux-usb@vger.kernel.org
Date:   Sun, 19 May 2019 19:35:45 +0200
In-Reply-To: <1558182664.16275.8.camel@trentalancia.com>
References: <1558121554.3771.12.camel@trentalancia.com>
         <1558182664.16275.8.camel@trentalancia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEXu2XP4rbERGoICqS9LUGobH1RoWE82rQetS6V4QGWa7CHqTzQCOQ6XzUjJ5kqgFQC+atssUKfsptRcbzwZfoxBJsZkiDOFbWyVw0cPvZEf1yUnoKNn
 gLLKQnExFB9JAZkWnxzKm+YN09U0a3PJmNHwqgg+DKZyLxJ+lhNQ6XUN
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks to the new firmware and its more meaningful Sense Key, I finally
realized that the hard-drive was simply "locked" as in the BIOS Hard-
Disk Password Lock feature.

Therefore this is not a bug, the UAS driver is working fine with the
HDD enclosure and the issue was simply a matter of unlocking the drive
in the BIOS before connecting it to the JMicron JMS578 enclosure.

On Sat, 18/05/2019 at 14.31 +0200, Guido Trentalancia wrote:
> Hello again.
> 
> I have now upgraded the original HDD enclosure firmware (version
> 46.01.00.01) with the latest available one from the Hardkernel.com /
> Odroid.com project (version 173.01.00.02).
> 
> The problem persists with similar symptoms, however the Sense Key is
> now different:
> 
> sd 2:0:0:0: [sdb] tag#13 FAILED Result: hostbyte=DID_OK
> driverbyte=DRIVER_SENSE
> sd 2:0:0:0: [sdb] tag#13 Sense Key : Data Protect [current] 
> sd 2:0:0:0: [sdb] tag#13 Add. Sense: Logical unit access not
> authorized
> sd 2:0:0:0: [sdb] tag#13 CDB: Read(10) 28 00 00 00 00 00 00 00 08 00
> print_req_error: critical target error, dev sdb, sector 0 flags 0
> Buffer I/O error on dev sdb, logical block 0, async page read
> sdb: unable to read partition table
> sd 2:0:0:0: [sdb] Attached SCSI disk
> sd 2:0:0:0: [sdb] tag#4 FAILED Result: hostbyte=DID_OK
> driverbyte=DRIVER_SENSE
> sd 2:0:0:0: [sdb] tag#4 Sense Key : Data Protect [current] 
> sd 2:0:0:0: [sdb] tag#4 Add. Sense: Logical unit access not
> authorized
> sd 2:0:0:0: [sdb] tag#4 CDB: Read(10) 28 00 74 70 6d 00 00 00 08 00
> print_req_error: critical target error, dev sdb, sector 1953524992
> flags 80700
> 
> So, the Sense basically changed from "No additional sense" to
> "Logical
> unit access not authorized", which at least seems a bit more
> meaningful...
> 
> The hard-drive is a brand-new Seagate 1TB HDD which works perfectly
> fine when connected to the SATA port directly.
> 
> Is anybody aware of any kind of Data Protection or Access
> Authorization
> option that needs to be disabled or enabled, respectively ? If yes,
> how
> ?
> 
> Thanks very much for your time !
> 
> Guido
> 
> On Fri, 17/05/2019 at 21.32 +0200, Guido Trentalancia wrote:
> > Hello.
> > 
> > I am trying to use a Digitus DA-71114 USB-to-SATA HDD enclosure.
> > 
> > Such unit is reported to use the JMicron JMS578 chipset by the same
> > manufacturer, although it is listed with a different USB VID/PID:
> > 0080:a001.
> > 
> > Immediately after plugging in the USB cable, it reports I/O errors,
> > even though the hard-drive is fine (mounts and reads/writes fine
> > under
> > Windows without the enclosure):
> > 
> > [ 5432.689781] usb 2-1: new SuperSpeed Gen 1 USB device number 29
> > using
> > xhci_hcd
> > [ 5432.702547] usb 2-1: New USB device found, idVendor=0080,
> > idProduct=a001, bcdDevice= 1.00
> > [ 5432.702553] usb 2-1: New USB device strings: Mfr=1, Product=2,
> > SerialNumber=3
> > [ 5432.702557] usb 2-1: Product: External USB 3.0
> > [ 5432.702561] usb 2-1: Manufacturer: TOSHIBA
> > [ 5432.702565] usb 2-1: SerialNumber: 201503310008E
> > [ 5432.730948] usbcore: registered new interface driver usb-storage
> > [ 5432.736029] scsi host2: uas
> > [ 5432.736373] usbcore: registered new interface driver uas
> > [ 5432.736939] scsi 2:0:0:0: Direct-Access     TO Exter nal USB
> > 3.0      6101 PQ: 0 ANSI: 6
> > [ 5432.738326] sd 2:0:0:0: Attached scsi generic sg2 type 0
> > [ 5435.336588] sd 2:0:0:0: [sdb] 1953525168 512-byte logical
> > blocks:
> > (1.00 TB/932 GiB)
> > [ 5435.336594] sd 2:0:0:0: [sdb] 4096-byte physical blocks
> > [ 5435.336762] sd 2:0:0:0: [sdb] Write Protect is off
> > [ 5435.336766] sd 2:0:0:0: [sdb] Mode Sense: 53 00 00 08
> > [ 5435.337063] sd 2:0:0:0: [sdb] Write cache: enabled, read cache:
> > enabled, doesn't support DPO or FUA
> > [ 5435.337347] sd 2:0:0:0: [sdb] Optimal transfer size 33553920
> > bytes
> > not a multiple of physical block size (4096 bytes)
> > [ 5465.794203] sd 2:0:0:0: [sdb] tag#6 uas_eh_abort_handler 0 uas-
> > tag 
> > 1
> > inflight: CMD IN 
> > [ 5465.794211] sd 2:0:0:0: [sdb] tag#6 CDB: Read(10) 28 00 00 00 00
> > 00
> > 00 00 08 00
> > [ 5465.800252] scsi host2: uas_eh_device_reset_handler start
> > [ 5465.915678] usb 2-1: reset SuperSpeed Gen 1 USB device number 29
> > using xhci_hcd
> > [ 5465.931925] scsi host2: uas_eh_device_reset_handler success
> > [ 5496.510222] scsi host2: uas_eh_device_reset_handler start
> > [ 5496.510329] sd 2:0:0:0: [sdb] tag#11 uas_zap_pending 0 uas-tag 1
> > inflight: CMD 
> > [ 5496.510337] sd 2:0:0:0: [sdb] tag#11 CDB: Read(10) 28 00 00 00
> > 00
> > 00
> > 00 00 08 00
> > [ 5496.625614] usb 2-1: reset SuperSpeed Gen 1 USB device number 29
> > using xhci_hcd
> > [ 5496.642411] scsi host2: uas_eh_device_reset_handler success
> > [ 5527.230204] scsi host2: uas_eh_device_reset_handler start
> > [ 5527.230309] sd 2:0:0:0: [sdb] tag#9 uas_zap_pending 0 uas-tag 1
> > inflight: CMD 
> > [ 5527.230316] sd 2:0:0:0: [sdb] tag#9 CDB: Read(10) 28 00 00 00 00
> > 00
> > 00 00 08 00
> > [ 5527.345769] usb 2-1: reset SuperSpeed Gen 1 USB device number 29
> > using xhci_hcd
> > [ 5527.361964] scsi host2: uas_eh_device_reset_handler success
> > [ 5527.780612] sd 2:0:0:0: [sdb] tag#10 FAILED Result:
> > hostbyte=DID_OK
> > driverbyte=DRIVER_SENSE
> > [ 5527.780631] sd 2:0:0:0: [sdb] tag#10 Sense Key : Aborted Command
> > [current] 
> > [ 5527.780636] sd 2:0:0:0: [sdb] tag#10 Add. Sense: No additional
> > sense
> > information
> > [ 5527.780642] sd 2:0:0:0: [sdb] tag#10 CDB: Read(10) 28 00 00 00
> > 00
> > 00
> > 00 00 08 00
> > [ 5527.780647] print_req_error: I/O error, dev sdb, sector 0 flags
> > 0
> > [ 5527.780657] Buffer I/O error on dev sdb, logical block 0, async
> > page
> > read
> > 
> > I have also attached the usbmon dump just before and after plugging
> > in
> > the device.
> > 
> > Adding the US_FL_BROKEN_FUA in unusual_uas.h and unusual_devs.h
> > does
> > not help !
> > 
> > I have also tried adding many other quirks (such as
> > US_FL_NO_REPORT_OPCODES, US_FL_NO_ATA_1X, US_FL_IGNORE_RESIDUE,
> > US_FL_FIX_CAPACITY, US_FL_NO_WP_DETECT, US_FL_MAX_SECTORS_64)
> > without
> > any luck !!
> > 
> > The problem also happens when not using UAS but the standard USB
> > storage driver (fails on READ command, sector 0 and sometimes also
> > sector 1953524992).
> > 
> > When the drive is used in the enclosure it is completely unusable,
> > as
> > it fails even on fdisk...
> > 
> > What should I do ?
> > 
> > Thanks.
> > 
> > Guido

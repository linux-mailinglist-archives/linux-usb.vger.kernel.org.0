Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317E81AB2FA
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 23:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442212AbgDOU4T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 16:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2438334AbgDOU4P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Apr 2020 16:56:15 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7A0C061A0C
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2020 13:56:15 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id d17so1824103wrg.11
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2020 13:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=OCXyA4pnspRk+w/u6FGgUtANqV7nu316JVdN7jCyeF4=;
        b=Bbb4cQkOmQ57Txh8G/f5YCZPo18dtDIMxPrxXAGbpNB+glAnZpCl009hQc1tgGjVIu
         kd49Q9h1iM9tTgWM2VZgs5XmHCqdq+qnCvAM9HGMLKCebp/DUxGNj1epcuUANIwNBD41
         ulvPFV/ilieDYEhQwhW7HSAiqflNNrkQQsHJaKJ3gtVdtix/0cYsPjLbhfP2veyYFVx2
         EkNvyg5qat24QYfxpkegF8ehchooj8iCsrLEuqEIki1myQdnqg3BgXuKxDv5dXnIUeVo
         u8/WI9LKeG2xUz9uqKaiRFYsvJtCm+krXsM76mttDPaR+7h3tQK6ni9OF8o257+SunQe
         VWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=OCXyA4pnspRk+w/u6FGgUtANqV7nu316JVdN7jCyeF4=;
        b=lMOIL1Z3jAYQgvymk2618GOqpZNl8jDyz8ebdu7vT6MEbhHmeoz+tG5meiTJhWutvD
         NxqPmoeYkAZl35uTVvzJUb08zKkSHmFV3ElEHL8WDUmrJDnSY75TBKPqvPrrOT/MEei3
         w9AiS5hgd5APqV8DsAgPrKTbv8DxVamc49A3hDzhcOl5PeC3b4uRDdh1TAUfVAZNR8Jt
         0lRlsPotv2c7rh8dSaO1sQlbTVxMZvlQPBEubKz+jNy8KgUnft+fspsotpmCSJ5C+WF0
         bjiHCMHsLzghoVPspQg123D0+xLeA4PSW/nM0XXE47NBTkCCpRypJe0sDHX6O4+EEpT7
         9hQA==
X-Gm-Message-State: AGi0PuZrmx0QDWyaUmyGF+XySOH5bSs0EZiO/7qtQK2yD62mcAjhgK9z
        EMyzdiFVDWIYttwYm6LcOVEooFsK
X-Google-Smtp-Source: APiQypL+n1r3DypC+5jHsH++25GS8q6wvXU8ZkEn7DaQXu5HC3ef+fw5oW9X49jWWf9FEW6yBbsg4A==
X-Received: by 2002:adf:f1c5:: with SMTP id z5mr19087398wro.100.1586984173437;
        Wed, 15 Apr 2020 13:56:13 -0700 (PDT)
Received: from Susan (91-164-97-136.subs.proxad.net. [91.164.97.136])
        by smtp.gmail.com with ESMTPSA id a15sm849402wme.17.2020.04.15.13.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 13:56:12 -0700 (PDT)
Date:   Wed, 15 Apr 2020 22:56:10 +0200
From:   Cyril Roelandt <tipecaml@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     sellis@redhat.com, pachoramos@gmail.com, labbott@fedoraproject.org,
        gregkh@linuxfoundation.org
Subject: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
Message-ID: <20200415205610.GA8665@Susan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I own a WD Blue 1TB hard drive that I use in combination with an Icy Box
IB-273StU3-B enclosure in order to plug it to my laptop using USB. It
worked fine with all the Linux versions I tried, up until 5.4.17.


Using Linux 5.3
---------------
Everything works as expected when I plug the drive, and I can mount the
partitions:

# dmesg -T
[Sun Mar 22 23:48:39 2020] usb 2-2: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[Sun Mar 22 23:48:39 2020] usb 2-2: New USB device found, idVendor=357d, idProduct=7788, bcdDevice= 1.14
[Sun Mar 22 23:48:39 2020] usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[Sun Mar 22 23:48:39 2020] usb 2-2: Product: USB to ATA/ATAPI Bridge
[Sun Mar 22 23:48:39 2020] usb 2-2: Manufacturer: JMicron
[Sun Mar 22 23:48:39 2020] usb 2-2: SerialNumber: 74D7851513309E5
[Sun Mar 22 23:48:39 2020] usbcore: registered new interface driver usb-storage
[Sun Mar 22 23:48:39 2020] scsi host6: uas
[Sun Mar 22 23:48:39 2020] usbcore: registered new interface driver uas
[Sun Mar 22 23:48:39 2020] scsi 6:0:0:0: Direct-Access     WDC WD10 JPVT-00A1YT0     0114 PQ: 0 ANSI: 6
[Sun Mar 22 23:48:39 2020] sd 6:0:0:0: Attached scsi generic sg1 type 0
[Sun Mar 22 23:48:39 2020] sd 6:0:0:0: [sdb] Spinning up disk...
[Sun Mar 22 23:48:40 2020] ..ready
[Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
[Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] 4096-byte physical blocks
[Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] Write Protect is off
[Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] Mode Sense: 53 00 10 08
[Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
[Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] Optimal transfer size 33553920 bytes not a multiple of physical block size (4096 bytes)
[Sun Mar 22 23:48:41 2020]  sdb: sdb1
[Sun Mar 22 23:48:41 2020] sd 6:0:0:0: [sdb] Attached SCSI disk


Using Linux 5.4
---------------

# uname -a
Linux Susan 5.4.0-4-amd64 #1 SMP Debian 5.4.19-1 (2020-02-13) x86_64 GNU/Linux

# mkdir /tmp/mnt

# mount /dev/sdb1 /tmp/mnt
mount: /tmp/mnt: can't read superblock on /dev/sdb1.

# fsck -y /dev/sdb1
fsck from util-linux 2.34
e2fsck 1.45.6 (20-Mar-2020)
/dev/sdb1: clean, 2951657/61054976 files, 115035523/244190208 blocks

# dmesg -T 
[Mon Mar 23 18:43:06 2020] usb 3-2: new SuperSpeed Gen 1 USB device number 8 using xhci_hcd
[Mon Mar 23 18:43:06 2020] usb 3-2: New USB device found, idVendor=357d, idProduct=7788, bcdDevice= 1.14
[Mon Mar 23 18:43:06 2020] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[Mon Mar 23 18:43:06 2020] usb 3-2: Product: USB to ATA/ATAPI Bridge
[Mon Mar 23 18:43:06 2020] usb 3-2: Manufacturer: JMicron
[Mon Mar 23 18:43:06 2020] usb 3-2: SerialNumber: 74D7851513309E5
[Mon Mar 23 18:43:06 2020] usb 3-2: UAS is blacklisted for this device, using usb-storage instead
[Mon Mar 23 18:43:06 2020] usb-storage 3-2:1.0: USB Mass Storage device detected
[Mon Mar 23 18:43:06 2020] usb-storage 3-2:1.0: Quirks match for vid 357d pid 7788: 4800000
[Mon Mar 23 18:43:06 2020] scsi host6: usb-storage 3-2:1.0
[Mon Mar 23 18:43:07 2020] scsi 6:0:0:0: Direct-Access     WDC WD10 JPVT-00A1YT0     0114 PQ: 0 ANSI: 6
[Mon Mar 23 18:43:07 2020] sd 6:0:0:0: Attached scsi generic sg1 type 0
[Mon Mar 23 18:43:07 2020] sd 6:0:0:0: [sdb] Spinning up disk...
[Mon Mar 23 18:43:08 2020] ..ready
[Mon Mar 23 18:43:09 2020] sd 6:0:0:0: [sdb] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
[Mon Mar 23 18:43:09 2020] sd 6:0:0:0: [sdb] Write Protect is off
[Mon Mar 23 18:43:09 2020] sd 6:0:0:0: [sdb] Mode Sense: 47 00 10 08
[Mon Mar 23 18:43:09 2020] sd 6:0:0:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
[Mon Mar 23 18:43:09 2020]  sdb: sdb1
[Mon Mar 23 18:43:09 2020] sd 6:0:0:0: [sdb] Attached SCSI disk
[Mon Mar 23 18:43:30 2020] sd 6:0:0:0: [sdb] tag#0 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_SENSE
[Mon Mar 23 18:43:30 2020] sd 6:0:0:0: [sdb] tag#0 Sense Key : Illegal Request [current] 
[Mon Mar 23 18:43:30 2020] sd 6:0:0:0: [sdb] tag#0 Add. Sense: Invalid field in cdb
[Mon Mar 23 18:43:30 2020] sd 6:0:0:0: [sdb] tag#0 CDB: Write(10) 2a 08 00 00 08 00 00 00 08 00
[Mon Mar 23 18:43:30 2020] blk_update_request: critical target error, dev sdb, sector 2048 op 0x1:(WRITE) flags 0x20800 phys_seg 1 prio class 0
[Mon Mar 23 18:43:30 2020] Buffer I/O error on dev sdb1, logical block 0, lost sync page write
[Mon Mar 23 18:43:30 2020] EXT4-fs (sdb1): I/O error while writing superblock
[Mon Mar 23 18:43:30 2020] EXT4-fs (sdb1): mount failed

# lsusb 
Bus 003 Device 008: ID 357d:7788 Sharkoon QuickPort XT


Other considerations
--------------------
This enclosure works as expected with another drive: I tried with an old
Fujitsu 250GB drive and was able to mount the partitions.

The WD drive works with a similar enclosure: the Icy Box IB-268U3-B
enclosure. It has the exact same vendor id and product id (357d:7788)
but a different bcdDevice (2.03).

Looking at the dmesg logs I pasted above, I see that the main difference
is the driver used:
- uas in Linux 5.3;
- usb-storage in Linux 5.4, since uas is blacklisted.


I believe the uas driver was blacklisted because of an old bug[1] in
Fedora. In Linux, the commit that disabled uas is
bc3bdb12bbb3492067c8719011576370e959a2e6.

I do not really mind not being able to use uas, however I would like to
be able to mount my partitions using usb-storage.


Regards,
Cyril Roelandt


[1] https://bugzilla.redhat.com/show_bug.cgi?id=1260207

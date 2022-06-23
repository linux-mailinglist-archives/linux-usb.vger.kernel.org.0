Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4992558BA5
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 01:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbiFWXVp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 19:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiFWXVo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 19:21:44 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FCE4B1C5
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 16:21:42 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id c30so864241ljr.9
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 16:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=HX1oXxGd35O7b0Mx9WucklJeNs4yrJgMG/WDEY27GRI=;
        b=NEuJW84xuOl1xm2n5RsXsDTMGPlt4ixOjFxJ1Ach03frNEaGqRUiHOa6KsY4oSGVjd
         kHeSoZFjevsIfsec8ajuxxhupW4JBzkMYAMwAaPLqvIcSRKrDZHlpXBz7hs7jG/nknXp
         3yKo2icrR3k3IgGU1+esHlaYHx+PbF01mCNNG+TkpvO7QHkSDSixm8k9tUmylvM5BnbU
         oAFuSxW19khU3cO0UcPfsbaUBALTXbo4+CCQV9ObPVKwA3zgT5GmVUhJx3ir4+o5+IhY
         QuCitKj6pKScAP4p9re/ZY1RePqL46igaXnyJPRgMCxZeI9ko4SH9ekKFI42xS2sJkYX
         CjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=HX1oXxGd35O7b0Mx9WucklJeNs4yrJgMG/WDEY27GRI=;
        b=Ji0iI5prxafzOugZTmIrz+ncKFl4FgBpokHWFGXdzk6xCkPg4x2yIFB3enbdej2lw+
         JX5HZ0YIx8euWd4sB/7Rws88WgBnGJ3smTZ7boCgtlf5SrhSryYSjcrZgNlCLnrndt2r
         qvLpVM4s/mZMC2wo9GXuzIvus3VfFcKXkiueEHZLYX2AOUcLlQpEEj8iT4MBPCIkLzk6
         4ugbU2+eAzH/KQtoA5QalrA2xR2kRweCSx2cuu2ewENrfxjgzCGSHRAZFI35bbk0AcMZ
         GUyAZWDIhKmNtUNyVHEulRpQj2Y9mDI+MRINZGcBthbL3MdH/xZoNfky8jbsGuxcfPRG
         gHgg==
X-Gm-Message-State: AJIora9cIQGPzEvEfD3gpJKStpNQzyUQF+4U1rSkg+bUd+i+8NFc6mdb
        IPy+2/qUPT6gAjE/ubeNqRKhig4R2XGk4foSnOkJM8MXlcQ=
X-Google-Smtp-Source: AGRyM1tiVDEMogpx0R0ROCVv8lJZqskv7mxG4RnF65ANMKqnfwqzkmTBh8JGHF5CJ0DqANAAyU+cm+NcAT5WujogC2Q=
X-Received: by 2002:a2e:bb88:0:b0:25a:6ec7:a1a0 with SMTP id
 y8-20020a2ebb88000000b0025a6ec7a1a0mr6148855lje.360.1656026499637; Thu, 23
 Jun 2022 16:21:39 -0700 (PDT)
MIME-Version: 1.0
From:   jharrop@gmail.com
Date:   Fri, 24 Jun 2022 09:21:27 +1000
Message-ID: <CAM-hvXeAad4d4KDrL=evC1dXr2fqqkQd0BpqHtmB4K4xxqPKJQ@mail.gmail.com>
Subject: SilverStone/Asmedia errors on SuperSpeed Plus Gen 2x2 USB (xhci_hcd)
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,  I've tried SST-MS12 on a Gen2x2 (20 Gbps) port in a Dell
Precision 3660 tower.

It gives kernel errors; this happens booting from it, or attaching it
at run time.

On a Gen 2 (10 Gbps) port, the device works fine.

I'm using Linux version 5.15.48-1-MANJARO;  is it likely to work
better with more recent patches?

thanks .. Jason

--------------

Jun 22 23:57:43 jason-precision3660 kernel: Linux version
5.15.48-1-MANJARO (builduser@fv-az504-703) (gcc (GCC) 12.1.0, GNU ld
(GNU Binutils) 2.38) #1 SMP PREEMPT Thu Jun 16 12:33:56>

Jun 22 23:57:43 jason-precision3660 kernel: DMI: Dell Inc. Precision
3660/0N0992, BIOS 1.2.48 05/13/2022

Jun 22 23:58:46 jason-precision3660 kernel: usb 2-9: new SuperSpeed
Plus Gen 2x2 USB device number 2 using xhci_hcd
Jun 22 23:58:46 jason-precision3660 kernel: usb 2-9: New USB device
found, idVendor=174c, idProduct=2362, bcdDevice= 1.00
Jun 22 23:58:46 jason-precision3660 kernel: usb 2-9: New USB device
strings: Mfr=2, Product=3, SerialNumber=1
Jun 22 23:58:46 jason-precision3660 kernel: usb 2-9: Product: SilverStone MS12
Jun 22 23:58:46 jason-precision3660 kernel: usb 2-9: Manufacturer: Asmedia
Jun 22 23:58:46 jason-precision3660 kernel: usb 2-9: SerialNumber: 000000000DA1
Jun 22 23:58:46 jason-precision3660 mtp-probe[1497]: checking bus 2,
device 2: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-9"
Jun 22 23:58:46 jason-precision3660 mtp-probe[1497]: bus: 2, device: 2
was not an MTP device
Jun 22 23:58:46 jason-precision3660 kernel: usbcore: registered new
interface driver usb-storage
Jun 22 23:58:46 jason-precision3660 kernel: scsi host8: uas
Jun 22 23:58:46 jason-precision3660 kernel: usbcore: registered new
interface driver uas
Jun 22 23:58:47 jason-precision3660 kernel: scsi 8:0:0:0:
Direct-Access     SST-     MS12 MVMe        0    PQ: 0 ANSI: 6
Jun 22 23:58:47 jason-precision3660 kernel: sd 8:0:0:0: Attached scsi
generic sg1 type 0
Jun 22 23:58:47 jason-precision3660 kernel: sd 8:0:0:0: [sdb]
1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
Jun 22 23:58:47 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Write
Protect is off
Jun 22 23:58:47 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Mode
Sense: 43 00 00 00
Jun 22 23:58:47 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Write
cache: enabled, read cache: enabled, doesn't support DPO or FUA
Jun 22 23:58:47 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Optimal
transfer size 2097152 bytes
Jun 22 23:58:47 jason-precision3660 kernel:  sdb: sdb1 sdb2
Jun 22 23:58:47 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Attached SCSI disk
Jun 22 23:58:47 jason-precision3660 mtp-probe[1503]: checking bus 2,
device 2: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-9"
Jun 22 23:58:47 jason-precision3660 mtp-probe[1503]: bus: 2, device: 2
was not an MTP device
Jun 22 23:58:51 jason-precision3660 kernel: usb 2-9: USB disconnect,
device number 2
Jun 22 23:58:51 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#24
uas_zap_pending 0 uas-tag 1 inflight: CMD
Jun 22 23:58:51 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#24
CDB: Read(10) 28 00 00 00 01 08 00 00 f8 00
Jun 22 23:58:51 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#24
FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK cmd_age=4s
Jun 22 23:58:51 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#24
CDB: Read(10) 28 00 00 00 01 08 00 00 f8 00
Jun 22 23:58:51 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 264 op 0x0:(READ) flags 0x80700 phys_seg 31
prio class 0
Jun 22 23:58:51 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 264 op 0x0:(READ) flags 0x0 phys_seg 1 prio
class 0
Jun 22 23:58:51 jason-precision3660 kernel: Buffer I/O error on dev
sdb, logical block 33, async page read
Jun 22 23:58:51 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 264 op 0x0:(READ) flags 0x0 phys_seg 1 prio
class 0
Jun 22 23:58:51 jason-precision3660 kernel: Buffer I/O error on dev
sdb, logical block 33, async page read
Jun 22 23:58:51 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 264 op 0x0:(READ) flags 0x0 phys_seg 1 prio
class 0
Jun 22 23:58:51 jason-precision3660 kernel: Buffer I/O error on dev
sdb, logical block 33, async page read
Jun 22 23:58:51 jason-precision3660 kernel: sd 8:0:0:0: [sdb]
Synchronizing SCSI cache
Jun 22 23:58:52 jason-precision3660 kernel: sd 8:0:0:0: [sdb]
Synchronize Cache(10) failed: Result: hostbyte=DID_ERROR
driverbyte=DRIVER_OK


Jun 23 00:17:21 jason-precision3660 udisksd[956]: Mounted /dev/sdb2 at
/run/media/jharrop/93adcd90-e911-4f78-82b0-b3c1f45284d2 on behalf of
uid 1000
Jun 23 00:17:21 jason-precision3660 kernel: EXT4-fs (sdb2): mounted
filesystem with ordered data mode. Opts: errors=remount-ro. Quota
mode: none.
Jun 23 00:17:21 jason-precision3660 systemd[978]: Started kde-open5.
Jun 23 00:17:21 jason-precision3660 kde-open5[3252]:
kf.service.services: KApplicationTrader: mimeType
"x-scheme-handler/file" not found
Jun 23 00:17:21 jason-precision3660 kde-open5[3252]:
kf.service.services: KApplicationTrader: mimeType
"x-scheme-handler/file" not found
Jun 23 00:17:21 jason-precision3660 systemd[978]: Started Dolphin -
File Manager.
Jun 23 00:17:21 jason-precision3660 kwin_x11[1072]: qt.qpa.xcb:
QXcbConnection: XCB error: 3 (BadWindow), sequence: 51553, resource
id: 75497477, major code: 18 (ChangeProperty), mino
r code: 0
Jun 23 00:17:21 jason-precision3660 kwin_x11[1072]: qt.qpa.xcb:
QXcbConnection: XCB error: 3 (BadWindow), sequence: 51558, resource
id: 75497478, major code: 18 (ChangeProperty), mino
r code: 0
Jun 23 00:17:21 jason-precision3660 kwin_x11[1072]: qt.qpa.xcb:
QXcbConnection: XCB error: 3 (BadWindow), sequence: 51562, resource
id: 75497479, major code: 18 (ChangeProperty), mino
r code: 0
Jun 23 00:17:21 jason-precision3660 dolphin[3258]: org.kde.dolphin:
Unknown class  ""  in session saved data!
Jun 23 00:17:21 jason-precision3660 dolphin[3258]: kf.kio.widgets:
Cannot read information about filesystem under path
"/home/jharrop/.cache/thumbnails/"
Jun 23 00:17:28 jason-precision3660 kernel: usb 2-9: USB disconnect,
device number 3
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#11
uas_zap_pending 0 uas-tag 1 inflight: CMD
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#11
CDB: Read(10) 28 00 26 05 84 48 00 00 80 00
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#12
uas_zap_pending 0 uas-tag 2 inflight: CMD
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#12
CDB: Read(10) 28 00 00 09 93 b0 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#13
uas_zap_pending 0 uas-tag 3 inflight: CMD
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#13
CDB: Read(10) 28 00 00 49 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#14
uas_zap_pending 0 uas-tag 4 inflight: CMD
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#14
CDB: Read(10) 28 00 00 89 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#15
uas_zap_pending 0 uas-tag 5 inflight: CMD
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#15
CDB: Read(10) 28 00 00 c9 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#16
uas_zap_pending 0 uas-tag 6 inflight: CMD
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#16
CDB: Read(10) 28 00 01 09 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#17
uas_zap_pending 0 uas-tag 7 inflight: CMD
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#17
CDB: Read(10) 28 00 01 49 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#18
uas_zap_pending 0 uas-tag 8 inflight: CMD
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#18
CDB: Read(10) 28 00 01 89 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#19
uas_zap_pending 0 uas-tag 9 inflight: CMD
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#19
CDB: Read(10) 28 00 01 c9 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#20
uas_zap_pending 0 uas-tag 10 inflight: CMD
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#20
CDB: Read(10) 28 00 01 c9 70 50 00 00 30 00
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#24
uas_zap_pending 0 uas-tag 11 inflight: CMD
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#24
CDB: Write(10) 2a 00 3a 0d 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#11
FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK cmd_age=6s
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#11
CDB: Read(10) 28 00 26 05 84 48 00 00 80 00
Jun 23 00:17:28 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 637895752 op 0x0:(READ) flags 0x80700 phys_seg
16 prio class 0
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#12
FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK cmd_age=5s
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#12
CDB: Read(10) 28 00 00 09 93 b0 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 627632 op 0x0:(READ) flags 0x83700 phys_seg 1
prio class 0
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#13
FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK cmd_age=5s
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#13
CDB: Read(10) 28 00 00 49 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 4812800 op 0x0:(READ) flags 0x83700 phys_seg 1
prio class 0
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#14
FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK cmd_age=5s
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#14
CDB: Read(10) 28 00 00 89 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 9007104 op 0x0:(READ) flags 0x83700 phys_seg 1
prio class 0
Jun 23 00:17:28 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 637895752 op 0x0:(READ) flags 0x0 phys_seg 1
prio class 0
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#15
FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK cmd_age=5s
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#15
CDB: Read(10) 28 00 00 c9 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 13201408 op 0x0:(READ) flags 0x83700 phys_seg 1
prio class 0
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#16
FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK cmd_age=5s
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#16
CDB: Read(10) 28 00 01 09 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 17395712 op 0x0:(READ) flags 0x83700 phys_seg 1
prio class 0
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#17
FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK cmd_age=5s
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#17
CDB: Read(10) 28 00 01 49 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 21590016 op 0x0:(READ) flags 0x83700 phys_seg 1
prio class 0
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#18
FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK cmd_age=5s
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#18
CDB: Read(10) 28 00 01 89 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 25784320 op 0x0:(READ) flags 0x83700 phys_seg 1
prio class 0
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#19
FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK cmd_age=5s
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#19
CDB: Read(10) 28 00 01 c9 70 00 00 00 08 00
Jun 23 00:17:28 jason-precision3660 kernel: blk_update_request: I/O
error, dev sdb, sector 29978624 op 0x0:(READ) flags 0x83700 phys_seg 1
prio class 0
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#20
FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK cmd_age=5s
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb] tag#20
CDB: Read(10) 28 00 01 c9 70 50 00 00 30 00
Jun 23 00:17:28 jason-precision3660 kernel: Buffer I/O error on dev
sdb2, logical block 121667584, lost sync page write
Jun 23 00:17:28 jason-precision3660 kernel: JBD2: Error -5 detected
when updating journal superblock for sdb2-8.
Jun 23 00:17:28 jason-precision3660 kernel: Aborting journal on device sdb2-8.
Jun 23 00:17:28 jason-precision3660 kernel: Buffer I/O error on dev
sdb2, logical block 121667584, lost sync page write
Jun 23 00:17:28 jason-precision3660 kernel: JBD2: Error -5 detected
when updating journal superblock for sdb2-8.
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs error (device
sdb2): ext4_wait_block_bitmap:531: comm ext4lazyinit: Cannot read
block bitmap - block_group = 127, block_bitmap = 36
70031
Jun 23 00:17:28 jason-precision3660 kernel: Buffer I/O error on dev
sdb2, logical block 0, lost sync page write
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs (sdb2): I/O error
while writing superblock
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs (sdb2): Remounting
filesystem read-only
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs error (device
sdb2): ext4_wait_block_bitmap:531: comm ext4lazyinit: Cannot read
block bitmap - block_group = 255, block_bitmap = 78
64335
Jun 23 00:17:28 jason-precision3660 kernel: Buffer I/O error on dev
sdb2, logical block 0, lost sync page write
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs (sdb2): I/O error
while writing superblock
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs error (device
sdb2): ext4_wait_block_bitmap:531: comm ext4lazyinit: Cannot read
block bitmap - block_group = 383, block_bitmap = 12
058639
Jun 23 00:17:28 jason-precision3660 kernel: Buffer I/O error on dev
sdb2, logical block 0, lost sync page write
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs (sdb2): I/O error
while writing superblock
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs error (device
sdb2): ext4_wait_block_bitmap:531: comm ext4lazyinit: Cannot read
block bitmap - block_group = 511, block_bitmap = 16
252943
Jun 23 00:17:28 jason-precision3660 kernel: Buffer I/O error on dev
sdb2, logical block 0, lost sync page write
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs (sdb2): I/O error
while writing superblock
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs error (device
sdb2): ext4_wait_block_bitmap:531: comm ext4lazyinit: Cannot read
block bitmap - block_group = 639, block_bitmap = 20
447247
Jun 23 00:17:28 jason-precision3660 kernel: Buffer I/O error on dev
sdb2, logical block 0, lost sync page write
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs (sdb2): I/O error
while writing superblock
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs error (device
sdb2): ext4_wait_block_bitmap:531: comm ext4lazyinit: Cannot read
block bitmap - block_group = 767, block_bitmap = 24
641551
Jun 23 00:17:28 jason-precision3660 kernel: Buffer I/O error on dev
sdb2, logical block 0, lost sync page write
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs (sdb2): I/O error
while writing superblock
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs error (device
sdb2): ext4_wait_block_bitmap:531: comm ext4lazyinit: Cannot read
block bitmap - block_group = 895, block_bitmap = 28
835855
Jun 23 00:17:28 jason-precision3660 kernel: Buffer I/O error on dev
sdb2, logical block 0, lost sync page write
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs (sdb2): I/O error
while writing superblock
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs error (device
sdb2): ext4_wait_block_bitmap:531: comm ext4lazyinit: Cannot read
block bitmap - block_group = 1023, block_bitmap = 3
3030159
Jun 23 00:17:28 jason-precision3660 kernel: Buffer I/O error on dev
sdb2, logical block 0, lost sync page write
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs (sdb2): I/O error
while writing superblock
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs error (device
sdb2): ext4_wait_block_bitmap:531: comm ext4lazyinit: Cannot read
block bitmap - block_group = 1151, block_bitmap = 3
7224463
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs (sdb2): I/O error
while writing superblock
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs error (device
sdb2): ext4_wait_block_bitmap:531: comm ext4lazyinit: Cannot read
block bitmap - block_group = 1279, block_bitmap = 4
1418767
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs warning (device
sdb2): dx_probe:790: inode #17956868: lblock 0: comm kioslave5: error
-5 reading directory block
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs warning (device
sdb2): dx_probe:790: inode #17956868: lblock 0: comm kioslave5: error
-5 reading directory block
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs warning (device
sdb2): dx_probe:790: inode #17956868: lblock 0: comm kioslave5: error
-5 reading directory block
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs warning (device
sdb2): dx_probe:790: inode #17956868: lblock 0: comm kioslave5: error
-5 reading directory block
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs warning (device
sdb2): dx_probe:790: inode #17956868: lblock 0: comm kioslave5: error
-5 reading directory block
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs warning (device
sdb2): dx_probe:790: inode #17956868: lblock 0: comm kioslave5: error
-5 reading directory block
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs warning (device
sdb2): dx_probe:790: inode #17956868: lblock 0: comm kioslave5: error
-5 reading directory block
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs warning (device
sdb2): dx_probe:790: inode #17956868: lblock 0: comm kioslave5: error
-5 reading directory block
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs warning (device
sdb2): dx_probe:790: inode #17956868: lblock 0: comm kioslave5: error
-5 reading directory block
Jun 23 00:17:28 jason-precision3660 kernel: EXT4-fs warning (device
sdb2): dx_probe:790: inode #17956868: lblock 0: comm kioslave5: error
-5 reading directory block
Jun 23 00:17:28 jason-precision3660 udisksd[956]: Cleaning up mount
point /run/media/jharrop/93adcd90-e911-4f78-82b0-b3c1f45284d2 (device
8:18 no longer exists)
Jun 23 00:17:28 jason-precision3660 systemd[1]:
run-media-jharrop-93adcd90\x2de911\x2d4f78\x2d82b0\x2db3c1f45284d2.mount:
Deactivated successfully.
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb]
Synchronizing SCSI cache
Jun 23 00:17:28 jason-precision3660 kernel: sd 8:0:0:0: [sdb]
Synchronize Cache(10) failed: Result: hostbyte=DID_ERROR
driverbyte=DRIVER_OK
Jun 23 00:17:28 jason-precision3660 kernel: usb 2-9: new SuperSpeed
Plus Gen 2x2 USB device number 4 using xhci_hcd
Jun 23 00:17:28 jason-precision3660 kernel: usb 2-9: New USB device
found, idVendor=174c, idProduct=2362, bcdDevice= 1.00
Jun 23 00:17:28 jason-precision3660 kernel: usb 2-9: New USB device
strings: Mfr=2, Product=3, SerialNumber=1
Jun 23 00:17:28 jason-precision3660 kernel: usb 2-9: Product: SilverStone MS12
Jun 23 00:17:28 jason-precision3660 kernel: usb 2-9: Manufacturer: Asmedia
Jun 23 00:17:28 jason-precision3660 kernel: usb 2-9: SerialNumber: 000000000DA1
Jun 23 00:17:28 jason-precision3660 kernel: scsi host8: uas
Jun 23 00:17:28 jason-precision3660 mtp-probe[3348]: checking bus 2,
device 4: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-9"
Jun 23 00:17:28 jason-precision3660 mtp-probe[3348]: bus: 2, device: 4
was not an MTP device
Jun 23 00:17:28 jason-precision3660 mtp-probe[3349]: checking bus 2,
device 4: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-9"
Jun 23 00:17:28 jason-precision3660 mtp-probe[3349]: bus: 2, device: 4
was not an MTP device
Jun 23 00:17:29 jason-precision3660 kernel: scsi 8:0:0:0:
Direct-Access     SST-     MS12 MVMe        0    PQ: 0 ANSI: 6
Jun 23 00:17:29 jason-precision3660 kernel: sd 8:0:0:0: Attached scsi
generic sg1 type 0
Jun 23 00:17:29 jason-precision3660 kernel: sd 8:0:0:0: [sdb]
1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
Jun 23 00:17:29 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Write
Protect is off
Jun 23 00:17:29 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Mode
Sense: 43 00 00 00
Jun 23 00:17:29 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Write
cache: enabled, read cache: enabled, doesn't support DPO or FUA
Jun 23 00:17:29 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Optimal
transfer size 2097152 bytes
Jun 23 00:17:29 jason-precision3660 kernel:  sdb: sdb1 sdb2
Jun 23 00:17:29 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Attached SCSI disk
Jun 23 00:17:30 jason-precision3660 plasmashell[1166]:
file:///usr/lib/qt/qml/org/kde/plasma/extras/ExpandableListItem.qml:292:
TypeError: Cannot read property 'enabled' of null
Jun 23 00:17:30 jason-precision3660 plasmashell[1166]:
file:///usr/lib/qt/qml/org/kde/plasma/extras/ExpandableListItem.qml:292:
TypeError: Cannot read property 'enabled' of null
Jun 23 00:17:30 jason-precision3660 plasmashell[1166]:
file:///usr/lib/qt/qml/org/kde/plasma/extras/ExpandableListItem.qml:292:
TypeError: Cannot read property 'enabled' of null
Jun 23 00:17:30 jason-precision3660 udisksd[956]: Mounted /dev/sdb2 at
/run/media/jharrop/93adcd90-e911-4f78-82b0-b3c1f45284d2 on behalf of
uid 1000
Jun 23 00:17:30 jason-precision3660 kernel: EXT4-fs (sdb2): recovery complete
Jun 23 00:17:30 jason-precision3660 kernel: EXT4-fs (sdb2): mounted
filesystem with ordered data mode. Opts: errors=remount-ro. Quota
mode: none.
Jun 23 00:17:30 jason-precision3660 plasmashell[1166]:
file:///usr/lib/qt/qml/org/kde/plasma/extras/ExpandableListItem.qml:292:
TypeError: Cannot read property 'enabled' of null
Jun 23 00:17:33 jason-precision3660 kernel: usb 2-9: USB disconnect,
device number 4
Jun 23 00:17:33 jason-precision3660 udisksd[956]: Cleaning up mount
point /run/media/jharrop/93adcd90-e911-4f78-82b0-b3c1f45284d2 (device
8:18 no longer exists)
Jun 23 00:17:33 jason-precision3660 systemd[1]:
run-media-jharrop-93adcd90\x2de911\x2d4f78\x2d82b0\x2db3c1f45284d2.mount:
Deactivated successfully.
Jun 23 00:17:33 jason-precision3660 plasmashell[1166]:
file:///usr/lib/qt/qml/org/kde/plasma/extras/ExpandableListItem.qml:292:
TypeError: Cannot read property 'enabled' of null
Jun 23 00:17:33 jason-precision3660 kernel: sd 8:0:0:0: [sdb]
Synchronizing SCSI cache
Jun 23 00:17:33 jason-precision3660 kernel: sd 8:0:0:0: [sdb]
Synchronize Cache(10) failed: Result: hostbyte=DID_ERROR
driverbyte=DRIVER_OK
Jun 23 00:17:33 jason-precision3660 kernel: usb 2-9: new SuperSpeed
Plus Gen 2x2 USB device number 5 using xhci_hcd
Jun 23 00:17:33 jason-precision3660 kernel: usb 2-9: New USB device
found, idVendor=174c, idProduct=2362, bcdDevice= 1.00
Jun 23 00:17:33 jason-precision3660 kernel: usb 2-9: New USB device
strings: Mfr=2, Product=3, SerialNumber=1
Jun 23 00:17:33 jason-precision3660 kernel: usb 2-9: Product: SilverStone MS12
Jun 23 00:17:33 jason-precision3660 kernel: usb 2-9: Manufacturer: Asmedia
Jun 23 00:17:33 jason-precision3660 kernel: usb 2-9: SerialNumber: 000000000DA1
Jun 23 00:17:33 jason-precision3660 kernel: scsi host8: uas
Jun 23 00:17:33 jason-precision3660 kernel: scsi 8:0:0:0:
Direct-Access     SST-     MS12 MVMe        0    PQ: 0 ANSI: 6
Jun 23 00:17:33 jason-precision3660 kernel: sd 8:0:0:0: Attached scsi
generic sg1 type 0
Jun 23 00:17:33 jason-precision3660 mtp-probe[3365]: checking bus 2,
device 5: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-9"
Jun 23 00:17:33 jason-precision3660 mtp-probe[3365]: bus: 2, device: 5
was not an MTP device
Jun 23 00:17:33 jason-precision3660 kernel: sd 8:0:0:0: [sdb]
1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
Jun 23 00:17:33 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Write
Protect is off
Jun 23 00:17:33 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Mode
Sense: 43 00 00 00
Jun 23 00:17:33 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Write
cache: enabled, read cache: enabled, doesn't support DPO or FUA
Jun 23 00:17:33 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Optimal
transfer size 2097152 bytes
Jun 23 00:17:33 jason-precision3660 mtp-probe[3366]: checking bus 2,
device 5: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-9"
Jun 23 00:17:33 jason-precision3660 mtp-probe[3366]: bus: 2, device: 5
was not an MTP device
Jun 23 00:17:33 jason-precision3660 kernel:  sdb: sdb1 sdb2
Jun 23 00:17:33 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Attached SCSI disk
Jun 23 00:17:33 jason-precision3660 kernel: EXT4-fs (sdb2): recovery complete
Jun 23 00:17:33 jason-precision3660 kernel: EXT4-fs (sdb2): mounted
filesystem with ordered data mode. Opts: errors=remount-ro. Quota
mode: none.
Jun 23 00:17:33 jason-precision3660 udisksd[956]: Mounted /dev/sdb2 at
/run/media/jharrop/93adcd90-e911-4f78-82b0-b3c1f45284d2 on behalf of
uid 1000


It works in a Gen 2x1 port:

Jun 23 00:19:28 jason-precision3660 kernel: dell_wmi: Unknown key with
type 0x0012 and code 0x000f pressed
Jun 23 00:19:28 jason-precision3660 kernel: usb 2-3: new SuperSpeed
Plus Gen 2x1 USB device number 6 using xhci_hcd
Jun 23 00:19:28 jason-precision3660 kernel: usb 2-3: New USB device
found, idVendor=174c, idProduct=2362, bcdDevice= 1.00
Jun 23 00:19:28 jason-precision3660 kernel: usb 2-3: New USB device
strings: Mfr=2, Product=3, SerialNumber=1
Jun 23 00:19:28 jason-precision3660 kernel: usb 2-3: Product: SilverStone MS12
Jun 23 00:19:28 jason-precision3660 kernel: usb 2-3: Manufacturer: Asmedia
Jun 23 00:19:28 jason-precision3660 kernel: usb 2-3: SerialNumber: 000000000DA1
Jun 23 00:19:28 jason-precision3660 kernel: scsi host8: uas
Jun 23 00:19:28 jason-precision3660 mtp-probe[3410]: checking bus 2,
device 6: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-3"
Jun 23 00:19:28 jason-precision3660 mtp-probe[3410]: bus: 2, device: 6
was not an MTP device
Jun 23 00:19:28 jason-precision3660 mtp-probe[3411]: checking bus 2,
device 6: "/sys/devices/pci0000:00/0000:00:14.0/usb2/2-3"
Jun 23 00:19:28 jason-precision3660 mtp-probe[3411]: bus: 2, device: 6
was not an MTP device
Jun 23 00:19:29 jason-precision3660 kernel: scsi 8:0:0:0:
Direct-Access     SST-     MS12 MVMe        0    PQ: 0 ANSI: 6
Jun 23 00:19:29 jason-precision3660 kernel: sd 8:0:0:0: Attached scsi
generic sg1 type 0
Jun 23 00:19:29 jason-precision3660 kernel: sd 8:0:0:0: [sdb]
1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
Jun 23 00:19:29 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Write
Protect is off
Jun 23 00:19:29 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Mode
Sense: 43 00 00 00
Jun 23 00:19:29 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Write
cache: enabled, read cache: enabled, doesn't support DPO or FUA
Jun 23 00:19:29 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Optimal
transfer size 2097152 bytes
Jun 23 00:19:29 jason-precision3660 kernel:  sdb: sdb1 sdb2
Jun 23 00:19:29 jason-precision3660 kernel: sd 8:0:0:0: [sdb] Attached SCSI disk
Jun 23 00:19:30 jason-precision3660 kernel: EXT4-fs (sdb2): mounted
filesystem with ordered data mode. Opts: errors=remount-ro. Quota
mode: none.
Jun 23 00:19:30 jason-precision3660 udisksd[956]: Mounted /dev/sdb2 at
/run/media/jharrop/93adcd90-e911-4f78-82b0-b3c1f45284d2 on behalf of
uid 1000

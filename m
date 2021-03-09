Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903E8331F77
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 07:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbhCIGlo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 01:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhCIGli (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Mar 2021 01:41:38 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B01C06174A
        for <linux-usb@vger.kernel.org>; Mon,  8 Mar 2021 22:41:37 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id q25so25216957lfc.8
        for <linux-usb@vger.kernel.org>; Mon, 08 Mar 2021 22:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=OSpVNFxuMZA8hZpCpR/ByJiv8QeJ9sr2+PvYkDfjhto=;
        b=bA1vz76qmM3TldC20SucBRGYbC/8DCzeYuELc/x59tbwGYLaPp23/ucvjxvmCLfQBA
         kXX7vyznypOE9WSHMW4rqRlr9N6q4yrLemClFburlePbisHR78Rg+XM2JlnDT/MjrEsl
         ytrXIprDv+FwR0pzuKYLaoUCFBe4w4nm81OBZ3K5zcR7gWhqsAJffXJGDV3+xyu/LJJs
         saYgoFo2duXiedUcnqLHIrY8XYU/8iyUVl7RyVhg+fdXgiPtuEXOPnEnk3EJQQlH6ovi
         KxcvDHkfBJg5RW+jqZaVhreCA8fZYEJ3Ue7yGDRtjLAkS4VeQajJLgS8bXAHVOloDs/1
         Q2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=OSpVNFxuMZA8hZpCpR/ByJiv8QeJ9sr2+PvYkDfjhto=;
        b=sAcYRthmWblfMDkoS+y24h8yBY7eqcQrtlLIo0aP1qFSw+dsdJ6Xnb9Tc7L127hiZ/
         vHEgGP5TySQD0F3L9Zed+5NnWUNYlh3nUe+KcbWp77Wm96XmS+aasDzS42Gb1f9ndGTu
         vLkJn1zO7A28Pcr6n2VckN3+SmOzeyRuL7cGLf138L7WlCzAjtLbVesUQbvzvTuoCW0N
         BKliLDAdNr6ylBmUss4tjwm3vFoaJT67EIMglRtJJk/LAyqwzvlQiAQFDOzcJtbatCbW
         i0c8i7ZJk251VqmJrrkqR00zi5g8gkLy2erNxMfgCTvA0JJ1Jx7awFakuzWPg+A87S4e
         U0Yg==
X-Gm-Message-State: AOAM5327uerZ1dk/skpE+jp7fKX9JQgjgWMJ4TIHuR/nS1eFAk8RFiUT
        mXWkOgnHZaAsq+LrKRYpdPUFRzWxXco5P7ercBqdLvPvdIvUkw==
X-Google-Smtp-Source: ABdhPJyTkOn4byqccTLK9VmOobwKWKwFhhlNWPgWxAaBrM2q3sba9EnyFJloigxlCDnjgtApjj24dEjaDAfAYQsK044=
X-Received: by 2002:a19:3fca:: with SMTP id m193mr13247098lfa.609.1615272095840;
 Mon, 08 Mar 2021 22:41:35 -0800 (PST)
MIME-Version: 1.0
From:   William Allen <william.allentx@gmail.com>
Date:   Tue, 9 Mar 2021 00:41:25 -0600
Message-ID: <CAKRa1U6rukBBwWx0vN2wqiHMbUH9zWsc-y1wknOCvhueqWsT7w@mail.gmail.com>
Subject: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I've never submitted to the mailing list before, so please excuse any
formalities that I may not be observing.
I would like to be able to use USB 3.2 Gen2x2 "SuperSpeed+=C2=B2=E2=81=B0Gb=
ps"
under Linux. I've tried several different kernel versions, and have
built the kernel from the usb-next tree. All without finding proper
functionality.

I have an Ableconn PEX-UB159 USB 3.2 Gen 2x2 PCIe expansion card, with
the ASM3242 controller. This controller appears to be the only Gen2x2
capable controller that exists in commercial products- so far as I've
found. Everything appears to work, except for "SuperSpeed+=C2=B2=E2=81=B0Gb=
ps" when
I plug in a capable device.
Here is the dmesg output as soon as I plug in a Gen2x2 WD P50 Black
External NVMe SSD, using an appropriate SuperSpeed+=C2=B2=E2=81=B0Gbps cert=
ified
cable:
5.11.2-arch1-1
--------------------
usb 7-2: new SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd
usb 7-2: New USB device found, idVendor=3D1058, idProduct=3D2642, bcdDevice=
=3D10.03
usb 7-2: New USB device strings: Mfr=3D2, Product=3D3, SerialNumber=3D1
usb 7-2: Product: Game Drive
usb 7-2: Manufacturer: Western Digital
usb 7-2: SerialNumber: 323130334431343030303736
scsi host11: uas
scsi 11:0:0:0: Direct-Access     WD       Game Drive       1003 PQ: 0 ANSI:=
 6
scsi 11:0:0:1: Enclosure         WD       SES Device       1003 PQ: 0 ANSI:=
 6
sd 11:0:0:0: [sdf] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
sd 11:0:0:0: [sdf] Write Protect is off
sd 11:0:0:0: [sdf] Mode Sense: 57 00 10 00
sd 11:0:0:0: [sdf] Write cache: enabled, read cache: enabled, supports
DPO and FUA
sd 11:0:0:0: [sdf] Optimal transfer size 33553920 bytes
sd 11:0:0:0: [sdf] Attached SCSI disk

 When I saw commits referring to Gen2x2 in the usb-next repo, I built
off that, and also ran linux-next-git.r0.gabaf6f60176f-1 from AUR,
both giving me the same results/output:
linux-next-git.r0.gabaf6f60176f-1
----------------------------------------------
usb 5-1: new SuperSpeed Gen 1x2 USB device number 3 using xhci_hcd
usb 5-1: New USB device found, idVendor=3D1058, idProduct=3D2642, bcdDevice=
=3D10.03
usb 5-1: New USB device strings: Mfr=3D2, Product=3D3, SerialNumber=3D1
usb 5-1: Product: Game Drive
usb 5-1: Manufacturer: Western Digital
usb 5-1: SerialNumber: 323130334431343030303736
scsi host7: uas
scsi 7:0:0:0: Direct-Access     WD       Game Drive       1003 PQ: 0 ANSI: =
6
scsi 7:0:0:1: Enclosure         WD       SES Device       1003 PQ: 0 ANSI: =
6
ses 7:0:0:1: Attached Enclosure device
ses 7:0:0:1: Failed to get diagnostic page 0x1
ses 7:0:0:1: Failed to bind enclosure -19
sd 7:0:0:0: [sdf] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
sd 7:0:0:0: [sdf] Write Protect is off
sd 7:0:0:0: [sdf] Mode Sense: 57 00 10 00
sd 7:0:0:0: [sdf] Write cache: enabled, read cache: enabled, supports
DPO and FUA
sd 7:0:0:0: [sdf] Optimal transfer size 33553920 bytes
sd 7:0:0:0: [sdf] Attached SCSI disk

See that it's detecting it as Gen 1x2.
The output of lsusb -t shows that it is connected at 5000M using the
uas driver. Even my much slower USB 3.1 SSDs connect at 10000M on the
exact same port.
When I attach the Gen2x2 NVMe SSD to my other 3.2 Gen2 card, it
connects at 10000M, so It seems to be directly related to a
mishandling when the Gen2x2 device gets recognized by the Gen2x2 card.

lspci output from 5.11.2-arch1-1:
-------------------------------------------
USB controller: ASMedia Technology Inc. ASM3242 USB 3.2 Host
Controller (prog-if 30 [XHCI])
Subsystem: ASMedia Technology Inc. ASM3242 USB 3.2 Host Controller
Physical Slot: 1
Flags: bus master, fast devsel, latency 0, IRQ 62, NUMA node 0
Memory at f7df0000 (64-bit, non-prefetchable) [size=3D32K]
Capabilities: [50] MSI: Enable- Count=3D1/8 Maskable- 64bit+
Capabilities: [68] MSI-X: Enable+ Count=3D8 Masked-
Capabilities: [78] Power Management version 3
Capabilities: [80] Express Legacy Endpoint, MSI 00
Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 0201
Capabilities: [100] Advanced Error Reporting
Capabilities: [200] Secondary PCI Express
Capabilities: [300] Latency Tolerance Reporting
Capabilities: [400] L1 PM Substates
Kernel driver in use: xhci_hcd
Kernel modules: xhci_pci

I'm happy to test anything, or file this somewhere more appropriate if
you could point me in the right direction.

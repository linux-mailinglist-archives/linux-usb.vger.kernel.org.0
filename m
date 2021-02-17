Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4166431D6C1
	for <lists+linux-usb@lfdr.de>; Wed, 17 Feb 2021 09:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbhBQIvg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Feb 2021 03:51:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhBQIv3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Feb 2021 03:51:29 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB0F9C061574
        for <linux-usb@vger.kernel.org>; Wed, 17 Feb 2021 00:50:48 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id f18so5910701qvm.9
        for <linux-usb@vger.kernel.org>; Wed, 17 Feb 2021 00:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cklI9Ycjm7LY8zs4ZZZwl+QL7Mxbf1sUNhMSDjZT09A=;
        b=fOyOPhnNErsCPf2OBpa1tEIRieKQKEZ7zeWrNkaBKek9fO0eATE1qOZxKvJgnAFOOy
         9KVxQLuM7rDwbUMeNMnC41jsniazRNQQEUB9U/pFGKSVaQqHwoRPhiZ6bwWyly/6jdi1
         VUQSK7VWgmaPTFvzDnC/CEfVXUepcU/o2TO6scOHDdjCBPGDtXeACqy8CoXJh9MGgUiB
         q5L2nnaTS5FuZskOoSJcq/MYDRfdSFh63B/xWBzzzmrJM+H/cBCPWooNXaD15lOVQXnM
         9qtskWBwOOVAQsByvfDPvi50XdfYlE3illQqYNra5dHSAYizbuuwqrGUIZvI3LaO+e4Y
         1fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cklI9Ycjm7LY8zs4ZZZwl+QL7Mxbf1sUNhMSDjZT09A=;
        b=XO6s3O9N/bDVhwaBi5ff9YSnd8o8A/fbFT2Xm4SpgfWweeBxmLg+dnl8WwTM5EOx0s
         YNPnbsBTPT+SGgLNBHbFNFxJKrZzez3kkL0BKiWcKvvB2l6TTM6OrFFV4LZK+JZqq4ZW
         h4XAZbl2M/pzkMyFNxSezOUEFyquM7No+/Twjfgdi0BPWSnGlu4Q9p+IbLj72/tJGHEg
         tOSXLvBljMEkFi7U80rTRZdqXvJ7FEXr2Y3AtkHQUpa/MvjIcycdVTalN8DU3whVAi/q
         dD+rSeG/Uk2ST2i5iCGGb5x/a5ywS+Mul1rtIbJVUyqjm0mY66WvvfhixZ3kq+fsd5TF
         Hyjg==
X-Gm-Message-State: AOAM533YHYC3rAerXemAnsB2WNKfMbMadCOx6X+WaxYALYBDOSxWE/VN
        D+wcJQ3oxibw/qfdX9Y0nzUkbIMgO0vLd1wwjVo3n1ugczhkug==
X-Google-Smtp-Source: ABdhPJyPqDu1G3LEDvka+gqC4AiMtQDenDnVUCH4xxsAOhBZka9OkLnzTw6y9cnQ1AnrR1jilKXCggdEO1x6K6vC5to=
X-Received: by 2002:a0c:ee89:: with SMTP id u9mr23305227qvr.40.1613551847991;
 Wed, 17 Feb 2021 00:50:47 -0800 (PST)
MIME-Version: 1.0
References: <CAGv7gkgb12vGPvZcSE0aVOpu32zSgxaayYreLvWs+vJc5EkQrA@mail.gmail.com>
 <YCTS9I5xTVBDvwax@kroah.com> <CAGv7gkjoNt9gx_VPfEj=tauKAOcnOd+-2pCXyCoR=GPcHj7jxw@mail.gmail.com>
 <YCUI0h7qkY2PuJcT@kroah.com> <CAGv7gki7J1NVX3ti6Qhe9AFLp0JYRTRsT35zpDBTxxQ=te7-sQ@mail.gmail.com>
 <b4ae0847-23a2-c3e3-3ef2-17efdfc792ba@linux.intel.com>
In-Reply-To: <b4ae0847-23a2-c3e3-3ef2-17efdfc792ba@linux.intel.com>
From:   Yiyu Zhu <danielzeltar@gmail.com>
Date:   Wed, 17 Feb 2021 00:50:36 -0800
Message-ID: <CAGv7gkgLVTvBaGTUFd00daN0PBoqj2MbFk0dwnWKRL2odzD-8g@mail.gmail.com>
Subject: Re: kworker takes 100% core after unplugging usb c hub
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Greg KH <greg@kroah.com>, linux-usb@vger.kernel.org,
        mathias.nyman@intel.linux.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

Hi

>
> Could you add usbcore dynamic debug, it should show more details about hub activity.
>
> mount -t debugfs none /sys/kernel/debug
> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
>
Here are the dmesg after I enabled dynamic debug.

(at hub connection)
[18746.363125] usb 1-3: new high-speed USB device number 7 using xhci_hcd
[18747.635125] usb 1-3: new high-speed USB device number 8 using xhci_hcd
[18747.790174] usb 1-3: New USB device found, idVendor=291a,
idProduct=5423, bcdDevice= 1.0a
[18747.790185] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[18747.790190] usb 1-3: Product: 4-Port USB 2.0 Hub
[18747.790194] usb 1-3: Manufacturer: Generic
[18747.791444] hub 1-3:1.0: USB hub found
[18747.791644] hub 1-3:1.0: 5 ports detected
[18748.087060] usb 1-3.1: new high-speed USB device number 9 using xhci_hcd
[18748.193599] usb 1-3.1: New USB device found, idVendor=05e3,
idProduct=0610, bcdDevice= 6.55
[18748.193611] usb 1-3.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[18748.193615] usb 1-3.1: Product: USB2.1 Hub
[18748.193618] usb 1-3.1: Manufacturer: GenesysLogic
[18748.195938] hub 1-3.1:1.0: USB hub found
[18748.196221] hub 1-3.1:1.0: 4 ports detected
[18748.531325] hp_wmi: Unknown event_id - 131073 - 0x0
[18748.607073] usb 1-3.5: new high-speed USB device number 10 using xhci_hcd
[18748.713602] usb 1-3.5: New USB device found, idVendor=0bda,
idProduct=5450, bcdDevice= 1.01
[18748.713608] usb 1-3.5: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[18748.713610] usb 1-3.5: Product: BillBoard Device
[18748.713612] usb 1-3.5: Manufacturer: Realtek
[18749.083366] hp_wmi: Unknown event_id - 131073 - 0x0
[18749.099460] pci 0000:02:00.0: [8086:15d3] type 01 class 0x060400
[18749.099544] pci 0000:02:00.0: enabling Extended Tags
[18749.099804] pci 0000:02:00.0: supports D1 D2
[18749.099806] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[18749.100401] pci 0000:03:00.0: [8086:15d3] type 01 class 0x060400
[18749.100484] pci 0000:03:00.0: enabling Extended Tags
[18749.100671] pci 0000:03:00.0: supports D1 D2
[18749.100674] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[18749.100879] pci 0000:03:01.0: [8086:15d3] type 01 class 0x060400
[18749.100942] pci 0000:03:01.0: enabling Extended Tags
[18749.101066] pci 0000:03:01.0: supports D1 D2
[18749.101068] pci 0000:03:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[18749.101258] pci 0000:03:02.0: [8086:15d3] type 01 class 0x060400
[18749.101333] pci 0000:03:02.0: enabling Extended Tags
[18749.101471] pci 0000:03:02.0: supports D1 D2
[18749.101474] pci 0000:03:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[18749.101794] pci 0000:03:04.0: [8086:15d3] type 01 class 0x060400
[18749.101869] pci 0000:03:04.0: enabling Extended Tags
[18749.102089] pci 0000:03:04.0: supports D1 D2
[18749.102093] pci 0000:03:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[18749.102375] pci 0000:02:00.0: PCI bridge to [bus 03-6c]
[18749.102395] pci 0000:02:00.0:   bridge window [mem 0xb0000000-0xde0fffff]
[18749.102402] pci 0000:02:00.0:   bridge window [mem
0x2f90000000-0x2fd9ffffff 64bit pref]
[18749.102490] pci 0000:03:00.0: PCI bridge to [bus 04]
[18749.102504] pci 0000:03:00.0:   bridge window [mem 0xde000000-0xde0fffff]
[18749.102583] pci 0000:03:01.0: PCI bridge to [bus 05-37]
[18749.102596] pci 0000:03:01.0:   bridge window [mem 0xb0000000-0xc7efffff]
[18749.102604] pci 0000:03:01.0:   bridge window [mem
0x2f90000000-0x2fafffffff 64bit pref]
[18749.102748] pci 0000:38:00.0: [8086:15d4] type 00 class 0x0c0330
[18749.102776] pci 0000:38:00.0: reg 0x10: [mem 0xc7f00000-0xc7f0ffff]
[18749.102861] pci 0000:38:00.0: enabling Extended Tags
[18749.103107] pci 0000:38:00.0: supports D1 D2
[18749.103111] pci 0000:38:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[18749.103215] pci 0000:38:00.0: 8.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x4 link at 0000:03:02.0 (capable of 31.504
Gb/s with 8.0 GT/s PCIe x4 link)
[18749.103431] pci 0000:03:02.0: PCI bridge to [bus 38]
[18749.103443] pci 0000:03:02.0:   bridge window [mem 0xc7f00000-0xc7ffffff]
[18749.103535] pci 0000:03:04.0: PCI bridge to [bus 39-6c]
[18749.103548] pci 0000:03:04.0:   bridge window [mem 0xc8000000-0xddffffff]
[18749.103555] pci 0000:03:04.0:   bridge window [mem
0x2fb0000000-0x2fd9ffffff 64bit pref]
[18749.103596] pci_bus 0000:03: Allocating resources
[18749.103624] pci 0000:03:01.0: bridge window [io  0x1000-0x0fff] to
[bus 05-37] add_size 1000
[18749.103629] pci 0000:03:02.0: bridge window [io  0x1000-0x0fff] to
[bus 38] add_size 1000
[18749.103631] pci 0000:03:02.0: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 38] add_size 200000
add_align 100000
[18749.103635] pci 0000:03:04.0: bridge window [io  0x1000-0x0fff] to
[bus 39-6c] add_size 1000
[18749.103638] pci 0000:02:00.0: bridge window [io  0x1000-0x0fff] to
[bus 03-6c] add_size 4000
[18749.103645] pci 0000:02:00.0: BAR 13: assigned [io  0x2000-0x5fff]
[18749.103652] pci 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[18749.103654] pci 0000:03:02.0: BAR 15: failed to assign [mem size
0x00200000 64bit pref]
[18749.103657] pci 0000:03:01.0: BAR 13: assigned [io  0x2000-0x2fff]
[18749.103659] pci 0000:03:02.0: BAR 13: assigned [io  0x3000-0x3fff]
[18749.103661] pci 0000:03:04.0: BAR 13: assigned [io  0x4000-0x4fff]
[18749.103665] pci 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[18749.103667] pci 0000:03:02.0: BAR 15: failed to assign [mem size
0x00200000 64bit pref]
[18749.103669] pci 0000:03:00.0: PCI bridge to [bus 04]
[18749.103678] pci 0000:03:00.0:   bridge window [mem 0xde000000-0xde0fffff]
[18749.103690] pci 0000:03:01.0: PCI bridge to [bus 05-37]
[18749.103693] pci 0000:03:01.0:   bridge window [io  0x2000-0x2fff]
[18749.103699] pci 0000:03:01.0:   bridge window [mem 0xb0000000-0xc7efffff]
[18749.103704] pci 0000:03:01.0:   bridge window [mem
0x2f90000000-0x2fafffffff 64bit pref]
[18749.103712] pci 0000:03:02.0: PCI bridge to [bus 38]
[18749.103716] pci 0000:03:02.0:   bridge window [io  0x3000-0x3fff]
[18749.103722] pci 0000:03:02.0:   bridge window [mem 0xc7f00000-0xc7ffffff]
[18749.103733] pci 0000:03:04.0: PCI bridge to [bus 39-6c]
[18749.103735] pci 0000:03:04.0:   bridge window [io  0x4000-0x4fff]
[18749.103740] pci 0000:03:04.0:   bridge window [mem 0xc8000000-0xddffffff]
[18749.103744] pci 0000:03:04.0:   bridge window [mem
0x2fb0000000-0x2fd9ffffff 64bit pref]
[18749.103752] pci 0000:02:00.0: PCI bridge to [bus 03-6c]
[18749.103756] pci 0000:02:00.0:   bridge window [io  0x2000-0x5fff]
[18749.103762] pci 0000:02:00.0:   bridge window [mem 0xb0000000-0xde0fffff]
[18749.103767] pci 0000:02:00.0:   bridge window [mem
0x2f90000000-0x2fd9ffffff 64bit pref]
[18749.103853] pcieport 0000:02:00.0: enabling device (0006 -> 0007)
[18749.112985] pcieport 0000:03:01.0: enabling device (0006 -> 0007)
[18749.113561] pcieport 0000:03:02.0: enabling device (0006 -> 0007)
[18749.114275] pcieport 0000:03:04.0: enabling device (0006 -> 0007)
[18749.116042] xhci_hcd 0000:38:00.0: xHCI Host Controller
[18749.116048] xhci_hcd 0000:38:00.0: new USB bus registered, assigned
bus number 3
[18749.117311] xhci_hcd 0000:38:00.0: hcc params 0x200077c1 hci
version 0x110 quirks 0x0000000200009810
[18749.117782] usb usb3: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.11
[18749.117785] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[18749.117787] usb usb3: Product: xHCI Host Controller
[18749.117789] usb usb3: Manufacturer: Linux 5.11.0-051100-generic xhci-hcd
[18749.117791] usb usb3: SerialNumber: 0000:38:00.0
[18749.117985] hub 3-0:1.0: USB hub found
[18749.117995] hub 3-0:1.0: 2 ports detected
[18749.118900] xhci_hcd 0000:38:00.0: xHCI Host Controller
[18749.118904] xhci_hcd 0000:38:00.0: new USB bus registered, assigned
bus number 4
[18749.118908] xhci_hcd 0000:38:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[18749.118961] usb usb4: New USB device found, idVendor=1d6b,
idProduct=0003, bcdDevice= 5.11
[18749.118964] usb usb4: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[18749.118965] usb usb4: Product: xHCI Host Controller
[18749.118967] usb usb4: Manufacturer: Linux 5.11.0-051100-generic xhci-hcd
[18749.118968] usb usb4: SerialNumber: 0000:38:00.0
[18749.119164] hub 4-0:1.0: USB hub found
[18749.119177] hub 4-0:1.0: 2 ports detected
[18749.463260] usb 4-2: new SuperSpeedPlus Gen 2 USB device number 2
using xhci_hcd
[18749.486323] usb 4-2: New USB device found, idVendor=2900,
idProduct=8383, bcdDevice= 1.0a
[18749.486344] usb 4-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[18749.486354] usb 4-2: Product: 4-Port USB 3.0 Hub
[18749.486361] usb 4-2: Manufacturer: Generic
[18749.490230] hub 4-2:1.0: USB hub found
[18749.490676] hub 4-2:1.0: 4 ports detected
[18749.791233] usb 4-2.1: new SuperSpeed Gen 1 USB device number 3
using xhci_hcd
[18749.818255] usb 4-2.1: New USB device found, idVendor=05e3,
idProduct=0626, bcdDevice= 6.55
[18749.818268] usb 4-2.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[18749.818275] usb 4-2.1: Product: USB3.1 Hub
[18749.818279] usb 4-2.1: Manufacturer: GenesysLogic
[18749.820840] hub 4-2.1:1.0: USB hub found
[18749.821202] hub 4-2.1:1.0: 4 ports detected
[18750.111133] usb 4-2.1.3: new SuperSpeed Gen 1 USB device number 4
using xhci_hcd
[18750.135823] usb 4-2.1.3: New USB device found, idVendor=0bda,
idProduct=8153, bcdDevice=30.00
[18750.135840] usb 4-2.1.3: New USB device strings: Mfr=1, Product=2,
SerialNumber=6
[18750.135842] usb 4-2.1.3: Product: USB 10/100/1000 LAN
[18750.135843] usb 4-2.1.3: Manufacturer: Realtek
[18750.135844] usb 4-2.1.3: SerialNumber: 000001
[18750.219205] usb 4-2.1.4: new SuperSpeed Gen 1 USB device number 5
using xhci_hcd
[18750.240829] usb 4-2.1.4: New USB device found, idVendor=058f,
idProduct=8468, bcdDevice= 1.00
[18750.240838] usb 4-2.1.4: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[18750.240839] usb 4-2.1.4: Product: Mass Storage Device
[18750.240840] usb 4-2.1.4: Manufacturer: Generic
[18750.240841] usb 4-2.1.4: SerialNumber: 058F84688461
[18750.319697] usb 4-2.1.3: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd
[18750.344307] r8152 4-2.1.3:1.0: Direct firmware load for
rtl_nic/rtl8153a-4.fw failed with error -2
[18750.344330] r8152 4-2.1.3:1.0: unable to load firmware patch
rtl_nic/rtl8153a-4.fw (-2)
[18750.365494] usb-storage 4-2.1.4:1.0: USB Mass Storage device detected
[18750.366060] scsi host4: usb-storage 4-2.1.4:1.0
[18750.366502] usbcore: registered new interface driver usb-storage
[18750.374087] usbcore: registered new interface driver uas
[18750.387495] r8152 4-2.1.3:1.0 eth0: v1.11.11
[18750.463135] r8152 4-2.1.3:1.0 enx00e04cb5877c: renamed from eth0
[18751.368123] scsi 4:0:0:0: Direct-Access     Generic- SD/MMC
  1.00 PQ: 0 ANSI: 6
[18751.368733] scsi 4:0:0:1: Direct-Access     Generic- Micro SD/M2
  1.08 PQ: 0 ANSI: 6
[18751.369524] sd 4:0:0:0: Attached scsi generic sg0 type 0
[18751.370071] sd 4:0:0:1: Attached scsi generic sg1 type 0
[18751.388549] sd 4:0:0:0: [sda] Attached SCSI removable disk
[18751.388976] sd 4:0:0:1: [sdb] Attached SCSI removable disk
[18753.631878] IPv6: ADDRCONF(NETDEV_CHANGE): enx00e04cb5877c: link
becomes ready
[18753.632485] r8152 4-2.1.3:1.0 enx00e04cb5877c: carrier on

(at hub disconnection)
[18848.819858] [drm] PCIE GART of 256M enabled (table at 0x000000F400000000).
[18848.999416] [drm] UVD and UVD ENC initialized successfully.
[18849.100370] [drm] VCE initialized successfully.
[18946.839352] usb 1-3: USB disconnect, device number 8
[18946.839373] usb 1-3.1: USB disconnect, device number 9
[18946.840644] usb 1-3.5: USB disconnect, device number 10
[18946.890865] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -71
[18946.916623] r8152 4-2.1.3:1.0 enx00e04cb5877c: Stop submitting
intr, status -71
[18947.068201] usb usb3-port2: over-current condition
[18947.604290] usb 4-2: USB disconnect, device number 2
[18947.604307] usb 4-2.1: USB disconnect, device number 3
[18947.604315] usb 4-2.1.3: USB disconnect, device number 4
[18947.604721] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -108
[18947.604748] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -108
[18947.604756] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -108
[18947.604763] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -108
[18947.685529] usb 4-2.1.4: USB disconnect, device number 5
[18948.304163] usb usb4-port2: over-current condition

>
> hub reports overcurrent condition, worth keeping in mind.
>
This condition can actually persist through reboot. Which causes the
kworker to spawn immediately after boot.

>
> Is this xHC contoller in a Alpine Ridge/Titan Ridge/Maple Ridge based system
> that has runtime PM enabled by default, and whole xHC controller
> disappears from PCI bus when last device is disconnected?
> (check with lspci -nn)
>
It is an Alpine Ridge controller. Here is the `lspci -nn` output

00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen
Core Processor Host Bridge/DRAM Registers [8086:5910] (rev 05)
00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v5/E3-1500
v5/6th Gen Core Processor PCIe Controller (x16) [8086:1901] (rev 05)
00:02.0 VGA compatible controller [0300]: Intel Corporation Device
[8086:591b] (rev 04)
00:04.0 Signal processing controller [1180]: Intel Corporation Xeon
E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem
[8086:1903] (rev 05)
00:13.0 Non-VGA unclassified device [0000]: Intel Corporation 100
Series/C230 Series Chipset Family Integrated Sensor Hub [8086:a135]
(rev 31)
00:14.0 USB controller [0c03]: Intel Corporation 100 Series/C230
Series Chipset Family USB 3.0 xHCI Controller [8086:a12f] (rev 31)
00:14.2 Signal processing controller [1180]: Intel Corporation 100
Series/C230 Series Chipset Family Thermal Subsystem [8086:a131] (rev
31)
00:15.0 Signal processing controller [1180]: Intel Corporation 100
Series/C230 Series Chipset Family Serial IO I2C Controller #0
[8086:a160] (rev 31)
00:16.0 Communication controller [0780]: Intel Corporation 100
Series/C230 Series Chipset Family MEI Controller #1 [8086:a13a] (rev
31)
00:17.0 SATA controller [0106]: Intel Corporation HM170/QM170 Chipset
SATA Controller [AHCI Mode] [8086:a103] (rev 31)
00:1c.0 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series
Chipset Family PCI Express Root Port #1 [8086:a110] (rev f1)
00:1c.4 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series
Chipset Family PCI Express Root Port #5 [8086:a114] (rev f1)
00:1c.5 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series
Chipset Family PCI Express Root Port #6 [8086:a115] (rev f1)
00:1d.0 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series
Chipset Family PCI Express Root Port #9 [8086:a118] (rev f1)
00:1e.0 Signal processing controller [1180]: Intel Corporation 100
Series/C230 Series Chipset Family Serial IO UART #0 [8086:a127] (rev
31)
00:1e.2 Signal processing controller [1180]: Intel Corporation 100
Series/C230 Series Chipset Family Serial IO GSPI #0 [8086:a129] (rev
31)
00:1f.0 ISA bridge [0601]: Intel Corporation HM175 Chipset LPC/eSPI
Controller [8086:a152] (rev 31)
00:1f.2 Memory controller [0580]: Intel Corporation 100 Series/C230
Series Chipset Family Power Management Controller [8086:a121] (rev 31)
00:1f.3 Audio device [0403]: Intel Corporation CM238 HD Audio
Controller [8086:a171] (rev 31)
00:1f.4 SMBus [0c05]: Intel Corporation 100 Series/C230 Series Chipset
Family SMBus [8086:a123] (rev 31)
01:00.0 Display controller [0380]: Advanced Micro Devices, Inc.
[AMD/ATI] Polaris 22 [Radeon RX Vega M GL] [1002:694e] (rev c0)
02:00.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
03:00.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
03:01.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
03:02.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
03:04.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
38:00.0 USB controller [0c03]: Intel Corporation JHL6540 Thunderbolt 3
USB Controller (C step) [Alpine Ridge 4C 2016] [8086:15d4] (rev 02)
6d:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd.
RTS525A PCI Express Card Reader [10ec:525a] (rev 01)
6e:00.0 Network controller [0280]: Intel Corporation Wireless 8265 /
8275 [8086:24fd] (rev 78)
6f:00.0 Non-Volatile memory controller [0108]: Sandisk Corp Device [15b7:5002]

One thing I notice is that when the hub is disconnected, the USB
controller is still there.
It will remain there until I plug and unplug another device. After
that, the following section will be gone.

02:00.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
03:00.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
03:01.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
03:02.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
03:04.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
38:00.0 USB controller [0c03]: Intel Corporation JHL6540 Thunderbolt 3
USB Controller (C step) [Alpine Ridge 4C 2016] [8086:15d4] (rev 02)

> Does it help if another USB device is connected to a different
> roothub port of this xHC while disconnecting the hub?
> Or does just disabling runtime PM for this xhci help?
>
I tried with another usb device on the root hub port. But it does not help.
I am not sure about how to disable runtime PM. I tried to use `echo on
> .../0000:38:00.0/power/control` (its value was auto). But it also
does not help.

Thanks
Yiyu Zhu

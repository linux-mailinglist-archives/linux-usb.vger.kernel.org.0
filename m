Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE0F32A47E
	for <lists+linux-usb@lfdr.de>; Tue,  2 Mar 2021 16:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383167AbhCBKrQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Mar 2021 05:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835910AbhCBG00 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Mar 2021 01:26:26 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC4AC061788
        for <linux-usb@vger.kernel.org>; Mon,  1 Mar 2021 22:25:45 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id 130so4605349qkh.11
        for <linux-usb@vger.kernel.org>; Mon, 01 Mar 2021 22:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nfHjNyrawZLpwzNAFsDrpV/91n0CbXFxz55YxTTdcR8=;
        b=eqg3aMRPDPW4S7ug0HS9UjxIQlF22HyonObtxwtOk2O4VLX/15VJCou7bQtcl+O6Gw
         IqQ6+wvMhPS+30UlRN9gZ8XP84kpMGbIOPZBHB4oVr1TAuhXI1MRUQkCVwNOwO4gi/EP
         RURRSN+8a7s8PVxV0FUitQ/KfamsQLD0cfJHnlJ39dAamaTIsVJ0YC86HxIzzxy1lreN
         qgEiwZD4juZDTcZO5e6Qz+c5G5Yz1Z3KR8QpBfb6K7lQoW2H3BBUWY1DMLPqqhEd8ujN
         RHGs1gYnolBHwgVokkDnBMrlGXlpel10P+IV9lGWqCgClsJchuqJIdwqjzv+6jOD/n6/
         I3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nfHjNyrawZLpwzNAFsDrpV/91n0CbXFxz55YxTTdcR8=;
        b=uKYEPGJ9I17IgAYcsN3+x76OXmPFlwvbg7pW9JdOWKNA5Wb5iIclqzVli5+LXtjmLZ
         jbNssAjS1lXG997vl1Clt6kS56Hy5NXD5qCTvZm3dqfk3aZpD/HYqOVELkQVfgy+VMOq
         1Iq+ntVIp0ItjvAz0ZcEyJ9W3Qi35fu42C2sk1R6BchYuKXov3x8IBow9RNLfR9SvDP3
         waM1N14J1zLiG0IsK2qvY2Q8PvaQzxPEDySd4B2ydhH9IIiM9rcoPy2gqU6uegQXcK7A
         HkPZ2Yw6gqxu0pSSp5UpH2+W+FLIRelZB4/QUaGDWmauVrBBzEBTvsVcFB0gK8ENhhp0
         fvYw==
X-Gm-Message-State: AOAM530/+5bE9yH/f8CC4/7axfDqlRhV6xJQZ1AOdjcnheQCRzOupGz8
        ftI1xPGei3QJC23b0lGMhFrXVB4qYFtjaXHAFZtsYv6YzVJ1NQ==
X-Google-Smtp-Source: ABdhPJyFJla0h32NSPuw9qd9BuNjtPkCNng1XkcwT8Uzwe/DXwitAbFRakTLMAJBHisK90iif1kDPdeEhssqSEOQXMM=
X-Received: by 2002:a37:4bc5:: with SMTP id y188mr17594842qka.276.1614666344604;
 Mon, 01 Mar 2021 22:25:44 -0800 (PST)
MIME-Version: 1.0
References: <CAGv7gkgb12vGPvZcSE0aVOpu32zSgxaayYreLvWs+vJc5EkQrA@mail.gmail.com>
 <YCTS9I5xTVBDvwax@kroah.com> <CAGv7gkjoNt9gx_VPfEj=tauKAOcnOd+-2pCXyCoR=GPcHj7jxw@mail.gmail.com>
 <YCUI0h7qkY2PuJcT@kroah.com> <CAGv7gki7J1NVX3ti6Qhe9AFLp0JYRTRsT35zpDBTxxQ=te7-sQ@mail.gmail.com>
 <b4ae0847-23a2-c3e3-3ef2-17efdfc792ba@linux.intel.com> <CAGv7gkgLVTvBaGTUFd00daN0PBoqj2MbFk0dwnWKRL2odzD-8g@mail.gmail.com>
 <5d3c5b2d-4752-7253-66f3-945c06f8a980@linux.intel.com>
In-Reply-To: <5d3c5b2d-4752-7253-66f3-945c06f8a980@linux.intel.com>
From:   Yiyu Zhu <danielzeltar@gmail.com>
Date:   Mon, 1 Mar 2021 22:25:33 -0800
Message-ID: <CAGv7gkigBrghpO9gETuGBLf=Go3RCA4dU6Z4NRjfTMLUn-Cxgw@mail.gmail.com>
Subject: Re: kworker takes 100% core after unplugging usb c hub
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Greg KH <greg@kroah.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

I did not set the correct printk value. Here is a recent dmesg showing
the hub connection and disconnection on Linux 5.11.0.

[ 1638.295144] usb usb1: usb wakeup-resume
[ 1638.295161] usb usb1: usb auto-resume
[ 1638.295200] hub 1-0:1.0: hub_resume
[ 1638.295244] usb usb1-port2: status 0101 change 0001
[ 1638.295297] usb usb1-port5: status 0507 change 0000
[ 1638.295325] usb usb1-port7: status 0107 change 0000
[ 1638.402985] hub 1-0:1.0: state 7 ports 16 chg 0004 evt 0000
[ 1638.403009] usb usb1-port2: status 0101, change 0000, 12 Mb/s
[ 1638.530971] usb 1-2: new high-speed USB device number 7 using xhci_hcd
[ 1638.681711] usb 1-2: default language 0x0409
[ 1638.682344] usb 1-2: udev 7, busnum 1, minor = 6
[ 1638.682358] usb 1-2: New USB device found, idVendor=291a,
idProduct=5423, bcdDevice= 1.0a
[ 1638.682367] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 1638.682374] usb 1-2: Product: 4-Port USB 2.0 Hub
[ 1638.682379] usb 1-2: Manufacturer: Generic
[ 1638.682686] usb 1-2: usb_probe_device
[ 1638.682694] usb 1-2: configuration #1 chosen from 1 choice
[ 1638.683873] usb 1-2: adding 1-2:1.0 (config #1, interface 0)
[ 1638.683949] hub 1-2:1.0: usb_probe_interface
[ 1638.683957] hub 1-2:1.0: usb_probe_interface - got id
[ 1638.683964] hub 1-2:1.0: USB hub found
[ 1638.684215] hub 1-2:1.0: 5 ports detected
[ 1638.684230] hub 1-2:1.0: compound device; port removable status: FRRRR
[ 1638.684236] hub 1-2:1.0: individual port power switching
[ 1638.684241] hub 1-2:1.0: individual port over-current protection
[ 1638.685148] hub 1-2:1.0: TT per port
[ 1638.685157] hub 1-2:1.0: TT requires at most 16 FS bit times (1332 ns)
[ 1638.685163] hub 1-2:1.0: Port indicators are supported
[ 1638.685167] hub 1-2:1.0: power on to power good time: 0ms
[ 1638.685363] hub 1-2:1.0: local power source is good
[ 1638.685837] hub 1-2:1.0: enabling power on all ports
[ 1638.786900] usb 1-2-port1: status 0101 change 0001
[ 1638.894955] hub 1-2:1.0: state 7 ports 5 chg 0002 evt 0000
[ 1638.895268] usb 1-2-port1: status 0101, change 0000, 12 Mb/s
[ 1638.895492] usb 1-2-port1: indicator auto status 0
[ 1638.974872] usb 1-2.1: new high-speed USB device number 8 using xhci_hcd
[ 1639.076826] usb 1-2.1: default language 0x0409
[ 1639.077467] usb 1-2.1: udev 8, busnum 1, minor = 7
[ 1639.077484] usb 1-2.1: New USB device found, idVendor=05e3,
idProduct=0610, bcdDevice= 6.55
[ 1639.077499] usb 1-2.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[ 1639.077509] usb 1-2.1: Product: USB2.1 Hub
[ 1639.077518] usb 1-2.1: Manufacturer: GenesysLogic
[ 1639.077798] usb 1-2.1: usb_probe_device
[ 1639.077809] usb 1-2.1: configuration #1 chosen from 1 choice
[ 1639.081691] usb 1-2.1: adding 1-2.1:1.0 (config #1, interface 0)
[ 1639.081812] hub 1-2.1:1.0: usb_probe_interface
[ 1639.081824] hub 1-2.1:1.0: usb_probe_interface - got id
[ 1639.081837] hub 1-2.1:1.0: USB hub found
[ 1639.082177] hub 1-2.1:1.0: 4 ports detected
[ 1639.082190] hub 1-2.1:1.0: standalone hub
[ 1639.082198] hub 1-2.1:1.0: ganged power switching
[ 1639.082207] hub 1-2.1:1.0: global over-current protection
[ 1639.082215] hub 1-2.1:1.0: Single TT
[ 1639.082223] hub 1-2.1:1.0: TT requires at most 32 FS bit times (2664 ns)
[ 1639.082234] hub 1-2.1:1.0: Port indicators are supported
[ 1639.082242] hub 1-2.1:1.0: power on to power good time: 100ms
[ 1639.082656] hub 1-2.1:1.0: local power source is good
[ 1639.082666] hub 1-2.1:1.0: no over-current condition exists
[ 1639.083345] hub 1-2.1:1.0: enabling power on all ports
[ 1639.187891] hub 1-2.1:1.0: state 7 ports 4 chg 0000 evt 0000
[ 1639.188992] hub 1-2.1:1.0: hub_suspend
[ 1639.199568] usb 1-2.1: usb auto-suspend, wakeup 1
[ 1639.218757] hub 1-2:1.0: hub_suspend
[ 1639.337447] hub 1-0:1.0: state 7 ports 16 chg 0000 evt 0004
[ 1639.337468] usb 1-2: usb auto-suspend, wakeup 1
[ 1639.466710] usb 1-2: usb wakeup-resume
[ 1639.466758] usb 1-2: Waited 0ms for CONNECT
[ 1639.466764] usb 1-2: finish resume
[ 1639.467088] hub 1-2:1.0: hub_resume
[ 1639.467136] usb 1-2-port1: status 0507 change 0000
[ 1639.467424] usb 1-2-port5: status 0101 change 0001
[ 1639.475222] pci 0000:02:00.0: [8086:15d3] type 01 class 0x060400
[ 1639.475319] pci 0000:02:00.0: enabling Extended Tags
[ 1639.475498] pci 0000:02:00.0: supports D1 D2
[ 1639.475502] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[ 1639.476061] pci 0000:03:00.0: [8086:15d3] type 01 class 0x060400
[ 1639.476157] pci 0000:03:00.0: enabling Extended Tags
[ 1639.476334] pci 0000:03:00.0: supports D1 D2
[ 1639.476337] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[ 1639.476587] pci 0000:03:01.0: [8086:15d3] type 01 class 0x060400
[ 1639.476678] pci 0000:03:01.0: enabling Extended Tags
[ 1639.476854] pci 0000:03:01.0: supports D1 D2
[ 1639.476857] pci 0000:03:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[ 1639.477108] pci 0000:03:02.0: [8086:15d3] type 01 class 0x060400
[ 1639.477203] pci 0000:03:02.0: enabling Extended Tags
[ 1639.477385] pci 0000:03:02.0: supports D1 D2
[ 1639.477390] pci 0000:03:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[ 1639.477744] pci 0000:03:04.0: [8086:15d3] type 01 class 0x060400
[ 1639.477842] pci 0000:03:04.0: enabling Extended Tags
[ 1639.478028] pci 0000:03:04.0: supports D1 D2
[ 1639.478033] pci 0000:03:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[ 1639.478369] pci 0000:02:00.0: PCI bridge to [bus 03-6c]
[ 1639.478401] pci 0000:02:00.0:   bridge window [mem 0xb0000000-0xde0fffff]
[ 1639.478416] pci 0000:02:00.0:   bridge window [mem
0x2f90000000-0x2fd9ffffff 64bit pref]
[ 1639.478565] pci 0000:03:00.0: PCI bridge to [bus 04]
[ 1639.478587] pci 0000:03:00.0:   bridge window [mem 0xde000000-0xde0fffff]
[ 1639.478823] pci 0000:03:01.0: PCI bridge to [bus 05-37]
[ 1639.478844] pci 0000:03:01.0:   bridge window [mem 0xb0000000-0xc7efffff]
[ 1639.478859] pci 0000:03:01.0:   bridge window [mem
0x2f90000000-0x2fafffffff 64bit pref]
[ 1639.479072] pci 0000:38:00.0: [8086:15d4] type 00 class 0x0c0330
[ 1639.479111] pci 0000:38:00.0: reg 0x10: [mem 0xc7f00000-0xc7f0ffff]
[ 1639.479222] pci 0000:38:00.0: enabling Extended Tags
[ 1639.479454] pci 0000:38:00.0: supports D1 D2
[ 1639.479461] pci 0000:38:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[ 1639.479582] pci 0000:38:00.0: 8.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x4 link at 0000:03:02.0 (capable of 31.504
Gb/s with 8.0 GT/s PCIe x4 link)
[ 1639.479942] pci 0000:03:02.0: PCI bridge to [bus 38]
[ 1639.479964] pci 0000:03:02.0:   bridge window [mem 0xc7f00000-0xc7ffffff]
[ 1639.480087] pci 0000:03:04.0: PCI bridge to [bus 39-6c]
[ 1639.480107] pci 0000:03:04.0:   bridge window [mem 0xc8000000-0xddffffff]
[ 1639.480122] pci 0000:03:04.0:   bridge window [mem
0x2fb0000000-0x2fd9ffffff 64bit pref]
[ 1639.480180] pci_bus 0000:03: Allocating resources
[ 1639.480218] pci 0000:03:01.0: bridge window [io  0x1000-0x0fff] to
[bus 05-37] add_size 1000
[ 1639.480228] pci 0000:03:02.0: bridge window [io  0x1000-0x0fff] to
[bus 38] add_size 1000
[ 1639.480237] pci 0000:03:02.0: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 38] add_size 200000
add_align 100000
[ 1639.480248] pci 0000:03:04.0: bridge window [io  0x1000-0x0fff] to
[bus 39-6c] add_size 1000
[ 1639.480258] pci 0000:02:00.0: bridge window [io  0x1000-0x0fff] to
[bus 03-6c] add_size 4000
[ 1639.480272] pci 0000:02:00.0: BAR 13: assigned [io  0x2000-0x5fff]
[ 1639.480289] pci 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[ 1639.480296] pci 0000:03:02.0: BAR 15: failed to assign [mem size
0x00200000 64bit pref]
[ 1639.480304] pci 0000:03:01.0: BAR 13: assigned [io  0x2000-0x2fff]
[ 1639.480310] pci 0000:03:02.0: BAR 13: assigned [io  0x3000-0x3fff]
[ 1639.480317] pci 0000:03:04.0: BAR 13: assigned [io  0x4000-0x4fff]
[ 1639.480330] pci 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[ 1639.480336] pci 0000:03:02.0: BAR 15: failed to assign [mem size
0x00200000 64bit pref]
[ 1639.480344] pci 0000:03:00.0: PCI bridge to [bus 04]
[ 1639.480358] pci 0000:03:00.0:   bridge window [mem 0xde000000-0xde0fffff]
[ 1639.480378] pci 0000:03:01.0: PCI bridge to [bus 05-37]
[ 1639.480386] pci 0000:03:01.0:   bridge window [io  0x2000-0x2fff]
[ 1639.480398] pci 0000:03:01.0:   bridge window [mem 0xb0000000-0xc7efffff]
[ 1639.480409] pci 0000:03:01.0:   bridge window [mem
0x2f90000000-0x2fafffffff 64bit pref]
[ 1639.480424] pci 0000:03:02.0: PCI bridge to [bus 38]
[ 1639.480431] pci 0000:03:02.0:   bridge window [io  0x3000-0x3fff]
[ 1639.480443] pci 0000:03:02.0:   bridge window [mem 0xc7f00000-0xc7ffffff]
[ 1639.480462] pci 0000:03:04.0: PCI bridge to [bus 39-6c]
[ 1639.480469] pci 0000:03:04.0:   bridge window [io  0x4000-0x4fff]
[ 1639.480481] pci 0000:03:04.0:   bridge window [mem 0xc8000000-0xddffffff]
[ 1639.480491] pci 0000:03:04.0:   bridge window [mem
0x2fb0000000-0x2fd9ffffff 64bit pref]
[ 1639.480506] pci 0000:02:00.0: PCI bridge to [bus 03-6c]
[ 1639.480514] pci 0000:02:00.0:   bridge window [io  0x2000-0x5fff]
[ 1639.480526] pci 0000:02:00.0:   bridge window [mem 0xb0000000-0xde0fffff]
[ 1639.480540] pci 0000:02:00.0:   bridge window [mem
0x2f90000000-0x2fd9ffffff 64bit pref]
[ 1639.480632] pcieport 0000:02:00.0: enabling device (0006 -> 0007)
[ 1639.482300] pcieport 0000:03:01.0: enabling device (0006 -> 0007)
[ 1639.483230] pcieport 0000:03:02.0: enabling device (0006 -> 0007)
[ 1639.483823] pcieport 0000:03:04.0: enabling device (0006 -> 0007)
[ 1639.485044] xhci_hcd 0000:38:00.0: xHCI Host Controller
[ 1639.485063] xhci_hcd 0000:38:00.0: new USB bus registered, assigned
bus number 3
[ 1639.486225] xhci_hcd 0000:38:00.0: hcc params 0x200077c1 hci
version 0x110 quirks 0x0000000200009810
[ 1639.486243] xhci_hcd 0000:38:00.0: supports USB remote wakeup
[ 1639.486551] usb usb3: default language 0x0409
[ 1639.486575] usb usb3: udev 1, busnum 3, minor = 256
[ 1639.486580] usb usb3: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.11
[ 1639.486586] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[ 1639.486623] usb usb3: Product: xHCI Host Controller
[ 1639.486629] usb usb3: Manufacturer: Linux 5.11.0-051100-generic xhci-hcd
[ 1639.486634] usb usb3: SerialNumber: 0000:38:00.0
[ 1639.487174] usb usb3: usb_probe_device
[ 1639.487186] usb usb3: configuration #1 chosen from 1 choice
[ 1639.487229] usb usb3: adding 3-0:1.0 (config #1, interface 0)
[ 1639.487298] hub 3-0:1.0: usb_probe_interface
[ 1639.487305] hub 3-0:1.0: usb_probe_interface - got id
[ 1639.487312] hub 3-0:1.0: USB hub found
[ 1639.487334] hub 3-0:1.0: 2 ports detected
[ 1639.487338] hub 3-0:1.0: standalone hub
[ 1639.487341] hub 3-0:1.0: no power switching (usb 1.0)
[ 1639.487344] hub 3-0:1.0: individual port over-current protection
[ 1639.487348] hub 3-0:1.0: Single TT
[ 1639.487350] hub 3-0:1.0: TT requires at most 8 FS bit times (666 ns)
[ 1639.487354] hub 3-0:1.0: power on to power good time: 20ms
[ 1639.487373] hub 3-0:1.0: local power source is good
[ 1639.488620] hub 3-0:1.0: trying to enable port power on non-switchable hub
[ 1639.488949] xhci_hcd 0000:38:00.0: xHCI Host Controller
[ 1639.488966] xhci_hcd 0000:38:00.0: new USB bus registered, assigned
bus number 4
[ 1639.488978] xhci_hcd 0000:38:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[ 1639.488986] xhci_hcd 0000:38:00.0: supports USB remote wakeup
[ 1639.489058] usb usb4: skipped 1 descriptor after endpoint
[ 1639.489075] usb usb4: default language 0x0409
[ 1639.489109] usb usb4: udev 1, busnum 4, minor = 384
[ 1639.489119] usb usb4: New USB device found, idVendor=1d6b,
idProduct=0003, bcdDevice= 5.11
[ 1639.489128] usb usb4: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[ 1639.489134] usb usb4: Product: xHCI Host Controller
[ 1639.489140] usb usb4: Manufacturer: Linux 5.11.0-051100-generic xhci-hcd
[ 1639.489146] usb usb4: SerialNumber: 0000:38:00.0
[ 1639.489435] usb usb4: usb_probe_device
[ 1639.489449] usb usb4: configuration #1 chosen from 1 choice
[ 1639.489495] usb usb4: adding 4-0:1.0 (config #1, interface 0)
[ 1639.489601] hub 4-0:1.0: usb_probe_interface
[ 1639.489609] hub 4-0:1.0: usb_probe_interface - got id
[ 1639.489625] hub 4-0:1.0: USB hub found
[ 1639.489702] hub 4-0:1.0: 2 ports detected
[ 1639.489711] hub 4-0:1.0: standalone hub
[ 1639.489716] hub 4-0:1.0: no power switching (usb 1.0)
[ 1639.489721] hub 4-0:1.0: individual port over-current protection
[ 1639.489725] hub 4-0:1.0: TT requires at most 8 FS bit times (666 ns)
[ 1639.489732] hub 4-0:1.0: power on to power good time: 20ms
[ 1639.489759] hub 4-0:1.0: local power source is good
[ 1639.491665] hub 4-0:1.0: trying to enable port power on non-switchable hub
[ 1639.574674] usb usb1-port2: resume, status 0
[ 1639.574696] hub 1-2:1.0: state 7 ports 5 chg 0020 evt 0000
[ 1639.574741] usb 1-2-port5: status 0101, change 0000, 12 Mb/s
[ 1639.574956] usb 1-2-port5: indicator auto status 0
[ 1639.590694] hub 3-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 1639.590709] hub 3-0:1.0: hub_suspend
[ 1639.590719] usb usb3: bus auto-suspend, wakeup 1
[ 1639.654609] usb 1-2.5: new high-speed USB device number 9 using xhci_hcd
[ 1639.698666] hub 4-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 1639.698736] hub 4-0:1.0: hub_suspend
[ 1639.698754] usb usb4: bus auto-suspend, wakeup 1
[ 1639.698766] usb usb4: bus suspend fail, err -16
[ 1639.698772] hub 4-0:1.0: hub_resume
[ 1639.698788] usb usb4-port1: status 0203 change 0011
[ 1639.756646] usb 1-2.5: default language 0x0409
[ 1639.757169] usb 1-2.5: udev 9, busnum 1, minor = 8
[ 1639.757184] usb 1-2.5: New USB device found, idVendor=0bda,
idProduct=5450, bcdDevice= 1.01
[ 1639.757194] usb 1-2.5: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[ 1639.757201] usb 1-2.5: Product: BillBoard Device
[ 1639.757206] usb 1-2.5: Manufacturer: Realtek
[ 1639.757503] usb 1-2.5: usb_probe_device
[ 1639.757519] usb 1-2.5: configuration #1 chosen from 1 choice
[ 1639.758004] usb 1-2.5: adding 1-2.5:1.0 (config #1, interface 0)
[ 1639.810625] hub 4-0:1.0: state 7 ports 2 chg 0002 evt 0000
[ 1639.811053] usb usb4-port1: status 0203, change 0000, 10.0 Gb/s
[ 1639.939008] usb 4-1: new SuperSpeedPlus Gen 2 USB device number 2
using xhci_hcd
[ 1639.965109] usb 4-1: skipped 1 descriptor after endpoint
[ 1639.965329] usb 4-1: default language 0x0409
[ 1639.965945] usb 4-1: udev 2, busnum 4, minor = 385
[ 1639.965956] usb 4-1: New USB device found, idVendor=2900,
idProduct=8383, bcdDevice= 1.0a
[ 1639.965966] usb 4-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 1639.965973] usb 4-1: Product: 4-Port USB 3.0 Hub
[ 1639.965979] usb 4-1: Manufacturer: Generic
[ 1639.966257] usb 4-1: usb_probe_device
[ 1639.966264] usb 4-1: configuration #1 chosen from 1 choice
[ 1639.967895] usb 4-1: adding 4-1:1.0 (config #1, interface 0)
[ 1639.968370] hub 4-1:1.0: usb_probe_interface
[ 1639.968383] hub 4-1:1.0: usb_probe_interface - got id
[ 1639.968396] hub 4-1:1.0: USB hub found
[ 1639.968659] hub 4-1:1.0: 4 ports detected
[ 1639.968669] hub 4-1:1.0: standalone hub
[ 1639.968674] hub 4-1:1.0: individual port power switching
[ 1639.968679] hub 4-1:1.0: individual port over-current protection
[ 1639.968683] hub 4-1:1.0: TT requires at most 8 FS bit times (666 ns)
[ 1639.968689] hub 4-1:1.0: power on to power good time: 0ms
[ 1639.969006] hub 4-1:1.0: local power source is good
[ 1639.969499] hub 4-1:1.0: enabling power on all ports
[ 1640.074857] usb 4-1-port1: status 0203 change 0010
[ 1640.178564] hub 4-1:1.0: state 7 ports 4 chg 0002 evt 0000
[ 1640.178836] usb 4-1-port1: status 0203, change 0000, 10.0 Gb/s
[ 1640.258712] usb 4-1.1: new SuperSpeed Gen 1 USB device number 3
using xhci_hcd
[ 1640.285169] usb 4-1.1: skipped 1 descriptor after endpoint
[ 1640.285460] usb 4-1.1: default language 0x0409
[ 1640.286221] usb 4-1.1: udev 3, busnum 4, minor = 386
[ 1640.286236] usb 4-1.1: New USB device found, idVendor=05e3,
idProduct=0626, bcdDevice= 6.55
[ 1640.286245] usb 4-1.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[ 1640.286252] usb 4-1.1: Product: USB3.1 Hub
[ 1640.286257] usb 4-1.1: Manufacturer: GenesysLogic
[ 1640.286934] usb 4-1.1: usb_probe_device
[ 1640.286946] usb 4-1.1: configuration #1 chosen from 1 choice
[ 1640.289733] usb 4-1.1: adding 4-1.1:1.0 (config #1, interface 0)
[ 1640.290325] hub 4-1.1:1.0: usb_probe_interface
[ 1640.290334] hub 4-1.1:1.0: usb_probe_interface - got id
[ 1640.290342] hub 4-1.1:1.0: USB hub found
[ 1640.293808] hub 4-1.1:1.0: 4 ports detected
[ 1640.293815] hub 4-1.1:1.0: standalone hub
[ 1640.293818] hub 4-1.1:1.0: ganged power switching
[ 1640.293820] hub 4-1.1:1.0: global over-current protection
[ 1640.293823] hub 4-1.1:1.0: TT requires at most 8 FS bit times (666 ns)
[ 1640.293826] hub 4-1.1:1.0: power on to power good time: 100ms
[ 1640.294360] hub 4-1.1:1.0: local power source is good
[ 1640.294365] hub 4-1.1:1.0: no over-current condition exists
[ 1640.295181] hub 4-1.1:1.0: enabling power on all ports
[ 1640.296295] hub 4-1:1.0: state 7 ports 4 chg 0000 evt 0002
[ 1640.399649] usb 4-1.1-port3: status 0203 change 0011
[ 1640.400645] usb 4-1.1-port4: status 0203 change 0011
[ 1640.502609] hub 4-1.1:1.0: state 7 ports 4 chg 0018 evt 0000
[ 1640.502977] usb 4-1.1-port3: status 0203, change 0000, 5.0 Gb/s
[ 1640.582678] usb 4-1.1.3: new SuperSpeed Gen 1 USB device number 4
using xhci_hcd
[ 1640.602938] usb 4-1.1.3: USB quirks for this device: 400
[ 1640.603795] usb 4-1.1.3: skipped 1 descriptor after endpoint
[ 1640.603805] usb 4-1.1.3: skipped 1 descriptor after endpoint
[ 1640.603810] usb 4-1.1.3: skipped 1 descriptor after endpoint
[ 1640.604112] usb 4-1.1.3: skipped 3 descriptors after interface
[ 1640.604117] usb 4-1.1.3: skipped 1 descriptor after endpoint
[ 1640.604121] usb 4-1.1.3: skipped 1 descriptor after endpoint
[ 1640.604125] usb 4-1.1.3: skipped 1 descriptor after endpoint
[ 1640.604318] usb 4-1.1.3: default language 0x0409
[ 1640.604926] usb 4-1.1.3: udev 4, busnum 4, minor = 387
[ 1640.604937] usb 4-1.1.3: New USB device found, idVendor=0bda,
idProduct=8153, bcdDevice=30.00
[ 1640.604943] usb 4-1.1.3: New USB device strings: Mfr=1, Product=2,
SerialNumber=6
[ 1640.604948] usb 4-1.1.3: Product: USB 10/100/1000 LAN
[ 1640.604952] usb 4-1.1.3: Manufacturer: Realtek
[ 1640.604955] usb 4-1.1.3: SerialNumber: 000001
[ 1640.605239] usb 4-1.1.3: usb_probe_device
[ 1640.605248] usb 4-1.1.3: configuration #2 chosen from 2 choices
[ 1640.606530] usb 4-1.1.3: adding 4-1.1.3:2.0 (config #2, interface 0)
[ 1640.606722] r8152 4-1.1.3:2.0: usb_probe_interface
[ 1640.606736] r8152 4-1.1.3:2.0: usb_probe_interface - got id
[ 1640.606826] cdc_ether 4-1.1.3:2.0: usb_probe_interface
[ 1640.606838] cdc_ether 4-1.1.3:2.0: usb_probe_interface - got id
[ 1640.606856] r8153_ecm 4-1.1.3:2.0: usb_probe_interface
[ 1640.606863] r8153_ecm 4-1.1.3:2.0: usb_probe_interface - got id
[ 1640.606983] usb 4-1.1.3: adding 4-1.1.3:2.1 (config #2, interface 1)
[ 1640.607195] usb 4-1.1.3: unregistering interface 4-1.1.3:2.0
[ 1640.607285] usb 4-1.1.3: unregistering interface 4-1.1.3:2.1
[ 1640.607361] usb 4-1.1-port4: status 0203, change 0000, 5.0 Gb/s
[ 1640.607410] usb 4-1.1.3: usb_disable_device nuking non-ep0 URBs
[ 1640.610317] usb 4-1.1.3: adding 4-1.1.3:1.0 (config #1, interface 0)
[ 1640.610419] r8152 4-1.1.3:1.0: usb_probe_interface
[ 1640.610434] r8152 4-1.1.3:1.0: usb_probe_interface - got id
[ 1640.690509] usb 4-1.1.4: new SuperSpeed Gen 1 USB device number 5
using xhci_hcd
[ 1640.712240] usb 4-1.1.4: skipped 1 descriptor after endpoint
[ 1640.712252] usb 4-1.1.4: skipped 1 descriptor after endpoint
[ 1640.712461] usb 4-1.1.4: default language 0x0409
[ 1640.713257] usb 4-1.1.4: udev 5, busnum 4, minor = 388
[ 1640.713268] usb 4-1.1.4: New USB device found, idVendor=058f,
idProduct=8468, bcdDevice= 1.00
[ 1640.713275] usb 4-1.1.4: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[ 1640.713279] usb 4-1.1.4: Product: Mass Storage Device
[ 1640.713283] usb 4-1.1.4: Manufacturer: Generic
[ 1640.713286] usb 4-1.1.4: SerialNumber: 058F84688461
[ 1640.713560] usb 4-1.1.4: usb_probe_device
[ 1640.713571] usb 4-1.1.4: configuration #1 chosen from 1 choice
[ 1640.715840] usb 4-1.1.4: adding 4-1.1.4:1.0 (config #1, interface 0)
[ 1640.716065] hub 4-1.1:1.0: state 7 ports 4 chg 0000 evt 0010
[ 1640.726054] hub 4-1.1:1.0: state 7 ports 4 chg 0000 evt 0008
[ 1640.778891] hp_wmi: Unknown event_id - 131073 - 0x0
[ 1640.796512] hub 1-0:1.0: state 7 ports 16 chg 0000 evt 0004
[ 1640.796548] usb usb1-port2: status 0100, change 0001, 12 Mb/s
[ 1640.796555] usb 1-2: USB disconnect, device number 7
[ 1640.796558] usb 1-2.1: USB disconnect, device number 8
[ 1640.796560] usb 1-2.1: unregistering device
[ 1640.796563] usb 1-2.1: unregistering interface 1-2.1:1.0
[ 1640.796697] usb 1-2.1: usb_disable_device nuking all URBs
[ 1640.797416] usb 1-2.5: USB disconnect, device number 9
[ 1640.797434] usb 1-2.5: unregistering device
[ 1640.797437] usb 1-2.5: unregistering interface 1-2.5:1.0
[ 1640.797469] usb 1-2.5: usb_disable_device nuking all URBs
[ 1640.797613] usb 1-2: unregistering device
[ 1640.797616] usb 1-2: unregistering interface 1-2:1.0
[ 1640.797669] xhci_hcd 0000:00:14.0: shutdown urb ffff9be3848e8d80 ep1in-intr
[ 1640.797773] usb 1-2: usb_disable_device nuking all URBs
[ 1640.946495] usb usb1-port2: debounce total 100ms stable 100ms status 0x100
[ 1640.946528] hub 1-0:1.0: hub_suspend
[ 1640.946548] usb usb1: bus auto-suspend, wakeup 1
[ 1641.768923] usb usb1: usb wakeup-resume
[ 1641.768940] usb usb1: usb auto-resume
[ 1641.768979] hub 1-0:1.0: hub_resume
[ 1641.769024] usb usb1-port2: status 0101 change 0001
[ 1641.769078] usb usb1-port5: status 0507 change 0000
[ 1641.769106] usb usb1-port7: status 0107 change 0000
[ 1641.874201] hub 1-0:1.0: state 7 ports 16 chg 0004 evt 0000
[ 1641.874248] usb usb1-port2: status 0101, change 0000, 12 Mb/s
[ 1642.002280] usb 1-2: new high-speed USB device number 10 using xhci_hcd
[ 1642.154168] usb 1-2: default language 0x0409
[ 1642.155079] usb 1-2: udev 10, busnum 1, minor = 9
[ 1642.155098] usb 1-2: New USB device found, idVendor=291a,
idProduct=5423, bcdDevice= 1.0a
[ 1642.155107] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 1642.155114] usb 1-2: Product: 4-Port USB 2.0 Hub
[ 1642.155119] usb 1-2: Manufacturer: Generic
[ 1642.155452] usb 1-2: usb_probe_device
[ 1642.155464] usb 1-2: configuration #1 chosen from 1 choice
[ 1642.156570] usb 1-2: adding 1-2:1.0 (config #1, interface 0)
[ 1642.156650] hub 1-2:1.0: usb_probe_interface
[ 1642.156657] hub 1-2:1.0: usb_probe_interface - got id
[ 1642.156666] hub 1-2:1.0: USB hub found
[ 1642.156918] hub 1-2:1.0: 5 ports detected
[ 1642.156934] hub 1-2:1.0: compound device; port removable status: FRRRR
[ 1642.156940] hub 1-2:1.0: individual port power switching
[ 1642.156945] hub 1-2:1.0: individual port over-current protection
[ 1642.158251] hub 1-2:1.0: TT per port
[ 1642.158266] hub 1-2:1.0: TT requires at most 16 FS bit times (1332 ns)
[ 1642.158277] hub 1-2:1.0: Port indicators are supported
[ 1642.158285] hub 1-2:1.0: power on to power good time: 0ms
[ 1642.158571] hub 1-2:1.0: local power source is good
[ 1642.159083] hub 1-2:1.0: enabling power on all ports
[ 1642.262275] usb 1-2-port1: status 0101 change 0001
[ 1642.366197] hub 1-2:1.0: state 7 ports 5 chg 0002 evt 0000
[ 1642.366359] usb 1-2-port1: status 0101, change 0000, 12 Mb/s
[ 1642.366709] usb 1-2-port1: indicator auto status 0
[ 1642.446187] usb 1-2.1: new high-speed USB device number 11 using xhci_hcd
[ 1642.553074] usb 1-2.1: default language 0x0409
[ 1642.553778] usb 1-2.1: udev 11, busnum 1, minor = 10
[ 1642.553793] usb 1-2.1: New USB device found, idVendor=05e3,
idProduct=0610, bcdDevice= 6.55
[ 1642.553803] usb 1-2.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[ 1642.553809] usb 1-2.1: Product: USB2.1 Hub
[ 1642.553814] usb 1-2.1: Manufacturer: GenesysLogic
[ 1642.554132] usb 1-2.1: usb_probe_device
[ 1642.554145] usb 1-2.1: configuration #1 chosen from 1 choice
[ 1642.555463] usb 1-2.1: adding 1-2.1:1.0 (config #1, interface 0)
[ 1642.555606] hub 1-2.1:1.0: usb_probe_interface
[ 1642.555619] hub 1-2.1:1.0: usb_probe_interface - got id
[ 1642.555630] hub 1-2.1:1.0: USB hub found
[ 1642.555958] hub 1-2.1:1.0: 4 ports detected
[ 1642.555971] hub 1-2.1:1.0: standalone hub
[ 1642.555979] hub 1-2.1:1.0: ganged power switching
[ 1642.555988] hub 1-2.1:1.0: global over-current protection
[ 1642.555996] hub 1-2.1:1.0: Single TT
[ 1642.556003] hub 1-2.1:1.0: TT requires at most 32 FS bit times (2664 ns)
[ 1642.556013] hub 1-2.1:1.0: Port indicators are supported
[ 1642.556022] hub 1-2.1:1.0: power on to power good time: 100ms
[ 1642.556486] hub 1-2.1:1.0: local power source is good
[ 1642.556497] hub 1-2.1:1.0: no over-current condition exists
[ 1642.557138] hub 1-2.1:1.0: enabling power on all ports
[ 1642.663668] hub 1-2.1:1.0: state 7 ports 4 chg 0000 evt 0000
[ 1642.664996] hub 1-2.1:1.0: hub_suspend
[ 1642.675515] usb 1-2.1: usb auto-suspend, wakeup 1
[ 1642.694000] hub 1-2:1.0: hub_suspend
[ 1642.714067] usb 1-2: usb auto-suspend, wakeup 1
[ 1642.746050] hub 1-0:1.0: state 7 ports 16 chg 0000 evt 0004
[ 1642.770047] usb 1-2: usb wakeup-resume
[ 1642.770115] usb 1-2: Waited 0ms for CONNECT
[ 1642.770122] usb 1-2: finish resume
[ 1642.770502] hub 1-2:1.0: hub_resume
[ 1642.770608] usb 1-2-port1: status 0507 change 0000
[ 1642.770992] usb 1-2-port5: status 0101 change 0001
[ 1642.878002] usb usb1-port2: resume, status 0
[ 1642.878023] hub 1-2:1.0: state 7 ports 5 chg 0020 evt 0000
[ 1642.878178] usb 1-2-port5: status 0101, change 0000, 12 Mb/s
[ 1642.878461] usb 1-2-port5: indicator auto status 0
[ 1642.958063] usb 1-2.5: new high-speed USB device number 12 using xhci_hcd
[ 1643.060993] usb 1-2.5: default language 0x0409
[ 1643.061615] usb 1-2.5: udev 12, busnum 1, minor = 11
[ 1643.061630] usb 1-2.5: New USB device found, idVendor=0bda,
idProduct=5450, bcdDevice= 1.01
[ 1643.061640] usb 1-2.5: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[ 1643.061647] usb 1-2.5: Product: BillBoard Device
[ 1643.061653] usb 1-2.5: Manufacturer: Realtek
[ 1643.061991] usb 1-2.5: usb_probe_device
[ 1643.062002] usb 1-2.5: configuration #1 chosen from 1 choice
[ 1643.066558] usb 1-2.5: adding 1-2.5:1.0 (config #1, interface 0)
[ 1644.493871] xhci_hcd 0000:38:00.0: remove, state 1
[ 1644.493876] xhci_hcd 0000:38:00.0: roothub graceful disconnect
[ 1644.493881] usb usb4: USB disconnect, device number 1
[ 1644.493883] usb 4-1: USB disconnect, device number 2
[ 1644.493884] usb 4-1.1: USB disconnect, device number 3
[ 1644.962015] hp_wmi: Unknown event_id - 131073 - 0x0
[ 1645.939854] xhci_hcd 0000:38:00.0: xHCI host controller not
responding, assume dead
[ 1645.939895] xhci_hcd 0000:38:00.0: Timeout waiting for reset device command
[ 1646.345303] usb 4-1.1.3: device not accepting address 4, error -22
[ 1646.345334] usb 4-1.1-port3: logical disconnect
[ 1646.345370] r8152 4-1.1.3:1.0 (unnamed net_device) (uninitialized):
Get ether addr fail
[ 1646.345428] hub 4-1.1:1.0: state 0 ports 4 chg 0008 evt 0000
[ 1646.345446] usb 4-1.1.3: USB disconnect, device number 4
[ 1646.346134] r8152 4-1.1.3:1.0 eth0: v1.11.11
[ 1646.346407] usb 4-1.1.3: unregistering device
[ 1646.346419] usb 4-1.1.3: unregistering interface 4-1.1.3:1.0
[ 1646.393904] usb 4-1.1.3: usb_disable_device nuking all URBs
[ 1646.394591] usb 4-1.1.4: USB disconnect, device number 5
[ 1646.394603] usb 4-1.1.4: unregistering device
[ 1646.394609] usb 4-1.1.4: unregistering interface 4-1.1.4:1.0
[ 1646.394739] usb 4-1.1.4: usb_disable_device nuking all URBs
[ 1646.395279] usb 4-1.1: unregistering device
[ 1646.395294] usb 4-1.1: unregistering interface 4-1.1:1.0
[ 1646.395745] usb 4-1.1: usb_disable_device nuking all URBs
[ 1646.396205] usb 4-1: unregistering device
[ 1646.396219] usb 4-1: unregistering interface 4-1:1.0
[ 1646.396636] usb 4-1: usb_disable_device nuking all URBs
[ 1646.397091] usb usb4: unregistering device
[ 1646.397103] usb usb4: unregistering interface 4-0:1.0
[ 1646.397249] xhci_hcd 0000:38:00.0: shutdown urb ffff9be365d83d80 ep1in-intr
[ 1646.397542] usb usb4: usb_disable_device nuking all URBs
[ 1646.397973] xhci_hcd 0000:38:00.0: USB bus 4 deregistered
[ 1646.398000] xhci_hcd 0000:38:00.0: remove, state 4
[ 1646.398009] xhci_hcd 0000:38:00.0: roothub graceful disconnect
[ 1646.398019] usb usb3: USB disconnect, device number 1
[ 1646.398028] usb usb3: unregistering device
[ 1646.398035] usb usb3: unregistering interface 3-0:1.0
[ 1646.398355] usb usb3: usb_disable_device nuking all URBs
[ 1646.398710] xhci_hcd 0000:38:00.0: Host halt failed, -19
[ 1646.398724] xhci_hcd 0000:38:00.0: Host not accessible, reset failed.
[ 1646.398994] xhci_hcd 0000:38:00.0: USB bus 3 deregistered
[ 1646.421648] pci_bus 0000:03: Allocating resources
[ 1646.421698] pcieport 0000:03:02.0: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 38] add_size 200000
add_align 100000
[ 1646.421736] pcieport 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[ 1646.421749] pcieport 0000:03:02.0: BAR 15: failed to assign [mem
size 0x00200000 64bit pref]
[ 1646.421768] pcieport 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[ 1646.421777] pcieport 0000:03:02.0: BAR 15: failed to assign [mem
size 0x00200000 64bit pref]
[ 1646.436195] usbcore: registered new interface driver usb-storage
[ 1646.438626] usbcore: registered new interface driver uas
[ 1649.641049] pci 0000:38:00.0: [8086:15d4] type 00 class 0x0c0330
[ 1649.641074] pci 0000:38:00.0: reg 0x10: [mem 0xc7f00000-0xc7f0ffff]
[ 1649.641148] pci 0000:38:00.0: enabling Extended Tags
[ 1649.641294] pci 0000:38:00.0: supports D1 D2
[ 1649.641296] pci 0000:38:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[ 1649.641415] pci 0000:38:00.0: 8.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x4 link at 0000:03:02.0 (capable of 31.504
Gb/s with 8.0 GT/s PCIe x4 link)
[ 1649.641544] pcieport 0000:03:02.0: ASPM: current common clock
configuration is inconsistent, reconfiguring
[ 1649.641616] pci_bus 0000:03: Allocating resources
[ 1649.641635] pcieport 0000:03:02.0: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 38] add_size 200000
add_align 100000
[ 1649.641641] pcieport 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[ 1649.641643] pcieport 0000:03:02.0: BAR 15: failed to assign [mem
size 0x00200000 64bit pref]
[ 1649.641645] pcieport 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[ 1649.641646] pcieport 0000:03:02.0: BAR 15: failed to assign [mem
size 0x00200000 64bit pref]
[ 1649.641910] xhci_hcd 0000:38:00.0: xHCI Host Controller
[ 1649.641916] xhci_hcd 0000:38:00.0: new USB bus registered, assigned
bus number 3
[ 1649.643071] xhci_hcd 0000:38:00.0: hcc params 0x200077c1 hci
version 0x110 quirks 0x0000000200009810
[ 1649.643078] xhci_hcd 0000:38:00.0: supports USB remote wakeup
[ 1649.643351] usb usb3: default language 0x0409
[ 1649.643361] usb usb3: udev 1, busnum 3, minor = 256
[ 1649.643363] usb usb3: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.11
[ 1649.643365] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[ 1649.643366] usb usb3: Product: xHCI Host Controller
[ 1649.643368] usb usb3: Manufacturer: Linux 5.11.0-051100-generic xhci-hcd
[ 1649.643369] usb usb3: SerialNumber: 0000:38:00.0
[ 1649.643544] usb usb3: usb_probe_device
[ 1649.643548] usb usb3: configuration #1 chosen from 1 choice
[ 1649.643557] usb usb3: adding 3-0:1.0 (config #1, interface 0)
[ 1649.643575] hub 3-0:1.0: usb_probe_interface
[ 1649.643576] hub 3-0:1.0: usb_probe_interface - got id
[ 1649.643578] hub 3-0:1.0: USB hub found
[ 1649.643587] hub 3-0:1.0: 2 ports detected
[ 1649.643588] hub 3-0:1.0: standalone hub
[ 1649.643589] hub 3-0:1.0: no power switching (usb 1.0)
[ 1649.643590] hub 3-0:1.0: individual port over-current protection
[ 1649.643591] hub 3-0:1.0: Single TT
[ 1649.643592] hub 3-0:1.0: TT requires at most 8 FS bit times (666 ns)
[ 1649.643594] hub 3-0:1.0: power on to power good time: 20ms
[ 1649.643600] hub 3-0:1.0: local power source is good
[ 1649.643994] hub 3-0:1.0: trying to enable port power on non-switchable hub
[ 1649.644172] xhci_hcd 0000:38:00.0: xHCI Host Controller
[ 1649.644175] xhci_hcd 0000:38:00.0: new USB bus registered, assigned
bus number 4
[ 1649.644177] xhci_hcd 0000:38:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[ 1649.644179] xhci_hcd 0000:38:00.0: supports USB remote wakeup
[ 1649.644202] usb usb4: skipped 1 descriptor after endpoint
[ 1649.644205] usb usb4: default language 0x0409
[ 1649.644213] usb usb4: udev 1, busnum 4, minor = 384
[ 1649.644215] usb usb4: New USB device found, idVendor=1d6b,
idProduct=0003, bcdDevice= 5.11
[ 1649.644217] usb usb4: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[ 1649.644218] usb usb4: Product: xHCI Host Controller
[ 1649.644219] usb usb4: Manufacturer: Linux 5.11.0-051100-generic xhci-hcd
[ 1649.644220] usb usb4: SerialNumber: 0000:38:00.0
[ 1649.644318] usb usb4: usb_probe_device
[ 1649.644319] usb usb4: configuration #1 chosen from 1 choice
[ 1649.644327] usb usb4: adding 4-0:1.0 (config #1, interface 0)
[ 1649.644344] hub 4-0:1.0: usb_probe_interface
[ 1649.644345] hub 4-0:1.0: usb_probe_interface - got id
[ 1649.644347] hub 4-0:1.0: USB hub found
[ 1649.644354] hub 4-0:1.0: 2 ports detected
[ 1649.644356] hub 4-0:1.0: standalone hub
[ 1649.644357] hub 4-0:1.0: no power switching (usb 1.0)
[ 1649.644358] hub 4-0:1.0: individual port over-current protection
[ 1649.644358] hub 4-0:1.0: TT requires at most 8 FS bit times (666 ns)
[ 1649.644360] hub 4-0:1.0: power on to power good time: 20ms
[ 1649.644365] hub 4-0:1.0: local power source is good
[ 1649.644781] hub 4-0:1.0: trying to enable port power on non-switchable hub
[ 1649.746606] hub 3-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 1649.746629] hub 3-0:1.0: hub_suspend
[ 1649.746647] usb usb3: bus auto-suspend, wakeup 1
[ 1649.856703] hub 4-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 1649.856773] hub 4-0:1.0: hub_suspend
[ 1649.856792] usb usb4: bus auto-suspend, wakeup 1
[ 1649.856803] usb usb4: bus suspend fail, err -16
[ 1649.856809] hub 4-0:1.0: hub_resume
[ 1649.856825] usb usb4-port1: status 0203 change 0011
[ 1649.962673] hub 4-0:1.0: state 7 ports 2 chg 0002 evt 0000
[ 1649.962722] usb usb4-port1: status 0203, change 0000, 10.0 Gb/s
[ 1650.089187] usb 4-1: new SuperSpeedPlus Gen 2 USB device number 2
using xhci_hcd
[ 1650.114569] usb 4-1: skipped 1 descriptor after endpoint
[ 1650.114812] usb 4-1: default language 0x0409
[ 1650.115538] usb 4-1: udev 2, busnum 4, minor = 385
[ 1650.115541] usb 4-1: New USB device found, idVendor=2900,
idProduct=8383, bcdDevice= 1.0a
[ 1650.115544] usb 4-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 1650.115545] usb 4-1: Product: 4-Port USB 3.0 Hub
[ 1650.115547] usb 4-1: Manufacturer: Generic
[ 1650.115671] usb 4-1: usb_probe_device
[ 1650.115674] usb 4-1: configuration #1 chosen from 1 choice
[ 1650.117676] usb 4-1: adding 4-1:1.0 (config #1, interface 0)
[ 1650.118074] hub 4-1:1.0: usb_probe_interface
[ 1650.118077] hub 4-1:1.0: usb_probe_interface - got id
[ 1650.118079] hub 4-1:1.0: USB hub found
[ 1650.118363] hub 4-1:1.0: 4 ports detected
[ 1650.118366] hub 4-1:1.0: standalone hub
[ 1650.118367] hub 4-1:1.0: individual port power switching
[ 1650.118369] hub 4-1:1.0: individual port over-current protection
[ 1650.118370] hub 4-1:1.0: TT requires at most 8 FS bit times (666 ns)
[ 1650.118371] hub 4-1:1.0: power on to power good time: 0ms
[ 1650.118726] hub 4-1:1.0: local power source is good
[ 1650.119146] hub 4-1:1.0: enabling power on all ports
[ 1650.218352] usb 4-1-port1: status 0203 change 0010
[ 1650.320829] hub 4-1:1.0: state 7 ports 4 chg 0002 evt 0000
[ 1650.321083] usb 4-1-port1: status 0203, change 0000, 10.0 Gb/s
[ 1650.399044] usb 4-1.1: new SuperSpeed Gen 1 USB device number 3
using xhci_hcd
[ 1650.420852] usb 4-1.1: skipped 1 descriptor after endpoint
[ 1650.421057] usb 4-1.1: default language 0x0409
[ 1650.421640] usb 4-1.1: udev 3, busnum 4, minor = 386
[ 1650.421653] usb 4-1.1: New USB device found, idVendor=05e3,
idProduct=0626, bcdDevice= 6.55
[ 1650.421663] usb 4-1.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[ 1650.421669] usb 4-1.1: Product: USB3.1 Hub
[ 1650.421675] usb 4-1.1: Manufacturer: GenesysLogic
[ 1650.421967] usb 4-1.1: usb_probe_device
[ 1650.421976] usb 4-1.1: configuration #1 chosen from 1 choice
[ 1650.428742] usb 4-1.1: adding 4-1.1:1.0 (config #1, interface 0)
[ 1650.429155] hub 4-1.1:1.0: usb_probe_interface
[ 1650.429164] hub 4-1.1:1.0: usb_probe_interface - got id
[ 1650.429173] hub 4-1.1:1.0: USB hub found
[ 1650.429472] hub 4-1.1:1.0: 4 ports detected
[ 1650.429480] hub 4-1.1:1.0: standalone hub
[ 1650.429485] hub 4-1.1:1.0: ganged power switching
[ 1650.429490] hub 4-1.1:1.0: global over-current protection
[ 1650.429495] hub 4-1.1:1.0: TT requires at most 8 FS bit times (666 ns)
[ 1650.429502] hub 4-1.1:1.0: power on to power good time: 100ms
[ 1650.429783] hub 4-1.1:1.0: local power source is good
[ 1650.429790] hub 4-1.1:1.0: no over-current condition exists
[ 1650.430382] hub 4-1.1:1.0: enabling power on all ports
[ 1650.431183] hub 4-1:1.0: state 7 ports 4 chg 0000 evt 0002
[ 1650.533758] usb 4-1.1-port3: status 0203 change 0010
[ 1650.534442] usb 4-1.1-port4: status 0203 change 0010
[ 1650.635120] hub 4-1.1:1.0: state 7 ports 4 chg 0018 evt 0000
[ 1650.635494] usb 4-1.1-port3: status 0203, change 0000, 5.0 Gb/s
[ 1650.713912] usb 4-1.1.3: new SuperSpeed Gen 1 USB device number 4
using xhci_hcd
[ 1650.733977] usb 4-1.1.3: USB quirks for this device: 400
[ 1650.734836] usb 4-1.1.3: skipped 1 descriptor after endpoint
[ 1650.734850] usb 4-1.1.3: skipped 1 descriptor after endpoint
[ 1650.734857] usb 4-1.1.3: skipped 1 descriptor after endpoint
[ 1650.735108] usb 4-1.1.3: skipped 3 descriptors after interface
[ 1650.735114] usb 4-1.1.3: skipped 1 descriptor after endpoint
[ 1650.735120] usb 4-1.1.3: skipped 1 descriptor after endpoint
[ 1650.735125] usb 4-1.1.3: skipped 1 descriptor after endpoint
[ 1650.735248] usb 4-1.1.3: default language 0x0409
[ 1650.735589] usb 4-1.1.3: udev 4, busnum 4, minor = 387
[ 1650.735597] usb 4-1.1.3: New USB device found, idVendor=0bda,
idProduct=8153, bcdDevice=30.00
[ 1650.735606] usb 4-1.1.3: New USB device strings: Mfr=1, Product=2,
SerialNumber=6
[ 1650.735612] usb 4-1.1.3: Product: USB 10/100/1000 LAN
[ 1650.735617] usb 4-1.1.3: Manufacturer: Realtek
[ 1650.735622] usb 4-1.1.3: SerialNumber: 000001
[ 1650.735933] usb 4-1.1.3: usb_probe_device
[ 1650.735950] usb 4-1.1.3: configuration #2 chosen from 2 choices
[ 1650.737361] usb 4-1.1.3: adding 4-1.1.3:2.0 (config #2, interface 0)
[ 1650.737620] r8152 4-1.1.3:2.0: usb_probe_interface
[ 1650.737637] r8152 4-1.1.3:2.0: usb_probe_interface - got id
[ 1650.737744] cdc_ether 4-1.1.3:2.0: usb_probe_interface
[ 1650.737755] cdc_ether 4-1.1.3:2.0: usb_probe_interface - got id
[ 1650.737780] r8153_ecm 4-1.1.3:2.0: usb_probe_interface
[ 1650.737789] r8153_ecm 4-1.1.3:2.0: usb_probe_interface - got id
[ 1650.737991] usb 4-1.1.3: adding 4-1.1.3:2.1 (config #2, interface 1)
[ 1650.738319] usb 4-1.1.3: unregistering interface 4-1.1.3:2.0
[ 1650.738451] usb 4-1.1.3: unregistering interface 4-1.1.3:2.1
[ 1650.738589] usb 4-1.1-port4: status 0203, change 0000, 5.0 Gb/s
[ 1650.738666] usb 4-1.1.3: usb_disable_device nuking non-ep0 URBs
[ 1650.741361] usb 4-1.1.3: adding 4-1.1.3:1.0 (config #1, interface 0)
[ 1650.741541] r8152 4-1.1.3:1.0: usb_probe_interface
[ 1650.741565] r8152 4-1.1.3:1.0: usb_probe_interface - got id
[ 1650.816117] usb 4-1.1.4: new SuperSpeed Gen 1 USB device number 5
using xhci_hcd
[ 1650.836949] usb 4-1.1.4: skipped 1 descriptor after endpoint
[ 1650.836959] usb 4-1.1.4: skipped 1 descriptor after endpoint
[ 1650.837058] usb 4-1.1.4: default language 0x0409
[ 1650.837660] usb 4-1.1.4: udev 5, busnum 4, minor = 388
[ 1650.837665] usb 4-1.1.4: New USB device found, idVendor=058f,
idProduct=8468, bcdDevice= 1.00
[ 1650.837669] usb 4-1.1.4: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[ 1650.837672] usb 4-1.1.4: Product: Mass Storage Device
[ 1650.837675] usb 4-1.1.4: Manufacturer: Generic
[ 1650.837677] usb 4-1.1.4: SerialNumber: 058F84688461
[ 1650.837905] usb 4-1.1.4: usb_probe_device
[ 1650.837913] usb 4-1.1.4: configuration #1 chosen from 1 choice
[ 1650.840156] usb 4-1.1.4: adding 4-1.1.4:1.0 (config #1, interface 0)
[ 1650.840229] usb-storage 4-1.1.4:1.0: usb_probe_interface
[ 1650.840239] usb-storage 4-1.1.4:1.0: usb_probe_interface - got id
[ 1650.840252] usb-storage 4-1.1.4:1.0: USB Mass Storage device detected
[ 1650.840589] scsi host4: usb-storage 4-1.1.4:1.0
[ 1650.840906] hub 4-1.1:1.0: state 7 ports 4 chg 0000 evt 0010
[ 1650.844166] hub 4-1.1:1.0: state 7 ports 4 chg 0000 evt 0008
[ 1650.922789] usb 4-1.1.3: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd
[ 1650.946539] usb 4-1.1.3: USB quirks for this device: 400
[ 1650.980894] r8152 4-1.1.3:1.0: load rtl8153a-4 v2 02/07/20 successfully
[ 1651.009527] r8152 4-1.1.3:1.0 eth0: v1.11.11
[ 1651.070832] r8152 4-1.1.3:1.0 enx00e04cb5877c: renamed from eth0
[ 1651.829771] scsi 4:0:0:0: Direct-Access     Generic- SD/MMC
  1.00 PQ: 0 ANSI: 6
[ 1651.830537] scsi 4:0:0:1: Direct-Access     Generic- Micro SD/M2
  1.08 PQ: 0 ANSI: 6
[ 1651.831209] sd 4:0:0:0: Attached scsi generic sg0 type 0
[ 1651.831943] sd 4:0:0:1: Attached scsi generic sg1 type 0
[ 1651.853289] sd 4:0:0:0: [sda] Attached SCSI removable disk
[ 1651.861143] sd 4:0:0:1: [sdb] Attached SCSI removable disk
[ 1654.173190] IPv6: ADDRCONF(NETDEV_CHANGE): enx00e04cb5877c: link
becomes ready
[ 1654.173604] r8152 4-1.1.3:1.0 enx00e04cb5877c: carrier on
[ 1654.720505] snd_hda_intel 0000:00:1f.3: Unstable LPIB (363076 >=
192000); disabling LPIB delay counting
[ 1654.766006] pci_bus 0000:03: Allocating resources
[ 1654.766030] pcieport 0000:03:02.0: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 38] add_size 200000
add_align 100000
[ 1654.766036] pcieport 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[ 1654.766038] pcieport 0000:03:02.0: BAR 15: failed to assign [mem
size 0x00200000 64bit pref]
[ 1654.766041] pcieport 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[ 1654.766042] pcieport 0000:03:02.0: BAR 15: failed to assign [mem
size 0x00200000 64bit pref]
[ 1662.603778] hub 1-0:1.0: state 7 ports 16 chg 0000 evt 0004
[ 1662.603840] usb usb1-port2: status 0100, change 0001, 12 Mb/s
[ 1662.603855] usb 1-2: USB disconnect, device number 10
[ 1662.603862] usb 1-2.1: USB disconnect, device number 11
[ 1662.603868] usb 1-2.1: unregistering device
[ 1662.603873] usb 1-2.1: unregistering interface 1-2.1:1.0
[ 1662.604170] usb 1-2.1: usb_disable_device nuking all URBs
[ 1662.605298] usb 1-2.5: USB disconnect, device number 12
[ 1662.605314] usb 1-2.5: unregistering device
[ 1662.605323] usb 1-2.5: unregistering interface 1-2.5:1.0
[ 1662.605421] usb 1-2.5: usb_disable_device nuking all URBs
[ 1662.605847] usb 1-2: unregistering device
[ 1662.605880] usb 1-2: unregistering interface 1-2:1.0
[ 1662.606004] xhci_hcd 0000:00:14.0: shutdown urb ffff9be3848e8d80 ep1in-intr
[ 1662.606388] usb 1-2: usb_disable_device nuking all URBs
[ 1662.611722] hub 4-0:1.0: state 7 ports 2 chg 0000 evt 0002
[ 1662.611741] usb usb4-port1: link state change
[ 1662.611749] usb usb4-port1: do warm reset
[ 1662.620564] usb usb3: usb wakeup-resume
[ 1662.620570] usb usb3: usb auto-resume
[ 1662.620585] hub 3-0:1.0: hub_resume
[ 1662.620607] hub 3-0:1.0: state 7 ports 2 chg 0002 evt 0000
[ 1662.620637] usb usb3-port1: over-current change #1
[ 1662.668681] usb usb4-port1: not warm reset yet, waiting 50ms
[ 1662.671688] r8152 4-1.1.3:1.0 enx00e04cb5877c: Stop submitting
intr, status -71
[ 1662.724578] hub 3-0:1.0: trying to enable port power on non-switchable hub
[ 1662.728662] usb usb4-port1: not warm reset yet, waiting 200ms
[ 1662.748411] usb usb1-port2: debounce total 100ms stable 100ms status 0x100
[ 1662.748458] hub 1-0:1.0: hub_suspend
[ 1662.748479] usb usb1: bus auto-suspend, wakeup 1
[ 1662.832221] usb usb3-port1: over-current condition
[ 1662.832237] usb usb3-port1: status 0008, change 0008, 12 Mb/s
[ 1662.832262] hub 3-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 1662.832277] hub 3-0:1.0: hub_suspend
[ 1662.832297] usb usb3: bus auto-suspend, wakeup 1
[ 1662.832307] usb usb3: bus suspend fail, err -16
[ 1662.832313] hub 3-0:1.0: hub_resume
[ 1662.832344] hub 3-0:1.0: state 7 ports 2 chg 0002 evt 0000
[ 1662.832363] usb usb3-port1: status 0008, change 0000, 12 Mb/s
[ 1662.832375] hub 3-0:1.0: hub_suspend
[ 1662.832388] usb usb3: bus auto-suspend, wakeup 1
[ 1662.832397] usb usb3: bus suspend fail, err -16
[ 1662.832402] hub 3-0:1.0: hub_resume
[ 1662.832433] hub 3-0:1.0: state 7 ports 2 chg 0002 evt 0000
[ 1662.832453] usb usb3-port1: status 0008, change 0000, 12 Mb/s
[ 1662.832463] hub 3-0:1.0: hub_suspend
[ 1662.832479] usb usb3: bus auto-suspend, wakeup 1
[ 1662.832487] usb usb3: bus suspend fail, err -16
[ 1662.832492] hub 3-0:1.0: hub_resume
[ 1662.832524] hub 3-0:1.0: state 7 ports 2 chg 0002 evt 0000
[ 1662.832542] usb usb3-port1: status 0008, change 0000, 12 Mb/s
[ 1662.832552] hub 3-0:1.0: hub_suspend
[ 1662.832564] usb usb3: bus auto-suspend, wakeup 1
[ 1662.832573] usb usb3: bus suspend fail, err -16
[ 1662.832578] hub 3-0:1.0: hub_resume
[ 1662.832611] hub 3-0:1.0: state 7 ports 2 chg 0002 evt 0000
[ 1662.832631] usb usb3-port1: status 0008, change 0000, 12 Mb/s

The log around hub_suspend and hub_resume repeats from this point on.
I only showed the first several repetitions.

Thanks
Yiyu Zhu

On Fri, Feb 19, 2021 at 1:43 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> Hi Yiyu Zhu
>
> On 17.2.2021 10.50, Yiyu Zhu wrote:
> > Hi Mathias,
> >
> > Hi
> >
> >>
> >> Could you add usbcore dynamic debug, it should show more details about hub activity.
> >>
> >> mount -t debugfs none /sys/kernel/debug
> >> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> >>
> > Here are the dmesg after I enabled dynamic debug.
> >
>
> ...
>
> > (at hub disconnection)
> > [18848.819858] [drm] PCIE GART of 256M enabled (table at 0x000000F400000000).
> > [18848.999416] [drm] UVD and UVD ENC initialized successfully.
> > [18849.100370] [drm] VCE initialized successfully.
> > [18946.839352] usb 1-3: USB disconnect, device number 8
> > [18946.839373] usb 1-3.1: USB disconnect, device number 9
> > [18946.840644] usb 1-3.5: USB disconnect, device number 10
> > [18946.890865] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -71
> > [18946.916623] r8152 4-2.1.3:1.0 enx00e04cb5877c: Stop submitting
> > intr, status -71
> > [18947.068201] usb usb3-port2: over-current condition
> > [18947.604290] usb 4-2: USB disconnect, device number 2
> > [18947.604307] usb 4-2.1: USB disconnect, device number 3
> > [18947.604315] usb 4-2.1.3: USB disconnect, device number 4
> > [18947.604721] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -108
> > [18947.604748] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -108
> > [18947.604756] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -108
> > [18947.604763] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -108
> > [18947.685529] usb 4-2.1.4: USB disconnect, device number 5
> > [18948.304163] usb usb4-port2: over-current condition
> >
>
> Hmm, I think something went wrong when enabling usbcore dynamic degug.
> I was expecting more hub messages.
> Is CONFIG_DYNAMIC_DEBUG set?
> Is this a snippet from console or dmesg? maybe some issues with log level
> (/proc/sys/kernel/printk)?
>
> The other cpu hogging worker was related to pm, maybe adding initcall_debug
> boot option to the kernel cmdline could reveal something.
>
> >>
> >> hub reports overcurrent condition, worth keeping in mind.
> >>
> > This condition can actually persist through reboot. Which causes the
> > kworker to spawn immediately after boot.
> >
> >>
> >> Is this xHC contoller in a Alpine Ridge/Titan Ridge/Maple Ridge based system
> >> that has runtime PM enabled by default, and whole xHC controller
> >> disappears from PCI bus when last device is disconnected?
> >> (check with lspci -nn)
> >>
> > It is an Alpine Ridge controller. Here is the `lspci -nn` output
> >
> > 00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen
> > Core Processor Host Bridge/DRAM Registers [8086:5910] (rev 05)
> > 00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v5/E3-1500
> > v5/6th Gen Core Processor PCIe Controller (x16) [8086:1901] (rev 05)
> > 00:02.0 VGA compatible controller [0300]: Intel Corporation Device
> > [8086:591b] (rev 04)
> > 00:04.0 Signal processing controller [1180]: Intel Corporation Xeon
> > E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem
> > [8086:1903] (rev 05)
> > 00:13.0 Non-VGA unclassified device [0000]: Intel Corporation 100
> > Series/C230 Series Chipset Family Integrated Sensor Hub [8086:a135]
> > (rev 31)
> > 00:14.0 USB controller [0c03]: Intel Corporation 100 Series/C230
> > Series Chipset Family USB 3.0 xHCI Controller [8086:a12f] (rev 31)
> > 00:14.2 Signal processing controller [1180]: Intel Corporation 100
> > Series/C230 Series Chipset Family Thermal Subsystem [8086:a131] (rev
> > 31)
> > 00:15.0 Signal processing controller [1180]: Intel Corporation 100
> > Series/C230 Series Chipset Family Serial IO I2C Controller #0
> > [8086:a160] (rev 31)
> > 00:16.0 Communication controller [0780]: Intel Corporation 100
> > Series/C230 Series Chipset Family MEI Controller #1 [8086:a13a] (rev
> > 31)
> > 00:17.0 SATA controller [0106]: Intel Corporation HM170/QM170 Chipset
> > SATA Controller [AHCI Mode] [8086:a103] (rev 31)
> > 00:1c.0 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series
> > Chipset Family PCI Express Root Port #1 [8086:a110] (rev f1)
> > 00:1c.4 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series
> > Chipset Family PCI Express Root Port #5 [8086:a114] (rev f1)
> > 00:1c.5 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series
> > Chipset Family PCI Express Root Port #6 [8086:a115] (rev f1)
> > 00:1d.0 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series
> > Chipset Family PCI Express Root Port #9 [8086:a118] (rev f1)
> > 00:1e.0 Signal processing controller [1180]: Intel Corporation 100
> > Series/C230 Series Chipset Family Serial IO UART #0 [8086:a127] (rev
> > 31)
> > 00:1e.2 Signal processing controller [1180]: Intel Corporation 100
> > Series/C230 Series Chipset Family Serial IO GSPI #0 [8086:a129] (rev
> > 31)
> > 00:1f.0 ISA bridge [0601]: Intel Corporation HM175 Chipset LPC/eSPI
> > Controller [8086:a152] (rev 31)
> > 00:1f.2 Memory controller [0580]: Intel Corporation 100 Series/C230
> > Series Chipset Family Power Management Controller [8086:a121] (rev 31)
> > 00:1f.3 Audio device [0403]: Intel Corporation CM238 HD Audio
> > Controller [8086:a171] (rev 31)
> > 00:1f.4 SMBus [0c05]: Intel Corporation 100 Series/C230 Series Chipset
> > Family SMBus [8086:a123] (rev 31)
> > 01:00.0 Display controller [0380]: Advanced Micro Devices, Inc.
> > [AMD/ATI] Polaris 22 [Radeon RX Vega M GL] [1002:694e] (rev c0)
> > 02:00.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> > Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> > 03:00.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> > Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> > 03:01.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> > Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> > 03:02.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> > Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> > 03:04.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> > Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> > 38:00.0 USB controller [0c03]: Intel Corporation JHL6540 Thunderbolt 3
> > USB Controller (C step) [Alpine Ridge 4C 2016] [8086:15d4] (rev 02)
> > 6d:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd.
> > RTS525A PCI Express Card Reader [10ec:525a] (rev 01)
> > 6e:00.0 Network controller [0280]: Intel Corporation Wireless 8265 /
> > 8275 [8086:24fd] (rev 78)
> > 6f:00.0 Non-Volatile memory controller [0108]: Sandisk Corp Device [15b7:5002]
> >
> > One thing I notice is that when the hub is disconnected, the USB
> > controller is still there.
> > It will remain there until I plug and unplug another device. After
> > that, the following section will be gone.
> >
> > 02:00.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> > Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> > 03:00.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> > Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> > 03:01.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> > Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> > 03:02.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> > Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> > 03:04.0 PCI bridge [0604]: Intel Corporation JHL6540 Thunderbolt 3
> > Bridge (C step) [Alpine Ridge 4C 2016] [8086:15d3] (rev 02)
> > 38:00.0 USB controller [0c03]: Intel Corporation JHL6540 Thunderbolt 3
> > USB Controller (C step) [Alpine Ridge 4C 2016] [8086:15d4] (rev 02)
> >
> >> Does it help if another USB device is connected to a different
> >> roothub port of this xHC while disconnecting the hub?
> >> Or does just disabling runtime PM for this xhci help?
> >>
> > I tried with another usb device on the root hub port. But it does not help.
> > I am not sure about how to disable runtime PM. I tried to use `echo on
> >> .../0000:38:00.0/power/control` (its value was auto). But it also
> > does not help.
> >
> > Thanks
> > Yiyu Zhu
> >
>
> Ok, thanks for the info
> -Mathias

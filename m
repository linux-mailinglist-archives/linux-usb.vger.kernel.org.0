Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A5E31959C
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 23:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhBKWMJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Feb 2021 17:12:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhBKWMI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Feb 2021 17:12:08 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2540AC061756
        for <linux-usb@vger.kernel.org>; Thu, 11 Feb 2021 14:11:28 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id f17so3650303qkl.5
        for <linux-usb@vger.kernel.org>; Thu, 11 Feb 2021 14:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C8ZtEPrCWk19aBu/lnHkh1txD2dhF/QPJIzfsVRn57o=;
        b=pbQYBXofcNPX6reTishC4SFy/3Pud5qW+b7W1TgMUUcNy/31MVHDy+2iLpgOnZV62P
         yH7G0hk30VHrpJetrklJI54unStgNqKQqbstr+lGYu6Sy4xdTKGxQzHjxHaygig14/SD
         /6j+y1XrZlZfE64Nc6w1CvLXZ+yMUtmWTdctQITIdB8ND0NKGXbro9C2zsbMTgHmE5lT
         sLjnn2yduRbusWdsKAcfXcHtCRSDtQ2OS3K5w5DkH3yeFHlqb06zdYI+JHtCBUc8C/1e
         /NG3gfVGymUEE9cD7KPmvDu68BEiW23nJ2BTddO1be4FpKICuZy2EmkVAzcmkS1a04j6
         TFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C8ZtEPrCWk19aBu/lnHkh1txD2dhF/QPJIzfsVRn57o=;
        b=b+/UlC5/Gr9DtitrS0+sWpb7jJ0ulbdGucw0OaOgMg2rV867PS7FN8yOXNOZQUtk8y
         ofFja87HPBXwWuNHqtZNKQsMaojfNACSTs2li1akjhSeAoxmM7T4iJ+JP+A2AJ8/X94Q
         mlMbSoifrmh13gT2HyMR5aMQ0Fyw7rSkEKTVQZshJhWMm1WlFPuR4GRmmkLJXBq9Q4de
         jyY7a8D9oLJgpSE9kiD54Y/ULyUkc/85JkER3vIdcnyC6MnYw1St8OKiDIPaOAYuPonN
         7inp/BDaF5UWKm2upmzwZbSnn25e3gdpKWpQ93JunWseyyNCjKbeFACV85gGI+Mw2JGF
         rkKw==
X-Gm-Message-State: AOAM532/bzifVcDxxAZCXMxlHjqfrZVTA7ltgJRCLlaWhG6WEzP2XeVm
        Lmkg7MWsfP8fwWrn67RHuqdJ78qtm1rT2M/Cf1o=
X-Google-Smtp-Source: ABdhPJyX2bXkJjJRj0d764uZnZKqToMjAn9yz586z6lXfiRl6/3TfdDY5ZmXXIUG396i3TOXyheGDgekXItVak5gd+M=
X-Received: by 2002:a37:9ace:: with SMTP id c197mr9052719qke.276.1613081487311;
 Thu, 11 Feb 2021 14:11:27 -0800 (PST)
MIME-Version: 1.0
References: <CAGv7gkgb12vGPvZcSE0aVOpu32zSgxaayYreLvWs+vJc5EkQrA@mail.gmail.com>
 <YCTS9I5xTVBDvwax@kroah.com> <CAGv7gkjoNt9gx_VPfEj=tauKAOcnOd+-2pCXyCoR=GPcHj7jxw@mail.gmail.com>
 <YCUI0h7qkY2PuJcT@kroah.com>
In-Reply-To: <YCUI0h7qkY2PuJcT@kroah.com>
From:   Yiyu Zhu <danielzeltar@gmail.com>
Date:   Thu, 11 Feb 2021 14:11:16 -0800
Message-ID: <CAGv7gki7J1NVX3ti6Qhe9AFLp0JYRTRsT35zpDBTxxQ=te7-sQ@mail.gmail.com>
Subject: Re: kworker takes 100% core after unplugging usb c hub
To:     Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I was trying to unplug the hub manually so that I can trigger this
issue. The kworker only shows up when the hub is actually
disconnected. They will be gone if any thing is connected back into
the port.

The hub works normally when it is connected. And no additional dmesg is printed.

On Thu, Feb 11, 2021 at 2:37 AM Greg KH <greg@kroah.com> wrote:
>
> On Thu, Feb 11, 2021 at 02:10:53AM -0800, Yiyu Zhu wrote:
> > Hi Greg,
> >
> > I just updated the kernel to 5.10.15-051015-generic. (It is the
> > ubuntu's mainline build. I am not sure if that matters.)
> >
> > The issue is still there but with a slightly different behavior. There
> > is still high cpu usage but the two kworkers seem to take turns.
> >
> > 01:18:49 AM     0       117    0.00   87.00    0.00   13.00   87.00
> >  2  kworker/2:1+usb_hub_wq
> > 01:18:50 AM     0       117    0.00   87.00    0.00   12.00   87.00
> >  2  kworker/2:1+pm
> >
> > The trace is now filled with:
> >
> >      kworker/2:1-117     [002] d...   450.048063:
> > workqueue_queue_work: work struct=00000000573429cf function=hub_event
> > workqueue=000000007b72f8bb req_cpu=8192 cpu=2
> >      kworker/2:1-117     [002] d...   450.048097:
> > workqueue_queue_work: work struct=000000005facda71 function=hub_event
> > workqueue=000000007b72f8bb req_cpu=8192 cpu=2
> >      kworker/2:1-117     [002] d...   450.048104:
> > workqueue_queue_work: work struct=0000000053de14fd
> > function=pm_runtime_work workqueue=00000000a24828a0 req_cpu=8192 cpu=2
> >      kworker/2:1-117     [002] d...   450.048110:
> > workqueue_queue_work: work struct=00000000ffe78fd2
> > function=pm_runtime_work workqueue=00000000a24828a0 req_cpu=8192 cpu=2
> >      kworker/2:1-117     [002] d...   450.048123:
> > workqueue_queue_work: work struct=00000000573429cf function=hub_event
> > workqueue=000000007b72f8bb req_cpu=8192 cpu=2
> >      kworker/2:1-117     [002] d...   450.048157:
> > workqueue_queue_work: work struct=000000005facda71 function=hub_event
> > workqueue=000000007b72f8bb req_cpu=8192 cpu=2
> >      kworker/2:1-117     [002] d...   450.048162:
> > workqueue_queue_work: work struct=0000000053de14fd
> > function=pm_runtime_work workqueue=00000000a24828a0 req_cpu=8192 cpu=2
> >      kworker/2:1-117     [002] d...   450.048166:
> > workqueue_queue_work: work struct=00000000ffe78fd2
> > function=pm_runtime_work workqueue=00000000a24828a0 req_cpu=8192 cpu=2
> >
> > The dmesg is similar:
> >
> > [ 2798.450977] usb 1-3: USB disconnect, device number 25
> > [ 2798.450984] usb 1-3.1: USB disconnect, device number 26
> > [ 2798.452218] usb 1-3.5: USB disconnect, device number 27
> > [ 2798.521539] r8152 4-2.1.3:1.0 enx00e04cb5877c: Stop submitting
> > intr, status -71
> > [ 2798.587510] usb 4-2.1.4: Failed to set U1 timeout to 0x0,error code -71
> > [ 2798.594506] usb 4-2.1.4: Set SEL for device-initiated U1 failed.
> > [ 2798.601497] usb 4-2.1.4: Set SEL for device-initiated U2 failed.
> > [ 2798.601504] usb 4-2.1.4: usb_reset_and_verify_device Failed to disable LPM
> > [ 2798.677498] usb usb3-port2: over-current condition
> > [ 2799.209385] usb 4-2: USB disconnect, device number 2
> > [ 2799.209392] usb 4-2.1: USB disconnect, device number 3
> > [ 2799.209396] usb 4-2.1.3: USB disconnect, device number 4
> > [ 2799.302548] usb 4-2.1.4: USB disconnect, device number 5
> > [ 2799.633505] usb 4-2.1-port4: cannot disable (err = -110)
> > [ 2800.181325] usb usb4-port2: over-current condition
> > [ 2818.993944] xhci_hcd 0000:38:00.0: xHCI host controller not
> > responding, assume dead
> > [ 2818.993956] xhci_hcd 0000:38:00.0: HC died; cleaning up
> > [ 2819.126421] xhci_hcd 0000:38:00.0: remove, state 1
> > [ 2819.126431] usb usb4: USB disconnect, device number 1
> > [ 2819.154189] xhci_hcd 0000:38:00.0: USB bus 4 deregistered
> > [ 2819.154206] xhci_hcd 0000:38:00.0: remove, state 1
> > [ 2819.154211] usb usb3: USB disconnect, device number 1
> > [ 2819.154684] xhci_hcd 0000:38:00.0: Host halt failed, -19
> > [ 2819.154689] xhci_hcd 0000:38:00.0: Host not accessible, reset failed.
> > [ 2819.154900] xhci_hcd 0000:38:00.0: USB bus 3 deregistered
> > [ 2819.156059] pcieport 0000:03:00.0: can't change power state from
> > D3cold to D0 (config space inaccessible)
> > [ 2819.156709] pci_bus 0000:04: busn_res: [bus 04] is released
> > [ 2819.156776] pci_bus 0000:05: busn_res: [bus 05-37] is released
> > [ 2819.169419] pci_bus 0000:38: busn_res: [bus 38] is released
> > [ 2819.169491] pci_bus 0000:39: busn_res: [bus 39-6c] is released
> > [ 2819.169533] pci_bus 0000:03: busn_res: [bus 03-6c] is released
> > [ 2820.557517] usb 1-3: new high-speed USB device number 28 using xhci_hcd
> > [ 2820.708869] usb 1-3: New USB device found, idVendor=291a,
> > idProduct=5423, bcdDevice= 1.0a
> > [ 2820.708874] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > [ 2820.708876] usb 1-3: Product: 4-Port USB 2.0 Hub
> > [ 2820.708878] usb 1-3: Manufacturer: Generic
> > [ 2820.710578] hub 1-3:1.0: USB hub found
> > [ 2820.710816] hub 1-3:1.0: 5 ports detected
> > [ 2821.001436] usb 1-3.1: new high-speed USB device number 29 using xhci_hcd
> > [ 2821.104284] usb 1-3.1: New USB device found, idVendor=05e3,
> > idProduct=0610, bcdDevice= 6.55
> > [ 2821.104290] usb 1-3.1: New USB device strings: Mfr=1, Product=2,
> > SerialNumber=0
> > [ 2821.104294] usb 1-3.1: Product: USB2.1 Hub
> > [ 2821.104296] usb 1-3.1: Manufacturer: GenesysLogic
> > [ 2821.108236] hub 1-3.1:1.0: USB hub found
> > [ 2821.108521] hub 1-3.1:1.0: 4 ports detected
> > [ 2821.637686] hp_wmi: Unknown event_id - 131073 - 0x0
> > [ 2821.693397] usb 1-3.5: new high-speed USB device number 30 using xhci_hcd
> > [ 2821.796169] usb 1-3.5: New USB device found, idVendor=0bda,
> > idProduct=5450, bcdDevice= 1.01
> > [ 2821.796176] usb 1-3.5: New USB device strings: Mfr=1, Product=2,
> > SerialNumber=0
> > [ 2821.796179] usb 1-3.5: Product: BillBoard Device
> > [ 2821.796182] usb 1-3.5: Manufacturer: Realtek
> > [ 2822.157917] hp_wmi: Unknown event_id - 131073 - 0x0
> > [ 2829.665791] pci 0000:02:00.0: [8086:15d3] type 01 class 0x060400
> > [ 2829.665874] pci 0000:02:00.0: enabling Extended Tags
> > [ 2829.666011] pci 0000:02:00.0: supports D1 D2
> > [ 2829.666012] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> > [ 2829.666391] pci 0000:03:00.0: [8086:15d3] type 01 class 0x060400
> > [ 2829.666458] pci 0000:03:00.0: enabling Extended Tags
> > [ 2829.666613] pci 0000:03:00.0: supports D1 D2
> > [ 2829.666613] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> > [ 2829.666806] pci 0000:03:01.0: [8086:15d3] type 01 class 0x060400
> > [ 2829.666875] pci 0000:03:01.0: enabling Extended Tags
> > [ 2829.667024] pci 0000:03:01.0: supports D1 D2
> > [ 2829.667025] pci 0000:03:01.0: PME# supported from D0 D1 D2 D3hot D3cold
> > [ 2829.667211] pci 0000:03:02.0: [8086:15d3] type 01 class 0x060400
> > [ 2829.667295] pci 0000:03:02.0: enabling Extended Tags
> > [ 2829.667422] pci 0000:03:02.0: supports D1 D2
> > [ 2829.667423] pci 0000:03:02.0: PME# supported from D0 D1 D2 D3hot D3cold
> > [ 2829.667655] pci 0000:03:04.0: [8086:15d3] type 01 class 0x060400
> > [ 2829.667722] pci 0000:03:04.0: enabling Extended Tags
> > [ 2829.667868] pci 0000:03:04.0: supports D1 D2
> > [ 2829.667869] pci 0000:03:04.0: PME# supported from D0 D1 D2 D3hot D3cold
> > [ 2829.668067] pci 0000:02:00.0: PCI bridge to [bus 03-6c]
> > [ 2829.668078] pci 0000:02:00.0:   bridge window [mem 0xb0000000-0xde0fffff]
> > [ 2829.668108] pci 0000:02:00.0:   bridge window [mem
> > 0x2f90000000-0x2fd9ffffff 64bit pref]
> > [ 2829.668156] pci 0000:03:00.0: PCI bridge to [bus 04]
> > [ 2829.668184] pci 0000:03:00.0:   bridge window [mem 0xde000000-0xde0fffff]
> > [ 2829.668241] pci 0000:03:01.0: PCI bridge to [bus 05-37]
> > [ 2829.668251] pci 0000:03:01.0:   bridge window [mem 0xb0000000-0xc7efffff]
> > [ 2829.668258] pci 0000:03:01.0:   bridge window [mem
> > 0x2f90000000-0x2fafffffff 64bit pref]
> > [ 2829.668352] pci 0000:38:00.0: [8086:15d4] type 00 class 0x0c0330
> > [ 2829.668372] pci 0000:38:00.0: reg 0x10: [mem 0xc7f00000-0xc7f0ffff]
> > [ 2829.668444] pci 0000:38:00.0: enabling Extended Tags
> > [ 2829.668578] pci 0000:38:00.0: supports D1 D2
> > [ 2829.668579] pci 0000:38:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> > [ 2829.668699] pci 0000:38:00.0: 8.000 Gb/s available PCIe bandwidth,
> > limited by 2.5 GT/s PCIe x4 link at 0000:03:02.0 (capable of 31
> > .504 Gb/s with 8.0 GT/s PCIe x4 link)
> > [ 2829.668804] pci 0000:03:02.0: PCI bridge to [bus 38]
> > [ 2829.668815] pci 0000:03:02.0:   bridge window [mem 0xc7f00000-0xc7ffffff]
> > [ 2829.668874] pci 0000:03:04.0: PCI bridge to [bus 39-6c]
> > [ 2829.668884] pci 0000:03:04.0:   bridge window [mem 0xc8000000-0xddffffff]
> > [ 2829.668891] pci 0000:03:04.0:   bridge window [mem
> > 0x2fb0000000-0x2fd9ffffff 64bit pref]
> > [ 2829.668925] pci_bus 0000:03: Allocating resources
> > [ 2829.668942] pci 0000:03:01.0: bridge window [io  0x1000-0x0fff] to
> > [bus 05-37] add_size 1000
> > [ 2829.668943] pci 0000:03:02.0: bridge window [io  0x1000-0x0fff] to
> > [bus 38] add_size 1000
> > [ 2829.668945] pci 0000:03:02.0: bridge window [mem
> > 0x00100000-0x000fffff 64bit pref] to [bus 38] add_size 200000
> > add_align 100000
> > [ 2829.668946] pci 0000:03:04.0: bridge window [io  0x1000-0x0fff] to
> > [bus 39-6c] add_size 1000
> > [ 2829.668947] pci 0000:02:00.0: bridge window [io  0x1000-0x0fff] to
> > [bus 03-6c] add_size 4000
> > [ 2829.668949] pci 0000:02:00.0: BAR 13: no space for [io  size 0x4000]
> > [ 2829.668950] pci 0000:02:00.0: BAR 13: failed to assign [io  size 0x4000]
> > [ 2829.668951] pci 0000:02:00.0: BAR 13: no space for [io  size 0x4000]
> > [ 2829.668952] pci 0000:02:00.0: BAR 13: failed to assign [io  size 0x4000]
> > [ 2829.668955] pci 0000:03:02.0: BAR 15: no space for [mem size
> > 0x00200000 64bit pref]
> > [ 2829.668955] pci 0000:03:02.0: BAR 15: failed to assign [mem size
> > 0x00200000 64bit pref]
> > [ 2829.668956] pci 0000:03:01.0: BAR 13: no space for [io  size 0x1000]
> > [ 2829.668957] pci 0000:03:01.0: BAR 13: failed to assign [io  size 0x1000]
> > [ 2829.668957] pci 0000:03:02.0: BAR 13: no space for [io  size 0x1000]
> > [ 2829.668958] pci 0000:03:02.0: BAR 13: failed to assign [io  size 0x1000]
> > [ 2829.668959] pci 0000:03:04.0: BAR 13: no space for [io  size 0x1000]
> > [ 2829.668960] pci 0000:03:04.0: BAR 13: failed to assign [io  size 0x1000]
> > [ 2829.668961] pci 0000:03:04.0: BAR 13: no space for [io  size 0x1000]
> > [ 2829.668961] pci 0000:03:04.0: BAR 13: failed to assign [io  size 0x1000]
> > [ 2829.668963] pci 0000:03:02.0: BAR 15: no space for [mem size
> > 0x00200000 64bit pref]
> > [ 2829.668963] pci 0000:03:02.0: BAR 15: failed to assign [mem size
> > 0x00200000 64bit pref]
> > [ 2829.668964] pci 0000:03:02.0: BAR 13: no space for [io  size 0x1000]
> > [ 2829.668965] pci 0000:03:02.0: BAR 13: failed to assign [io  size 0x1000]
> > [ 2829.668966] pci 0000:03:01.0: BAR 13: no space for [io  size 0x1000]
> > [ 2829.668966] pci 0000:03:01.0: BAR 13: failed to assign [io  size 0x1000]
> > [ 2829.668967] pci 0000:03:00.0: PCI bridge to [bus 04]
> > [ 2829.668973] pci 0000:03:00.0:   bridge window [mem 0xde000000-0xde0fffff]
> > [ 2829.668996] pci 0000:03:01.0: PCI bridge to [bus 05-37]
> > [ 2829.669001] pci 0000:03:01.0:   bridge window [mem 0xb0000000-0xc7efffff]
> > [ 2829.669005] pci 0000:03:01.0:   bridge window [mem
> > 0x2f90000000-0x2fafffffff 64bit pref]
> > [ 2829.669012] pci 0000:03:02.0: PCI bridge to [bus 38]
> > [ 2829.669017] pci 0000:03:02.0:   bridge window [mem 0xc7f00000-0xc7ffffff]
> > [ 2829.669026] pci 0000:03:04.0: PCI bridge to [bus 39-6c]
> > [ 2829.669031] pci 0000:03:04.0:   bridge window [mem 0xc8000000-0xddffffff]
> > [ 2829.669035] pci 0000:03:04.0:   bridge window [mem
> > 0x2fb0000000-0x2fd9ffffff 64bit pref]
> > [ 2829.669041] pci 0000:02:00.0: PCI bridge to [bus 03-6c]
> > [ 2829.669046] pci 0000:02:00.0:   bridge window [mem 0xb0000000-0xde0fffff]
> > [ 2829.669050] pci 0000:02:00.0:   bridge window [mem
> > 0x2f90000000-0x2fd9ffffff 64bit pref]
> > [ 2829.670507] xhci_hcd 0000:38:00.0: xHCI Host Controller
> > [ 2829.670512] xhci_hcd 0000:38:00.0: new USB bus registered, assigned
> > bus number 3
> > [ 2829.671664] xhci_hcd 0000:38:00.0: hcc params 0x200077c1 hci
> > version 0x110 quirks 0x0000000200009810
> > [ 2829.671920] usb usb3: New USB device found, idVendor=1d6b,
> > idProduct=0002, bcdDevice= 5.10
> > [ 2829.671922] usb usb3: New USB device strings: Mfr=3, Product=2,
> > SerialNumber=1
> > [ 2829.671923] usb usb3: Product: xHCI Host Controller
> > [ 2829.671924] usb usb3: Manufacturer: Linux 5.10.15-051015-generic xhci-hcd
> > [ 2829.671925] usb usb3: SerialNumber: 0000:38:00.0
> > [ 2829.672067] hub 3-0:1.0: USB hub found
> > [ 2829.672077] hub 3-0:1.0: 2 ports detected
> > [ 2829.672818] xhci_hcd 0000:38:00.0: xHCI Host Controller
> > [ 2829.672822] xhci_hcd 0000:38:00.0: new USB bus registered, assigned
> > bus number 4
> > [ 2829.672824] xhci_hcd 0000:38:00.0: Host supports USB 3.1 Enhanced SuperSpeed
> > [ 2829.672850] usb usb4: New USB device found, idVendor=1d6b,
> > idProduct=0003, bcdDevice= 5.10
> > [ 2829.672851] usb usb4: New USB device strings: Mfr=3, Product=2,
> > SerialNumber=1
> > [ 2829.672851] usb usb4: Product: xHCI Host Controller
> > [ 2829.672852] usb usb4: Manufacturer: Linux 5.10.15-051015-generic xhci-hcd
> > [ 2829.672853] usb usb4: SerialNumber: 0000:38:00.0
> > [ 2829.672977] hub 4-0:1.0: USB hub found
> > [ 2829.672985] hub 4-0:1.0: 2 ports detected
> > [ 2830.113812] usb 4-2: new SuperSpeedPlus Gen 2 USB device number 2
> > using xhci_hcd
> > [ 2830.137150] usb 4-2: New USB device found, idVendor=2900,
> > idProduct=8383, bcdDevice= 1.0a
> > [ 2830.137159] usb 4-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > [ 2830.137165] usb 4-2: Product: 4-Port USB 3.0 Hub
> > [ 2830.137170] usb 4-2: Manufacturer: Generic
> > [ 2830.139872] hub 4-2:1.0: USB hub found
> > [ 2830.140153] hub 4-2:1.0: 4 ports detected
> > [ 2830.429717] usb 4-2.1: new SuperSpeed Gen 1 USB device number 3
> > using xhci_hcd
> > [ 2830.453599] usb 4-2.1: New USB device found, idVendor=05e3,
> > idProduct=0626, bcdDevice= 6.55
> > [ 2830.453606] usb 4-2.1: New USB device strings: Mfr=1, Product=2,
> > SerialNumber=0
> > [ 2830.453610] usb 4-2.1: Product: USB3.1 Hub
> > [ 2830.453613] usb 4-2.1: Manufacturer: GenesysLogic
> > [ 2830.456109] hub 4-2.1:1.0: USB hub found
> > [ 2830.456457] hub 4-2.1:1.0: 4 ports detected
> > [ 2830.745598] usb 4-2.1.4: new SuperSpeed Gen 1 USB device number 4
> > using xhci_hcd
> > [ 2830.767264] usb 4-2.1.4: New USB device found, idVendor=058f,
> > idProduct=8468, bcdDevice= 1.00
> > [ 2830.767266] usb 4-2.1.4: New USB device strings: Mfr=1, Product=2,
> > SerialNumber=3
> > [ 2830.767267] usb 4-2.1.4: Product: Mass Storage Device
> > [ 2830.767267] usb 4-2.1.4: Manufacturer: Generic
> > [ 2830.767268] usb 4-2.1.4: SerialNumber: 058F84688461
> > [ 2830.769494] usb-storage 4-2.1.4:1.0: USB Mass Storage device detected
> > [ 2830.769683] scsi host4: usb-storage 4-2.1.4:1.0
> > [ 2831.794370] scsi 4:0:0:0: Direct-Access     Generic- SD/MMC
> >   1.00 PQ: 0 ANSI: 6
> > [ 2831.794831] scsi 4:0:0:1: Direct-Access     Generic- Micro SD/M2
> >   1.08 PQ: 0 ANSI: 6
> > [ 2831.795344] sd 4:0:0:0: Attached scsi generic sg0 type 0
> > [ 2831.795741] sd 4:0:0:1: Attached scsi generic sg1 type 0
> > [ 2831.846323] sd 4:0:0:0: [sda] Attached SCSI removable disk
> > [ 2831.847114] sd 4:0:0:1: [sdb] Attached SCSI removable disk
>
> Looks like your hub is disconnecting and then reconnecting over and over
> and over.  Perhaps it's an electrical issue?  Not much the kernel can do
> about that.
>
> Try a better cable, or a different hub.
>
> thanks,
>
> greg k-h

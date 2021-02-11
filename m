Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10E24318398
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 03:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbhBKCct (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 21:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbhBKCcs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Feb 2021 21:32:48 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186EDC061574
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 18:32:08 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id f17so645700qkl.5
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 18:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=+FRlQC04BaWLm/YLRLYhD/HgsjRPdLTkKhPn/sJncWg=;
        b=BGBA0Ywwp3Kp8zSrhag1r9bDox18qn5G61NEEDfy56jYidDKAiAs+vDc2v+aJENdNZ
         A1g0Xnivg0hFg1717FSfbLqVWusB7k3fbgT2yjx+TKlFGgc2te+LqRI693vrwtdMXyhp
         JirG/Na7HZBKnpUb3mSVMdtZYebP0NZS3EdJuVeRM/6KSPO/zCJ1gvH430PVxrN9fG4u
         mUFIMqpe+psl3MGE7bYvuAlz86qAmmQ/hAeByC+n6taWAdZmraFjfxeHJnxg5Su5PLuS
         V37n7P5+tQ2FFoVpi3gU9tzQF3583VgGIbHyBSkX7k9asd16z/uHbLbH7+zUKvKqYiT4
         y7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=+FRlQC04BaWLm/YLRLYhD/HgsjRPdLTkKhPn/sJncWg=;
        b=fQmHqc90VmOBAElLXpWju6pufkUH4hVexHAA5AU7hd86YXI852UxZ0I2WtKT4OT0kW
         /tMVSMkfpSGAVc4eEffvou+YCR2xEQLeZUNpMONEqrWnoplLW4ghVLFGp5ax6qopuioG
         Ph9EDzzZGI1JP3cII+h8yVtCArfbr6hA2iGRqfWVnsM7nIUxJtT5+nnyxCQTmvQG2M4I
         Lo+H06yGgCb8+u1wxwVG0aU6jL10rH7scrbGtCTqE6UU72vzxnDn9cetYi9VCCezZs1y
         CFHQyklqOJzHJ6/RhY+M5Zq+RzIImHM0Tdv8yy73CBs9FILexkbZq3DBnPAW8UoXudeZ
         ZCyA==
X-Gm-Message-State: AOAM530jotPZ35vhLH4/MrmKrtjSFh8hmUDnavRoYsKooBUI8gYwpO/m
        zGFE80cB7Wo8yBBRcKQfWLxiRouEUHhaatQk7XaPrRp2EQH2xA==
X-Google-Smtp-Source: ABdhPJz8UIiFkCsIYg/BVhI6xkSpzE8951KbKPn+JogB6amV+aH1Ex6VMcyygqAGnRw2M4zZTw0axbNm+W0YCSWX8oI=
X-Received: by 2002:a05:620a:542:: with SMTP id o2mr6681919qko.266.1613010726914;
 Wed, 10 Feb 2021 18:32:06 -0800 (PST)
MIME-Version: 1.0
From:   Yiyu Zhu <danielzeltar@gmail.com>
Date:   Wed, 10 Feb 2021 18:31:56 -0800
Message-ID: <CAGv7gkgb12vGPvZcSE0aVOpu32zSgxaayYreLvWs+vJc5EkQrA@mail.gmail.com>
Subject: kworker takes 100% core after unplugging usb c hub
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I have an Anker A8383 USB C hub with power delivery. I use the hub for
both charging and connecting to network. But when I unplug the hub, it
sometimes causes two kworker processes to occupy 100 % cpu time.
The issue will go away if I plug something back into the usbc port.
And the issue seems to persist through reboot.

I am running kernel version 5.8.0-43-generic #49~20.04.1-Ubuntu SMP

Here are the two problematic kworker from pidstat

05:06:50 PM     0     13702    0.00   92.00    0.00    8.00   92.00
 6  kworker/6:3+pm
05:06:50 PM     0     14510    0.00   92.00    0.00    8.00   92.00
 5  kworker/5:3+usb_hub_wq

I also tried to trace what those kworker are working on by

echo 1 > events/workqueue/workqueue_queue_work/enable

And the trace file was occupied with

     kworker/6:3-13702   [006] d... 55465.131483:
workqueue_queue_work: work struct=000000002c91f94a
function=pm_runtime_work workqueue=000000004caabfbb req_cpu=8192 cpu=6
     kworker/5:3-14510   [005] d... 55465.131484:
workqueue_queue_work: work struct=000000001307b478 function=hub_event
workqueue=0000000050d44cf1 req_cpu=8192 cpu=5
     kworker/5:3-14510   [005] d... 55465.131491:
workqueue_queue_work: work struct=000000000a62d754
function=pm_runtime_work workqueue=000000004caabfbb req_cpu=8192 cpu=5
     kworker/6:3-13702   [006] d... 55465.131516:
workqueue_queue_work: work struct=0000000043fda29b function=hub_event
workqueue=0000000050d44cf1 req_cpu=8192 cpu=6
     kworker/6:3-13702   [006] d... 55465.131547:
workqueue_queue_work: work struct=000000002c91f94a
function=pm_runtime_work workqueue=000000004caabfbb req_cpu=8192 cpu=6
     kworker/5:3-14510   [005] d... 55465.131563:
workqueue_queue_work: work struct=000000001307b478 function=hub_event
workqueue=0000000050d44cf1 req_cpu=8192 cpu=5
     kworker/6:3-13702   [006] d... 55465.131565:
workqueue_queue_work: work struct=0000000043fda29b function=hub_event
workqueue=0000000050d44cf1 req_cpu=8192 cpu=6
     kworker/5:3-14510   [005] d... 55465.131569:
workqueue_queue_work: work struct=000000000a62d754
function=pm_runtime_work workqueue=000000004caabfbb req_cpu=8192 cpu=5
     kworker/6:3-13702   [006] d... 55465.131570:
workqueue_queue_work: work struct=000000002c91f94a
function=pm_runtime_work workqueue=000000004caabfbb req_cpu=8192 cpu=6
     kworker/6:3-13702   [006] d... 55465.131610:
workqueue_queue_work: work struct=0000000043fda29b function=hub_event
workqueue=0000000050d44cf1 req_cpu=8192 cpu=6
     kworker/6:3-13702   [006] d... 55465.131633:
workqueue_queue_work: work struct=000000002c91f94a
function=pm_runtime_work workqueue=000000004caabfbb req_cpu=8192 cpu=6


Here is the output from lsusb

Bus 004 Device 005: ID 058f:8468 Alcor Micro Corp.
Bus 004 Device 004: ID 0bda:8153 Realtek Semiconductor Corp. RTL8153
Gigabit Ethernet Adapter
Bus 004 Device 003: ID 05e3:0626 Genesys Logic, Inc.
Bus 004 Device 002: ID 2900:8383 Generic 4-Port USB 3.0 Hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 003: ID 8087:0a2b Intel Corp.
Bus 001 Device 002: ID 0408:5251 Quanta Computer, Inc. HP Wide Vision FHD Camera
Bus 001 Device 072: ID 0bda:5450 Realtek Semiconductor Corp. HP Wide
Vision FHD Camera
Bus 001 Device 071: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
Bus 001 Device 070: ID 291a:5423 Generic 4-Port USB 2.0 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Here is the part of dmesg that I think is relevant: (I was trying to
plug in and unplug the hub to recreate the issue.)

[55836.538747] pci_bus 0000:03: Allocating resources
[55836.538778] pcieport 0000:03:02.0: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 38] add_size 200000
add_align 100000
[55836.538794] pcieport 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[55836.538796] pcieport 0000:03:02.0: BAR 15: failed to assign [mem
size 0x00200000 64bit pref]
[55836.538800] pcieport 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[55836.538802] pcieport 0000:03:02.0: BAR 15: failed to assign [mem
size 0x00200000 64bit pref]
[55836.902256] usb 1-3: new high-speed USB device number 60 using xhci_hcd
[55837.058338] usb 1-3: New USB device found, idVendor=291a,
idProduct=5423, bcdDevice= 1.0a
[55837.058346] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[55837.058351] usb 1-3: Product: 4-Port USB 2.0 Hub
[55837.058355] usb 1-3: Manufacturer: Generic
[55837.059847] hub 1-3:1.0: USB hub found
[55837.060046] hub 1-3:1.0: 5 ports detected
[55837.354225] usb 1-3.1: new high-speed USB device number 61 using xhci_hcd
[55837.461292] usb 1-3.1: New USB device found, idVendor=05e3,
idProduct=0610, bcdDevice= 6.55
[55837.461300] usb 1-3.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[55837.461306] usb 1-3.1: Product: USB2.1 Hub
[55837.461310] usb 1-3.1: Manufacturer: GenesysLogic
[55837.463003] hub 1-3.1:1.0: USB hub found
[55837.463363] hub 1-3.1:1.0: 4 ports detected
[55837.934650] hp_wmi: Unknown event_id - 131073 - 0x0
[55837.950209] usb 1-3.5: new high-speed USB device number 62 using xhci_hcd
[55838.057266] usb 1-3.5: New USB device found, idVendor=0bda,
idProduct=5450, bcdDevice= 1.01
[55838.057271] usb 1-3.5: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[55838.057275] usb 1-3.5: Product: BillBoard Device
[55838.057278] usb 1-3.5: Manufacturer: Realtek
[55838.446698] hp_wmi: Unknown event_id - 131073 - 0x0
[55841.442698] pci 0000:38:00.0: [8086:15d4] type 00 class 0x0c0330
[55841.442738] pci 0000:38:00.0: reg 0x10: [mem 0xc7f00000-0xc7f0ffff]
[55841.442810] pci 0000:38:00.0: enabling Extended Tags
[55841.442949] pci 0000:38:00.0: supports D1 D2
[55841.442950] pci 0000:38:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[55841.443055] pci 0000:38:00.0: 8.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x4 link at 0000:03:02.0 (capable of 31.504
Gb/s with 8.0 GT/s PCIe x4 link)
[55841.443190] pcieport 0000:03:02.0: ASPM: current common clock
configuration is inconsistent, reconfiguring
[55841.443303] pci_bus 0000:03: Allocating resources
[55841.443325] pcieport 0000:03:02.0: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 38] add_size 200000
add_align 100000
[55841.443329] pcieport 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[55841.443329] pcieport 0000:03:02.0: BAR 15: failed to assign [mem
size 0x00200000 64bit pref]
[55841.443331] pcieport 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[55841.443331] pcieport 0000:03:02.0: BAR 15: failed to assign [mem
size 0x00200000 64bit pref]
[55841.443625] xhci_hcd 0000:38:00.0: xHCI Host Controller
[55841.443628] xhci_hcd 0000:38:00.0: new USB bus registered, assigned
bus number 3
[55841.444780] xhci_hcd 0000:38:00.0: hcc params 0x200077c1 hci
version 0x110 quirks 0x0000000200009810
[55841.445088] usb usb3: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.08
[55841.445090] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[55841.445090] usb usb3: Product: xHCI Host Controller
[55841.445091] usb usb3: Manufacturer: Linux 5.8.0-43-generic xhci-hcd
[55841.445092] usb usb3: SerialNumber: 0000:38:00.0
[55841.445315] hub 3-0:1.0: USB hub found
[55841.445323] hub 3-0:1.0: 2 ports detected
[55841.445871] xhci_hcd 0000:38:00.0: xHCI Host Controller
[55841.445873] xhci_hcd 0000:38:00.0: new USB bus registered, assigned
bus number 4
[55841.445875] xhci_hcd 0000:38:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[55841.445905] usb usb4: New USB device found, idVendor=1d6b,
idProduct=0003, bcdDevice= 5.08
[55841.445905] usb usb4: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[55841.445906] usb usb4: Product: xHCI Host Controller
[55841.445907] usb usb4: Manufacturer: Linux 5.8.0-43-generic xhci-hcd
[55841.445907] usb usb4: SerialNumber: 0000:38:00.0
[55841.446059] hub 4-0:1.0: USB hub found
[55841.446066] hub 4-0:1.0: 2 ports detected
[55841.890489] usb 4-2: new SuperSpeedPlus Gen 2 USB device number 2
using xhci_hcd
[55841.914304] usb 4-2: New USB device found, idVendor=2900,
idProduct=8383, bcdDevice= 1.0a
[55841.914310] usb 4-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[55841.914314] usb 4-2: Product: 4-Port USB 3.0 Hub
[55841.914318] usb 4-2: Manufacturer: Generic
[55841.917881] hub 4-2:1.0: USB hub found
[55841.918251] hub 4-2:1.0: 4 ports detected
[55842.210614] usb 4-2.1: new SuperSpeed Gen 1 USB device number 3
using xhci_hcd
[55842.234139] usb 4-2.1: New USB device found, idVendor=05e3,
idProduct=0626, bcdDevice= 6.55
[55842.234145] usb 4-2.1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[55842.234148] usb 4-2.1: Product: USB3.1 Hub
[55842.234151] usb 4-2.1: Manufacturer: GenesysLogic
[55842.237477] hub 4-2.1:1.0: USB hub found
[55842.237836] hub 4-2.1:1.0: 4 ports detected
[55842.526714] usb 4-2.1.3: new SuperSpeed Gen 1 USB device number 4
using xhci_hcd
[55842.550133] usb 4-2.1.3: New USB device found, idVendor=0bda,
idProduct=8153, bcdDevice=30.00
[55842.550139] usb 4-2.1.3: New USB device strings: Mfr=1, Product=2,
SerialNumber=6
[55842.550143] usb 4-2.1.3: Product: USB 10/100/1000 LAN
[55842.550146] usb 4-2.1.3: Manufacturer: Realtek
[55842.550149] usb 4-2.1.3: SerialNumber: 000001
[55842.630589] usb 4-2.1.4: new SuperSpeed Gen 1 USB device number 5
using xhci_hcd
[55842.652867] usb 4-2.1.4: New USB device found, idVendor=058f,
idProduct=8468, bcdDevice= 1.00
[55842.652873] usb 4-2.1.4: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[55842.652877] usb 4-2.1.4: Product: Mass Storage Device
[55842.652880] usb 4-2.1.4: Manufacturer: Generic
[55842.652882] usb 4-2.1.4: SerialNumber: 058F84688461
[55842.659277] usb-storage 4-2.1.4:1.0: USB Mass Storage device detected
[55842.659630] scsi host4: usb-storage 4-2.1.4:1.0
[55842.731243] usb 4-2.1.3: reset SuperSpeed Gen 1 USB device number 4
using xhci_hcd
[55842.774922] r8152 4-2.1.3:1.0: load rtl8153a-4 v2 02/07/20 successfully
[55842.802955] r8152 4-2.1.3:1.0 eth0: v1.11.11
[55842.831883] r8152 4-2.1.3:1.0 enx00e04cb5877c: renamed from eth0
[55843.667490] scsi 4:0:0:0: Direct-Access     Generic- SD/MMC
  1.00 PQ: 0 ANSI: 6
[55843.668004] scsi 4:0:0:1: Direct-Access     Generic- Micro SD/M2
  1.08 PQ: 0 ANSI: 6
[55843.668638] sd 4:0:0:0: Attached scsi generic sg0 type 0
[55843.669188] sd 4:0:0:1: Attached scsi generic sg1 type 0
[55843.699682] sd 4:0:0:1: [sdb] Attached SCSI removable disk
[55843.700886] sd 4:0:0:0: [sda] Attached SCSI removable disk
[55845.974915] IPv6: ADDRCONF(NETDEV_CHANGE): enx00e04cb5877c: link
becomes ready
[55845.975197] r8152 4-2.1.3:1.0 enx00e04cb5877c: carrier on
[55846.582853] pci_bus 0000:03: Allocating resources
[55846.582892] pcieport 0000:03:02.0: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 38] add_size 200000
add_align 100000
[55846.582909] pcieport 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[55846.582912] pcieport 0000:03:02.0: BAR 15: failed to assign [mem
size 0x00200000 64bit pref]
[55846.582919] pcieport 0000:03:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
[55846.582922] pcieport 0000:03:02.0: BAR 15: failed to assign [mem
size 0x00200000 64bit pref]
[56382.630334] usb 1-3: USB disconnect, device number 60
[56382.630341] usb 1-3.1: USB disconnect, device number 61
[56382.633343] usb 1-3.5: USB disconnect, device number 62
[56382.702207] r8152 4-2.1.3:1.0 enx00e04cb5877c: Stop submitting
intr, status -71
[56382.729232] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -71
[56382.859307] usb usb3-port2: over-current condition
[56382.926145] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -71
[56383.154145] r8152 4-2.1.3:1.0 enx00e04cb5877c: Tx status -71
[56383.387194] usb 4-2: USB disconnect, device number 2
[56383.387200] usb 4-2.1: USB disconnect, device number 3
[56383.387203] usb 4-2.1.3: USB disconnect, device number 4
[56383.464366] usb 4-2.1.4: USB disconnect, device number 5
[56384.015157] usb usb4-port2: over-current condition

Please let me know if you need any further information.

Thanks
Yiyu Zhu

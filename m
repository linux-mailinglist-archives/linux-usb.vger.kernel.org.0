Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 730801E9ADB
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2020 01:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgEaXra (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 31 May 2020 19:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgEaXr3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 31 May 2020 19:47:29 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8A1C061A0E;
        Sun, 31 May 2020 16:47:29 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id w90so6437877qtd.8;
        Sun, 31 May 2020 16:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=dHkNB29IroypU9npEenFoEQZGKmg3uiqvWsxQnbV8wk=;
        b=WsUhc7s61uP5GJWAmtE9IgjeSFw01KWfEZNKzLwRm2B+35Pi7yB0XWFL+dpvnnYGBS
         8xbJ+O02bUo6cqcR1+GTsfhJywiVrTq5wMFS1ksq+GADlzCjulqih6tG84m9KWoik24d
         vxZRojLQOWG5MB1j2GTQwCGJ+FKzLNxMtVHL9zWJtrKhGPPuoaNj8cz05x+exOR6Mztn
         HanaTpYxpG81QmBXdwzr+mAha8W1nntelB9ivtby3WGZABLsTo6jkb0GT2qyV2LcGJkk
         fATtJJiu5wiHF09qUwQO/tdEoPNfVMqIEKjeYt6EO3qICE0gzpEOVqIwi+gYsTL3frke
         snrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=dHkNB29IroypU9npEenFoEQZGKmg3uiqvWsxQnbV8wk=;
        b=misrHlLFMl5xVWnf+SwuL6vxf3CM40cq3Hpzt71tGtyom0r/VJG2gUqYyTi9J1yoXV
         W+z/EX5gshFJW2sqYu5zjCer/j7S/7ECKG4OBhx3leZAqkJ0oPNvPJXBHFY/WbdBokMD
         TzZvyFjHJI5af5gwoNAYLdSTC/D+UfaneJrPGyvKvPwW3eOIfXeYQlgENsCUEXcRwxiA
         PNVECBUp4qThp9cMyvM1Gj77OcYskUXFZmSdyfdRjmwk5e+sqKZWpU43JKriFSkfBv0d
         NrTUkltoqyR9yv0oCK+047mdtkQtl4IUhg9HvMW0wdFI237Gz6l5n2+K8jhMb6eB37vr
         g0fQ==
X-Gm-Message-State: AOAM532c0rqbgRZ77ylwzLnAuSykRRqAU5PhqCU4XaKWDFjOu+tujS6d
        RCxIsggYj03GPdraelBKv4ZomNZBjBdblAVzukMD23ys
X-Google-Smtp-Source: ABdhPJzuqKbX8YD8xGmTwDocTOqymPR1nik/6If1N7+exU//MdtoHiq5tAd8dACIFETYfvNV3k/tbPPfqlRzUsVHaFI=
X-Received: by 2002:ac8:750a:: with SMTP id u10mr19212217qtq.103.1590968848048;
 Sun, 31 May 2020 16:47:28 -0700 (PDT)
MIME-Version: 1.0
From:   Vincent Pelletier <plr.vincent@gmail.com>
Date:   Mon, 1 Jun 2020 08:47:17 +0900
Message-ID: <CAF78GY0KH84QvFqbvetgGKVxBgm5761HojRSfj_Ch+pCS_urCA@mail.gmail.com>
Subject: DMAR errors on Wildcat Point-LP xHCI (Lenovo T450s)
To:     USB list <linux-usb@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        David Woodhouse <dwmw2@infradead.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

Trying to use a built-in USB device I rarely use (Sierra EM7345 LTE
modem), I ran into issues from the modem flapping (getting removed
from USB bus before LTE network registration is visible) up to all
devices on the bus being "disconnected" (xhci giving up, in my
understanding, with only the root hubs listed by lsusb).
Checking the syslog, I find this:

May 30 17:35:46 localhost kernel: [  278.999480] DMAR: DRHD: handling
fault status reg 3
May 30 17:35:46 localhost kernel: [  278.999485] DMAR: [DMA Read]
Request device [00:16.7] PASID ffffffff fault addr 9cdff000 [fault
reason 02] Present bit in context entry is clear
May 30 17:35:46 localhost kernel: [  278.999488] DMAR: DRHD: handling
fault status reg 3
May 30 17:35:46 localhost kernel: [  278.999490] DMAR: [DMA Read]
Request device [00:16.7] PASID ffffffff fault addr 9cdff000 [fault
reason 02] Present bit in context entry is clear
May 30 17:35:46 localhost kernel: [  279.001076] DMAR: DRHD: handling
fault status reg 2
May 30 17:35:46 localhost kernel: [  279.001078] DMAR: [DMA Write]
Request device [00:16.7] PASID ffffffff fault addr 9cdff000 [fault
reason 02] Present bit in context entry is clear
May 30 17:35:46 localhost kernel: [  279.001120] DMAR: DRHD: handling
fault status reg 2
May 30 17:35:47 localhost kernel: [  280.738192] usb 2-4: USB
disconnect, device number 10
May 30 17:35:47 localhost kernel: [  280.738224] cdc_mbim 2-4:1.0: Tx
URB error: -19
May 30 17:35:47 localhost kernel: [  280.738303] cdc_mbim 2-4:1.0
wwan0: unregister 'cdc_mbim' usb-0000:00:14.0-4, CDC MBIM
May 30 17:35:47 localhost ModemManager[736]: <info>  (net/wwan0):
released by device '/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4'
May 30 17:35:47 localhost ModemManager[736]: [/dev/cdc-wdm0]
unexpected port hangup!
May 30 17:35:47 localhost ModemManager[736]: [/dev/cdc-wdm0] channel destroyed
May 30 17:35:47 localhost ModemManager[736]: <info>  Connection to
mbim-proxy for /dev/cdc-wdm0 lost, reprobing
May 30 17:35:47 localhost ModemManager[736]: <info>  [device
/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4] creating modem with
plugin 'Sierra' and '2' ports
May 30 17:35:47 localhost ModemManager[736]: <warn>  Could not
recreate modem for device
'/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4': Failed to find a net
port in the MBIM modem
May 30 17:35:47 localhost ModemManager[736]: <info>
(usbmisc/cdc-wdm0): released by device
'/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4'
May 30 17:35:47 localhost ModemManager[736]: <info>  (tty/ttyACM0):
released by device '/sys/devices/pci0000:00/0000:00:14.0/usb2/2-4'
May 30 17:35:48 localhost kernel: [  281.202173] usb 2-4: new
high-speed USB device number 11 using xhci_hcd
May 30 17:35:48 localhost kernel: [  281.224037] usb 2-4: New USB
device found, idVendor=8087, idProduct=0716, bcdDevice= 0.00
May 30 17:35:48 localhost kernel: [  281.224043] usb 2-4: New USB
device strings: Mfr=0, Product=0, SerialNumber=0
May 30 17:35:48 localhost kernel: [  281.225646] usb_serial_simple
2-4:1.0: flashloader converter detected
May 30 17:35:48 localhost kernel: [  281.225891] usb 2-4: flashloader
converter now attached to ttyUSB0

which makes me suspect a missing IOMMU mapping in ACPI for the xhci
controller. In this case, the xhci could recover and re-enumerated the
device fairly quickly.
Booting with "intel_iommu=off" makes the LTE modem work at least far
enough that it gets registered to network (can send/receive SMS). I
have not tried data communication (no data plan on current SIM).
I have noticed for a while that this machine had a tendency to lose
all USB devices more often than I enable the LTE modem, so it seems
the modem just make this issue more likely, and is not their direct
cause.

This is on a 5.6.7 (Debian Sid 5.6.0-1-amd64, version from which
pasted logs are extracted), and reproduced with 5.6.14 (Debian Sid
5.6.0-2-amd64).
The USB issues have been happening for a long time, and I use this
modem rarely enough that I would not notice a new issue before several
kernel versions.
The modem usually worked "well enough" but always has had a bit of
flapping, sometimes working after one or two suspend/resume cycles,
and until now I did not feel the need to investigate more (I assumed a
less-than-optimal modem/modem driver).
This time it never ended up working after several suspend/resume
cycles and reboots. So I do not believe it is a localised regression,
but a bad situation getting just nudged over the edge.

$ lspci
00:00.0 Host bridge: Intel Corporation Broadwell-U Host Bridge -OPI (rev 09)
00:02.0 VGA compatible controller: Intel Corporation HD Graphics 5500 (rev 09)
00:03.0 Audio device: Intel Corporation Broadwell-U Audio Controller (rev 09)
00:14.0 USB controller: Intel Corporation Wildcat Point-LP USB xHCI
Controller (rev 03)
00:16.0 Communication controller: Intel Corporation Wildcat Point-LP
MEI Controller #1 (rev 03)
00:19.0 Ethernet controller: Intel Corporation Ethernet Connection (3)
I218-V (rev 03)
00:1b.0 Audio device: Intel Corporation Wildcat Point-LP High
Definition Audio Controller (rev 03)
00:1c.0 PCI bridge: Intel Corporation Wildcat Point-LP PCI Express
Root Port #6 (rev e3)
00:1c.1 PCI bridge: Intel Corporation Wildcat Point-LP PCI Express
Root Port #3 (rev e3)
00:1d.0 USB controller: Intel Corporation Wildcat Point-LP USB EHCI
Controller (rev 03)
00:1f.0 ISA bridge: Intel Corporation Wildcat Point-LP LPC Controller (rev 03)
00:1f.2 SATA controller: Intel Corporation Wildcat Point-LP SATA
Controller [AHCI Mode] (rev 03)
00:1f.3 SMBus: Intel Corporation Wildcat Point-LP SMBus Controller (rev 03)
00:1f.6 Signal processing controller: Intel Corporation Wildcat
Point-LP Thermal Management Controller (rev 03)
02:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd.
RTS5227 PCI Express Card Reader (rev 01)
03:00.0 Network controller: Intel Corporation Wireless 7265 (rev 59)
$ lsusb
Bus 001 Device 002: ID 8087:8001 Intel Corp.
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 006: ID 04f2:b449 Chicony Electronics Co., Ltd Integrated Camera
Bus 002 Device 017: ID 8087:0a2a Intel Corp.
Bus 002 Device 004: ID 138a:0017 Validity Sensors, Inc. VFS 5011
fingerprint sensor
Bus 002 Device 003: ID 058f:9540 Alcor Micro Corp. AU9540 Smartcard Reader
Bus 002 Device 016: ID 1199:a001 Sierra Wireless, Inc. Sierra Wireless
EM7345 4G LTE
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Early boot messages are unhappy with firmware (1.37 is the latest
available version to date):
May 30 17:32:17 localhost kernel: [    0.168626] DMAR: Host address width 39
May 30 17:32:17 localhost kernel: [    0.168629] DMAR: DRHD base:
0x000000fed90000 flags: 0x0
May 30 17:32:17 localhost kernel: [    0.168640] DMAR: dmar0:
reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 7e1ff0505e
May 30 17:32:17 localhost kernel: [    0.168643] DMAR: DRHD base:
0x000000fed91000 flags: 0x1
May 30 17:32:17 localhost kernel: [    0.168651] DMAR: dmar1:
reg_base_addr fed91000 ver 1:0 cap d2008c20660462 ecap f010da
May 30 17:32:17 localhost kernel: [    0.168653] DMAR: RMRR base:
0x0000009c0f1000 end: 0x0000009c107fff
May 30 17:32:17 localhost kernel: [    0.168655] DMAR: RMRR base:
0x0000009d800000 end: 0x0000009fffffff
May 30 17:32:17 localhost kernel: [    0.168658] DMAR: [Firmware Bug]:
No firmware reserved region can cover this RMRR
[0x000000009d800000-0x000000009fffffff], contact BIOS vendor for fixes
May 30 17:32:17 localhost kernel: [    0.168671] DMAR: [Firmware Bug]:
Your BIOS is broken; bad RMRR [0x000000009d800000-0x000000009fffffff]
May 30 17:32:17 localhost kernel: [    0.168671] BIOS vendor: LENOVO;
Ver: JBET73WW (1.37 ); Product Version: ThinkPad T450s
May 30 17:32:17 localhost kernel: [    0.168675] DMAR-IR: IOAPIC id 2
under DRHD base  0xfed91000 IOMMU 1
May 30 17:32:17 localhost kernel: [    0.168677] DMAR-IR: HPET id 0
under DRHD base 0xfed91000
May 30 17:32:17 localhost kernel: [    0.168679] DMAR-IR: x2apic is
disabled because BIOS sets x2apic opt out bit.
May 30 17:32:17 localhost kernel: [    0.168680] DMAR-IR: Use
'intremap=no_x2apic_optout' to override the BIOS setting.
May 30 17:32:17 localhost kernel: [    0.169608] DMAR-IR: Enabled IRQ
remapping in xapic mode
[...]
May 30 17:32:17 localhost kernel: [    0.890456] pci 0000:00:02.0:
DMAR: Disabling IOMMU for graphics on this chipset
[...]
May 30 17:32:17 localhost kernel: [    2.574095] DMAR: No ATSR found
May 30 17:32:17 localhost kernel: [    2.574207] DMAR: dmar1: Using
Queued invalidation
May 30 17:32:17 localhost kernel: [    2.574608] pci 0000:00:00.0:
Adding to iommu group 0
May 30 17:32:17 localhost kernel: [    2.574760] pci 0000:00:03.0:
Adding to iommu group 1
May 30 17:32:17 localhost kernel: [    2.575002] pci 0000:00:14.0:
Adding to iommu group 2
May 30 17:32:17 localhost kernel: [    2.575170] pci 0000:00:16.0:
Adding to iommu group 3
May 30 17:32:17 localhost kernel: [    2.575339] pci 0000:00:19.0:
Adding to iommu group 4
May 30 17:32:17 localhost kernel: [    2.575489] pci 0000:00:1b.0:
Adding to iommu group 5
May 30 17:32:17 localhost kernel: [    2.575652] pci 0000:00:1c.0:
Adding to iommu group 6
May 30 17:32:17 localhost kernel: [    2.575818] pci 0000:00:1c.1:
Adding to iommu group 7
May 30 17:32:17 localhost kernel: [    2.576035] pci 0000:00:1d.0:
Adding to iommu group 8
May 30 17:32:17 localhost kernel: [    2.580374] pci 0000:00:1f.0:
Adding to iommu group 9
May 30 17:32:17 localhost kernel: [    2.580411] pci 0000:00:1f.2:
Adding to iommu group 9
May 30 17:32:17 localhost kernel: [    2.580436] pci 0000:00:1f.3:
Adding to iommu group 9
May 30 17:32:17 localhost kernel: [    2.580461] pci 0000:00:1f.6:
Adding to iommu group 9
May 30 17:32:17 localhost kernel: [    2.580628] pci 0000:02:00.0:
Adding to iommu group 10
May 30 17:32:17 localhost kernel: [    2.581050] pci 0000:03:00.0:
Adding to iommu group 11
May 30 17:32:17 localhost kernel: [    2.581056] DMAR: Intel(R)
Virtualization Technology for Directed I/O

I am not sure what could fix this issue, hence the many recipients for
this email:
- An xhci module issue (should check/define extra IOMMU mappings, warn
about them missing, or maybe be able to more reliably recover) ?
- A new IOMMU quirk (workaround bad firmware) ?
- A new thinkpad_acpi quirk (workaround bad firmware) ?
Or somewhere else that I did not think of ? Hopefully it will not
require a Lenovo BIOS fix, as this is an aging model.

Regards,
-- 
Vincent Pelletier

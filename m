Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF0DF754E33
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jul 2023 11:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjGPJwi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Jul 2023 05:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjGPJwh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Jul 2023 05:52:37 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0AA128
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 02:52:34 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b8392076c9so36893111fa.1
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689501152; x=1692093152;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S9Wkca/KU+d+Rqi+GV16e36ZTlsNhG4pnwNGTlTLxl8=;
        b=bRz0Qwj17uTJ/USlPa4ko9HH5E6YbsWW9HkU3KWkCq852M14n1kTxJCGzp3RW4kkB2
         mgeDq7BS6m+XAKu7fnoB8ndV3375E9JAxoyAxOJvnUoF0KYN0rZMLKoTseAh15/LyhDn
         wg+cRbtgxx+OAQpCzWgEfVu2BppuGzk/R1SYMjUakqWAqGmqstNpOl7U2aWIdBlAQKbS
         njcYvjbpE+Bk1ovl76XML1eXml4sxVy33L0K9WPUsgV9BvKL08SAHtoGbtJkTx2Tb9ZX
         NniqHmzkwBPcprGeU3Zex1I4GNx7m3rh4U3URHrq6CpV1lLr/jZQjqfGiB2Voo0MOs4z
         xWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689501152; x=1692093152;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9Wkca/KU+d+Rqi+GV16e36ZTlsNhG4pnwNGTlTLxl8=;
        b=DqDMvfLM7Xl/x/SUFLYDSkPyEx+3gHJn5VaxoeksfQW2uJ7AQS+1GPLcv7jnJkEw/Z
         jiiiAlzKL8JZSnhd/BXzMBZVythmBC6o9MX9IC9Z7vZW1Bp3tBxBPGT3ozkH6xiiV3sF
         c2LSTWxNdKsdB+FPdH18khqVYOkug4b5pt/ZGfs2PTZ92FAVcFdSw9rQb3FxeK8PoTZ/
         UiIe9IhBAJX50x2HurbtKQOeHzNpq98zKF3HmA64BeFPjOgPtIpNawcS2aAqxdUV/9qq
         9BkSN/Tx382GaX+MeMNO2nMuwHTNJxXrrK7i15jrCc7eN9aLZuMlS41I3DnMjv0Fn2pl
         BVLg==
X-Gm-Message-State: ABy/qLauGOkCWqLQSSFsL3O0544gbO7aZenZ+BynGPm/J8SN+yK4bkXb
        QEvylT+Lp+vlVl9LfClJfEHkBA+AjvHF/MJxGW/HGtbcZ84=
X-Google-Smtp-Source: APBJJlHDHdtb4CgLM9ilAG0s6YgU6EAoAMqsF+RqoynwJ32mHcof85rgzXJvT/EzoPM83g1cTKLhcE0f5r/tbiK5DKY=
X-Received: by 2002:a2e:9045:0:b0:2b6:eefc:3e4f with SMTP id
 n5-20020a2e9045000000b002b6eefc3e4fmr6673264ljg.21.1689501151843; Sun, 16 Jul
 2023 02:52:31 -0700 (PDT)
MIME-Version: 1.0
From:   Andrew Marshall <planetmarshalluk@gmail.com>
Date:   Sun, 16 Jul 2023 10:52:19 +0100
Message-ID: <CAGQVT1Lc5ijoifa3iEqLJQo0N_106PTWLRP-eNMasYiz2QPX2w@mail.gmail.com>
Subject: Thunderbolt/USB4 dock is not recognized
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

# Summary

Startech 116U-USBC-DOCK is not recognized when connected (over USB-C).
Power delivery system is working partially.

# Expected Behaviour

The attached dock, its connected USB ports and displays should be
recognized and be usable.

# Actual Behaviour

The device is not recognized, no relevant messages are visible in the
kernel log when the device is connected.The following messages are
present in the kernel log (there are no thunderbolt or usb messages):
```
[  173.223920] pcieport 0000:00:01.1: AER: Corrected error received:
0000:01:00.0
[  173.223933] nvidia 0000:01:00.0: PCIe Bus Error:
severity=Corrected, type=Data Link Layer, (Receiver ID)
[  173.223935] nvidia 0000:01:00.0:   device [10de:28e0] error
status/mask=00000040/0000a000
[  173.223938] nvidia 0000:01:00.0:    [ 6] BadTLP
```
The following messages appear in `udevadm monitor`
```
KERNEL[173.402376] change
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:35/ACPI0003:00/power_supply/ADP0
(power_supply)
KERNEL[173.402443] change
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:35/PNP0C0A:00/power_supply/BAT0
(power_supply)
KERNEL[173.402928] change
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:35/PNP0C0A:00/power_supply/BAT0
(power_supply)
UDEV  [173.406888] change
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:35/ACPI0003:00/power_supply/ADP0
(power_supply)
UDEV  [173.406931] change
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:35/PNP0C0A:00/power_supply/BAT0
(power_supply)
UDEV  [173.408948] change
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:35/PNP0C0A:00/power_supply/BAT0
(power_supply)
KERNEL[178.057391] change
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:35/ACPI0003:00/power_supply/ADP0
(power_supply)
UDEV  [178.063252] change
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:35/ACPI0003:00/power_supply/ADP0
(power_supply)
```
The power connection appears to connect/disconnect repeatedly.

# Steps to Reproduce

1. Connect dock to USB-C and monitor kernel log

Reproduced with
ASUS G14 (2023) GA402NV
Startech 116U-USBC-DOCK
Linux 6.4.3 from stable repo

# lspci output

00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 17h-19h
PCIe Root Complex (rev 01)
    Subsystem: ASUSTeK Computer Inc. Family 17h-19h PCIe Root Complex
    Flags: fast devsel

00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Family 17h-19h IOMMU
    Subsystem: ASUSTeK Computer Inc. Family 17h-19h IOMMU
    Flags: fast devsel, IRQ 24
    Capabilities: <access denied>

00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 17h-19h
PCIe Dummy Host Bridge (rev 01)
    Flags: fast devsel, IOMMU group 0

00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 14b8
(prog-if 00 [Normal decode])
    Subsystem: ASUSTeK Computer Inc. Device 1463
    Flags: bus master, fast devsel, latency 0, IRQ 33, IOMMU group 1
    Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
    I/O behind bridge: f000-ffff [size=4K] [16-bit]
    Memory behind bridge: dc000000-dd0fffff [size=17M] [32-bit]
    Prefetchable memory behind bridge: 7c00000000-7e01ffffff
[size=8224M] [32-bit]
    Capabilities: <access denied>
    Kernel driver in use: pcieport

00:01.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 17h-19h
PCIe GPP Bridge (prog-if 00 [Normal decode])
    Subsystem: ASUSTeK Computer Inc. Family 17h-19h PCIe GPP Bridge
    Flags: bus master, fast devsel, latency 0, IRQ 34, IOMMU group 2
    Bus: primary=00, secondary=02, subordinate=02, sec-latency=0
    I/O behind bridge: [disabled] [32-bit]
    Memory behind bridge: ddc00000-ddcfffff [size=1M] [32-bit]
    Prefetchable memory behind bridge: [disabled] [64-bit]
    Capabilities: <access denied>
    Kernel driver in use: pcieport

00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 17h-19h
PCIe Dummy Host Bridge (rev 01)
    Flags: fast devsel, IOMMU group 3

00:02.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 17h-19h
PCIe GPP Bridge (prog-if 00 [Normal decode])
    Subsystem: ASUSTeK Computer Inc. Family 17h-19h PCIe GPP Bridge
    Flags: bus master, fast devsel, latency 0, IRQ 35, IOMMU group 4
    Bus: primary=00, secondary=03, subordinate=03, sec-latency=0
    I/O behind bridge: [disabled] [32-bit]
    Memory behind bridge: ddb00000-ddbfffff [size=1M] [32-bit]
    Prefetchable memory behind bridge: 7e50300000-7e503fffff [size=1M] [32-bit]
    Capabilities: <access denied>
    Kernel driver in use: pcieport

00:02.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 17h-19h
PCIe GPP Bridge (prog-if 00 [Normal decode])
    Subsystem: ASUSTeK Computer Inc. Family 17h-19h PCIe GPP Bridge
    Flags: bus master, fast devsel, latency 0, IRQ 36, IOMMU group 5
    Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
    I/O behind bridge: [disabled] [32-bit]
    Memory behind bridge: dda00000-ddafffff [size=1M] [32-bit]
    Prefetchable memory behind bridge: [disabled] [64-bit]
    Capabilities: <access denied>
    Kernel driver in use: pcieport

00:03.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 17h-19h
PCIe Dummy Host Bridge (rev 01)
    Flags: fast devsel, IOMMU group 6

00:03.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 19h
USB4/Thunderbolt PCIe tunnel (prog-if 00 [Normal decode])
    Subsystem: Advanced Micro Devices, Inc. [AMD] Family 19h
USB4/Thunderbolt PCIe tunnel
    Flags: bus master, fast devsel, latency 0, IRQ 37, IOMMU group 6
    Bus: primary=00, secondary=05, subordinate=74, sec-latency=0
    I/O behind bridge: c000-dfff [size=8K] [16-bit]
    Memory behind bridge: c4000000-dbffffff [size=384M] [32-bit]
    Prefetchable memory behind bridge: 7e10000000-7e37ffffff
[size=640M] [32-bit]
    Capabilities: <access denied>
    Kernel driver in use: pcieport

00:04.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 17h-19h
PCIe Dummy Host Bridge (rev 01)
    Flags: fast devsel, IOMMU group 7

00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 17h-19h
PCIe Dummy Host Bridge (rev 01)
    Flags: fast devsel, IOMMU group 8

00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 17h-19h
Internal PCIe GPP Bridge (rev 10) (prog-if 00 [Normal decode])
    Subsystem: Advanced Micro Devices, Inc. [AMD] Family 17h-19h
Internal PCIe GPP Bridge
    Flags: bus master, fast devsel, latency 0, IRQ 38, IOMMU group 9
    Bus: primary=00, secondary=75, subordinate=75, sec-latency=0
    I/O behind bridge: e000-efff [size=4K] [16-bit]
    Memory behind bridge: dd600000-dd9fffff [size=4M] [32-bit]
    Prefetchable memory behind bridge: 7e40000000-7e501fffff
[size=258M] [32-bit]
    Capabilities: <access denied>
    Kernel driver in use: pcieport

00:08.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 17h-19h
Internal PCIe GPP Bridge (rev 10) (prog-if 00 [Normal decode])
    Subsystem: Advanced Micro Devices, Inc. [AMD] Family 17h-19h
Internal PCIe GPP Bridge
    Flags: bus master, fast devsel, latency 0, IRQ 39, IOMMU group 10
    Bus: primary=00, secondary=76, subordinate=76, sec-latency=0
    I/O behind bridge: [disabled] [32-bit]
    Memory behind bridge: dd200000-dd5fffff [size=4M] [32-bit]
    Prefetchable memory behind bridge: [disabled] [64-bit]
    Capabilities: <access denied>
    Kernel driver in use: pcieport

00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev 71)
    Subsystem: ASUSTeK Computer Inc. FCH SMBus Controller
    Flags: 66MHz, medium devsel, IOMMU group 11
    Kernel driver in use: piix4_smbus
    Kernel modules: i2c_piix4, sp5100_tco

00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev 51)
    Subsystem: ASUSTeK Computer Inc. FCH LPC Bridge
    Flags: bus master, 66MHz, medium devsel, latency 0, IOMMU group 11

00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Rembrandt Data
Fabric: Device 18h; Function 0
    Flags: fast devsel, IOMMU group 12

00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Rembrandt Data
Fabric: Device 18h; Function 1
    Flags: fast devsel, IOMMU group 12

00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Rembrandt Data
Fabric: Device 18h; Function 2
    Flags: fast devsel, IOMMU group 12

00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Rembrandt Data
Fabric: Device 18h; Function 3
    Flags: fast devsel, IOMMU group 12
    Kernel driver in use: k10temp
    Kernel modules: k10temp

00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Rembrandt Data
Fabric: Device 18h; Function 4
    Flags: fast devsel, IOMMU group 12

00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Rembrandt Data
Fabric: Device 18h; Function 5
    Flags: fast devsel, IOMMU group 12

00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Rembrandt Data
Fabric: Device 18h; Function 6
    Flags: fast devsel, IOMMU group 12

00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Rembrandt Data
Fabric: Device 18h; Function 7
    Flags: fast devsel, IOMMU group 12

01:00.0 VGA compatible controller: NVIDIA Corporation AD107M [GeForce
RTX 4060 Max-Q / Mobile] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: ASUSTeK Computer Inc. AD107M [GeForce RTX 4060 Max-Q / Mobile]
    Physical Slot: 0
    Flags: bus master, fast devsel, latency 0, IRQ 92, IOMMU group 13
    Memory at dc000000 (32-bit, non-prefetchable) [size=16M]
    Memory at 7c00000000 (64-bit, prefetchable) [size=8G]
    Memory at 7e00000000 (64-bit, prefetchable) [size=32M]
    I/O ports at f000 [size=128]
    Expansion ROM at dd000000 [virtual] [disabled] [size=512K]
    Capabilities: <access denied>
    Kernel driver in use: nvidia
    Kernel modules: nouveau, nvidia_drm, nvidia

01:00.1 Audio device: NVIDIA Corporation Device 22be (rev a1)
    Subsystem: ASUSTeK Computer Inc. Device 183d
    Physical Slot: 0
    Flags: bus master, fast devsel, latency 0, IRQ 50, IOMMU group 13
    Memory at dd080000 (32-bit, non-prefetchable) [size=16K]
    Capabilities: <access denied>
    Kernel driver in use: snd_hda_intel
    Kernel modules: snd_hda_intel

02:00.0 Non-Volatile memory controller: Micron Technology Inc Device
5413 (rev 03) (prog-if 02 [NVM Express])
    Subsystem: Micron Technology Inc Device 1100
    Flags: bus master, fast devsel, latency 0, IRQ 55, NUMA node 0,
IOMMU group 14
    Memory at ddc00000 (64-bit, non-prefetchable) [size=16K]
    Capabilities: <access denied>
    Kernel driver in use: nvme
    Kernel modules: nvme

03:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express
Wireless Network Adapter
    Subsystem: Foxconn International, Inc. MT7922 802.11ax PCI Express
Wireless Network Adapter
    Flags: fast devsel, IRQ 96, IOMMU group 15
    Memory at 7e50300000 (64-bit, prefetchable) [size=1M]
    Memory at ddb00000 (64-bit, non-prefetchable) [size=32K]
    Capabilities: <access denied>
    Kernel modules: mt7921e

04:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd.
RTS525A PCI Express Card Reader (rev 01)
    Subsystem: ASUSTeK Computer Inc. RTS525A PCI Express Card Reader
    Flags: bus master, fast devsel, latency 0, IRQ 46, IOMMU group 16
    Memory at dda00000 (32-bit, non-prefetchable) [size=4K]
    Capabilities: <access denied>
    Kernel driver in use: rtsx_pci
    Kernel modules: rtsx_pci

05:00.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge
[Titan Ridge DD 2018] (rev 06) (prog-if 00 [Normal decode])
    Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan
Ridge DD 2018]
    Physical Slot: 0-1
    Flags: bus master, fast devsel, latency 0, IRQ 48, IOMMU group 6
    Bus: primary=05, secondary=06, subordinate=07, sec-latency=0
    I/O behind bridge: c000-dfff [size=8K] [16-bit]
    Memory behind bridge: c4000000-dbffffff [size=384M] [32-bit]
    Prefetchable memory behind bridge: 7e10000000-7e37ffffff
[size=640M] [32-bit]
    Capabilities: <access denied>
    Kernel driver in use: pcieport

06:02.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge
[Titan Ridge DD 2018] (rev 06) (prog-if 00 [Normal decode])
    Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan
Ridge DD 2018]
    Flags: bus master, fast devsel, latency 0, IRQ 96, IOMMU group 6
    Bus: primary=06, secondary=07, subordinate=07, sec-latency=0
    I/O behind bridge: c000-dfff [size=8K] [16-bit]
    Memory behind bridge: c4000000-dbffffff [size=384M] [32-bit]
    Prefetchable memory behind bridge: 7e10000000-7e37ffffff
[size=640M] [32-bit]
    Capabilities: <access denied>
    Kernel driver in use: pcieport

07:00.0 USB controller: Intel Corporation JHL7540 Thunderbolt 3 USB
Controller [Titan Ridge DD 2018] (rev 06) (prog-if 30 [XHCI])
    Subsystem: Intel Corporation JHL7540 Thunderbolt 3 USB Controller
[Titan Ridge DD 2018]
    Flags: bus master, fast devsel, latency 0, IRQ 97, IOMMU group 6
    Memory at c4000000 (32-bit, non-prefetchable) [size=64K]
    Capabilities: <access denied>
    Kernel driver in use: xhci_hcd
    Kernel modules: xhci_pci

75:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] Rembrandt [Radeon 680M] (rev 0a) (prog-if 00 [VGA
controller])
    Subsystem: ASUSTeK Computer Inc. Rembrandt [Radeon 680M]
    Flags: bus master, fast devsel, latency 0, IRQ 42, IOMMU group 17
    Memory at 7e40000000 (64-bit, prefetchable) [size=256M]
    Memory at 7e50000000 (64-bit, prefetchable) [size=2M]
    I/O ports at e000 [size=256]
    Memory at dd900000 (32-bit, non-prefetchable) [size=512K]
    Capabilities: <access denied>
    Kernel driver in use: amdgpu
    Kernel modules: amdgpu

75:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Rembrandt
Radeon High Definition Audio Controller
    Subsystem: ASUSTeK Computer Inc. Rembrandt Radeon High Definition
Audio Controller
    Flags: bus master, fast devsel, latency 0, IRQ 95, IOMMU group 18
    Memory at dd9c8000 (32-bit, non-prefetchable) [size=16K]
    Capabilities: <access denied>
    Kernel driver in use: snd_hda_intel
    Kernel modules: snd_hda_intel

75:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD]
VanGogh PSP/CCP
    Subsystem: ASUSTeK Computer Inc. VanGogh PSP/CCP
    Flags: bus master, fast devsel, latency 0, IRQ 52, IOMMU group 19
    Memory at dd800000 (32-bit, non-prefetchable) [size=1M]
    Memory at dd9cc000 (32-bit, non-prefetchable) [size=8K]
    Capabilities: <access denied>
    Kernel driver in use: ccp
    Kernel modules: ccp

75:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Rembrandt
USB4 XHCI controller #3 (prog-if 30 [XHCI])
    Subsystem: ASUSTeK Computer Inc. Rembrandt USB4 XHCI controller
    Flags: bus master, fast devsel, latency 0, IRQ 41, IOMMU group 20
    Memory at dd700000 (64-bit, non-prefetchable) [size=1M]
    Capabilities: <access denied>
    Kernel driver in use: xhci_hcd
    Kernel modules: xhci_pci

75:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Rembrandt
USB4 XHCI controller #4 (prog-if 30 [XHCI])
    Subsystem: ASUSTeK Computer Inc. Rembrandt USB4 XHCI controller
    Flags: bus master, fast devsel, latency 0, IRQ 43, IOMMU group 21
    Memory at dd600000 (64-bit, non-prefetchable) [size=1M]
    Capabilities: <access denied>
    Kernel driver in use: xhci_hcd
    Kernel modules: xhci_pci

75:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
ACP/ACP3X/ACP6x Audio Coprocessor (rev 60)
    Subsystem: ASUSTeK Computer Inc. ACP/ACP3X/ACP6x Audio Coprocessor
    Flags: bus master, fast devsel, latency 0, IRQ 93, IOMMU group 22
    Memory at dd980000 (32-bit, non-prefetchable) [size=256K]
    Capabilities: <access denied>
    Kernel driver in use: snd_pci_acp6x
    Kernel modules: snd_pci_acp3x, snd_rn_pci_acp3x, snd_pci_acp5x,
snd_pci_acp6x, snd_acp_pci, snd_rpl_pci_acp6x, snd_pci_ps,
snd_sof_amd_renoir, snd_sof_amd_rembrandt

75:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family
17h/19h HD Audio Controller
    DeviceName: HD Audio Controller
    Subsystem: ASUSTeK Computer Inc. Family 17h/19h HD Audio Controller
    Flags: bus master, fast devsel, latency 0, IRQ 56, IOMMU group 23
    Memory at dd9c0000 (32-bit, non-prefetchable) [size=32K]
    Capabilities: <access denied>
    Kernel driver in use: snd_hda_intel
    Kernel modules: snd_hda_intel

76:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] Rembrandt
USB4 XHCI controller #8 (prog-if 30 [XHCI])
    Subsystem: ASUSTeK Computer Inc. Rembrandt USB4 XHCI controller
    Flags: bus master, fast devsel, latency 0, IRQ 47, IOMMU group 24
    Memory at dd400000 (64-bit, non-prefetchable) [size=1M]
    Capabilities: <access denied>
    Kernel driver in use: xhci_hcd
    Kernel modules: xhci_pci

76:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Rembrandt
USB4 XHCI controller #5 (prog-if 30 [XHCI])
    Subsystem: ASUSTeK Computer Inc. Rembrandt USB4 XHCI controller
    Flags: bus master, fast devsel, latency 0, IRQ 49, IOMMU group 25
    Memory at dd300000 (64-bit, non-prefetchable) [size=1M]
    Capabilities: <access denied>
    Kernel driver in use: xhci_hcd
    Kernel modules: xhci_pci

76:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Rembrandt
USB4 XHCI controller #6 (prog-if 30 [XHCI])
    Subsystem: ASUSTeK Computer Inc. Rembrandt USB4 XHCI controller
    Flags: bus master, fast devsel, latency 0, IRQ 51, IOMMU group 26
    Memory at dd200000 (64-bit, non-prefetchable) [size=1M]
    Capabilities: <access denied>
    Kernel driver in use: xhci_hcd
    Kernel modules: xhci_pci

76:00.5 USB controller: Advanced Micro Devices, Inc. [AMD] Rembrandt
USB4/Thunderbolt NHI controller #1 (prog-if 40 [USB4 Host Interface])
    Subsystem: ASUSTeK Computer Inc. Rembrandt USB4/Thunderbolt NHI controller
    Flags: bus master, fast devsel, latency 0, IRQ 44, IOMMU group 27
    Memory at dd500000 (64-bit, non-prefetchable) [size=512K]
    Capabilities: <access denied>
    Kernel driver in use: thunderbolt
    Kernel modules: thunderbolt



-- 
Andrew Marshall

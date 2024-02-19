Return-Path: <linux-usb+bounces-6752-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E47E785ABF8
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 20:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BF3528499A
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 19:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CB350A60;
	Mon, 19 Feb 2024 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFBvmvBJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BA450279
	for <linux-usb@vger.kernel.org>; Mon, 19 Feb 2024 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708370807; cv=none; b=Rla5TizlzdjDXoYdHXKwIYtXa1IKDT1s390+ivoSvhhPCSTlAHvNvyocOq2WmsbFSN6vWvcCHFbKaQzihR8sb805bBupaNy7PBypoj3PStfg1S8Jp1QlyPpQGqhdoKEb+7SWkTF+gh7T3i0Vv/HhRnV4z5gylRL6qrr/nTVG2JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708370807; c=relaxed/simple;
	bh=SziVxjH++kI6boaiMhm6QJmGz3HM1ESWIcqKCHrMUIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ch8EIo7Hk4dMyYb/r5msXxBiHATmENCsDwNfdqJbwj/MJBNm5AAbgBM0Hj01Pw8WOnY+hScaRIMNJDu2g/YgEYbnXcqm90FNuCC+nt56+FENsyXvwrjNC7VOFMpilrDlib3FB0HylloPp67E6icGauTVZ3qnzCSnOzeIpKvYZzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFBvmvBJ; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-21e5fa2f7efso1434765fac.0
        for <linux-usb@vger.kernel.org>; Mon, 19 Feb 2024 11:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708370804; x=1708975604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hdqpgn1koNIrjEm1Lf+AAe+s8J8fJfCOnn8LeiiUmjY=;
        b=JFBvmvBJ88/it1ybpHqpa7DLs+UwZzWButIYDTgfRKzMgHz4oB76quwTWlCKmR3t1z
         tAhccV0d7W+cOMQAXcCyQ26kT+G95hTydT/F/FVi8avqT76JCKnsE5m+zKFogBuHBZk7
         J/D/FNW5D2vbuxlPSsZ/2R2NT544UvmAej2DwGMplWCX5Jn1uIq+Fv2dczXNDEFHGMpg
         vJdAAREIaVms1HniH0781z3S5fVYSBpEyPqjixp/CXTzPtfylOCfpmDcVGiFDp0VdJql
         dzXf9ZJKwRVakCZ8TkBvglZH5VEn2YgKGJIOo1i1f4fD939ymfYzCYMdO7cNKj0N0wZ4
         tUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708370804; x=1708975604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hdqpgn1koNIrjEm1Lf+AAe+s8J8fJfCOnn8LeiiUmjY=;
        b=sdAcB4LO22092lVa7WfH0nglWwyWFo6sj7MNcsR6dmfS5dlnbbBq9eFBoYX2gR6ukk
         5fH8tJ28gS8fHYYrvCTzHgV04+AOi6btO4uOHKLO+ukFIQ+jtWWwR4T/e1ZvVIKunubr
         kK99zauKEe2qOEXUr4xTtgkgeqgKhU9JURDjqECCol9d+Zk0zBRKswtPHJqg8FJ+DMKp
         9GZL2w5hacaKH9Cb8k2f+5ud/zh5BwaTt3V1AMU0CHZR78uR4Fqt2cccAFEcf7rcpYkA
         FgPlTybTF4edjroES84lvNM+CBsV1vdzyt0htvrumpJX0XBsz+hXrHLiaEzT2QocLikw
         U8+Q==
X-Gm-Message-State: AOJu0YxYNyNCBmqOm0Z4lZtxrAlNbvNYaQdsRLIcYAdjVlMp7BUHQLuW
	i9eaPC1tYiLsZDPGrpoGPxY+oOpCaJj/r0RxgUoQWbiOcpOz2w2mX8wgXf7EEhS54diQLL9ayqK
	R0dwE4W+TlJJktr8k2wBy2UMAQDPMJdY+g9Q=
X-Google-Smtp-Source: AGHT+IGIXLkJPk41V8S1sjzHITBFAF08owcc8/fJ+Iq6fcHiMXmIrzp6eKLI0jbOrXqeyiyCJb8daDl0yUah+17iLnI=
X-Received: by 2002:a05:6870:c48:b0:21e:45ff:120d with SMTP id
 lf8-20020a0568700c4800b0021e45ff120dmr9711098oab.44.1708370804011; Mon, 19
 Feb 2024 11:26:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGNgjthcKZEUdFvhHKmkAdwYFTNi5-VZWoXO3DdTyn4v5CNTvw@mail.gmail.com>
In-Reply-To: <CAGNgjthcKZEUdFvhHKmkAdwYFTNi5-VZWoXO3DdTyn4v5CNTvw@mail.gmail.com>
From: Federico L <flicfloc@gmail.com>
Date: Mon, 19 Feb 2024 20:26:07 +0100
Message-ID: <CAGNgjtg_GB+XHkFWqRsi0wj965svVj0K0aD-g++PLJJwe-v_RA@mail.gmail.com>
Subject: Re: Driver bug (?): dwc2 used by bcm2835 (compatible=brcm,bcm2835-usb)
 - please, kindly support
To: linux-usb@vger.kernel.org
Cc: hminas@synopsys.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

here below information I read in
"http://www.linux-usb.org/FAQ.html#ts1" in order to report bugs:

1)
cat /usr/src/linux/REPORTING-BUGS
cat: /usr/src/linux/REPORTING-BUGS: No such file or directory

2)
cat /proc/bus/input/devices
I: Bus=3D001e Vendor=3D0000 Product=3D0000 Version=3D0001
N: Name=3D"vc4-hdmi-0"
P: Phys=3Dvc4-hdmi-0/input0
S: Sysfs=3D/devices/platform/soc/fef00700.hdmi/rc/rc0/input0
U: Uniq=3D
H: Handlers=3Dkbd event0
B: PROP=3D20
B: EV=3D100017
B: KEY=3Dffffc000000000 3ff 0 400000320fc200 40830c900000000 0 210300
49d2c040ec00 1e378000000000 8010000010000000
B: REL=3D3
B: MSC=3D10

I: Bus=3D001e Vendor=3D0000 Product=3D0000 Version=3D0001
N: Name=3D"vc4-hdmi-1"
P: Phys=3Dvc4-hdmi-1/input0
S: Sysfs=3D/devices/platform/soc/fef05700.hdmi/rc/rc1/input1
U: Uniq=3D
H: Handlers=3Dkbd event1
B: PROP=3D20
B: EV=3D100017
B: KEY=3Dffffc000000000 3ff 0 400000320fc200 40830c900000000 0 210300
49d2c040ec00 1e378000000000 8010000010000000
B: REL=3D3
B: MSC=3D10

3)
cat /proc/bus/pci/devices
0000    14e42711        1f                     0
0                      0                0                       0
                 0               0                       0
          0                       0                       0
           0                       0               0        pcieport
0100    11063483        22             600000004
0                      0                0                       0
                 0               0                    1000
          0                       0                       0
           0                       0               0        xhci_hcd

4)
 lsusb -v

Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0
  bDeviceProtocol         1 Single TT
  bMaxPacketSize0        64
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0002 2.0 root hub
  bcdDevice            6.01
  iManufacturer           3 Linux 6.1.0-rpi7-rpi-v8 dwc2_hsotg
  iProduct                2 DWC OTG Controller
  iSerial                 1 fe980000.usb
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0019
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
Hub Descriptor:
  bLength               9
  bDescriptorType      41
  nNbrPorts             1
  wHubCharacteristic 0x0008
    Ganged power switching
    Per-port overcurrent protection
    TT think time 8 FS bits
  bPwrOn2PwrGood        1 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  DeviceRemovable    0x00
  PortPwrCtrlMask    0xff
 Hub Port Status:
   Port 1: 0000.0000
Device Status:     0x0001
  Self Powered

Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0
  bDeviceProtocol         3
  bMaxPacketSize0         9
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0003 3.0 root hub
  bcdDevice            6.01
  iManufacturer           3 Linux 6.1.0-rpi7-rpi-v8 xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:01:00.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x001f
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
        bMaxBurst               0
Hub Descriptor:
  bLength              12
  bDescriptorType      42
  nNbrPorts             4
  wHubCharacteristic 0x0009
    Per-port power switching
    Per-port overcurrent protection
  bPwrOn2PwrGood       50 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  bHubDecLat          0.0 micro seconds
  wHubDelay             0 nano seconds
  DeviceRemovable    0x00
 Hub Port Status:
   Port 1: 0000.02a0 5Gbps power Rx.Detect
   Port 2: 0000.02a0 5Gbps power Rx.Detect
   Port 3: 0000.02a0 5Gbps power Rx.Detect
   Port 4: 0000.02a0 5Gbps power Rx.Detect
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x000f
  bNumDeviceCaps          1
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x02
      Latency Tolerance Messages (LTM) Supported
    wSpeedsSupported   0x0008
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat           4 micro seconds
    bU2DevExitLat         231 micro seconds
Device Status:     0x0001
  Self Powered

Bus 001 Device 002: ID 2109:3431 VIA Labs, Inc. Hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.10
  bDeviceClass            9 Hub
  bDeviceSubClass         0
  bDeviceProtocol         1 Single TT
  bMaxPacketSize0        64
  idVendor           0x2109 VIA Labs, Inc.
  idProduct          0x3431 Hub
  bcdDevice            4.21
  iManufacturer           0
  iProduct                1 USB2.0 Hub
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0019
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              12
Hub Descriptor:
  bLength               9
  bDescriptorType      41
  nNbrPorts             4
  wHubCharacteristic 0x00e0
    Ganged power switching
    Ganged overcurrent protection
    TT think time 32 FS bits
    Port indicators
  bPwrOn2PwrGood       50 * 2 milli seconds
  bHubContrCurrent    100 milli Ampere
  DeviceRemovable    0x00
  PortPwrCtrlMask    0xff
 Hub Port Status:
   Port 1: 0000.0100 power
   Port 2: 0000.0100 power
   Port 3: 0000.0100 power
   Port 4: 0000.0100 power
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x002a
  bNumDeviceCaps          3
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000002
      HIRD Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat           4 micro seconds
    bU2DevExitLat         231 micro seconds
  Container ID Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType      4
    bReserved               0
    ContainerID             {30eef35c-07d5-2549-b001-802d79434c30}
Device Status:     0x0001
  Self Powered

Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0
  bDeviceProtocol         1 Single TT
  bMaxPacketSize0        64
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0002 2.0 root hub
  bcdDevice            6.01
  iManufacturer           3 Linux 6.1.0-rpi7-rpi-v8 xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:01:00.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0019
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
Hub Descriptor:
  bLength               9
  bDescriptorType      41
  nNbrPorts             1
  wHubCharacteristic 0x0009
    Per-port power switching
    Per-port overcurrent protection
    TT think time 8 FS bits
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  DeviceRemovable    0x02
  PortPwrCtrlMask    0xff
 Hub Port Status:
   Port 1: 0000.0507 highspeed power suspend enable connect
Device Status:     0x0001
  Self Powered

5)
sudo lspci -v
00:00.0 PCI bridge: Broadcom Inc. and subsidiaries BCM2711 PCIe Bridge
(rev 20) (prog-if 00 [Normal decode])
        Device tree node:
/sys/firmware/devicetree/base/scb/pcie@7d500000/pci@0,0
        Flags: bus master, fast devsel, latency 0, IRQ 31
        Bus: primary=3D00, secondary=3D01, subordinate=3D01, sec-latency=3D=
0
        Memory behind bridge: 00000000-000fffff [size=3D1M] [32-bit]
        Prefetchable memory behind bridge: [disabled] [64-bit]
        Capabilities: [48] Power Management version 3
        Capabilities: [ac] Express Root Port (Slot-), MSI 00
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [180] Vendor Specific Information: ID=3D0000 Rev=3D0
Len=3D028 <?>
        Capabilities: [240] L1 PM Substates
        Kernel driver in use: pcieport

01:00.0 USB controller: VIA Technologies, Inc. VL805/806 xHCI USB 3.0
Controller (rev 01) (prog-if 30 [XHCI])
        Subsystem: VIA Technologies, Inc. VL805/806 xHCI USB 3.0 Controller
        Device tree node:
/sys/firmware/devicetree/base/scb/pcie@7d500000/pci@0,0/usb@0,0
        Flags: bus master, fast devsel, latency 0, IRQ 34
        Memory at 600000000 (64-bit, non-prefetchable) [size=3D4K]
        Capabilities: [80] Power Management version 3
        Capabilities: [90] MSI: Enable+ Count=3D1/4 Maskable- 64bit+
        Capabilities: [c4] Express Endpoint, MSI 00
        Capabilities: [100] Advanced Error Reporting
        Kernel driver in use: xhci_hcd

6)
 uname -a
Linux casettapi 6.1.0-rpi7-rpi-v8 #1 SMP PREEMPT Debian
1:6.1.63-1+rpt1 (2023-11-24) aarch64 GNU/Linux

 uname -r
6.1.0-rpi7-rpi-v8

Thank you very much in advance,
Br
Federico

On Thu, Feb 15, 2024 at 6:08=E2=80=AFPM Federico L <flicfloc@gmail.com> wro=
te:
>
> Hello,
>
> I put in place a "USB mass storage gadget"
> and basically the device works like a charm.
> For an entire day no issues at all, with my "dumb" device (a regular
> soundbar), the USB-Host, access to it (USB mass storage gadget) just
> like a regular "usb pen drive" without any kind of problem all the day
> long.
> The issue arises when the USB-host stops to access the usb mass
> storage gadget for hours;
> of course, during the night, the bar is powered off and does not play
> sounds, but next morning when I turn it on again, there is no way to
> let the bar access USB mass storage gadget
> until I force a reboot of my Linux machine.
>
> Analyzing logs (dmesg mainly) does not show any kind of issue, error,
> traceback or other, so I tried to investigate more in details, and I
> discovered that the "virtual" usb port created by dwc2 driver (named,
> in my case "fe980000.usb") hangs in "not attached" state forever;
> finally found thanks to this command:
>
> cat /sys/class/udc/fe980000.usb/state
> not attached
>
> I tried several Linux embedded utilities as well as, reset scripts
> found on the the web,
> in order to "reset" the device, the port, the hub, and even the full
> usb-stack, but no way to
> "restore" the right functionality of the virtual usb port, unless
> you do a full fresh reboot.
> After the reboot, the port goes in "not attached" and
> immediately, when I power-on the USB host it goes in "configured" state a=
nd
> works like a charm again.
>
> Among my several tests, I performed:
> 1)
> unbind/bind
>
> 2)
> modprobe -r dwc2
> modprobe dwc2
>
> 3)
> modprobe -r g_mass_storage
> modprobe g_mass_storage file=3D/piusb.bin stall=3D0 removable=3Dy
>
> watching the results in the logs, and every command returns and performs
> right, without any error, but the port still remains, always  "not attach=
ed".
>
> In the end, I tried to create, by myself, a python script with this
> content, and I was
> pretty confident, to get the right result, cause I got in the dmesg logs,
> almost the same identical output I get during a standard reboot:
>
> SyntaxEditor Code Snippet
>
> CMD_UNMOUNT1 =3D "modprobe -r g_mass_storage"
> CMD_SYNC2 =3D "sync"
> CMD_UNMOUNT3 =3D " modprobe -r dwc2"
> CMD_MOUNT4 =3D "modprobe dwc2"
> CMD_MOUNT5 =3D "modprobe g_mass_storage file=3D/piusb.bin stall=3D0 remov=
able=3Dy"
>
> os.system(CMD_UNMOUNT1)
> time.sleep(30)
> os.system(CMD_SYNC2)
> time.sleep(30)
> os.system(CMD_UNMOUNT3)
> time.sleep(30)
> os.system(CMD_MOUNT4)
> time.sleep(30)
> os.system(CMD_MOUNT5)
>
> With this python script I get this log from dmesg, and, this is really
> almost identical to what I get from dmesg during a reboot:
>
> [Feb14 10:35] dwc2 fe980000.usb: remove, state 4
> [  +0.000052] usb usb3: USB disconnect, device number 1
> [  +0.004965] dwc2 fe980000.usb: USB bus 3 deregistered
> [Feb14 10:36] dwc2 fe980000.usb: supply vusb_d not found, using dummy
> regulator
> [  +0.000972] dwc2 fe980000.usb: supply vusb_a not found, using dummy
> regulator
> [  +0.207690] dwc2 fe980000.usb: EPs: 8, dedicated fifos, 4080 entries in
> SPRAM
> [  +0.000173] dwc2 fe980000.usb: DWC OTG Controller
> [  +0.000014] dwc2 fe980000.usb: new USB bus registered, assigned bus
> number 3
> [  +0.000023] dwc2 fe980000.usb: irq 38, io mem 0xfe980000
> [  +0.000155] usb usb3: New USB device found, idVendor=3D1d6b,
> idProduct=3D0002, bcdDevice=3D 6.01
> [  +0.000008] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [  +0.000005] usb usb3: Product: DWC OTG Controller
> [  +0.000005] usb usb3: Manufacturer: Linux 6.1.0-rpi7-rpi-v8 dwc2_hsotg
> [  +0.000005] usb usb3: SerialNumber: fe980000.usb
> [  +0.000315] hub 3-0:1.0: USB hub found
> [  +0.000028] hub 3-0:1.0: 1 port detected
> [ +30.033766] Mass Storage Function, version: 2009/09/11
> [  +0.000033] LUN: removable file: (no medium)
> [  +0.000132] LUN: removable file: /piusb.bin
> [  +0.000016] Number of LUNs=3D1
> [  +0.000271] g_mass_storage gadget.0: Mass Storage Gadget, version:
> 2009/09/11
> [  +0.000020] g_mass_storage gadget.0: userspace failed to provide
> iSerialNumber
> [  +0.000013] g_mass_storage gadget.0: g_mass_storage ready
> [  +0.000019] dwc2 fe980000.usb: bound driver g_mass_storage
> [  +0.297414] dwc2 fe980000.usb: new device is full-speed
> [  +0.363083] dwc2 fe980000.usb: new device is full-speed
> [  +0.964163] dwc2 fe980000.usb: new device is full-speed
> [  +0.964170] dwc2 fe980000.usb: new device is full-speed
>
> Looking at the log, I was pretty confident, but unfortunately, "cat
> /sys/class/udc/fe980000.usb/state" still returns "not attached"
> and power-on the soundbar has no change, it starts blinking as nothing is
> attached.
> Even running the script with the bar powered-on, you can see every
> "cycle", as if you
> manually, remove the cable, and at a time, you put the cable again
> etc.. but no change, it starts blinking and "cat
> /sys/class/udc/fe980000.usb/state" reamins "not attached".
>
> Something is still missing, so I asked some Linux expert and he told me t=
o write
> to the mailing list cause maybe a bug and, to complete, if I do the same =
action
> with a regular usb-key mass storage pendrive, one hundred times, the
> USB-host (soundbar) recognizes it immediately and starts playing with
> no fault at all.
>
> Thank you very much in advance,
> Best regards
> Federico


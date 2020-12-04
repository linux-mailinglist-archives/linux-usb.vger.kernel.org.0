Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D40A2CECB0
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 12:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388045AbgLDLDy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 06:03:54 -0500
Received: from tpserv.tps-expert.ru ([92.50.149.54]:59020 "EHLO
        tpserv.tps-expert.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387969AbgLDLDy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 06:03:54 -0500
X-Greylist: delayed 457 seconds by postgrey-1.27 at vger.kernel.org; Fri, 04 Dec 2020 06:03:54 EST
Received: from localhost (localhost [127.0.0.1])
        by tpserv.tps-expert.ru (Postfix) with ESMTP id 010C28A01D9
        for <linux-usb@vger.kernel.org>; Fri,  4 Dec 2020 15:55:34 +0500 (+05)
X-Virus-Scanned: Debian amavisd-new at tps-expert.ru
Received: from tpserv.tps-expert.ru ([127.0.0.1])
        by localhost (tpserv.tps-expert.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id x8y0I3xpMVHw for <linux-usb@vger.kernel.org>;
        Fri,  4 Dec 2020 15:55:33 +0500 (+05)
Received: by tpserv.tps-expert.ru (Postfix, from userid 1001)
        id B51C78A0579; Fri,  4 Dec 2020 15:55:33 +0500 (+05)
Received: from [127.0.0.1] (DENISW [192.168.0.5])
        (Authenticated sender: denisw@tps-expert.ru)
        by tpserv.tps-expert.ru (Postfix) with ESMTPA id 731038A01D9
        for <linux-usb@vger.kernel.org>; Fri,  4 Dec 2020 15:55:33 +0500 (+05)
To:     linux-usb@vger.kernel.org
From:   =?UTF-8?B?0JTQtdC90LjRgQ==?= <denisw@tps-expert.ru>
Subject: usbhid kernel driver bug?
Message-ID: <cc67eeca-6d74-4e27-85db-11843c7f70db@tps-expert.ru>
Date:   Fri, 4 Dec 2020 15:55:38 +0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: ru
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

My UPS wokrs uncorrectly. it appears and disappears in system after a 
few seconds. help me

Ubuntu 20.04
5.4.0-56-generic

[ 2925.730918] usb 1-1.2: new low-speed USB device number 74 using ehci-pci
[ 2925.848395] usb 1-1.2: New USB device found, idVendor=0d9f, 
idProduct=0004, bcdDevice= 0.02
[ 2925.848402] usb 1-1.2: New USB device strings: Mfr=3, Product=1, 
SerialNumber=2
[ 2925.848405] usb 1-1.2: Product: HID UPS Battery
[ 2925.848409] usb 1-1.2: Manufacturer: POWERCOM Co.,LTD
[ 2925.848411] usb 1-1.2: SerialNumber: 004-0D9F-000
[ 2925.894211] hid-generic 0003:0D9F:0004.01C3: hiddev0,hidraw2: USB HID 
v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on 
usb-0000:00:1a.0-1.2/input0
[ 2929.604764] usb 1-1.2: USB disconnect, device number 74
[ 2932.131003] usb 1-1.2: new low-speed USB device number 75 using ehci-pci
[ 2932.248646] usb 1-1.2: New USB device found, idVendor=0d9f, 
idProduct=0004, bcdDevice= 0.02
[ 2932.248653] usb 1-1.2: New USB device strings: Mfr=3, Product=1, 
SerialNumber=2
[ 2932.248656] usb 1-1.2: Product: HID UPS Battery
[ 2932.248659] usb 1-1.2: Manufacturer: POWERCOM Co.,LTD
[ 2932.248662] usb 1-1.2: SerialNumber: 004-0D9F-000
[ 2932.296611] hid-generic 0003:0D9F:0004.01C4: hiddev0,hidraw2: USB HID 
v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on 
usb-0000:00:1a.0-1.2/input0
[ 2936.004771] usb 1-1.2: USB disconnect, device number 75
[ 2938.531147] usb 1-1.2: new low-speed USB device number 76 using ehci-pci
[ 2938.648654] usb 1-1.2: New USB device found, idVendor=0d9f, 
idProduct=0004, bcdDevice= 0.02
[ 2938.648661] usb 1-1.2: New USB device strings: Mfr=3, Product=1, 
SerialNumber=2
[ 2938.648665] usb 1-1.2: Product: HID UPS Battery
[ 2938.648668] usb 1-1.2: Manufacturer: POWERCOM Co.,LTD
[ 2938.648670] usb 1-1.2: SerialNumber: 004-0D9F-000
[ 2938.695146] hid-generic 0003:0D9F:0004.01C5: hiddev0,hidraw2: USB HID 
v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on 
usb-0000:00:1a.0-1.2/input0
[ 2942.404770] usb 1-1.2: USB disconnect, device number 76
[ 2945.187271] usb 1-1.2: new low-speed USB device number 77 using ehci-pci
[ 2945.304664] usb 1-1.2: New USB device found, idVendor=0d9f, 
idProduct=0004, bcdDevice= 0.02
[ 2945.304670] usb 1-1.2: New USB device strings: Mfr=3, Product=1, 
SerialNumber=2
[ 2945.304674] usb 1-1.2: Product: HID UPS Battery
[ 2945.304677] usb 1-1.2: Manufacturer: POWERCOM Co.,LTD
[ 2945.304680] usb 1-1.2: SerialNumber: 004-0D9F-000
[ 2945.349977] hid-generic 0003:0D9F:0004.01C6: hiddev0,hidraw2: USB HID 
v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on 
usb-0000:00:1a.0-1.2/input0
[ 2949.060775] usb 1-1.2: USB disconnect, device number 77
[ 2951.843390] usb 1-1.2: new low-speed USB device number 78 using ehci-pci
[ 2951.960420] usb 1-1.2: New USB device found, idVendor=0d9f, 
idProduct=0004, bcdDevice= 0.02
[ 2951.960427] usb 1-1.2: New USB device strings: Mfr=3, Product=1, 
SerialNumber=2
[ 2951.960430] usb 1-1.2: Product: HID UPS Battery
[ 2951.960433] usb 1-1.2: Manufacturer: POWERCOM Co.,LTD
[ 2951.960436] usb 1-1.2: SerialNumber: 004-0D9F-000
[ 2952.006860] hid-generic 0003:0D9F:0004.01C7: hiddev0,hidraw2: USB HID 
v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on 
usb-0000:00:1a.0-1.2/input0
[ 2955.716788] usb 1-1.2: USB disconnect, device number 78
[ 2958.499506] usb 1-1.2: new low-speed USB device number 79 using ehci-pci
[ 2958.616917] usb 1-1.2: New USB device found, idVendor=0d9f, 
idProduct=0004, bcdDevice= 0.02
[ 2958.616924] usb 1-1.2: New USB device strings: Mfr=3, Product=1, 
SerialNumber=2
[ 2958.616927] usb 1-1.2: Product: HID UPS Battery
[ 2958.616930] usb 1-1.2: Manufacturer: POWERCOM Co.,LTD
[ 2958.616933] usb 1-1.2: SerialNumber: 004-0D9F-000
[ 2958.666897] hid-generic 0003:0D9F:0004.01C8: hiddev0,hidraw2: USB HID 
v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on 
usb-0000:00:1a.0-1.2/input0
[ 2962.372449] usb 1-1.2: USB disconnect, device number 79


looking at device '/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2':
     KERNEL=="1-1.2"
     SUBSYSTEM=="usb"
     DRIVER=="usb"
     ATTR{configuration}==""
     ATTR{idProduct}=="0004"
     ATTR{speed}=="1.5"
     ATTR{maxchild}=="0"
     ATTR{idVendor}=="0d9f"
     ATTR{urbnum}=="13"
     ATTR{bConfigurationValue}=="1"
     ATTR{bMaxPower}=="100mA"
     ATTR{authorized}=="1"
     ATTR{bMaxPacketSize0}=="8"
     ATTR{version}==" 1.10"
     ATTR{manufacturer}=="POWERCOM Co.,LTD"
     ATTR{product}=="HID UPS Battery"
     ATTR{serial}=="004-0D9F-000"
     ATTR{bmAttributes}=="a0"
     ATTR{rx_lanes}=="1"
     ATTR{devnum}=="41"
     ATTR{quirks}=="0x0"
     ATTR{bNumConfigurations}=="1"
     ATTR{tx_lanes}=="1"
     ATTR{avoid_reset_quirk}=="0"
     ATTR{bcdDevice}=="0002"
     ATTR{devpath}=="1.2"
     ATTR{ltm_capable}=="no"
     ATTR{bNumInterfaces}==" 1"
     ATTR{bDeviceSubClass}=="00"
     ATTR{bDeviceClass}=="00"
     ATTR{bDeviceProtocol}=="00"
     ATTR{busnum}=="1"
     ATTR{removable}=="removable"

   looking at parent device '/devices/pci0000:00/0000:00:1a.0/usb1/1-1':
     KERNELS=="1-1"
     SUBSYSTEMS=="usb"
     DRIVERS=="usb"
     ATTRS{bmAttributes}=="e0"
     ATTRS{tx_lanes}=="1"
     ATTRS{idVendor}=="8087"
     ATTRS{authorized}=="1"
     ATTRS{removable}=="fixed"
     ATTRS{quirks}=="0x0"
     ATTRS{urbnum}=="14622"
     ATTRS{configuration}==""
     ATTRS{bMaxPacketSize0}=="64"
     ATTRS{bConfigurationValue}=="1"
     ATTRS{bcdDevice}=="0005"
     ATTRS{maxchild}=="4"
     ATTRS{devpath}=="1"
     ATTRS{version}==" 2.00"
     ATTRS{ltm_capable}=="no"
     ATTRS{bMaxPower}=="0mA"
     ATTRS{devnum}=="2"
     ATTRS{speed}=="480"
     ATTRS{bDeviceClass}=="09"
     ATTRS{avoid_reset_quirk}=="0"
     ATTRS{bDeviceSubClass}=="00"
     ATTRS{rx_lanes}=="1"
     ATTRS{busnum}=="1"
     ATTRS{bNumInterfaces}==" 1"
     ATTRS{idProduct}=="8008"
     ATTRS{bNumConfigurations}=="1"
     ATTRS{bDeviceProtocol}=="01"

   looking at parent device '/devices/pci0000:00/0000:00:1a.0/usb1':
     KERNELS=="usb1"
     SUBSYSTEMS=="usb"
     DRIVERS=="usb"
     ATTRS{interface_authorized_default}=="1"
     ATTRS{rx_lanes}=="1"
     ATTRS{bmAttributes}=="e0"
     ATTRS{tx_lanes}=="1"
     ATTRS{serial}=="0000:00:1a.0"
     ATTRS{bConfigurationValue}=="1"
     ATTRS{bNumConfigurations}=="1"
     ATTRS{bMaxPacketSize0}=="64"
     ATTRS{bDeviceSubClass}=="00"
     ATTRS{authorized}=="1"
     ATTRS{maxchild}=="2"
     ATTRS{bDeviceProtocol}=="00"
     ATTRS{bcdDevice}=="0504"
     ATTRS{idProduct}=="0002"
     ATTRS{bDeviceClass}=="09"
     ATTRS{bMaxPower}=="0mA"
     ATTRS{ltm_capable}=="no"
     ATTRS{product}=="EHCI Host Controller"
     ATTRS{manufacturer}=="Linux 5.4.0-56-generic ehci_hcd"
     ATTRS{quirks}=="0x0"
     ATTRS{bNumInterfaces}==" 1"
     ATTRS{avoid_reset_quirk}=="0"
     ATTRS{devpath}=="0"
     ATTRS{busnum}=="1"
     ATTRS{speed}=="480"
     ATTRS{removable}=="unknown"
     ATTRS{idVendor}=="1d6b"
     ATTRS{urbnum}=="24"
     ATTRS{configuration}==""
     ATTRS{authorized_default}=="1"
     ATTRS{devnum}=="1"
     ATTRS{version}==" 2.00"

   looking at parent device '/devices/pci0000:00/0000:00:1a.0':
     KERNELS=="0000:00:1a.0"
     SUBSYSTEMS=="pci"
     DRIVERS=="ehci-pci"
     ATTRS{subsystem_vendor}=="0x1043"
     ATTRS{consistent_dma_mask_bits}=="32"
     ATTRS{dma_mask_bits}=="32"
     ATTRS{class}=="0x0c0320"
     ATTRS{driver_override}=="(null)"
     ATTRS{uframe_periodic_max}=="100"
     ATTRS{local_cpus}=="f"
     ATTRS{msi_bus}=="1"
     ATTRS{companion}==""
     ATTRS{irq}=="20"
     ATTRS{vendor}=="0x8086"
     ATTRS{enable}=="1"
     ATTRS{d3cold_allowed}=="1"
     ATTRS{ari_enabled}=="0"
     ATTRS{subsystem_device}=="0x8534"
     ATTRS{numa_node}=="-1"
     ATTRS{local_cpulist}=="0-3"
     ATTRS{revision}=="0x05"
     ATTRS{device}=="0x8c2d"
     ATTRS{broken_parity_status}=="0"

   looking at parent device '/devices/pci0000:00':
     KERNELS=="pci0000:00"
     SUBSYSTEMS==""
     DRIVERS==""



On older ubuntu this hardware works fine



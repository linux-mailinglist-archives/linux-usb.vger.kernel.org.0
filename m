Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6823EC602
	for <lists+linux-usb@lfdr.de>; Sun, 15 Aug 2021 01:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233644AbhHNXmX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Aug 2021 19:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233549AbhHNXmX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Aug 2021 19:42:23 -0400
X-Greylist: delayed 575 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 14 Aug 2021 16:41:53 PDT
Received: from pasta.tip.net.au (pasta.pcug.org.au [IPv6:2401:fc00:0:129::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B9CC061764
        for <linux-usb@vger.kernel.org>; Sat, 14 Aug 2021 16:41:53 -0700 (PDT)
Received: from pasta.tip.net.au (pasta.pcug.org.au [IPv6:2401:fc00:0:129::4])
        by mailhost.tip.net.au (Postfix) with ESMTP id 4GnGt43RPdz9PYm
        for <linux-usb@vger.kernel.org>; Sun, 15 Aug 2021 09:32:12 +1000 (AEST)
Received: from e4.eyal.emu.id.au (unknown [121.45.32.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by pasta.tip.net.au (Postfix) with ESMTPSA id 4GnGt42ljsz8tSW
        for <linux-usb@vger.kernel.org>; Sun, 15 Aug 2021 09:32:12 +1000 (AEST)
To:     linux-usb@vger.kernel.org
From:   Eyal Lebedinsky <eyal@eyal.emu.id.au>
Subject: USB hub problem
Message-ID: <3481f401-1d52-d5a1-d983-4b5f7046704b@eyal.emu.id.au>
Date:   Sun, 15 Aug 2021 09:32:06 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I have an external 4-way USB3.0 hub (I actually have two of them) That do not behave as expected.
It is an XCD XCDESSUSBH4BK. It is unpowered. I am on fedora 34, kernel 5.13.8-200.fc34.x86_64

For starters, I found that attaching a USB SSD does not allow booting from it.
I then found that when attaching my phone it is not recognized.

I searched the hub model and IDs but did not find relevant information.
Is there an official list of supported hubs (or devices)?

Here is what it looks like.

When the hub is attached (no phone) I see
         Bus 001 Device 048: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
and
         /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
             |__ Port 5: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
                 |__ Port 2: Dev 48, If 0, Class=Hub, Driver=hub/4p, 480M
Attaching the phone does not add a device.

Detaching/attaching the hub (with the phone already plugged in) I get
         Bus 001 Device 052: ID 04e8:6860 Samsung Electronics Co., Ltd Galaxy A5 (MTP)
         Bus 001 Device 051: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
and
         /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
             |__ Port 5: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
                 |__ Port 2: Dev 51, If 0, Class=Hub, Driver=hub/4p, 480M
                     |__ Port 1: Dev 52, If 1, Class=Communications, Driver=cdc_acm, 480M
                     |__ Port 1: Dev 52, If 2, Class=CDC Data, Driver=cdc_acm, 480M
                     |__ Port 1: Dev 52, If 0, Class=Imaging, Driver=, 480M
                     |__ Port 1: Dev 52, If 3, Class=Vendor Specific Class, Driver=, 480M
and the phone is recognized and accessible as MTP device.

Here are the logged messages for the two situations.

## attach hub (no phone):
Aug 15 09:05:31 e7 pipewire[97866]: 8 events suppressed
Aug 15 09:05:31 e7 kernel: usb 2-5.2: new SuperSpeed USB device number 12 using xhci_hcd
Aug 15 09:05:31 e7 kernel: usb 2-5.2: New USB device found, idVendor=0bda, idProduct=0411, bcdDevice= 1.04
Aug 15 09:05:31 e7 kernel: usb 2-5.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Aug 15 09:05:31 e7 kernel: usb 2-5.2: Product: 4-Port USB 3.0 Hub
Aug 15 09:05:31 e7 kernel: usb 2-5.2: Manufacturer: Generic
Aug 15 09:05:31 e7 kernel: hub 2-5.2:1.0: USB hub found
Aug 15 09:05:31 e7 kernel: hub 2-5.2:1.0: 4 ports detected
Aug 15 09:05:31 e7 kernel: usb 1-5.2: new high-speed USB device number 55 using xhci_hcd
Aug 15 09:05:31 e7 kernel: usb 1-5.2: New USB device found, idVendor=0bda, idProduct=5411, bcdDevice= 1.04
Aug 15 09:05:31 e7 kernel: usb 1-5.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Aug 15 09:05:31 e7 kernel: usb 1-5.2: Product: 4-Port USB 2.0 Hub
Aug 15 09:05:31 e7 kernel: usb 1-5.2: Manufacturer: Generic
Aug 15 09:05:31 e7 kernel: hub 1-5.2:1.0: USB hub found
Aug 15 09:05:31 e7 kernel: hub 1-5.2:1.0: 4 ports detected
Aug 15 09:05:31 e7 systemd-udevd[279738]: 2-5.2: Process '/bin/sh -c 'test -f /sys/module/usbcore/parameters/usbfs_memory_mb && test $(cat /sys/module/usbcore/parameters/usbfs_memory_mb) -lt 256 && echo 256 > /sys/module/usbcore/parameters/usbfs_memory_mb'' failed with exit code 1.
Aug 15 09:05:31 e7 journal[3313]: treating change event as add on /sys/devices/pci0000:00/0000:00:14.0/usb2/2-5/2-5.2
Aug 15 09:05:31 e7 systemd-udevd[279738]: 2-5.2:1.0: Process '/bin/sh -c 'test -f /sys/module/usbcore/parameters/usbfs_memory_mb && test $(cat /sys/module/usbcore/parameters/usbfs_memory_mb) -lt 256 && echo 256 > /sys/module/usbcore/parameters/usbfs_memory_mb'' failed with exit code 1.
Aug 15 09:05:31 e7 systemd-udevd[279741]: 1-5.2: Process '/bin/sh -c 'test -f /sys/module/usbcore/parameters/usbfs_memory_mb && test $(cat /sys/module/usbcore/parameters/usbfs_memory_mb) -lt 256 && echo 256 > /sys/module/usbcore/parameters/usbfs_memory_mb'' failed with exit code 1.
Aug 15 09:05:31 e7 journal[3313]: treating change event as add on /sys/devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5.2
Aug 15 09:05:31 e7 systemd-udevd[279738]: 1-5.2:1.0: Process '/bin/sh -c 'test -f /sys/module/usbcore/parameters/usbfs_memory_mb && test $(cat /sys/module/usbcore/parameters/usbfs_memory_mb) -lt 256 && echo 256 > /sys/module/usbcore/parameters/usbfs_memory_mb'' failed with exit code 1.
Aug 15 09:05:31 e7 Thunar[279748]: thunar-volman: Unsupported USB device type "usb".
Aug 15 09:05:31 e7 Thunar[279764]: thunar-volman: Unsupported USB device type "hub".
Aug 15 09:05:31 e7 Thunar[279768]: thunar-volman: Unsupported USB device type "usb".
Aug 15 09:05:31 e7 Thunar[279772]: thunar-volman: Unsupported USB device type "hub".

## plug phone:
         (no new messages)

## attach hub with phone already plugged in:
Aug 15 09:07:06 e7 kernel: usb 2-5.2: new SuperSpeed USB device number 13 using xhci_hcd
Aug 15 09:07:06 e7 kernel: usb 2-5.2: New USB device found, idVendor=0bda, idProduct=0411, bcdDevice= 1.04
Aug 15 09:07:06 e7 kernel: usb 2-5.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Aug 15 09:07:06 e7 kernel: usb 2-5.2: Product: 4-Port USB 3.0 Hub
Aug 15 09:07:06 e7 kernel: usb 2-5.2: Manufacturer: Generic
Aug 15 09:07:06 e7 kernel: hub 2-5.2:1.0: USB hub found
Aug 15 09:07:06 e7 kernel: hub 2-5.2:1.0: 4 ports detected
Aug 15 09:07:07 e7 kernel: usb 1-5.2: new high-speed USB device number 56 using xhci_hcd
Aug 15 09:07:07 e7 kernel: usb 1-5.2: New USB device found, idVendor=0bda, idProduct=5411, bcdDevice= 1.04
Aug 15 09:07:07 e7 kernel: usb 1-5.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Aug 15 09:07:07 e7 kernel: usb 1-5.2: Product: 4-Port USB 2.0 Hub
Aug 15 09:07:07 e7 kernel: usb 1-5.2: Manufacturer: Generic
Aug 15 09:07:07 e7 kernel: hub 1-5.2:1.0: USB hub found
Aug 15 09:07:07 e7 kernel: hub 1-5.2:1.0: 4 ports detected
Aug 15 09:07:07 e7 systemd-udevd[279927]: 2-5.2: Process '/bin/sh -c 'test -f /sys/module/usbcore/parameters/usbfs_memory_mb && test $(cat /sys/module/usbcore/parameters/usbfs_memory_mb) -lt 256 && echo 256 > /sys/module/usbcore/parameters/usbfs_memory_mb'' failed with exit code 1.
Aug 15 09:07:07 e7 journal[3313]: treating change event as add on /sys/devices/pci0000:00/0000:00:14.0/usb2/2-5/2-5.2
Aug 15 09:07:07 e7 systemd-udevd[279927]: 2-5.2:1.0: Process '/bin/sh -c 'test -f /sys/module/usbcore/parameters/usbfs_memory_mb && test $(cat /sys/module/usbcore/parameters/usbfs_memory_mb) -lt 256 && echo 256 > /sys/module/usbcore/parameters/usbfs_memory_mb'' failed with exit code 1.
Aug 15 09:07:07 e7 systemd-udevd[279930]: 1-5.2: Process '/bin/sh -c 'test -f /sys/module/usbcore/parameters/usbfs_memory_mb && test $(cat /sys/module/usbcore/parameters/usbfs_memory_mb) -lt 256 && echo 256 > /sys/module/usbcore/parameters/usbfs_memory_mb'' failed with exit code 1.
Aug 15 09:07:07 e7 journal[3313]: treating change event as add on /sys/devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5.2
Aug 15 09:07:07 e7 systemd-udevd[279927]: 1-5.2:1.0: Process '/bin/sh -c 'test -f /sys/module/usbcore/parameters/usbfs_memory_mb && test $(cat /sys/module/usbcore/parameters/usbfs_memory_mb) -lt 256 && echo 256 > /sys/module/usbcore/parameters/usbfs_memory_mb'' failed with exit code 1.
Aug 15 09:07:07 e7 Thunar[279937]: thunar-volman: Unsupported USB device type "usb".
Aug 15 09:07:07 e7 Thunar[279952]: thunar-volman: Unsupported USB device type "hub".
Aug 15 09:07:07 e7 Thunar[279956]: thunar-volman: Unsupported USB device type "usb".
Aug 15 09:07:07 e7 Thunar[279960]: thunar-volman: Unsupported USB device type "hub".
Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: new high-speed USB device number 57 using xhci_hcd
Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: New USB device found, idVendor=04e8, idProduct=6860, bcdDevice= 4.00
Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: New USB device strings: Mfr=2, Product=3, SerialNumber=4
Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: Product: SAMSUNG_Android
Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: Manufacturer: SAMSUNG
Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: SerialNumber: 0019ae8070ad3f
Aug 15 09:07:07 e7 kernel: cdc_acm 1-5.2.1:1.1: ttyACM0: USB ACM device
Aug 15 09:07:07 e7 systemd-udevd[279927]: 1-5.2.1: Process '/bin/sh -c 'test -f /sys/module/usbcore/parameters/usbfs_memory_mb && test $(cat /sys/module/usbcore/parameters/usbfs_memory_mb) -lt 256 && echo 256 > /sys/module/usbcore/parameters/usbfs_memory_mb'' failed with exit code 1.
Aug 15 09:07:07 e7 systemd-udevd[279927]: 1-5.2.1:1.0: Process '/bin/sh -c 'test -f /sys/module/usbcore/parameters/usbfs_memory_mb && test $(cat /sys/module/usbcore/parameters/usbfs_memory_mb) -lt 256 && echo 256 > /sys/module/usbcore/parameters/usbfs_memory_mb'' failed with exit code 1.
Aug 15 09:07:07 e7 systemd-udevd[279930]: 1-5.2.1:1.1: Process '/bin/sh -c 'test -f /sys/module/usbcore/parameters/usbfs_memory_mb && test $(cat /sys/module/usbcore/parameters/usbfs_memory_mb) -lt 256 && echo 256 > /sys/module/usbcore/parameters/usbfs_memory_mb'' failed with exit code 1.
Aug 15 09:07:07 e7 systemd-udevd[279970]: 1-5.2.1:1.2: Process '/bin/sh -c 'test -f /sys/module/usbcore/parameters/usbfs_memory_mb && test $(cat /sys/module/usbcore/parameters/usbfs_memory_mb) -lt 256 && echo 256 > /sys/module/usbcore/parameters/usbfs_memory_mb'' failed with exit code 1.
Aug 15 09:07:07 e7 systemd-udevd[279971]: 1-5.2.1:1.3: Process '/bin/sh -c 'test -f /sys/module/usbcore/parameters/usbfs_memory_mb && test $(cat /sys/module/usbcore/parameters/usbfs_memory_mb) -lt 256 && echo 256 > /sys/module/usbcore/parameters/usbfs_memory_mb'' failed with exit code 1.
Aug 15 09:07:07 e7 journal[1648]: CdMain: failed to emit DeviceAdded: failed to register object: An object is already exported for the interface org.freedesktop.ColorManager.Device at /org/freedesktop/ColorManager/devices/sysfs__null_
Aug 15 09:07:07 e7 journal[1648]: CdMain: failed to emit DeviceAdded: failed to register object: An object is already exported for the interface org.freedesktop.ColorManager.Device at /org/freedesktop/ColorManager/devices/sysfs__null_
Aug 15 09:07:07 e7 journal[1648]: CdMain: failed to emit DeviceAdded: failed to register object: An object is already exported for the interface org.freedesktop.ColorManager.Device at /org/freedesktop/ColorManager/devices/sysfs__null_

-- 
Eyal Lebedinsky (eyal@eyal.emu.id.au)

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABCC2FBED3
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 19:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbhASSVy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 13:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403965AbhASSVl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 13:21:41 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7D0C061574
        for <linux-usb@vger.kernel.org>; Tue, 19 Jan 2021 10:21:00 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id d81so26357405iof.3
        for <linux-usb@vger.kernel.org>; Tue, 19 Jan 2021 10:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=randomnotes-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=d0LQYnSSwDHxvNapYa/8Cf3qPMBLWUFpusNkHQ0hMak=;
        b=gwzFikqStPSco6ed4qM39J/GFeXkHP6l3kqYRCIcaHpE6sTb2M9S+k7jBU09XqeTTk
         n1YAsADbNsHboWRiRDPCLx5ydxn5bKYqkjkkIRqt2ErHo3fqZvBZoJlmPEsHD2GeG+qR
         yiRYwk58/MMaKHze5wjmen2k3mjV4MY9HSa/iLUMwQxDsAA/0pUjbPXZt60ML+v9zolN
         ASeUN3QzLLBKm6/vCktvZitKulmqeJoiQt8b2a5meh7JcJuhZxzG/BYPS9xId1P+1Aqk
         DNu7UGFSOTYVYt+v+GVM36zOOz1Xn4lC/+9q+qg73ibbykWufqFmoio7StpSQzxvFdSF
         AQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=d0LQYnSSwDHxvNapYa/8Cf3qPMBLWUFpusNkHQ0hMak=;
        b=EdI7swDYi48FT00wzOxv1nqYLfWKLb7TR3F4KrBP/hAb/kujqwkumolb8CNXNCMtL3
         a6wdcM+2hHU6HQeChfoRntm5DpnP+GBH4da82r7TcJlePgf47ZiTGHcHRPmYRYN1dJuj
         xCJgJtB5fu9wAU2W/cVSbGxFpeeQrey5Qh44WjpJCOzCiGj3B6m+VMWYv8eU/m2hECMx
         I5yRx3RwaZR6rlTMcV+aXhIorvRoTDgo9oDeT0ale3iOYqcT/U6tSlbX9gPWOKd7SBE3
         81CktHGfVqj15aftqMxmqN6dUguWjXPvpJurSteti8G8RAWaPevA1KKn9eYf+SiIyq+z
         WRTg==
X-Gm-Message-State: AOAM531Ct/n8x9htqt6brUy6rIYqJJk+WmTfDWTW90/H19j4AwM7s50I
        qvmKU8EF3axhg30oIHvdxNCdnLMJ+nH8mrSgnfPM6oDW8nOq/K83
X-Google-Smtp-Source: ABdhPJyEe58Wnm6bs4c800S4Zqhce1fPjOx9WWpsP0CrckOK6u3pImGaJS1iJ9wc/WLWhxbKTrelk5888qmuk6MCTvw=
X-Received: by 2002:a5e:c00e:: with SMTP id u14mr3847158iol.194.1611080459646;
 Tue, 19 Jan 2021 10:20:59 -0800 (PST)
MIME-Version: 1.0
From:   Doug Kingston <dpk@randomnotes.org>
Date:   Tue, 19 Jan 2021 10:20:34 -0800
Message-ID: <CAGPaoUucowcpa5k_9VVjnRnrUkiG=npiCJYaOyT6-Ya7hEfJKg@mail.gmail.com>
Subject: USB Sound Device detection problem
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I am doing some work setting up some radio data nodes that use USB
soundcard devices to attach to radios.  I am building a system with
two radios and two identical soundcard devices attached to a Raspberry
Pi running Raspbian.  The devices are discovered at boot time by the
hid-generic subsystem:

(see dmesg output below)

I am accessing the sound devices from Wine via the ALSA stack.  The
problem I have is that
the product string is identical for both devices and they show up
identically to the Windows app ("USB PnP Sound Device").  I need to
find a way to alter this string so that they are different.  If they
were processed by udev I might be able to do something there.

The options seem to be:
1) fix at kernel usb discovery
2) somehow fix in the ALSA library (snd_*)
3) fix in Wine (mmsys.drv / winealsa.drv/mmdevdrv.c
4) somewhere else?

And, we need to do this in a supportable fashion that does not break
existing users of this subsystem.

Do you have any suggestions?

Regards,
  -Doug-


winlink@acs-vara-cappark:~$ lsusb
Bus 004 Device 002: ID 8087:8000 Intel Corp.
Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 002: ID 8087:8008 Intel Corp.
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 003: ID 0d8c:013a C-Media Electronics, Inc.
Bus 001 Device 002: ID 0403:6015 Future Technology Devices
International, Ltd Bridge(I2C/SPI/UART/FIFO)
Bus 001 Device 004: ID 0d8c:013a C-Media Electronics, Inc.
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

winlink@acs-vara-cappark:~$ amixer -c 2 info
Card hw:2 'Device'/'C-Media Electronics Inc. USB PnP Sound Device at
usb-0000:00:14.0-9, full speed'
  Mixer name : 'USB Mixer'
  Components : 'USB0d8c:013a'
  Controls      : 10
  Simple ctrls  : 3
winlink@acs-vara-cappark:~$ amixer -c 3 info
Card hw:3 'Device_1'/'C-Media Electronics Inc. USB PnP Sound Device at
usb-0000:00:14.0-10, full spee'
  Mixer name : 'USB Mixer'
  Components : 'USB0d8c:013a'
  Controls      : 10
  Simple ctrls  : 3
winlink@acs-vara-cappark:~$

dmesg output:

[    1.743798] usb 3-1: New USB device found, idVendor=8087,
idProduct=8008, bcdDevice= 0.04
[    1.743799] usb 3-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    1.743935] hub 3-1:1.0: USB hub found
[    1.744047] hub 3-1:1.0: 6 ports detected
[    1.759796] usb 4-1: New USB device found, idVendor=8087,
idProduct=8000, bcdDevice= 0.04
[    1.759799] usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    1.759921] hub 4-1:1.0: USB hub found
[    1.760055] hub 4-1:1.0: 8 ports detected
[    1.831425] usb 1-9: new full-speed USB device number 3 using xhci_hcd
[    2.020574] usb 1-9: New USB device found, idVendor=0d8c,
idProduct=013a, bcdDevice= 1.00
[    2.020576] usb 1-9: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    2.020577] usb 1-9: Product: USB PnP Sound Device
[    2.020577] usb 1-9: Manufacturer: C-Media Electronics Inc.
[    2.025323] hidraw: raw HID events driver (C) Jiri Kosina
[    2.027693] usbcore: registered new interface driver usbhid
[    2.027694] usbhid: USB HID core driver
[    2.028580] input: C-Media Electronics Inc.       USB PnP Sound
Device as /devices/pci0000:00/0000:00:14.0/usb1/1-9/1-9:1.3/0003:0D8C:013A.0001/input/input3
[    2.087471] hid-generic 0003:0D8C:013A.0001: input,hidraw0: USB HID
v1.00 Device [C-Media Electronics Inc.       USB PnP Sound Device] on
usb-0000:00:14.0-9/input3
[    2.171437] usb 1-10: new full-speed USB device number 4 using xhci_hcd
[    2.288774] EXT4-fs (dm-0): mounted filesystem with ordered data
mode. Opts: (null)
[    2.299437] [drm] Cannot find any crtc or sizes
[    2.364637] usb 1-10: New USB device found, idVendor=0d8c,
idProduct=013a, bcdDevice= 1.00
[    2.364639] usb 1-10: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[    2.364641] usb 1-10: Product: USB PnP Sound Device
[    2.364641] usb 1-10: Manufacturer: C-Media Electronics Inc.
[    2.365761] input: C-Media Electronics Inc.       USB PnP Sound
Device as /devices/pci0000:00/0000:00:14.0/usb1/1-10/1-10:1.3/0003:0D8C:013A.0002/input/input4
[    2.423454] hid-generic 0003:0D8C:013A.0002: input,hidraw1: USB HID
v1.00 Device [C-Media Electronics Inc.       USB PnP Sound Device] on
usb-0000:00:14.0-10/input3

-Doug-

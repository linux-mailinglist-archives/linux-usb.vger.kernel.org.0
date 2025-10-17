Return-Path: <linux-usb+bounces-29413-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEAABEAC20
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 18:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DB2094743F
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 16:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1882BE631;
	Fri, 17 Oct 2025 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYb7fHXr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF5429AB11
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 16:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760718147; cv=none; b=iZnGrPyopJGhc7VMtlQQofULyKTGjxtXkD7SObsA/30Jnmx468fxHZYJDwM34rK3RJgzSic5A0OIMMeXXEN9txJOL59WK8tLjXvOlWfTAeTKdWqC/8mklmSKEPB/w/AUiOBf+3NMIOne1HuImHCYAMKvihyR4QpMb4kblN8KH6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760718147; c=relaxed/simple;
	bh=ji4O3kJuvAWf9KxkSL59dxI7FAARlWgzXg5ruGa0RY0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=oDqGdJNcBCWkVCPLgOXPykgHY6Rkyjwe8zIYlFEAzya4jgfsVcQ5yC5ZA8d9bg9w5vjCXmrkDV885LA/ZXM0bFvrV/zKdU6S6taR/Axi8o4f6DCMv1ZbYoBsBsHZjfp75O5EFZecVdtHcx8kvJX8ZyW6SC7URM8bLCrmlFCOMBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYb7fHXr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-427084a641aso486614f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760718144; x=1761322944; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5dy939i+sggNUzLELn5SkuYv/G5ubAaOJXAQKuDPefU=;
        b=bYb7fHXrz4JMWZ5S9bqubnHLg6YzE8fHyH2pmZXcKxn/P1dBxI4nJFm2wFuzWAFahd
         EWDZ4jWI+HDa8Tk/euVQuHWjN7MqPL5tji7g63aD1F6r1z5Lqd3i4cmIIqyqf/qdXgAc
         Xz+bYHnl6dGZQtpbCkw72v1ms2OcFQOWbgWGnCyrV6W9YoG195hZC/zIg7Z9ejgmbD40
         94Ic+lLQxWN3FARDbZsEkdfsEi7AD9E24r69cuZTarwDD8ib2sBerHUIy6VBAobnP3RK
         P4xSIaCyYlziq65fRg05HG9iNbKT436r8yLHt7HZnQ7AMOUGgVxLwOuI8hPe9xIVAM6e
         9k6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718144; x=1761322944;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dy939i+sggNUzLELn5SkuYv/G5ubAaOJXAQKuDPefU=;
        b=KgOSZERn45uyp7M/g25lpaN11SqsZzfdqrFNNXPiL0ujwf9G6sqHZwxvOpxjvx1hPx
         Q4YjeCRqDVPTaP2caNT7qmUemG7nbLQMxxfNvCDmxQYes1ugZEcrrebk9QEjidS0yGnx
         vfog0kIqWyZnJWQf6G3DFpvlsilq/BAMk22QrEB3hCO0Goi6Y1NgFg19pfwwZfJ4lAUi
         nLHUd5BSLRs9GVWvqtjA07VdLVQqrwxfDm6MSRjORLAAIRn9iKUGx7RuOJ8Mfek8F9XX
         kUrDmNPVwFIHMIPlsZ7F8avexmCnzwMd6DJFSXmHtAtGmPcagBkBwDPHiCvp9cpxbCRg
         BdeA==
X-Forwarded-Encrypted: i=1; AJvYcCXXqZa3VH8+bl3QE4l5ZVuHsgkJ8FcimR9t/IZ9mS21pDgwQ4m7lGACLR3TS0DfKO+s6QNbUeTw96A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtRZUyef11aDRGT9dcjlctpEE2f8C7isPAImDhzcxPtzl/FUsy
	k2Fgga4pQhizX/6DC9TDxbUBSijTQxJN8182zKTsu/I76hDAQiOCQ1TLtKotjkcgobu+EWnwJcp
	+dwkQKfP3xv2z8QGSF74+NSfo+3afQCfFap7I
X-Gm-Gg: ASbGncvekMTkntQ4q/UaNRjH4qmXZjdmO4HYHY784m2KZSqEBNGMF1wY39zevhl9XpG
	DSkznYL/abYPvcqWfNPFV1H7sVsVHWz5MGNnTjeIr/uLmH4Wzx3lZvpw84To43sd01vYPVYsgH1
	+3pxyX5J51yakd+7gBiR4/5JbQ3pYPiXVFIrYuO3oNqXg2qxv6axELA4Mh6lX7glDbonsI1tDHM
	x4oUAua37N8ZZl/P5jg8zA+y1/7g/pzCTC8rNUD0KaZFdyVpCEnFdOqA93ZANw4jLZd4OYiHSXG
	7O6s0lt/Kh8H2hiR
X-Google-Smtp-Source: AGHT+IFuqHIKBLC5zjmri8npJ2cjtntUHsi1/9aod93dMjtxXXAVfWCwBr7TMm5+oNmFoORqq6E2Er0fR8Jbplp+uFQ=
X-Received: by 2002:a05:6000:178e:b0:3ec:2529:b4e5 with SMTP id
 ffacd0b85a97d-42704d966c5mr3418562f8f.38.1760718143619; Fri, 17 Oct 2025
 09:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: The-Luga <lugathe2@gmail.com>
Date: Fri, 17 Oct 2025 13:22:12 -0300
X-Gm-Features: AS18NWDS515xe7elMn_Sg0UkjBEBKP861Za6cSdz_oJIqVxDQHo3oQoPL-EqyU8
Message-ID: <CALvgqEAq8ZWgG4Dyg_oL7_+nUDy+LUoTXi+-6aceO-AKtBS3Mg@mail.gmail.com>
Subject: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself when
 RGB brightness button is used under Linux
To: linux-sound@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Device: Edifier QR30 USB Speakers
Vendor: Jieli Technology
USB ID: 2d99:a101
Firmware label in descriptors: "EDIFIER Hal0 2.0 SE"
Kernel tested:  6.12.53-1-lts and 6.17.2-arch1-1
Distribution: Arch Linux
DE: Gnome 49


Problem:
When connected via USB on Linux, rotating the built-in RGB brightness
button on the speaker causes an immediate USB disconnect/reconnect
(firmware reboot).
This does NOT occur under Windows.

Steps to reproduce:
1. Connect Edifier QR30 via USB.
2. Confirm working playback.
3. Rotate the RGB brightness button on the side of the speaker.
4. Observe immediate reboot/disconnect.


```
> lsusb -t

/:  Bus 003.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 480M
    |__ Port 002: Dev 002, If 0, Class=3DAudio, Driver=3Dsnd-usb-audio, 12M
    |__ Port 002: Dev 002, If 1, Class=3DAudio, Driver=3Dsnd-usb-audio, 12M
    |__ Port 002: Dev 002, If 2, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
    |__ Port 002: Dev 002, If 3, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M

```

I tried unbinding every HID device :

```
> echo -n '3-2:1.2' | sudo tee /sys/bus/usb/drivers/usbhid/unbind
3-2:1.2%
> echo -n '3-2:1.3' | sudo tee /sys/bus/usb/drivers/usbhid/unbind
3-2:1.3%

         ```

When using the brightness button, reboots of the speaker still occurs.

I also tried unbinding the audio itself:

```
> echo -n '3-2:1.0' | sudo tee /sys/bus/usb/drivers/snd-usb-audio/unbind
3-2:1.0%
> echo -n '3-2:1.1' | sudo tee /sys/bus/usb/drivers/snd-usb-audio/unbind
3-2:1.1%
```

The reboots continues to happen.

Here's the output of dmesg when the reboot of the speaker occurs:

```
> sudo dmesg -w

[  994.674827] usb 3-2: USB disconnect, device number 7
[  996.031031] usb 3-2: new full-speed USB device number 8 using xhci_hcd
[  996.865709] usb 3-2: device descriptor read/64, error -71
[  997.106087] usb 3-2: New USB device found, idVendor=3D2d99,
idProduct=3Da101, bcdDevice=3D 1.00
[  997.106094] usb 3-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[  997.106097] usb 3-2: Product: EDIFIER Hal0 2.0 SE
[  997.106099] usb 3-2: Manufacturer: Jieli Technology
[  997.106102] usb 3-2: SerialNumber: 4250315A34383502
[  997.180035] input: Jieli Technology EDIFIER Hal0 2.0 SE as
/devices/pci0000:00/0000:00:08.1/0000:06:00.4/usb3/3-2/3-2:1.2/0003:2D99:A1=
01.0014/input/input51
[  997.230824] hid-generic 0003:2D99:A101.0014: input,hidraw0: USB HID
v1.00 Device [Jieli Technology EDIFIER Hal0 2.0 SE] on
usb-0000:06:00.4-2/input2
[  997.237434] hid-generic 0003:2D99:A101.0015: hiddev96,hidraw1: USB
HID v2.01 Device [Jieli Technology EDIFIER Hal0 2.0 SE] on
usb-0000:06:00.4-2/input3
```

Information of the USB device:

```
> sudo lsusb -v -d 2d99:a101

Bus 003 Device 002: ID 2d99:a101 Jieli Technology EDIFIER Hal0 2.0 SE
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x2d99 Jieli Technology
  idProduct          0xa101 EDIFIER Hal0 2.0 SE
  bcdDevice            1.00
  iManufacturer           1 Jieli Technology
  iProduct                2 EDIFIER Hal0 2.0 SE
  iSerial                 3 4250315A34383502
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00b6
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              100mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       2 Streaming
      bFunctionProtocol       0
      iFunction               5 EDIFIER QR30
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0
      iInterface              5 EDIFIER QR30
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x002f
        bInCollection           1
        baInterfaceNr(0)        1
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                10
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 2
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        bmaControls(1)       0x00
        bmaControls(2)       0x00
        iFeature                0
      AudioControl Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      5 (SELECTOR_UNIT)
        bUnitID                 8
        bNrInPins               1
        baSourceID(0)           2
        iSelector               0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0301 Speaker
        bAssocTerminal          0
        bSourceID               2
        iTerminal               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           1
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           3
        bBitResolution         24
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            9
          Transfer Type            Isochronous
          Synch Type               Adaptive
          Usage Type               Data
        wMaxPacketSize     0x0120  1x 288 bytes
        bInterval               1
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.00
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 (null)
          wDescriptorLength      33
          Report Descriptors:
            ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               2.01
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 (null)
          wDescriptorLength      66
          Report Descriptors:
            ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
Device Status:     0x0000
  (Bus Powered)
```

Here's the log of bus 3 when rebooting:

```
> sudo modprobe usbmon
> sudo cat /sys/kernel/debug/usb/usbmon/3u > qr30.log

ffff8e9c81b28fc0 1394065014 C Ii:3:001:1 0:2048 1 =3D 04
ffff8e9c81b28fc0 1394065023 S Ii:3:001:1 -115:2048 4 <
ffff8e9c88c2a300 1394065033 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2a300 1394065038 C Ci:3:001:0 0 4 =3D 00010100
ffff8e9c88c2a300 1394065041 S Co:3:001:0 s 23 01 0010 0002 0000 0
ffff8e9c88c2a300 1394065046 C Co:3:001:0 0 0
ffff8e9c88c2bd40 1394065457 C Ii:3:009:2 -108:1 0
ffff8e9c88c2b980 1394103576 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1394103627 C Ci:3:001:0 0 4 =3D 00010000
ffff8e9c88c2b980 1394129013 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1394129024 C Ci:3:001:0 0 4 =3D 00010000
ffff8e9c88c2b980 1394155010 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1394155017 C Ci:3:001:0 0 4 =3D 00010000
ffff8e9c88c2b980 1394181022 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1394181031 C Ci:3:001:0 0 4 =3D 00010000
ffff8e9c88c2b980 1394207292 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1394207317 C Ci:3:001:0 0 4 =3D 00010000
ffff8e9c81b28fc0 1395205229 C Ii:3:001:1 0:2048 1 =3D 04
ffff8e9c81b28fc0 1395205252 S Ii:3:001:1 -115:2048 4 <
ffff8e9c88c2b980 1395205278 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1395205293 C Ci:3:001:0 0 4 =3D 01010100
ffff8e9c88c2b980 1395205300 S Co:3:001:0 s 23 01 0010 0002 0000 0
ffff8e9c88c2b980 1395205306 C Co:3:001:0 0 0
ffff8e9c88c2b980 1395205310 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1395205314 C Ci:3:001:0 0 4 =3D 01010000
ffff8e9c88c2b980 1395231031 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1395231049 C Ci:3:001:0 0 4 =3D 01010000
ffff8e9c88c2b980 1395257305 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1395257334 C Ci:3:001:0 0 4 =3D 01010000
ffff8e9c88c2b980 1395283283 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1395283311 C Ci:3:001:0 0 4 =3D 01010000
ffff8e9c88c2b980 1395309287 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1395309317 C Ci:3:001:0 0 4 =3D 01010000
ffff8e9c88c2b980 1395309418 S Co:3:001:0 s 23 03 0004 0002 0000 0
ffff8e9c88c2b980 1395309426 C Co:3:001:0 0 0
ffff8e9c88c2b980 1395370721 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1395370746 C Ci:3:001:0 0 4 =3D 03011000
ffff8e9c88c2b980 1395370756 S Co:3:001:0 s 23 01 0014 0002 0000 0
ffff8e9c88c2b980 1395370762 C Co:3:001:0 0 0
ffff8e9c88c2b980 1395421446 S Ci:3:000:0 s 80 06 0100 0000 0040 64 <
ffff8e9c81b28fc0 1395454957 C Ii:3:001:1 0:2048 1 =3D 04
ffff8e9c81b28fc0 1395454979 S Ii:3:001:1 -115:2048 4 <
ffff8e9c88c2b980 1395456684 C Ci:3:000:0 -71 0
ffff8e9c88c2b980 1395456717 S Ci:3:000:0 s 80 06 0100 0000 0040 64 <
ffff8e9c88c2b980 1395459710 C Ci:3:000:0 -71 0
ffff8e9c88c2b980 1395459745 S Ci:3:000:0 s 80 06 0100 0000 0040 64 <
ffff8e9c88c2b980 1395461696 C Ci:3:000:0 -71 0
ffff8e9c88c2b980 1395461730 S Co:3:001:0 s 23 03 0004 0002 0000 0
ffff8e9c88c2b980 1395461742 C Co:3:001:0 0 0
ffff8e9c88c2b980 1395522293 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1395522315 C Ci:3:001:0 0 4 =3D 00011100
ffff8e9c81b28fc0 1395567319 C Ii:3:001:1 0:2048 1 =3D 04
ffff8e9c81b28fc0 1395567346 S Ii:3:001:1 -115:2048 4 <
ffff8e9c88c2b980 1395583053 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1395583070 C Ci:3:001:0 0 4 =3D 00011100
ffff8e9c88c2b980 1395791311 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1395791332 C Ci:3:001:0 0 4 =3D 00011100
ffff8e9c81b28fc0 1395823253 C Ii:3:001:1 0:2048 1 =3D 04
ffff8e9c81b28fc0 1395823276 S Ii:3:001:1 -115:2048 4 <
ffff8e9c88c2b980 1395999298 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1395999325 C Ci:3:001:0 0 4 =3D 01011100
ffff8e9c88c2b980 1395999334 S Co:3:001:0 s 23 01 0010 0002 0000 0
ffff8e9c88c2b980 1395999339 C Co:3:001:0 0 0
ffff8e9c88c2b980 1395999342 S Co:3:001:0 s 23 03 0004 0002 0000 0
ffff8e9c88c2b980 1395999347 C Co:3:001:0 0 0
ffff8e9c88c2b980 1396207024 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1396207040 C Ci:3:001:0 0 4 =3D 03011000
ffff8e9c88c2b980 1396207045 S Co:3:001:0 s 23 01 0014 0002 0000 0
ffff8e9c88c2b980 1396207049 C Co:3:001:0 0 0
ffff8e9c88c2b980 1396359012 S Ci:3:000:0 s 80 06 0100 0000 0040 64 <
ffff8e9c88c2b980 1396359403 C Ci:3:000:0 0 18 =3D 12011001 ef020140
992d01a1 00010102 0301
ffff8e9c88c2b980 1396359408 S Co:3:001:0 s 23 03 0004 0002 0000 0
ffff8e9c88c2b980 1396359417 C Co:3:001:0 0 0
ffff8e9c88c2b980 1396420014 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b980 1396420023 C Ci:3:001:0 0 4 =3D 03011000
ffff8e9c88c2b980 1396420027 S Co:3:001:0 s 23 01 0014 0002 0000 0
ffff8e9c88c2b980 1396420031 C Co:3:001:0 0 0
ffff8e9c88c2b980 1396482417 S Ci:3:010:0 s 80 06 0100 0000 0012 18 <
ffff8e9c88c2b980 1396483409 C Ci:3:010:0 0 18 =3D 12011001 ef020140
992d01a1 00010102 0301
ffff8e9c88c2b980 1396483422 S Ci:3:010:0 s 80 06 0200 0000 0009 9 <
ffff8e9c88c2b980 1396485399 C Ci:3:010:0 0 9 =3D 0902b600 04010080 32
ffff8e9c88c2acc0 1396485406 S Ci:3:010:0 s 80 06 0200 0000 00b6 182 <
ffff8e9c88c2acc0 1396488386 C Ci:3:010:0 0 182 =3D 0902b600 04010080
32080b00 02010200 05090400 00000101 00050924 0100012f
ffff8e9c88c2a6c0 1396488397 S Ci:3:010:0 s 80 06 0300 0000 00ff 255 <
ffff8e9c88c2a6c0 1396491393 C Ci:3:010:0 0 4 =3D 04030904
ffff8e9c88c2a6c0 1396491402 S Ci:3:010:0 s 80 06 0302 0409 00ff 255 <
ffff8e9c88c2a6c0 1396493424 C Ci:3:010:0 0 40 =3D 28034500 44004900
46004900 45005200 20004800 61006c00 30002000 32002e00
ffff8e9c88c2a6c0 1396493441 S Ci:3:010:0 s 80 06 0301 0409 00ff 255 <
ffff8e9c88c2a6c0 1396495422 C Ci:3:010:0 0 34 =3D 22034a00 69006500
6c006900 20005400 65006300 68006e00 6f006c00 6f006700
ffff8e9c88c2a6c0 1396495437 S Ci:3:010:0 s 80 06 0303 0409 00ff 255 <
ffff8e9c88c2a6c0 1396497827 C Ci:3:010:0 0 34 =3D 22033400 32003500
30003300 31003500 41003300 34003300 38003300 35003000
ffff8e9c88c2a6c0 1396507381 S Co:3:010:0 s 00 09 0001 0000 0000 0
ffff8e9c88c2a6c0 1396508385 C Co:3:010:0 0 0
ffff8e9c88c2a6c0 1396508469 S Ci:3:010:0 s 80 06 0305 0409 00ff 255 <
ffff8e9c88c2a6c0 1396511390 C Ci:3:010:0 0 26 =3D 1a034500 44004900
46004900 45005200 20005100 52003300 3000
ffff8e9c88c2b5c0 1396511455 S Ci:3:010:0 s 80 06 0302 0409 00ff 255 <
ffff8e9c88c2b5c0 1396513425 C Ci:3:010:0 0 40 =3D 28034500 44004900
46004900 45005200 20004800 61006c00 30002000 32002e00
ffff8e9c88c2b5c0 1396513435 S Ci:3:010:0 s 80 06 0301 0409 00ff 255 <
ffff8e9c88c2b5c0 1396515418 C Ci:3:010:0 0 34 =3D 22034a00 69006500
6c006900 20005400 65006300 68006e00 6f006c00 6f006700
ffff8e9c88c2bec0 1396515454 S Co:3:010:0 s 01 0b 0000 0001 0000 0
ffff8e9c88c2bec0 1396517391 C Co:3:010:0 0 0
ffff8e9c88c2bec0 1396519380 S Co:3:010:0 s 01 0b 0001 0001 0000 0
ffff8e9c88c2bec0 1396520379 C Co:3:010:0 0 0
ffff8e9c88c2bec0 1396523379 S Co:3:010:0 s 01 0b 0000 0001 0000 0
ffff8e9c88c2bec0 1396524387 C Co:3:010:0 0 0
ffff8e9c88c2b380 1396524402 S Ci:3:010:0 s a1 81 0100 0200 0001 1 <
ffff8e9c88c2b380 1396527394 C Ci:3:010:0 0 1 =3D 00
ffff8e9c88c2a840 1396527409 S Ci:3:010:0 s a1 83 0200 0200 0002 2 <
ffff8e9c88c2a840 1396529395 C Ci:3:010:0 0 2 =3D 0fff
ffff8e9c88c2a840 1396529405 S Ci:3:010:0 s a1 82 0200 0200 0002 2 <
ffff8e9c88c2a840 1396531395 C Ci:3:010:0 0 2 =3D a0e3
ffff8e9c88c2a840 1396531405 S Ci:3:010:0 s a1 84 0200 0200 0002 2 <
ffff8e9c88c2a840 1396533383 C Ci:3:010:0 0 2 =3D 3000
ffff8e9c88c2a840 1396533390 S Co:3:010:0 s 21 04 0200 0200 0002 2 =3D 1800
ffff8e9c88c2a840 1396535463 C Co:3:010:0 -32 0
ffff8e9c88c2a840 1396535468 S Co:3:010:0 s 21 04 0200 0200 0002 2 =3D 1800
ffff8e9c88c2a840 1396537463 C Co:3:010:0 -32 0
ffff8e9c88c2a840 1396537468 S Co:3:010:0 s 21 04 0200 0200 0002 2 =3D 1800
ffff8e9c88c2a840 1396539462 C Co:3:010:0 -32 0
ffff8e9c88c2a840 1396539467 S Co:3:010:0 s 21 04 0200 0200 0002 2 =3D 1800
ffff8e9c88c2a840 1396541462 C Co:3:010:0 -32 0
ffff8e9c88c2a840 1396541466 S Co:3:010:0 s 21 04 0200 0200 0002 2 =3D 1800
ffff8e9c88c2a840 1396543452 C Co:3:010:0 -32 0
ffff8e9c88c2a840 1396543457 S Co:3:010:0 s 21 04 0200 0200 0002 2 =3D 1800
ffff8e9c88c2a840 1396545461 C Co:3:010:0 -32 0
ffff8e9c88c2a840 1396545468 S Co:3:010:0 s 21 04 0200 0200 0002 2 =3D 1800
ffff8e9c88c2a840 1396547462 C Co:3:010:0 -32 0
ffff8e9c88c2a840 1396547467 S Co:3:010:0 s 21 04 0200 0200 0002 2 =3D 1800
ffff8e9c88c2a840 1396549462 C Co:3:010:0 -32 0
ffff8e9c88c2a840 1396549468 S Co:3:010:0 s 21 04 0200 0200 0002 2 =3D 1800
ffff8e9c88c2a840 1396551462 C Co:3:010:0 -32 0
ffff8e9c88c2a840 1396551468 S Co:3:010:0 s 21 04 0200 0200 0002 2 =3D 1800
ffff8e9c88c2a840 1396553462 C Co:3:010:0 -32 0
ffff8e9c88c2a840 1396553467 S Ci:3:010:0 s a1 84 0200 0200 0002 2 <
ffff8e9c88c2a840 1396555383 C Ci:3:010:0 0 2 =3D 3000
ffff8e9c88c2a840 1396555388 S Ci:3:010:0 s a1 81 0200 0200 0002 2 <
ffff8e9c88c2a840 1396557382 C Ci:3:010:0 0 2 =3D 0fff
ffff8e9c88c2a840 1396557387 S Co:3:010:0 s 21 01 0200 0200 0002 2 =3D dffe
ffff8e9c88c2a840 1396560374 C Co:3:010:0 0 2 >
ffff8e9c88c2a840 1396560378 S Ci:3:010:0 s a1 81 0200 0200 0002 2 <
ffff8e9c88c2a840 1396563380 C Ci:3:010:0 0 2 =3D dffe
ffff8e9c88c2a840 1396563384 S Co:3:010:0 s 21 01 0200 0200 0002 2 =3D 0fff
ffff8e9c88c2a840 1396566369 C Co:3:010:0 0 2 >
ffff8e9c88c2bb00 1396566719 S Ci:3:010:0 s 80 06 0303 0409 00ff 255 <
ffff8e9c88c2bb00 1396569381 C Ci:3:010:0 0 34 =3D 22033400 32003500
30003300 31003500 41003300 34003300 38003300 35003000
ffff8e9c88c2bb00 1396569394 S Co:3:010:0 s 21 0a 0000 0002 0000 0
ffff8e9c88c2bb00 1396571376 C Co:3:010:0 0 0
ffff8e9c88c2bb00 1396571379 S Ci:3:010:0 s 81 06 2200 0002 0021 33 <
ffff8e9c88c2bb00 1396573402 C Ci:3:010:0 0 33 =3D 050c0901 a1011500
250109e9 09ea09e2 09cd09b5 09b609b3 09b77501 95088142
ffff8e9c88c2bb00 1396573571 S Ii:3:010:2 -115:1 1 <
ffff8e9c88c2a540 1396624419 S Ci:3:010:0 s 80 06 0303 0409 00ff 255 <
ffff8e9c88c2a540 1396625422 C Ci:3:010:0 0 34 =3D 22033400 32003500
30003300 31003500 41003300 34003300 38003300 35003000
ffff8e9c88c2a540 1396625438 S Co:3:010:0 s 21 0a 0000 0003 0000 0
ffff8e9c88c2a540 1396627394 C Co:3:010:0 0 0
ffff8e9c88c2a540 1396627401 S Ci:3:010:0 s 81 06 2200 0003 0042 66 <
ffff8e9c88c2a540 1396630398 C Ci:3:010:0 0 66 =3D 0613ff09 01a10115
0026ff00 85060900 7508953d 91028507 09007508 953d8102
ffff8e9c88c2b680 1396630828 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
ffff8e9c88c2b680 1396630840 C Ci:3:001:0 0 4 =3D 03010000
ffff8e9c8ae5b740 1396647084 S Co:3:010:0 s 21 01 0200 0200 0002 2 =3D 20f4
ffff8e9c8ae5b740 1396648382 C Co:3:010:0 0 2 >
ffff8e9d9b3c75c0 1396701374 S Co:3:010:0 s 01 0b 0001 0001 0000 0
ffff8e9d9b3c75c0 1396702379 C Co:3:010:0 0 0
ffff8e9c88c11ec0 1396705364 S Co:3:010:0 s 01 0b 0000 0001 0000 0
ffff8e9c88c11ec0 1396706376 C Co:3:010:0 0 0
ffff8e9d1ecd2780 1396711369 S Co:3:010:0 s 01 0b 0001 0001 0000 0
ffff8e9d1ecd2780 1396712377 C Co:3:010:0 0 0
ffff8e9c88c2b680 1396715364 S Co:3:010:0 s 01 0b 0000 0001 0000 0
ffff8e9c88c2b680 1396716377 C Co:3:010:0 0 0
ffff8e9d9b3c7bc0 1396729375 S Co:3:010:0 s 01 0b 0001 0001 0000 0
ffff8e9d9b3c7bc0 1396730378 C Co:3:010:0 0 0
ffff8e9d9b3c7bc0 1396733363 S Co:3:010:0 s 01 0b 0000 0001 0000 0
ffff8e9d9b3c7bc0 1396734376 C Co:3:010:0 0 0
```


I'm not familiar with kernel development, but I=E2=80=99m happy to run any
tests or provide additional information.
Please just let me know which commands to execute or what logs would
be most useful.

I'm sending again in plaintext, sorry.

Thank you!


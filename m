Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4669261702
	for <lists+linux-usb@lfdr.de>; Sun,  7 Jul 2019 21:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbfGGToh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Jul 2019 15:44:37 -0400
Received: from mout.gmx.net ([212.227.15.19]:55877 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727514AbfGGTiI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 7 Jul 2019 15:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562528283;
        bh=tXpzRb4wuzZs+dU01LXqnRdQgGjOiwUypZenv/vXKio=;
        h=X-UI-Sender-Class:Date:From:To:CC:Subject:References:In-Reply-To;
        b=c8Q5Kra8bvd4px0Hms69XTkrB+xqY5ZtNLx5hH7VoM5AaijgxNdadw4pxqG78eXgJ
         C1rHJ7+ZkHK/M7SsW2CUEdzZYpyd0zoqlwrLteT9blqOnQNxdm3vFM0vLkn3btuNKP
         Ajz4OAt4XX/BkiXQUh71T1kehFShYqAXD0RKRP+k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.102] ([88.65.35.191]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LzKmP-1iX0Di1kkT-014PdW; Sun, 07
 Jul 2019 21:38:03 +0200
Message-ID: <5D224A18.2070907@gmx.net>
Date:   Sun, 07 Jul 2019 21:38:00 +0200
From:   Markus Breunig <Markus.L.Breunig@gmx.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     linux-usb@vger.kernel.org
Subject: Re: Fwd: Re: New USB Device
References: <5D1D1376.7070202@gmx.net> <5D1E65F3.6090307@gmx.net> <20190705052121.GD15821@kroah.com>
In-Reply-To: <20190705052121.GD15821@kroah.com>
Content-Type: multipart/mixed;
 boundary="------------060304030807060108020801"
X-Provags-ID: V03:K1:YmzonE5SLKGqRUy4sdXbL6DGRr5xyjuEJsXFVlE88PwMuyL7JFJ
 adxpM8/0p2ZOMF7AZpW/S1QTWHo5/AmtIbDToGqOO92WdUnAGkQJ+jJupIRbUaFm8fURY4w
 ds1qtCc1AW6cI1/r1PKiwS0x4TmIKqegnVuMxl52KkIJ8VVAnNZygI23NJOQzI+o6dnzVVD
 C45DCgIh9RaGY6GnaaWFw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cmUngAkUJhw=:8QwVAH2NVYaA+NV8re0JNQ
 XhrgzLyNe0XOwU3u1+8fNlxRxHWdz7HzC1LW1CCk6qF1YryTwWfXK5Vyn0SPGOqmz5s09bmlw
 dU3u3k1TH6y8uJkDJH2UG9Up75hAibJhX/gVbDSnNkthpF2LRfRAdR4frKDnnRwSmkV4lj9eo
 4/Sa71y4+8wFp3OYD2JbYQ5NkhVhZcZrxyvzaO8QrHlPeqZdCdokemBSLeg2bXPL/WJ1PNCIb
 nOhovuALJITGjexUWgVos4DArYgPTLQwgKPuh/JDRtzH8FH9zUlk+5S4w1sjluD7m8+qk6fOq
 sZuEIJWlgj/pXvbJj2gmE5e+Ho0wBlvcLBl/u40Kn6ZF2iUP+uPk/q5LLNTtP8QhFOlG+p/0H
 99Prkfle1aMFyd8qLm+DJd2uArQn2dl1GZwDdzTSuwTcCrv13+Vo+gf8/CSZIPAu1HlIrB2Da
 Dknmsa4zhNkaCPeoPVtWASWh/zcmEnYohRLIdtojiGEvObRDq8T4+qqYv4iedd+GBm7moa77v
 eFf7HSSEUd8tyYXVTFzPyJGIQB/SOQchlz5RH5/KZzensedoSNoQAJqcc8wzh5ROLiOn0tbqL
 CGg2TQ7WGTUZIVNTLJ55k4xFmeP0OlaFwNR4Tr9rZO+ZgezWi+/wy86lR5s9PDeBacYD+VehW
 SHQ73Ojjx6ANWb1DkRfjtzw2KZ4FA+vk7WnJgABgxutwkpHhHL2rC3IS+Ir5C/9UQRurfIjA2
 kqnSGgTG8oxR3lKi31cgZMe144JWzqtdnhG/9HcIdTwW/Zhi6Ly3amgrHleObzWZ5JdHIwzF2
 EJbnCqDUsEg0SGJzJJSim8AtcMEvs5byFLERXtJ/YczsTX2HyfcFK++O7CspmYsx7Ah4aJhx2
 b+ao7DdsCHt4T133nldBjPFlvM47QvKdAPRz3a59RmnP1hGLN0zuOVsM0ObGvKu0RO6fkxRPL
 5ex+0bil8/DY5kWIDqNiypATDQsJ/tbFyx5TVQXU3WDRvUqoacpRjXIhp1yZfABgVZaxXOkYh
 mK6An68UNZoGEVcIhEKILGtDIXlw2ldgP0PpMCBQDxGz2iqltcIJGelV6bOwV6CPFJM6/RVqN
 YSp71M1S4JSiVQ=
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------060304030807060108020801
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Greg,

also the company GNS has a fragmented homepage, the handbook ist
available here:
http://www.servicedocs.com/ARTIKELEN/7200284490001.pdf
habe a look to page 10 "Remarks to Linux"

This is the log of "lsusb -v" (full scan result attached):

Bus 001 Device 004: ID 04d8:f8e8 Microchip Technology, Inc. Harmony
300/350 Remote
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          255 Vendor Specific Class
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         8
   idVendor           0x04d8 Microchip Technology, Inc.
   idProduct          0xf8e8 Harmony 300/350 Remote
   bcdDevice           48.12
   iManufacturer           1
   iProduct                2
   iSerial                 3
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength           67
     bNumInterfaces          2
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xc0
       Self Powered
     MaxPower              100mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         2 Communications
       bInterfaceSubClass      2 Abstract (modem)
       bInterfaceProtocol      1 AT-commands (v.25ter)
       iInterface              0
       CDC Header:
         bcdCDC               1.10
       CDC ACM:
         bmCapabilities       0x02
           line coding and serial state
       CDC Union:
         bMasterInterface        0
         bSlaveInterface         1
       CDC Call Management:
         bmCapabilities       0x00
         bDataInterface          1
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0008  1x 8 bytes
         bInterval               2
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass        10 CDC Data
       bInterfaceSubClass      0 Unused
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x03  EP 3 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0

best regards

Markus

Am 05.07.2019 07:21, schrieb Greg KH:
> On Thu, Jul 04, 2019 at 10:47:47PM +0200, Markus Breunig wrote:
>> Hi Greg,
>>
>> using a serial device driver is the idea of the manufacturer
>> "www.gns-gmbh.com". In the LINUX instructions of the ADS-B receiver som=
e
>> hints to use the device are given via usbserial.
>
> Any pointers to those instructions?
>
>> In practice the "GNS 5890 ADS-B Receiver" is similare to some GPS
>> Receivers with NMEA 0183 interface starting to send information on the
>> serial interface after power on and signal availabillity (with 115200
>> boud data rate).
>>
>> does this help?
>
> Does the device actually work with those instructions?
>
> Can you provide the output of 'lsusb -v' with the device plugged in?
>
> thanks,
>
> greg k-h
>

--------------060304030807060108020801
Content-Type: text/plain; charset=windows-1252;
 name="usbconfig.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="usbconfig.txt"


Bus 001 Device 006: ID 046d:c05a Logitech, Inc. M90/M100 Optical Mouse
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0x046d Logitech, Inc.
  idProduct          0xc05a M90/M100 Optical Mouse
  bcdDevice           54.00
  iManufacturer           1
  iProduct                2
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           34
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower               98mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      2 Mouse
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      67
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0006  1x 6 bytes
        bInterval              10

Bus 001 Device 005: ID 046a:0001 Cherry GmbH Keyboard
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0x046a Cherry GmbH
  idProduct          0x0001 Keyboard
  bcdDevice            0.26
  iManufacturer           1
  iProduct                0
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           34
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      1 Keyboard
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      64
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval              10

Bus 001 Device 004: ID 04d8:f8e8 Microchip Technology, Inc. Harmony 300/350 Remote
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0x04d8 Microchip Technology, Inc.
  idProduct          0xf8e8 Harmony 300/350 Remote
  bcdDevice           48.12
  iManufacturer           1
  iProduct                2
  iSerial                 3
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           67
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xc0
      Self Powered
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface              0
      CDC Header:
        bcdCDC               1.10
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Union:
        bMasterInterface        0
        bSlaveInterface         1
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               2
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 Unused
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0

Bus 001 Device 003: ID 0424:ec00 Standard Microsystems Corp. SMSC9512/9514 Fast Ethernet Adapter
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0
  bDeviceProtocol         1
  bMaxPacketSize0        64
  idVendor           0x0424 Standard Microsystems Corp.
  idProduct          0xec00 SMSC9512/9514 Fast Ethernet Adapter
  bcdDevice            2.00
  iManufacturer           0
  iProduct                0
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           39
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                2mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol    255
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               4

Bus 001 Device 002: ID 0424:9514 Standard Microsystems Corp. SMC9514 Hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0 Unused
  bDeviceProtocol         2 TT per port
  bMaxPacketSize0        64
  idVendor           0x0424 Standard Microsystems Corp.
  idProduct          0x9514 SMC9514 Hub
  bcdDevice            2.00
  iManufacturer           0
  iProduct                0
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           41
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                2mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0 Unused
      bInterfaceProtocol      1 Single TT
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
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0 Unused
      bInterfaceProtocol      2 TT per port
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

Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0 Unused
  bDeviceProtocol         1 Single TT
  bMaxPacketSize0        64
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0002 2.0 root hub
  bcdDevice            4.19
  iManufacturer           3
  iProduct                2
  iSerial                 1
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           25
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
      bInterfaceSubClass      0 Unused
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

--------------060304030807060108020801--

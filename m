Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE937CA7F
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2019 19:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbfGaRcd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Jul 2019 13:32:33 -0400
Received: from mout.gmx.net ([212.227.17.21]:35773 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730842AbfGaRcc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 31 Jul 2019 13:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564594348;
        bh=u1sIVInpXZxDwaaKSgMN/AyMaMhbmLQodmddOS1TRuM=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=MkPpKiaolJPGX50GeWA1gTTaZz0ZE42BCDS+1a3/hWx0WBG8t/ICn8FFQ83k0srU2
         qhusYdtqSiNYG0CHcgNxXqvYJlWvrzgQh+kT2+x+pckYYLes7JAOKD2oCvOXx5k1Tz
         0CwgPsmVnI8xI00YD+kcR3Xw5WGGJIBIpHMNUxuM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.103] ([88.65.35.191]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LqW8j-1iW2u23aTJ-00e3Ic; Wed, 31
 Jul 2019 19:32:28 +0200
Subject: Re: Fwd: Re: New USB Device
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <5D1D1376.7070202@gmx.net> <5D1E65F3.6090307@gmx.net>
 <20190705052121.GD15821@kroah.com> <5D224A18.2070907@gmx.net>
 <20190716092305.GC3522@localhost>
From:   Markus Breunig <Markus.L.Breunig@gmx.net>
Message-ID: <4e9b3ecf-ca45-51a5-d582-d3d067ecc723@gmx.net>
Date:   Wed, 31 Jul 2019 19:32:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190716092305.GC3522@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4TQ5/SqbcreNItOLyLAqO48r0unZo9lZQGJB8BEdmxn19DMa4T+
 QjS+sL6tXd1QWm4cdpltniGvAbMp/xhheUoNYRnOSOeDXOd8BoBOQ03vGXn1l/hoFwnt/HB
 3nRDoVXh9+Bdpp4SePg9izSaLfjWZq3USYuacR2puwKqJcLRHf71P+woN7bBmFE4lA2HVQc
 9gOhW2Kv3vgstf6SmtQPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lS+QsXs6GQ8=:mwNV6TZ/5Buak0jkBt4ShJ
 PfL8Ndp9e7P+g7Pd9Pm4HalEh9cC/F5YC14l3dxuiqcZM3LMTx+ZbiG7MqrhRBVY70E6gpteV
 KNHWees9L32/whF3FDhA18sxHO+r9p1MH3FGHhq3n82bcI/JDCvIXpqxV+pVsgrmui4rpy+pw
 BuJ8ioFoxQz4WymewR/FvsDXlO1Bkh/fk/MdKmPfMtenKLQ9/YDDEG962qYJOkRa/iSn+jkKB
 HWVSK3qKVtgGa1ReWEcIwLpPPac5eXL0vXbxzWa+kO6FB7SJ94Gd2z8zvs2+KdImmcZ9F6Aj3
 gHTLeHM4arYPluvu5XrBihQW32qUdjWmThXyRxpkYpmOKJnrhc2BOvdA52GlCBjOiv7yFxO2Z
 TJ8/AhTWRpVgdVVvHimDTNqMQKx0fqWpEwPmcrEyCYN0jIzqLkia/t9CCRuHCg027Tl8elmT0
 yaLn/76K5qWYMlLbBOilXBw2+q81Ti7xljcWdEI9KHt0hQVldPQpYIc+ULfv4ffV3UPwhcUUx
 ZnozSLlANpcEZOamfWYW/LsKYkcdLNXlNGnbex0LK2h0z/0OLXoz9coaUtBhFnpOAog/KrnGA
 3kxq60itFtnPEHk8EoZScdL2Kc/d8wz6C9T0c1f8Rm9Q1ZdeMgwgmkqKjav7fRf0noaoCs2Nb
 fIWIFjPWs43PxblWvJXlx/Kksqz2YdvqmDo7AKCbmQmJdJxhMpaMuATd3rAWlid0TxCmN7FWN
 HwP+eSmkTyk/t5iCfwuLaMeHwnn/ehw57S3YQutMIRmeFR+MYjpvTEJXOTEcqAQ54aHX3RXQE
 K4sC2NCeodUZOjIO5PdmflzQLRm4dXoWWJj/I/6azGTub2IlaguUZLTSwxkNACyFRzKB7ekWT
 ddATS9OMNQXY1uPnDaWPv7VdMpMdl1Jv8UxY87185e95R4E8qDfTwLcyAvzAR/yLfDiFLXeWe
 ARyU01W2V2XZlVA4fpXOV7rsrAayizeKyAvb7DUsPVyCYun9PBzX3FZT/y5cnrTh0aGLCm1R9
 qs3FA3TxUO0ckqvE0NbZMrAptVCgMMddtirLRGeZfyKzIZH2BPQzn1lzJeynAOemgzTH0jPkf
 XB6t4wrKAx9mIogtmlk4PYrufogQpfSoLIQ
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Am 16.07.2019 um 11:23 schrieb Johan Hovold:
> [ Pleas avoid top posting. ]
>
> On Sun, Jul 07, 2019 at 09:38:00PM +0200, Markus Breunig wrote:
>> Hi Greg,
>>
>> also the company GNS has a fragmented homepage, the handbook ist
>> available here:
>> http://www.servicedocs.com/ARTIKELEN/7200284490001.pdf
>> habe a look to page 10 "Remarks to Linux"
>>
>> This is the log of "lsusb -v" (full scan result attached):
>>
>> Bus 001 Device 004: ID 04d8:f8e8 Microchip Technology, Inc. Harmony
>> 300/350 Remote
>
> Are you sure this is the right device? This looks like a remote control,
> and one that should be using the cdc-acm driver.
>

The output of lsusb before plugging the GNS5890 device into the USB-port:

Bus 001 Device 005: ID 046d:c05a Logitech, Inc. M90/M100 Optical Mouse
Bus 001 Device 004: ID 046a:0001 Cherry GmbH Keyboard
Bus 001 Device 003: ID 0424:ec00 Standard Microsystems Corp.
SMSC9512/9514 Fast Ethernet Adapter
Bus 001 Device 002: ID 0424:9514 Standard Microsystems Corp. SMC9514 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

and the result of the lsusb after plugging the GNS5890 device into the
USB-port:

Bus 001 Device 005: ID 046d:c05a Logitech, Inc. M90/M100 Optical Mouse
Bus 001 Device 004: ID 046a:0001 Cherry GmbH Keyboard
Bus 001 Device 006: ID 04d8:f8e8 Microchip Technology, Inc. Harmony
300/350 Remote
Bus 001 Device 003: ID 0424:ec00 Standard Microsystems Corp.
SMSC9512/9514 Fast Ethernet Adapter
Bus 001 Device 002: ID 0424:9514 Standard Microsystems Corp. SMC9514 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub


>> Device Descriptor:
>>     bLength                18
>>     bDescriptorType         1
>>     bcdUSB               2.00
>>     bDeviceClass          255 Vendor Specific Class
>>     bDeviceSubClass         0
>>     bDeviceProtocol         0
>>     bMaxPacketSize0         8
>>     idVendor           0x04d8 Microchip Technology, Inc.
>>     idProduct          0xf8e8 Harmony 300/350 Remote
>>     bcdDevice           48.12
>>     iManufacturer           1
>>     iProduct                2
>>     iSerial                 3
>>     bNumConfigurations      1
>>     Configuration Descriptor:
>>       bLength                 9
>>       bDescriptorType         2
>>       wTotalLength           67
>>       bNumInterfaces          2
>>       bConfigurationValue     1
>>       iConfiguration          0
>>       bmAttributes         0xc0
>>         Self Powered
>>       MaxPower              100mA
>>       Interface Descriptor:
>>         bLength                 9
>>         bDescriptorType         4
>>         bInterfaceNumber        0
>>         bAlternateSetting       0
>>         bNumEndpoints           1
>>         bInterfaceClass         2 Communications
>>         bInterfaceSubClass      2 Abstract (modem)
>>         bInterfaceProtocol      1 AT-commands (v.25ter)
>>         iInterface              0
>>         CDC Header:
>>           bcdCDC               1.10
>>         CDC ACM:
>>           bmCapabilities       0x02
>>             line coding and serial state
>>         CDC Union:
>>           bMasterInterface        0
>>           bSlaveInterface         1
>>         CDC Call Management:
>>           bmCapabilities       0x00
>>           bDataInterface          1
>>         Endpoint Descriptor:
>>           bLength                 7
>>           bDescriptorType         5
>>           bEndpointAddress     0x82  EP 2 IN
>>           bmAttributes            3
>>             Transfer Type            Interrupt
>>             Synch Type               None
>>             Usage Type               Data
>>           wMaxPacketSize     0x0008  1x 8 bytes
>>           bInterval               2
>>       Interface Descriptor:
>>         bLength                 9
>>         bDescriptorType         4
>>         bInterfaceNumber        1
>>         bAlternateSetting       0
>>         bNumEndpoints           2
>>         bInterfaceClass        10 CDC Data
>>         bInterfaceSubClass      0 Unused
>>         bInterfaceProtocol      0
>>         iInterface              0
>>         Endpoint Descriptor:
>>           bLength                 7
>>           bDescriptorType         5
>>           bEndpointAddress     0x03  EP 3 OUT
>>           bmAttributes            2
>>             Transfer Type            Bulk
>>             Synch Type               None
>>             Usage Type               Data
>>           wMaxPacketSize     0x0040  1x 64 bytes
>>           bInterval               0
>>         Endpoint Descriptor:
>>           bLength                 7
>>           bDescriptorType         5
>>           bEndpointAddress     0x83  EP 3 IN
>>           bmAttributes            2
>>             Transfer Type            Bulk
>>             Synch Type               None
>>             Usage Type               Data
>>           wMaxPacketSize     0x0040  1x 64 bytes
>>           bInterval               0
>
>> Am 05.07.2019 07:21, schrieb Greg KH:
>>> On Thu, Jul 04, 2019 at 10:47:47PM +0200, Markus Breunig wrote:
>>>> Hi Greg,
>>>>
>>>> using a serial device driver is the idea of the manufacturer
>>>> "www.gns-gmbh.com". In the LINUX instructions of the ADS-B receiver s=
ome
>>>> hints to use the device are given via usbserial.
>>>
>>> Any pointers to those instructions?
>>>
>>>> In practice the "GNS 5890 ADS-B Receiver" is similare to some GPS
>>>> Receivers with NMEA 0183 interface starting to send information on th=
e
>>>> serial interface after power on and signal availabillity (with 115200
>>>> boud data rate).
>
> Johan
>

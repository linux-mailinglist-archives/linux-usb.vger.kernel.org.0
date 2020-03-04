Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37DC1178F76
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 12:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387761AbgCDLTa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 06:19:30 -0500
Received: from mail-lj1-f177.google.com ([209.85.208.177]:41946 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387398AbgCDLTa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Mar 2020 06:19:30 -0500
Received: by mail-lj1-f177.google.com with SMTP id u26so1552748ljd.8
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2020 03:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=e+ODjofxvJm9uXagDSmFGYHa0XWxh2X4TBSz6GyGCHI=;
        b=kpWxjrR20Aq7lsJdedTg+kbzml0jbRIa8bv0jI+DHFoenCkCpihov4i1QOF1k54/Kf
         3iUemZ1nm2eEmF5CCIocIrTE52hZ+j+5c2N8lJw0ORY27v6j5N+QzMwTbF3Z4OTqdl+J
         /+ATBM6eE+nyFpzTB6L8lwctULSh2rOf/rxZbii8Eip89KaN5+ELWeiXk99P78eOqitj
         tK7jpfBnK3c6yvYsqzH0dLYIrVna8H0B9pogQiJ0tOQY077c88us4Jlq0QjsXkah1ooX
         96fpmzumRQ2d6AfaRNgDUtbi/RTwZSd/4/zs0C0mBUo5WbSNn4meEr1QEy7woh7rnafd
         4ZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=e+ODjofxvJm9uXagDSmFGYHa0XWxh2X4TBSz6GyGCHI=;
        b=imWnNpXL7hBY3xtKhanD0FWT/oGDcjXLiMjFUKKXSRTTBeP7rmmwpSv8godaEJK3vq
         /dPdoCjk+2VpOOfMDRXVn93mrn5Ph9i98YcFVQJnXtijj76WyFj0Pp4t6xxQIEOAGh2H
         YGxN7aFfWmADQzbxDCpNRjsEkwq/T4aDNoTzZ5+zMBKHNzBoWJLUV7JShbnwC+fyJM5z
         A3n2BRBiQBrtTpZQkUkO8NxUDDw+5Fvg6DhPI6JjbAJrnBnwJeV9pbT4kvU3NxBeB1hL
         UBjHPxGoq0Xx9txocu7y8L4J4Qp1c6lrI51LJ/T27unZftrrwVzuD9vz+rT9YbMwE0r9
         UDaw==
X-Gm-Message-State: ANhLgQ2dI7hNk0Q9Qq00m6fHlKtjU4vpFNMlogOXhfN52IFRWjmxK/7q
        ZbrMXEgduCMKBMhUs7BzPBx/cSj1
X-Google-Smtp-Source: ADFU+vsWgW9SLEBb8zx1hA6AXTC5T+sP0GFwdR0bz5DlQo6Vj4gNIzCNY8yM13oxgh9AtN/xKPDdfQ==
X-Received: by 2002:a05:651c:1072:: with SMTP id y18mr1723164ljm.243.1583320766617;
        Wed, 04 Mar 2020 03:19:26 -0800 (PST)
Received: from [192.168.1.14] ([89.109.10.26])
        by smtp.gmail.com with ESMTPSA id r15sm13747818ljh.11.2020.03.04.03.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 03:19:25 -0800 (PST)
Subject: Re: driver
To:     Greg KH <greg@kroah.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <5e5941d6.1c69fb81.92ce2.f6a5@mx.google.com>
 <20200304090905.GD1429273@kroah.com>
From:   Igor Filippov <igorf777@gmail.com>
Message-ID: <00931b5b-a8f0-3876-8762-e18ecdee7be4@gmail.com>
Date:   Wed, 4 Mar 2020 14:19:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304090905.GD1429273@kroah.com>
Content-Type: multipart/mixed;
 boundary="------------913C86F080D7FB5B31D9D9C8"
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------913C86F080D7FB5B31D9D9C8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

The i-7565H1 device has a driver installation script from the device 
manufacturer. This script contains the instruction "modprobe usbserial". 
If this is not correct, could you tell me which driver we should use? I 
attach the script to the message. The link to where we got the software: 
http://www.icpdas.com/root/product/solutions/industrial_communication/fieldbus/can_bus/converter/i-7565-h1h2.html

thanks,

igor

04.03.2020 12:09, Greg KH пишет:
> On Fri, Feb 28, 2020 at 07:37:40PM +0300, Igor Filippov wrote:
>> I apologize for my carelessness. I will try to send it to everyone...
> You can't send html email to the list, that will cause it to get
> rejected :(
>
> Anyway, I think this is the device, right:
>
>> Bus 002 Device 004: ID 1b5c:0201
>> Couldn't open device, some information will be missing
>> Device Descriptor:
>>    bLength                18
>>    bDescriptorType         1
>>    bcdUSB               2.00
>>    bDeviceClass            2 Communications
>>    bDeviceSubClass         0
>>    bDeviceProtocol         0
>>    bMaxPacketSize0        64
>>    idVendor           0x1b5c
>>    idProduct          0x0201
>>    bcdDevice            1.00
>>    iManufacturer           4
>>    iProduct               38
>>    iSerial                74
>>    bNumConfigurations      1
>>    Configuration Descriptor:
>>      bLength                 9
>>      bDescriptorType         2
>>      wTotalLength           67
>>      bNumInterfaces          2
>>      bConfigurationValue     1
>>      iConfiguration          0
>>      bmAttributes         0x80
>>        (Bus Powered)
>>      MaxPower              250mA
>>      Interface Descriptor:
>>        bLength                 9
>>        bDescriptorType         4
>>        bInterfaceNumber        0
>>        bAlternateSetting       0
>>        bNumEndpoints           1
>>        bInterfaceClass         2 Communications
>>        bInterfaceSubClass      2 Abstract (modem)
>>        bInterfaceProtocol      0 None
>>        iInterface            104
>>        CDC Header:
>>          bcdCDC               1.10
>>        CDC Call Management:
>>          bmCapabilities       0x01
>>            call management
>>          bDataInterface          1
>>        CDC ACM:
>>          bmCapabilities       0x02
>>            line coding and serial state
>>        CDC Union:
>>          bMasterInterface        0
>>          bSlaveInterface         1
>>        Endpoint Descriptor:
>>          bLength                 7
>>          bDescriptorType         5
>>          bEndpointAddress     0x81  EP 1 IN
>>          bmAttributes            3
>>            Transfer Type            Interrupt
>>            Synch Type               None
>>            Usage Type               Data
>>          wMaxPacketSize     0x0010  1x 16 bytes
>>          bInterval              32
>>      Interface Descriptor:
>>        bLength                 9
>>        bDescriptorType         4
>>        bInterfaceNumber        1
>>        bAlternateSetting       0
>>        bNumEndpoints           2
>>        bInterfaceClass        10 CDC Data
>>        bInterfaceSubClass      0 Unused
>>        bInterfaceProtocol      0
>>        iInterface            104
>>        Endpoint Descriptor:
>>          bLength                 7
>>          bDescriptorType         5
>>          bEndpointAddress     0x02  EP 2 OUT
>>          bmAttributes            2
>>            Transfer Type            Bulk
>>            Synch Type               None
>>            Usage Type               Data
>>          wMaxPacketSize     0x0040  1x 64 bytes
>>          bInterval               0
>>        Endpoint Descriptor:
>>          bLength                 7
>>          bDescriptorType         5
>>          bEndpointAddress     0x82  EP 2 IN
>>          bmAttributes            2
>>            Transfer Type            Bulk
>>            Synch Type               None
>>            Usage Type               Data
>>          wMaxPacketSize     0x0040  1x 64 bytes
>>          bInterval               0
>
> Can you confirm that the vendor/product id is 1b5c/0201 for this?
>
> If so, what is wrong with the "normal" cdc driver here?  Why does the
> usb-serial generic driver need to be used instead?
>
> Do you have a pointer to where you got the instructions to usb the
> usb-serial generic driver instead of the built-in kernel driver?
>
> thanks,
>
> greg k-h

--------------913C86F080D7FB5B31D9D9C8
Content-Type: text/plain; charset=UTF-8;
 name="I7565H1H2_install"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="I7565H1H2_install"

IyEvYmluL3NoCkJMQUNLTElTVD0vZXRjL21vZHByb2JlLmQvYmxhY2tsaXN0LmNvbmYKVVNC
X0dFTkVSSUNfTkVXSUQ9L3N5cy9idXMvdXNiLXNlcmlhbC9kcml2ZXJzL2dlbmVyaWMvbmV3
X2lkClZFTkRPUj0nMWI1YycKSDFfUFJPRFVDVD0nMDIwMScKSDJfUFJPRFVDVD0nMDIwMicK
CmlmIFsgIiQxIiA9ICdoZWxwJyBdOyB0aGVuCgllY2hvICItLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tIgoJZWNobyAidXNhZ2U6IC4vSTc1NjVIMUgyX2luc3Rh
bGwiCgllY2hvICIgICAgICAgSW5zdGFsbCBJNzU2NS1IMS9IMiBtb2R1bGUgZHJpdmVyIGF1
dG9tYXRpY2FsbHkiCgllY2hvICJ1c2FnZTogLi9JNzU2NUgxSDJfaW5zdGFsbCByZW1vdmUi
CgllY2hvICIgICAgICAgUmVtb3ZlIEk3NTY1LUgxL0gyIGRyaXZlciIKCWVjaG8gInVzYWdl
OiAuL0k3NTY1SDFIMl9pbnN0YWxsIGNkY19hY20iCgllY2hvICIgICAgICAgUmVtb3ZlIGNk
Y19hY20gZnJvbSBibGFja2xpc3QuIgoJZXhpdAplbGlmIFsgIiQxIiA9ICdyZW1vdmUnIF07
IHRoZW4KCW1vZHByb2JlIC1yIHVzYnNlcmlhbAoJZXhpdAplbGlmIFsgIiQxIiA9ICdjZGNf
YWNtJyBdOyB0aGVuCglzZWQgLWkgJy9jZGNfYWNtL2QnICRCTEFDS0xJU1QKCWV4aXQKZmkK
CiNjaGVjayBpLTc1NjUtSDEvSDIgVmVuZG9yIElEIGZpcnN0CmNhdCBgZmluZCAvc3lzIC1u
YW1lIGlkVmVuZG9yYCB8IGdyZXAgJFZFTkRPUiA+IC9kZXYvbnVsbCAyPiYxClJFVFVSTj0i
JD8iCgppZiBbICIkUkVUVVJOIiA9ICcxJyBdOyB0aGVuCgllY2hvICJObyBpLTc1NjUtSDEv
SDIgZm91bmQhIgoJZXhpdDsKZmkKCkNEQ19BQ009YGdyZXAgY2RjX2FjbSAiJEJMQUNLTElT
VCJgCgppZiBbICIkQ0RDX0FDTSIgPSAiIiBdOyB0aGVuCgllY2hvICJibGFja2xpc3QgY2Rj
X2FjbSIgPj4gJEJMQUNLTElTVAoJbW9kcHJvYmUgLXIgY2RjX2FjbQpmaQoKI2luc3RhbGwg
ZHJpdmVyICJ1c2JzZXJpYWwiIGZpcnN0Cm1vZHByb2JlIHVzYnNlcmlhbAoKI2NoZWNrIGkt
NzU2NS1IMSBQcm9kdWN0IElECmNhdCBgZmluZCAvc3lzIC1uYW1lIGlkUHJvZHVjdGAgfCBn
cmVwICRIMV9QUk9EVUNUID4gL2Rldi9udWxsIDI+JjEKUkVUVVJOPSIkPyIKaWYgWyAiJFJF
VFVSTiIgPSAnMCcgXTsgdGhlbgoJZWNobyAiSW5zdGFsbCBkcml2ZXIgZm9yIGktNzU2NS1I
MS4iCgllY2hvICIkVkVORE9SICRIMV9QUk9EVUNUIiA+ICRVU0JfR0VORVJJQ19ORVdJRApm
aQoKI2NoZWNrIGktNzU2NS1IMiBQcm9kdWN0IElECmNhdCBgZmluZCAvc3lzIC1uYW1lIGlk
UHJvZHVjdGAgfCBncmVwICRIMl9QUk9EVUNUID4gL2Rldi9udWxsIDI+JjEKUkVUVVJOPSIk
PyIKaWYgWyAiJFJFVFVSTiIgPSAnMCcgXTsgdGhlbgoJZWNobyAiSW5zdGFsbCBkcml2ZXIg
Zm9yIGktNzU2NS1IMi4iCgllY2hvICIkVkVORE9SICRIMl9QUk9EVUNUIiA+ICRVU0JfR0VO
RVJJQ19ORVdJRCAKZmkKCmVjaG8gInN1Y2Nlc3MuIgo=
--------------913C86F080D7FB5B31D9D9C8--

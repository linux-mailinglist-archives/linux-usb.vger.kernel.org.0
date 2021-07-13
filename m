Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7813C7119
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 15:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236435AbhGMNTy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 09:19:54 -0400
Received: from cable.insite.cz ([84.242.75.189]:45304 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236492AbhGMNTy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Jul 2021 09:19:54 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id E5DF8A1A3D401;
        Tue, 13 Jul 2021 15:17:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626182221; bh=ZKZSoPp3xgI3lROWd/8vOiTFUlo9US70fDuaS73oVKo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lGT3Ml40vvBnYw1eDtIfBwftOwZj1/w1lBHfkED3245pd1XJjVqqSeEPsAtRmjdbC
         6QgIOCLX82HkqC9YUl9XoGZ2C5oy4RStRk+xARfdAnIOsWRWx5/wCBd8PacTVZhUCz
         hIFzUoHBkUD904l3ZqMjjRRDsVGzJntlKTln6jqA=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rAXakb0JntMr; Tue, 13 Jul 2021 15:16:55 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 30C32A1A3D400;
        Tue, 13 Jul 2021 15:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626182215; bh=ZKZSoPp3xgI3lROWd/8vOiTFUlo9US70fDuaS73oVKo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=A1Nj17lAK2dYIKdZ8i9nZ9e39MypuwK+A41w9ZwJTjlk3tJZdqzbxrZkAAHNPEW42
         CCJaiS1HGa0P4OAqgV/SS9FMpMyoesqB3/JTV+RomIwCAJZwL3XQbGemRbHPjEyh+H
         Bks5O1fYngm3Q+PwNWTzrDeJTuRNrQcpYUyxvgsI=
Subject: Re: usb:gadget:u_audio: Regression in [v3,3/3] usb: gadget: u_audio:
 add real feedback implementation - wMaxPacketSize calculation
To:     Jerome Brunet <jbrunet@baylibre.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
References: <f861e345-3642-5bfa-0ce7-a5cd34204613@ivitera.com>
 <1j8s2aa071.fsf@starbuckisacylon.baylibre.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <25120679-fe61-fb6a-d671-393e15428da0@ivitera.com>
Date:   Tue, 13 Jul 2021 15:16:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1j8s2aa071.fsf@starbuckisacylon.baylibre.com>
Content-Type: multipart/mixed;
 boundary="------------446C0FBD1D3521F45A3DB938"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------446C0FBD1D3521F45A3DB938
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit



Dne 13. 07. 21 v 14:05 Jerome Brunet napsal(a):
> 
> On Tue 13 Jul 2021 at 12:22, Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> 
>> Hi,
>>
>> I am testing the three Ruslan's async feedback patches as modified by
>> Jerome and I hit a regression in windows 10 enumeration.
>>
>> Ruslan posted an already accepted patch
>> https://github.com/torvalds/linux/commit/789ea77310f0200c84002884ffd628e2baf3ad8a#diff-876615ece7fb56ce8d45fc70623bef9caa2548e810426f217fb785ffa10b33d5
>> which allowed win10 enumeration.
>>
>> Ruslan's async feedback patchset kept the change:
>> https://patchwork.kernel.org/project/linux-usb/patch/1614603943-11668-5-git-send-email-ruslan.bilovol@gmail.com/
>>
>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>> b/drivers/usb/gadget/function/f_uac2.c
>> index 72b42f8..91b22fb 100644
>> --- a/drivers/usb/gadget/function/f_uac2.c
>> +++ b/drivers/usb/gadget/function/f_uac2.c
>> @@ -506,6 +506,10 @@  static int set_ep_max_packet_size(const struct
>> f_uac2_opts *uac2_opts,
>>
>>   	max_size_bw = num_channels(chmask) * ssize *
>>   		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
>> +
>> +	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>> +		max_size_bw = max_size_bw * FBACK_FREQ_MAX / 100;
>> +
>>   	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>>   						    max_size_ep));
>>
>>
>> Jerome's rebase patch which was accepted recently changed the functionality
>> to the original code:
>> https://patchwork.kernel.org/project/linux-usb/patch/20210603220104.1216001-4-jbrunet@baylibre.com/
>>
>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>> b/drivers/usb/gadget/function/f_uac2.c
>> index 321e6c05ba93..ae29ff2b2b68 100644
>> --- a/drivers/usb/gadget/function/f_uac2.c
>> +++ b/drivers/usb/gadget/function/f_uac2.c
>> @@ -584,8 +584,11 @@  static int set_ep_max_packet_size(const struct
>> f_uac2_opts *uac2_opts,
>>   		ssize = uac2_opts->c_ssize;
>>   	}
>>
>> +	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
>> +		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
>> +
>>   	max_size_bw = num_channels(chmask) * ssize *
>> -		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
>> +		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
>>   	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>>   						    max_size_ep));
>>
>> With this version my Win10 does not enumerate the USB AUDIO device, even if
>> it has only EP-IN capability (i.e. is_playback = true). For my setup the
>> EP-IN wMaxPacketSize is 192bytes vs. 196bytes in Ruslan's version, causing
>> win10 reporting "The specified range could not be found in the range list."
>>
> 
> Maybe I am lacking USB expertize, but is there any reason why a 192bytes
> maximum packet size should be considered invalid ? Just from your
> comment, I can't figure it out.
> 
> It would help if you could detail the parameters you started your gadget
> with (rate, format, channel number)
> 
> IIRC, Ruslan initial patchset reserved a fixed additional bandwidth
> (around 20% I think) to deal with the explicit feedback.
> 
> The idea is that, 99.9% of the time, all you need is the ability to fit
> one more sample in each packet. This is should be what the default
> setting provides (up to 192kHz). If it does not do that, I made mistake.
> 
> The setting configurable because I was trying to avoid wasting USB
> bandwith but still support poor quality platforms where 1 extra sample
> is not enough (I think Ruslan mentioned having seen such system)

I am absolutely no USB expert. What I did was testing Jerome's patchset 
and win10 refused to enumerate, even with the most trivial configuration 
c_srate=p_srate=48000, 16bits, capture 2ch, playback 0ch which 
configures no EP-OUT and  no feedback EP-IN. To find the cause I went 
back one patch (HEAD^) and win10 happily enumerated this no-EP-OUT 
configuration. So I compared the usb config dump - see attached files 
from Theosycon USB Descriptor Dumper - see the two attached files, named 
after commit IDs.

The dumps differ in only one parameter EP-IN 1 wMaxPacketSize, for both 
HS and the dumped "Other Speed Configuration Descriptor" i.e. FS:

diff 650f7f40dc1691a8ab4d1dc411f8f327b36e8d14.txt 
cb1c270600b2c6f55f55f227775aaddf2cc78bed.txt
185c185
< 0x00C4	wMaxPacketSize    (1 x 196 bytes)
---
 > 0x00C0	wMaxPacketSize    (1 x 192 bytes)
339c339
< 0x00C4	wMaxPacketSize    (1 x 196 bytes)
---
 > 0x00C0	wMaxPacketSize    (1 x 192 bytes)

So I looked at the patch and saw the changed wMaxPacketSize calculation. 
Adding +1 yielded what the original Ruslan's code yielded - one more 
sample (i.e. 196 bytes instead of 192bytes). Therefore I put it in the 
patch here. This value is accepted by win10.

I do not know how windows uac2 driver verifies validity of 
wMaxPacketSize but clearly 196bytes (+1 sample) is accepted while 
192bytes is refused. Linux does not care, just like Ruslan described in 
his commit 789ea77310f020.

I checked duplex with EP-OUT enabled (i.e. with the feedback EP-IN), the 
"new" calculation works OK in win10 (while the Jerome's values were 
refused).

I really do not know the correct code for calculating the wMaxPacketSize 
to satisfy the windows driver, but what I am posting works. I'll be 
happy if someone knowledgeable fixes my layman quickfix.

Best regards,

Pavel.

--------------446C0FBD1D3521F45A3DB938
Content-Type: text/plain; charset=UTF-8;
 name="650f7f40dc1691a8ab4d1dc411f8f327b36e8d14.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="650f7f40dc1691a8ab4d1dc411f8f327b36e8d14.txt"

Information for device Linux USB Audio Gadget (VID=0x1D6B PID=0x0101):

------------------------------
Connection Information:
------------------------------
Device current bus speed: HighSpeed
Device supports USB 1.1 specification
Device supports USB 2.0 specification
Device address: 0x0001
Current configuration value: 0x01
Number of open pipes: 0


------------------------------
Device Descriptor:
------------------------------
0x12	bLength
0x01	bDescriptorType
0x0200	bcdUSB
0xEF	bDeviceClass      (Miscellaneous device)
0x02	bDeviceSubClass   
0x01	bDeviceProtocol   
0x40	bMaxPacketSize0   (64 bytes)
0x1D6B	idVendor
0x0101	idProduct
0x0513	bcdDevice
0x01	iManufacturer   "Linux 5.13.1-v8+ with fe980000.usb"
0x02	iProduct        "Linux USB Audio Gadget"
0x00	iSerialNumber
0x01	bNumConfigurations

Device Qualifier Descriptor:
------------------------------
0x0A	bLength
0x06	bDescriptorType
0x0200	bcdUSB
0xEF	bDeviceClass      (Miscellaneous device)
0x02	bDeviceSubClass   
0x01	bDeviceProtocol   
0x40	bMaxPacketSize0   (64 bytes)
0x01	bNumConfigurations 
0x00	bReserved 


-------------------------
Configuration Descriptor:
-------------------------
0x09	bLength
0x02	bDescriptorType
0x007F	wTotalLength   (127 bytes)
0x02	bNumInterfaces
0x01	bConfigurationValue
0x00	iConfiguration
0xC0	bmAttributes   (Self-powered Device)
0x01	bMaxPower      (2 mA)

Interface Association Descriptor:
------------------------------
0x08	bLength
0x0B	bDescriptorType
0x00	bFirstInterface
0x02	bInterfaceCount
0x01	bFunctionClass      (Audio Device Class)
0x00	bFunctionSubClass   
0x20	bFunctionProtocol   (Audio Protocol IP version 2.00)
0x04	iFunction   "Source/Sink"

Interface Descriptor:
------------------------------
0x09	bLength
0x04	bDescriptorType
0x00	bInterfaceNumber
0x00	bAlternateSetting
0x00	bNumEndPoints
0x01	bInterfaceClass      (Audio Device Class)
0x01	bInterfaceSubClass   (Audio Control Interface)
0x20	bInterfaceProtocol   (Audio Protocol IP version 2.00)
0x05	iInterface   "Topology Control"

AC Interface Header Descriptor:
------------------------------
0x09	bLength
0x24	bDescriptorType
0x01	bDescriptorSubtype
0x0200	bcdADC
0x08	bCategory   (IO_BOX)
0x002E	wTotalLength   (46 bytes)
0x00	bmControls

AC Clock Source Descriptor:
------------------------------
0x08	bLength
0x24	bDescriptorType
0x0A	bDescriptorSubtype
0x03	bClockID
0x01	bmAttributes
0x01	bmControls
          Clock Frequency Control - read only
0x00	bAssocTerminal
0x06	iClockSource   "48000Hz"

AC Input Terminal Descriptor:
------------------------------
0x11	bLength
0x24	bDescriptorType
0x02	bDescriptorSubtype
0x01	bTerminalID
0x0200	wTerminalType   (Input Undefined)
0x00	bAssocTerminal
0x03	bCSourceID
0x02	bNrChannels   (2 channels)
0x00000003	bmChannelConfig
0x00	iChannelNames
0x03	bmControls
          Copy Protect Control - host programmable
0x09	iTerminal   "USBD Out"

AC Output Terminal Descriptor:
------------------------------
0x0C	bLength
0x24	bDescriptorType
0x03	bDescriptorSubtype
0x02	bTerminalID
0x0101	wTerminalType   (USB Streaming)
0x00	bAssocTerminal
0x01	bSourceID
0x03	bCSourceID
0x0003	bmControls
          Copy Protect Control - host programmable
0x0A	iTerminal   "USBH In"

Interface Descriptor:
------------------------------
0x09	bLength
0x04	bDescriptorType
0x01	bInterfaceNumber
0x00	bAlternateSetting
0x00	bNumEndPoints
0x01	bInterfaceClass      (Audio Device Class)
0x02	bInterfaceSubClass   (Audio Streaming Interface)
0x20	bInterfaceProtocol   (Audio Protocol IP version 2.00)
0x0E	iInterface   "Capture Inactive"

Interface Descriptor:
------------------------------
0x09	bLength
0x04	bDescriptorType
0x01	bInterfaceNumber
0x01	bAlternateSetting
0x01	bNumEndPoints
0x01	bInterfaceClass      (Audio Device Class)
0x02	bInterfaceSubClass   (Audio Streaming Interface)
0x20	bInterfaceProtocol   (Audio Protocol IP version 2.00)
0x0F	iInterface   "Capture Active"

AS Interface Descriptor:
------------------------------
0x10	bLength
0x24	bDescriptorType
0x01	bDescriptorSubtype
0x02	bTerminalLink
0x00	bmControls
0x01	bFormatType   (FORMAT_TYPE_1)
0x00000001	bmFormats
          PCM
0x02	bNrChannels   (2 channels)
0x00000003	bmChannelConfig
0x00	iChannelNames

AS Format Type 1 Descriptor:
------------------------------
0x06	bLength
0x24	bDescriptorType
0x02	bDescriptorSubtype
0x01	bFormatType   (FORMAT_TYPE_1)
0x02	bSubslotSize
0x10	bBitResolution   (16 bits per sample)

Endpoint Descriptor:
------------------------------
0x07	bLength
0x05	bDescriptorType
0x81	bEndpointAddress  (IN endpoint 1)
0x05	bmAttributes      (Transfer: Isochronous / Synch: Asynchronous / Usage: Data)
0x00C4	wMaxPacketSize    (1 x 196 bytes)
0x04	bInterval         (8 microframes)

AS Isochronous Data Endpoint Descriptor:
------------------------------
0x08	bLength
0x25	bDescriptorType
0x01	bDescriptorSubtype
0x00	bmAttributes
0x00	bmControls
0x00	bLockDelayUnits   (undefined)
0x0000	wLockDelay


-------------------------------------
Other Speed Configuration Descriptor:
-------------------------------------
0x09	bLength
0x07	bDescriptorType
0x007F	wTotalLength   (127 bytes)
0x02	bNumInterfaces
0x01	bConfigurationValue
0x00	iConfiguration
0xC0	bmAttributes   (Self-powered Device)
0x01	bMaxPower      (2 mA)

Interface Association Descriptor:
------------------------------
0x08	bLength
0x0B	bDescriptorType
0x00	bFirstInterface
0x02	bInterfaceCount
0x01	bFunctionClass      (Audio Device Class)
0x00	bFunctionSubClass   
0x20	bFunctionProtocol   (Audio Protocol IP version 2.00)
0x04	iFunction   "Source/Sink"

Interface Descriptor:
------------------------------
0x09	bLength
0x04	bDescriptorType
0x00	bInterfaceNumber
0x00	bAlternateSetting
0x00	bNumEndPoints
0x01	bInterfaceClass      (Audio Device Class)
0x01	bInterfaceSubClass   (Audio Control Interface)
0x20	bInterfaceProtocol   (Audio Protocol IP version 2.00)
0x05	iInterface   "Topology Control"

AC Interface Header Descriptor:
------------------------------
0x09	bLength
0x24	bDescriptorType
0x01	bDescriptorSubtype
0x0200	bcdADC
0x08	bCategory   (IO_BOX)
0x002E	wTotalLength   (46 bytes)
0x00	bmControls

AC Clock Source Descriptor:
------------------------------
0x08	bLength
0x24	bDescriptorType
0x0A	bDescriptorSubtype
0x03	bClockID
0x01	bmAttributes
0x01	bmControls
          Clock Frequency Control - read only
0x00	bAssocTerminal
0x06	iClockSource   "48000Hz"

AC Input Terminal Descriptor:
------------------------------
0x11	bLength
0x24	bDescriptorType
0x02	bDescriptorSubtype
0x01	bTerminalID
0x0200	wTerminalType   (Input Undefined)
0x00	bAssocTerminal
0x03	bCSourceID
0x02	bNrChannels   (2 channels)
0x00000003	bmChannelConfig
0x00	iChannelNames
0x03	bmControls
          Copy Protect Control - host programmable
0x09	iTerminal   "USBD Out"

AC Output Terminal Descriptor:
------------------------------
0x0C	bLength
0x24	bDescriptorType
0x03	bDescriptorSubtype
0x02	bTerminalID
0x0101	wTerminalType   (USB Streaming)
0x00	bAssocTerminal
0x01	bSourceID
0x03	bCSourceID
0x0003	bmControls
          Copy Protect Control - host programmable
0x0A	iTerminal   "USBH In"

Interface Descriptor:
------------------------------
0x09	bLength
0x04	bDescriptorType
0x01	bInterfaceNumber
0x00	bAlternateSetting
0x00	bNumEndPoints
0x01	bInterfaceClass      (Audio Device Class)
0x02	bInterfaceSubClass   (Audio Streaming Interface)
0x20	bInterfaceProtocol   (Audio Protocol IP version 2.00)
0x0E	iInterface   "Capture Inactive"

Interface Descriptor:
------------------------------
0x09	bLength
0x04	bDescriptorType
0x01	bInterfaceNumber
0x01	bAlternateSetting
0x01	bNumEndPoints
0x01	bInterfaceClass      (Audio Device Class)
0x02	bInterfaceSubClass   (Audio Streaming Interface)
0x20	bInterfaceProtocol   (Audio Protocol IP version 2.00)
0x0F	iInterface   "Capture Active"

AS Interface Descriptor:
------------------------------
0x10	bLength
0x24	bDescriptorType
0x01	bDescriptorSubtype
0x02	bTerminalLink
0x00	bmControls
0x01	bFormatType   (FORMAT_TYPE_1)
0x00000001	bmFormats
          PCM
0x02	bNrChannels   (2 channels)
0x00000003	bmChannelConfig
0x00	iChannelNames

AS Format Type 1 Descriptor:
------------------------------
0x06	bLength
0x24	bDescriptorType
0x02	bDescriptorSubtype
0x01	bFormatType   (FORMAT_TYPE_1)
0x02	bSubslotSize
0x10	bBitResolution   (16 bits per sample)

Endpoint Descriptor:
------------------------------
0x07	bLength
0x05	bDescriptorType
0x81	bEndpointAddress  (IN endpoint 1)
0x05	bmAttributes      (Transfer: Isochronous / Synch: Asynchronous / Usage: Data)
0x00C4	wMaxPacketSize    (1 x 196 bytes)
0x01	bInterval         (1 frames)

AS Isochronous Data Endpoint Descriptor:
------------------------------
0x08	bLength
0x25	bDescriptorType
0x01	bDescriptorSubtype
0x00	bmAttributes
0x00	bmControls
0x00	bLockDelayUnits   (undefined)
0x0000	wLockDelay

Microsoft OS Descriptor is not available. Error code: 0x0000001F


--------------------------------
String Descriptor Table
--------------------------------
Index  LANGID  String
0x00   0x0000  0x0409 
0x01   0x0409  "Linux 5.13.1-v8+ with fe980000.usb"
0x02   0x0409  "Linux USB Audio Gadget"
0x04   0x0409  "Source/Sink"
0x05   0x0409  "Topology Control"
0x06   0x0409  "48000Hz"
0x09   0x0409  "USBD Out"
0x0A   0x0409  "USBH In"
0x0E   0x0409  "Capture Inactive"
0x0F   0x0409  "Capture Active"

------------------------------

Connection path for device: 
Standard Enhanced PCI to USB Host Controller
Root Hub
Linux USB Audio Gadget (VID=0x1D6B PID=0x0101) Port: 1

Running on: Windows 10 or greater (Build Version 19041)

Brought to you by TDD v2.17.0, Feb 23 2021, 14:04:02


--------------446C0FBD1D3521F45A3DB938
Content-Type: text/plain; charset=UTF-8;
 name="cb1c270600b2c6f55f55f227775aaddf2cc78bed.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="cb1c270600b2c6f55f55f227775aaddf2cc78bed.txt"

Information for device Linux USB Audio Gadget (VID=0x1D6B PID=0x0101):

------------------------------
Connection Information:
------------------------------
Device current bus speed: HighSpeed
Device supports USB 1.1 specification
Device supports USB 2.0 specification
Device address: 0x0001
Current configuration value: 0x01
Number of open pipes: 0


------------------------------
Device Descriptor:
------------------------------
0x12	bLength
0x01	bDescriptorType
0x0200	bcdUSB
0xEF	bDeviceClass      (Miscellaneous device)
0x02	bDeviceSubClass   
0x01	bDeviceProtocol   
0x40	bMaxPacketSize0   (64 bytes)
0x1D6B	idVendor
0x0101	idProduct
0x0513	bcdDevice
0x01	iManufacturer   "Linux 5.13.1-v8+ with fe980000.usb"
0x02	iProduct        "Linux USB Audio Gadget"
0x00	iSerialNumber
0x01	bNumConfigurations

Device Qualifier Descriptor:
------------------------------
0x0A	bLength
0x06	bDescriptorType
0x0200	bcdUSB
0xEF	bDeviceClass      (Miscellaneous device)
0x02	bDeviceSubClass   
0x01	bDeviceProtocol   
0x40	bMaxPacketSize0   (64 bytes)
0x01	bNumConfigurations 
0x00	bReserved 


-------------------------
Configuration Descriptor:
-------------------------
0x09	bLength
0x02	bDescriptorType
0x007F	wTotalLength   (127 bytes)
0x02	bNumInterfaces
0x01	bConfigurationValue
0x00	iConfiguration
0xC0	bmAttributes   (Self-powered Device)
0x01	bMaxPower      (2 mA)

Interface Association Descriptor:
------------------------------
0x08	bLength
0x0B	bDescriptorType
0x00	bFirstInterface
0x02	bInterfaceCount
0x01	bFunctionClass      (Audio Device Class)
0x00	bFunctionSubClass   
0x20	bFunctionProtocol   (Audio Protocol IP version 2.00)
0x04	iFunction   "Source/Sink"

Interface Descriptor:
------------------------------
0x09	bLength
0x04	bDescriptorType
0x00	bInterfaceNumber
0x00	bAlternateSetting
0x00	bNumEndPoints
0x01	bInterfaceClass      (Audio Device Class)
0x01	bInterfaceSubClass   (Audio Control Interface)
0x20	bInterfaceProtocol   (Audio Protocol IP version 2.00)
0x05	iInterface   "Topology Control"

AC Interface Header Descriptor:
------------------------------
0x09	bLength
0x24	bDescriptorType
0x01	bDescriptorSubtype
0x0200	bcdADC
0x08	bCategory   (IO_BOX)
0x002E	wTotalLength   (46 bytes)
0x00	bmControls

AC Clock Source Descriptor:
------------------------------
0x08	bLength
0x24	bDescriptorType
0x0A	bDescriptorSubtype
0x03	bClockID
0x01	bmAttributes
0x01	bmControls
          Clock Frequency Control - read only
0x00	bAssocTerminal
0x06	iClockSource   "48000Hz"

AC Input Terminal Descriptor:
------------------------------
0x11	bLength
0x24	bDescriptorType
0x02	bDescriptorSubtype
0x01	bTerminalID
0x0200	wTerminalType   (Input Undefined)
0x00	bAssocTerminal
0x03	bCSourceID
0x02	bNrChannels   (2 channels)
0x00000003	bmChannelConfig
0x00	iChannelNames
0x03	bmControls
          Copy Protect Control - host programmable
0x09	iTerminal   "USBD Out"

AC Output Terminal Descriptor:
------------------------------
0x0C	bLength
0x24	bDescriptorType
0x03	bDescriptorSubtype
0x02	bTerminalID
0x0101	wTerminalType   (USB Streaming)
0x00	bAssocTerminal
0x01	bSourceID
0x03	bCSourceID
0x0003	bmControls
          Copy Protect Control - host programmable
0x0A	iTerminal   "USBH In"

Interface Descriptor:
------------------------------
0x09	bLength
0x04	bDescriptorType
0x01	bInterfaceNumber
0x00	bAlternateSetting
0x00	bNumEndPoints
0x01	bInterfaceClass      (Audio Device Class)
0x02	bInterfaceSubClass   (Audio Streaming Interface)
0x20	bInterfaceProtocol   (Audio Protocol IP version 2.00)
0x0E	iInterface   "Capture Inactive"

Interface Descriptor:
------------------------------
0x09	bLength
0x04	bDescriptorType
0x01	bInterfaceNumber
0x01	bAlternateSetting
0x01	bNumEndPoints
0x01	bInterfaceClass      (Audio Device Class)
0x02	bInterfaceSubClass   (Audio Streaming Interface)
0x20	bInterfaceProtocol   (Audio Protocol IP version 2.00)
0x0F	iInterface   "Capture Active"

AS Interface Descriptor:
------------------------------
0x10	bLength
0x24	bDescriptorType
0x01	bDescriptorSubtype
0x02	bTerminalLink
0x00	bmControls
0x01	bFormatType   (FORMAT_TYPE_1)
0x00000001	bmFormats
          PCM
0x02	bNrChannels   (2 channels)
0x00000003	bmChannelConfig
0x00	iChannelNames

AS Format Type 1 Descriptor:
------------------------------
0x06	bLength
0x24	bDescriptorType
0x02	bDescriptorSubtype
0x01	bFormatType   (FORMAT_TYPE_1)
0x02	bSubslotSize
0x10	bBitResolution   (16 bits per sample)

Endpoint Descriptor:
------------------------------
0x07	bLength
0x05	bDescriptorType
0x81	bEndpointAddress  (IN endpoint 1)
0x05	bmAttributes      (Transfer: Isochronous / Synch: Asynchronous / Usage: Data)
0x00C0	wMaxPacketSize    (1 x 192 bytes)
0x04	bInterval         (8 microframes)

AS Isochronous Data Endpoint Descriptor:
------------------------------
0x08	bLength
0x25	bDescriptorType
0x01	bDescriptorSubtype
0x00	bmAttributes
0x00	bmControls
0x00	bLockDelayUnits   (undefined)
0x0000	wLockDelay


-------------------------------------
Other Speed Configuration Descriptor:
-------------------------------------
0x09	bLength
0x07	bDescriptorType
0x007F	wTotalLength   (127 bytes)
0x02	bNumInterfaces
0x01	bConfigurationValue
0x00	iConfiguration
0xC0	bmAttributes   (Self-powered Device)
0x01	bMaxPower      (2 mA)

Interface Association Descriptor:
------------------------------
0x08	bLength
0x0B	bDescriptorType
0x00	bFirstInterface
0x02	bInterfaceCount
0x01	bFunctionClass      (Audio Device Class)
0x00	bFunctionSubClass   
0x20	bFunctionProtocol   (Audio Protocol IP version 2.00)
0x04	iFunction   "Source/Sink"

Interface Descriptor:
------------------------------
0x09	bLength
0x04	bDescriptorType
0x00	bInterfaceNumber
0x00	bAlternateSetting
0x00	bNumEndPoints
0x01	bInterfaceClass      (Audio Device Class)
0x01	bInterfaceSubClass   (Audio Control Interface)
0x20	bInterfaceProtocol   (Audio Protocol IP version 2.00)
0x05	iInterface   "Topology Control"

AC Interface Header Descriptor:
------------------------------
0x09	bLength
0x24	bDescriptorType
0x01	bDescriptorSubtype
0x0200	bcdADC
0x08	bCategory   (IO_BOX)
0x002E	wTotalLength   (46 bytes)
0x00	bmControls

AC Clock Source Descriptor:
------------------------------
0x08	bLength
0x24	bDescriptorType
0x0A	bDescriptorSubtype
0x03	bClockID
0x01	bmAttributes
0x01	bmControls
          Clock Frequency Control - read only
0x00	bAssocTerminal
0x06	iClockSource   "48000Hz"

AC Input Terminal Descriptor:
------------------------------
0x11	bLength
0x24	bDescriptorType
0x02	bDescriptorSubtype
0x01	bTerminalID
0x0200	wTerminalType   (Input Undefined)
0x00	bAssocTerminal
0x03	bCSourceID
0x02	bNrChannels   (2 channels)
0x00000003	bmChannelConfig
0x00	iChannelNames
0x03	bmControls
          Copy Protect Control - host programmable
0x09	iTerminal   "USBD Out"

AC Output Terminal Descriptor:
------------------------------
0x0C	bLength
0x24	bDescriptorType
0x03	bDescriptorSubtype
0x02	bTerminalID
0x0101	wTerminalType   (USB Streaming)
0x00	bAssocTerminal
0x01	bSourceID
0x03	bCSourceID
0x0003	bmControls
          Copy Protect Control - host programmable
0x0A	iTerminal   "USBH In"

Interface Descriptor:
------------------------------
0x09	bLength
0x04	bDescriptorType
0x01	bInterfaceNumber
0x00	bAlternateSetting
0x00	bNumEndPoints
0x01	bInterfaceClass      (Audio Device Class)
0x02	bInterfaceSubClass   (Audio Streaming Interface)
0x20	bInterfaceProtocol   (Audio Protocol IP version 2.00)
0x0E	iInterface   "Capture Inactive"

Interface Descriptor:
------------------------------
0x09	bLength
0x04	bDescriptorType
0x01	bInterfaceNumber
0x01	bAlternateSetting
0x01	bNumEndPoints
0x01	bInterfaceClass      (Audio Device Class)
0x02	bInterfaceSubClass   (Audio Streaming Interface)
0x20	bInterfaceProtocol   (Audio Protocol IP version 2.00)
0x0F	iInterface   "Capture Active"

AS Interface Descriptor:
------------------------------
0x10	bLength
0x24	bDescriptorType
0x01	bDescriptorSubtype
0x02	bTerminalLink
0x00	bmControls
0x01	bFormatType   (FORMAT_TYPE_1)
0x00000001	bmFormats
          PCM
0x02	bNrChannels   (2 channels)
0x00000003	bmChannelConfig
0x00	iChannelNames

AS Format Type 1 Descriptor:
------------------------------
0x06	bLength
0x24	bDescriptorType
0x02	bDescriptorSubtype
0x01	bFormatType   (FORMAT_TYPE_1)
0x02	bSubslotSize
0x10	bBitResolution   (16 bits per sample)

Endpoint Descriptor:
------------------------------
0x07	bLength
0x05	bDescriptorType
0x81	bEndpointAddress  (IN endpoint 1)
0x05	bmAttributes      (Transfer: Isochronous / Synch: Asynchronous / Usage: Data)
0x00C0	wMaxPacketSize    (1 x 192 bytes)
0x01	bInterval         (1 frames)

AS Isochronous Data Endpoint Descriptor:
------------------------------
0x08	bLength
0x25	bDescriptorType
0x01	bDescriptorSubtype
0x00	bmAttributes
0x00	bmControls
0x00	bLockDelayUnits   (undefined)
0x0000	wLockDelay

Microsoft OS Descriptor is not available. Error code: 0x0000001F


--------------------------------
String Descriptor Table
--------------------------------
Index  LANGID  String
0x00   0x0000  0x0409 
0x01   0x0409  "Linux 5.13.1-v8+ with fe980000.usb"
0x02   0x0409  "Linux USB Audio Gadget"
0x04   0x0409  "Source/Sink"
0x05   0x0409  "Topology Control"
0x06   0x0409  "48000Hz"
0x09   0x0409  "USBD Out"
0x0A   0x0409  "USBH In"
0x0E   0x0409  "Capture Inactive"
0x0F   0x0409  "Capture Active"

------------------------------

Connection path for device: 
Standard Enhanced PCI to USB Host Controller
Root Hub
Linux USB Audio Gadget (VID=0x1D6B PID=0x0101) Port: 1

Running on: Windows 10 or greater (Build Version 19041)

Brought to you by TDD v2.17.0, Feb 23 2021, 14:04:02


--------------446C0FBD1D3521F45A3DB938--

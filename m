Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7666253834
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 21:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgHZTUm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 15:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbgHZTUl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 15:20:41 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC8AC061574
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 12:20:40 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id d10so2049871wrw.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 12:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=q0K8/LpO/QOtJvaAMC+tC1n9FJzunaxYxczgnVQt10o=;
        b=MOP9J9FXXWYo3zVO6niwRb/kN5fMDuFeJxxjeHrfpLjtLFmcuIpFgsQ6NCm/dgp8cj
         g2sry6z/bIx+uC/tjIETEljK1ApXxSkWyGmuNFA24jlNwNy+GvcPZWeymAO7N+dXlAla
         rF6pr37v94TNPQ1/tVBsrvBKhnahleiXPV9yYkLbTAgmae4XePwL19pBz7fbNu+5eFAC
         6LkO+E3GnRJrBZVoDxH3UQpqLSMCDInFsi3yroY8Rira84W2t30e/bFnwi7V+d9K464D
         R6BMjPfCQ1crzsIndDbzejw64k2/j95BpjlHvL9SohASCNraNQvJEFxeykOKIrbXLBV5
         wO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=q0K8/LpO/QOtJvaAMC+tC1n9FJzunaxYxczgnVQt10o=;
        b=By5r+g7DgtY2fJzCOS5AmKRLzuxGlJofPFYvWFxEHnU019iBUEOUhN2fqZtgqpeh7k
         RWGG3ksbvD9adX3c3JusL5QqF4ZTe+doNr+7KpO4VMMitJOK+7V9DfTlYf8DSCWaD4kc
         8BTbynBncigh95SUpyPZzvZuOOuQ+KNADIwIciEJaXVFWHRaXyzf5BTIJwTSkWGuRbxq
         EVvAH6LduUTAHRWQZZTqxuFv6FH3IxoGxp45A6m+W3rauBsQpP1kzyJ5GEIw0HQaNx6i
         CrG+aWj3ADY+n8/fIPcKaomdHRGMLeXJsmUwpC+UYbPlkb0qKs+0vTLMyr5KmBDIQv1Q
         ymkQ==
X-Gm-Message-State: AOAM5306MCE4J+0D4oAeXaGj3iIv4nDRbtb0AQ9slYx+9z/KVR6Zdvnm
        N8L7F7vDQcFjJqG6eszSDjjVPV/mvj1Zcw==
X-Google-Smtp-Source: ABdhPJw88Xlrv+/lkAMow43boCfMbaLEEOwwymbQpV0NGQItFRqeh6NCmmPV3eIa3GdIN4Rmq5bdRA==
X-Received: by 2002:a5d:570d:: with SMTP id a13mr16649419wrv.111.1598469638807;
        Wed, 26 Aug 2020 12:20:38 -0700 (PDT)
Received: from localhost.localdomain (158.204.16.93.rev.sfr.net. [93.16.204.158])
        by smtp.gmail.com with ESMTPSA id 11sm7422405wmo.23.2020.08.26.12.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 12:20:38 -0700 (PDT)
Subject: Re: Duplicate endpoint : Sound Devices MixPre-D (sound interface)
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
References: <a8e7a061-e788-9c57-59fc-243d0daae851@gmail.com>
 <20200825004845.GC350601@rowland.harvard.edu>
 <5fbc016f-95f2-6c5c-5749-e8ea3250d18c@gmail.com>
 <20200825145743.GB365901@rowland.harvard.edu>
From:   Jean-Christophe Barnoud <jcbarnoud@gmail.com>
Message-ID: <45b3ef46-0b24-fc82-838d-1dab47a61b30@gmail.com>
Date:   Wed, 26 Aug 2020 21:20:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825145743.GB365901@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Le 25/08/2020 à 16:57, Alan Stern a écrit :
> Please use Reply-To-All so that your message gets sent to the mailing
> list as well as to me.
>
> On Tue, Aug 25, 2020 at 06:16:59AM +0200, Jean-Christophe Barnoud wrote:
>> Le 25/08/2020 à 02:48, Alan Stern a écrit :
>>> On Mon, Aug 24, 2020 at 06:48:37PM +0200, Jean-Christophe Barnoud wrote:
>>>> Hello.
>>>>
>>>> The team at libusb says that this is a kernel issue so here it is.
>>>> Device : Sound Devices MixPre-D
>>>> This is an external audio interface that worked simultaneously as input and
>>>> output with older kernels and libusb versions (see far below with fedora 26,
>>>> kernel 4.13.13-200, libusb 0.1.5-8 from an older mothballed machine).
>>>> With newer versions of the kernel and libusb it works only as output (see
>>>> just below with a current fedora 32, kernel 5.7.15-200, libusb-0.1.5-16).
>>>>
>>>> An online search shows that the dmesg output "duplicate endpoint" is
>>>> identical to the one referenced in this permalink :
>>>> http://archive.lwn.net:8080/linux-kernel/20200201105829.5682c887@acme7.acmenet/
>>>> So I guess that the solution is the same, adding in
>>>> drivers/usb/core/quirks.c (adapted to the specific hardware identification)
>>>> :
>>>> +    /* Sound Devices MixPre-D */
>>>> +    { USB_DEVICE(0x0926, 0x0208), .driver_info =
>>>> USB_QUIRK_ENDPOINT_BLACKLIST },
>>> More than just this entry is needed; there also has to be an entry
>>> listing the endpoints to be ignored.  But that's straightforward to add.
>>>
>>>> +
>>>> Would it be possible to add this exception to quirks.c ?
>>>> Thanks
>>>>
>>>>
>>>> Fedora 32
>>>>
>>>> [jcb@localhost ~]$ dmesg
>>>> [181470.940975] usb 3-9: new high-speed USB device number 6 using xhci_hcd
>>>> [181471.067606] usb 3-9: config 1 interface 2 altsetting 1 has a duplicate
>>>> endpoint with address 0x85, skipping
>>>> [181471.067609] usb 3-9: config 1 interface 2 altsetting 2 has a duplicate
>>>> endpoint with address 0x85, skipping
>>> Can you provide the output from "lsusb -v" for this device?  We'd like
>>> to know exactly what's being added to the ignore list and why, before
>>> doing it.
>>>
>>> Alan Stern
>> The output of lsusb -v was quite long so here is the part related to the
>> MixPre-D :
>>
>>
>> Bus 003 Device 004: ID 0926:0208 Sound Devices MixPre-D
>> Device Descriptor:
>>    bLength                18
>>    bDescriptorType         1
>>    bcdUSB               2.00
>>    bDeviceClass          239 Miscellaneous Device
>>    bDeviceSubClass         2
>>    bDeviceProtocol         1 Interface Association
>>    bMaxPacketSize0        64
>>    idVendor           0x0926
>>    idProduct          0x0208
>>    bcdDevice            1.00
>>    iManufacturer           1
>>    iProduct                2
>>    iSerial                 3
>>    bNumConfigurations      1
>>    Configuration Descriptor:
>>      bLength                 9
>>      bDescriptorType         2
>>      wTotalLength       0x015a
>>      bNumInterfaces          4
>>      bConfigurationValue     1
>>      iConfiguration          0
>>      bmAttributes         0xc0
>>        Self Powered
>>      MaxPower                0mA
>>      Interface Association:
>>        bLength                 8
>>        bDescriptorType        11
>>        bFirstInterface         0
>>        bInterfaceCount         3
>>        bFunctionClass          1 Audio
>>        bFunctionSubClass       0
>>        bFunctionProtocol       0
>>        iFunction               0
>>      Interface Descriptor:
>>        bLength                 9
>>        bDescriptorType         4
>>        bInterfaceNumber        0
>>        bAlternateSetting       0
>>        bNumEndpoints           0
>>        bInterfaceClass         1 Audio
>>        bInterfaceSubClass      1 Control Device
>>        bInterfaceProtocol      0
>>        iInterface              0
>>        AudioControl Interface Descriptor:
>>          bLength                10
>>          bDescriptorType        36
>>          bDescriptorSubtype      1 (HEADER)
>>          bcdADC               1.00
>>          wTotalLength       0x0034
>>          bInCollection           2
>>          baInterfaceNr(0)        1
>>          baInterfaceNr(1)        2
>>        AudioControl Interface Descriptor:
>>          bLength                12
>>          bDescriptorType        36
>>          bDescriptorSubtype      2 (INPUT_TERMINAL)
>>          bTerminalID             1
>>          wTerminalType      0x0101 USB Streaming
>>          bAssocTerminal          0
>>          bNrChannels             2
>>          wChannelConfig     0x0003
>>            Left Front (L)
>>            Right Front (R)
>>          iChannelNames           0
>>          iTerminal               0
>>        AudioControl Interface Descriptor:
>>          bLength                 9
>>          bDescriptorType        36
>>          bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>>          bTerminalID             2
>>          wTerminalType      0x0301 Speaker
>>          bAssocTerminal          0
>>          bSourceID               1
>>          iTerminal               0
>>        AudioControl Interface Descriptor:
>>          bLength                12
>>          bDescriptorType        36
>>          bDescriptorSubtype      2 (INPUT_TERMINAL)
>>          bTerminalID             3
>>          wTerminalType      0x0602 Digital Audio Interface
>>          bAssocTerminal          0
>>          bNrChannels             2
>>          wChannelConfig     0x0003
>>            Left Front (L)
>>            Right Front (R)
>>          iChannelNames           0
>>          iTerminal               0
>>        AudioControl Interface Descriptor:
>>          bLength                 9
>>          bDescriptorType        36
>>          bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>>          bTerminalID             4
>>          wTerminalType      0x0101 USB Streaming
>>          bAssocTerminal          0
>>          bSourceID               3
>>          iTerminal               0
>>      Interface Descriptor:
>>        bLength                 9
>>        bDescriptorType         4
>>        bInterfaceNumber        1
>>        bAlternateSetting       0
>>        bNumEndpoints           0
>>        bInterfaceClass         1 Audio
>>        bInterfaceSubClass      2 Streaming
>>        bInterfaceProtocol      0
>>        iInterface              0
>>      Interface Descriptor:
>>        bLength                 9
>>        bDescriptorType         4
>>        bInterfaceNumber        1
>>        bAlternateSetting       1
>>        bNumEndpoints           2
>>        bInterfaceClass         1 Audio
>>        bInterfaceSubClass      2 Streaming
>>        bInterfaceProtocol      0
>>        iInterface              0
>>        AudioStreaming Interface Descriptor:
>>          bLength                 7
>>          bDescriptorType        36
>>          bDescriptorSubtype      1 (AS_GENERAL)
>>          bTerminalLink           1
>>          bDelay                  1 frames
>>          wFormatTag         0x0001 PCM
>>        AudioStreaming Interface Descriptor:
>>          bLength                14
>>          bDescriptorType        36
>>          bDescriptorSubtype      2 (FORMAT_TYPE)
>>          bFormatType             1 (FORMAT_TYPE_I)
>>          bNrChannels             2
>>          bSubframeSize           2
>>          bBitResolution         16
>>          bSamFreqType            2 Discrete
>>          tSamFreq[ 0]        44100
>>          tSamFreq[ 1]        48000
>>        Endpoint Descriptor:
>>          bLength                 9
>>          bDescriptorType         5
>>          bEndpointAddress     0x06  EP 6 OUT
>>          bmAttributes            5
>>            Transfer Type            Isochronous
>>            Synch Type               Asynchronous
>>            Usage Type               Data
>>          wMaxPacketSize     0x0126  1x 294 bytes
>>          bInterval               4
>>          bRefresh                0
>>          bSynchAddress         129
>>          AudioStreaming Endpoint Descriptor:
>>            bLength                 7
>>            bDescriptorType        37
>>            bDescriptorSubtype      1 (EP_GENERAL)
>>            bmAttributes         0x01
>>              Sampling Frequency
>>            bLockDelayUnits         2 Decoded PCM samples
>>            wLockDelay         0x0000
>>        Endpoint Descriptor:
>>          bLength                 9
>>          bDescriptorType         5
>>          bEndpointAddress     0x81  EP 1 IN
>>          bmAttributes            1
>>            Transfer Type            Isochronous
>>            Synch Type               None
>>            Usage Type               Data
>>          wMaxPacketSize     0x0003  1x 3 bytes
>>          bInterval               4
>>          bRefresh                5
>>          bSynchAddress           0
>>      Interface Descriptor:
>>        bLength                 9
>>        bDescriptorType         4
>>        bInterfaceNumber        1
>>        bAlternateSetting       2
>>        bNumEndpoints           2
>>        bInterfaceClass         1 Audio
>>        bInterfaceSubClass      2 Streaming
>>        bInterfaceProtocol      0
>>        iInterface              0
>>        AudioStreaming Interface Descriptor:
>>          bLength                 7
>>          bDescriptorType        36
>>          bDescriptorSubtype      1 (AS_GENERAL)
>>          bTerminalLink           1
>>          bDelay                  1 frames
>>          wFormatTag         0x0001 PCM
>>        AudioStreaming Interface Descriptor:
>>          bLength                14
>>          bDescriptorType        36
>>          bDescriptorSubtype      2 (FORMAT_TYPE)
>>          bFormatType             1 (FORMAT_TYPE_I)
>>          bNrChannels             2
>>          bSubframeSize           3
>>          bBitResolution         24
>>          bSamFreqType            2 Discrete
>>          tSamFreq[ 0]        44100
>>          tSamFreq[ 1]        48000
>>        Endpoint Descriptor:
>>          bLength                 9
>>          bDescriptorType         5
>>          bEndpointAddress     0x06  EP 6 OUT
>>          bmAttributes            5
>>            Transfer Type            Isochronous
>>            Synch Type               Asynchronous
>>            Usage Type               Data
>>          wMaxPacketSize     0x0126  1x 294 bytes
>>          bInterval               4
>>          bRefresh                0
>>          bSynchAddress         129
>>          AudioStreaming Endpoint Descriptor:
>>            bLength                 7
>>            bDescriptorType        37
>>            bDescriptorSubtype      1 (EP_GENERAL)
>>            bmAttributes         0x01
>>              Sampling Frequency
>>            bLockDelayUnits         2 Decoded PCM samples
>>            wLockDelay         0x0000
>>        Endpoint Descriptor:
>>          bLength                 9
>>          bDescriptorType         5
>>          bEndpointAddress     0x81  EP 1 IN
>>          bmAttributes            1
>>            Transfer Type            Isochronous
>>            Synch Type               None
>>            Usage Type               Data
>>          wMaxPacketSize     0x0003  1x 3 bytes
>>          bInterval               4
>>          bRefresh                5
>>          bSynchAddress           0
>>      Interface Descriptor:
>>        bLength                 9
>>        bDescriptorType         4
>>        bInterfaceNumber        1
>>        bAlternateSetting       3
>>        bNumEndpoints           2
>>        bInterfaceClass       255 Vendor Specific Class
>>        bInterfaceSubClass      0
>>        bInterfaceProtocol      0
>>        iInterface              0
>>        Endpoint Descriptor:
>>          bLength                 7
>>          bDescriptorType         5
>>          bEndpointAddress     0x85  EP 5 IN
>>          bmAttributes            5
>>            Transfer Type            Isochronous
>>            Synch Type               Asynchronous
>>            Usage Type               Data
>>          wMaxPacketSize     0x0126  1x 294 bytes
>>          bInterval               1
>>        Endpoint Descriptor:
>>          bLength                 7
>>          bDescriptorType         5
>>          bEndpointAddress     0x06  EP 6 OUT
>>          bmAttributes            5
>>            Transfer Type            Isochronous
>>            Synch Type               Asynchronous
>>            Usage Type               Data
>>          wMaxPacketSize     0x0126  1x 294 bytes
>>          bInterval               1
>>      Interface Descriptor:
>>        bLength                 9
>>        bDescriptorType         4
>>        bInterfaceNumber        2
>>        bAlternateSetting       0
>>        bNumEndpoints           0
>>        bInterfaceClass         1 Audio
>>        bInterfaceSubClass      2 Streaming
>>        bInterfaceProtocol      0
>>        iInterface              0
>>      Interface Descriptor:
>>        bLength                 9
>>        bDescriptorType         4
>>        bInterfaceNumber        2
>>        bAlternateSetting       1
>>        bNumEndpoints           1
>>        bInterfaceClass         1 Audio
>>        bInterfaceSubClass      2 Streaming
>>        bInterfaceProtocol      0
>>        iInterface              0
>>        AudioStreaming Interface Descriptor:
>>          bLength                 7
>>          bDescriptorType        36
>>          bDescriptorSubtype      1 (AS_GENERAL)
>>          bTerminalLink           4
>>          bDelay                  1 frames
>>          wFormatTag         0x0001 PCM
>>        AudioStreaming Interface Descriptor:
>>          bLength                14
>>          bDescriptorType        36
>>          bDescriptorSubtype      2 (FORMAT_TYPE)
>>          bFormatType             1 (FORMAT_TYPE_I)
>>          bNrChannels             2
>>          bSubframeSize           2
>>          bBitResolution         16
>>          bSamFreqType            2 Discrete
>>          tSamFreq[ 0]        44100
>>          tSamFreq[ 1]        48000
>>        Endpoint Descriptor:
>>          bLength                 9
>>          bDescriptorType         5
>>          bEndpointAddress     0x85  EP 5 IN
>>          bmAttributes            5
>>            Transfer Type            Isochronous
>>            Synch Type               Asynchronous
>>            Usage Type               Data
>>          wMaxPacketSize     0x0126  1x 294 bytes
>>          bInterval               4
>>          bRefresh                0
>>          bSynchAddress           0
>>          AudioStreaming Endpoint Descriptor:
>>            bLength                 7
>>            bDescriptorType        37
>>            bDescriptorSubtype      1 (EP_GENERAL)
>>            bmAttributes         0x01
>>              Sampling Frequency
>>            bLockDelayUnits         2 Decoded PCM samples
>>            wLockDelay         0x0000
>>      Interface Descriptor:
>>        bLength                 9
>>        bDescriptorType         4
>>        bInterfaceNumber        2
>>        bAlternateSetting       2
>>        bNumEndpoints           1
>>        bInterfaceClass         1 Audio
>>        bInterfaceSubClass      2 Streaming
>>        bInterfaceProtocol      0
>>        iInterface              0
>>        AudioStreaming Interface Descriptor:
>>          bLength                 7
>>          bDescriptorType        36
>>          bDescriptorSubtype      1 (AS_GENERAL)
>>          bTerminalLink           4
>>          bDelay                  1 frames
>>          wFormatTag         0x0001 PCM
>>        AudioStreaming Interface Descriptor:
>>          bLength                14
>>          bDescriptorType        36
>>          bDescriptorSubtype      2 (FORMAT_TYPE)
>>          bFormatType             1 (FORMAT_TYPE_I)
>>          bNrChannels             2
>>          bSubframeSize           3
>>          bBitResolution         24
>>          bSamFreqType            2 Discrete
>>          tSamFreq[ 0]        44100
>>          tSamFreq[ 1]        48000
>>        Endpoint Descriptor:
>>          bLength                 9
>>          bDescriptorType         5
>>          bEndpointAddress     0x85  EP 5 IN
>>          bmAttributes            5
>>            Transfer Type            Isochronous
>>            Synch Type               Asynchronous
>>            Usage Type               Data
>>          wMaxPacketSize     0x0126  1x 294 bytes
>>          bInterval               4
>>          bRefresh                0
>>          bSynchAddress           0
>>          AudioStreaming Endpoint Descriptor:
>>            bLength                 7
>>            bDescriptorType        37
>>            bDescriptorSubtype      1 (EP_GENERAL)
>>            bmAttributes         0x01
>>              Sampling Frequency
>>            bLockDelayUnits         2 Decoded PCM samples
>>            wLockDelay         0x0000
>>      Interface Descriptor:
>>        bLength                 9
>>        bDescriptorType         4
>>        bInterfaceNumber        3
>>        bAlternateSetting       0
>>        bNumEndpoints           1
>>        bInterfaceClass         3 Human Interface Device
>>        bInterfaceSubClass      0
>>        bInterfaceProtocol      0
>>        iInterface              0
>>          HID Device Descriptor:
>>            bLength                 9
>>            bDescriptorType        33
>>            bcdHID               1.01
>>            bCountryCode            0 Not supported
>>            bNumDescriptors         1
>>            bDescriptorType        34 Report
>>            wDescriptorLength      66
>>           Report Descriptors:
>>             ** UNAVAILABLE **
>>        Endpoint Descriptor:
>>          bLength                 7
>>          bDescriptorType         5
>>          bEndpointAddress     0x82  EP 2 IN
>>          bmAttributes            3
>>            Transfer Type            Interrupt
>>            Synch Type               None
>>            Usage Type               Data
>>          wMaxPacketSize     0x0040  1x 64 bytes
>>          bInterval               4
> Okay, this device does look a lot like the Sound Device USBPre2, so
> the patch below should work.  Please test it and let me know.
>
> Warning: This patch was written for 5.9-rc2.  It will require a little
> adaptation to work with earlier kernel versions.
>
> Alan Stern
>
>
>
> Index: usb-devel/drivers/usb/core/quirks.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/quirks.c
> +++ usb-devel/drivers/usb/core/quirks.c
> @@ -370,6 +370,10 @@ static const struct usb_device_id usb_qu
>   	{ USB_DEVICE(0x0926, 0x0202), .driver_info =
>   			USB_QUIRK_ENDPOINT_IGNORE },
>   
> +	/* Sound Devices MixPre-D */
> +	{ USB_DEVICE(0x0926, 0x0208), .driver_info =
> +			USB_QUIRK_ENDPOINT_IGNORE },
> +
>   	/* Keytouch QWERTY Panel keyboard */
>   	{ USB_DEVICE(0x0926, 0x3333), .driver_info =
>   			USB_QUIRK_CONFIG_INTF_STRINGS },
> @@ -509,6 +513,7 @@ static const struct usb_device_id usb_am
>    */
>   static const struct usb_device_id usb_endpoint_ignore[] = {
>   	{ USB_DEVICE_INTERFACE_NUMBER(0x0926, 0x0202, 1), .driver_info = 0x85 },
> +	{ USB_DEVICE_INTERFACE_NUMBER(0x0926, 0x0208, 1), .driver_info = 0x85 },
>   	{ }
>   };
>   

It works!

I had to adapt the patch replacing USB_QUIRK_ENDPOINT_IGNORE by 
USB_QUIRK_ENDPOINT_BLACKLIST to compile with a 5.7.16 kernel.

Here is the dmesg output :

[   71.735873] usb 3-9: new high-speed USB device number 4 using xhci_hcd
[   71.862556] usb 3-9: config 1 interface 1 altsetting 3 has a 
blacklisted endpoint with address 0x85, skipping
[   71.862930] usb 3-9: New USB device found, idVendor=0926, 
idProduct=0208, bcdDevice= 1.00
[   71.862933] usb 3-9: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[   71.862934] usb 3-9: Product: MixPre-D
[   71.862936] usb 3-9: Manufacturer: Sound Devices
[   71.862937] usb 3-9: SerialNumber: JP0713320007
[   71.865678] usb 3-9: 1:3 : UAC_AS_GENERAL descriptor not found
[   71.868693] hid-generic 0003:0926:0208.000F: hiddev99,hidraw7: USB 
HID v1.01 Device [Sound Devices MixPre-D] on usb-0000:00:14.0-9/input3

Tested with Audacity, input and output through the MixPre-D both work 
normally.

Thanks a lot.



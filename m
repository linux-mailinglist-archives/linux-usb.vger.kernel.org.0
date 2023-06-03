Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 502D87213D7
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jun 2023 01:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjFCX7Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Jun 2023 19:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjFCX7X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Jun 2023 19:59:23 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A24FED
        for <linux-usb@vger.kernel.org>; Sat,  3 Jun 2023 16:59:22 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-541f4ee6f89so2400266eaf.2
        for <linux-usb@vger.kernel.org>; Sat, 03 Jun 2023 16:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685836761; x=1688428761;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jXiTnrgUYthUygSNS2TnF+eHarQQsueuQuGFlf+WVR0=;
        b=ovUNFInoMFIfOFdKS26IXhwU+7ouTMnvLTw5lNah97kPV+bNVa5gVVCR/wykIM+yQB
         rATK61ZfA10xcW8jkJZCK7u9NwTyY3VpkHilFibUXeCIb6jE8AxtCWhIzQcKSA0hvRG8
         ANqcogfmod8J13QfCqgpzhML4dDojxqrkBjwbhHQGGEbY+IeEX0L0wM7woWteUO8TVKR
         /nJTolQIPin5W/AV2K15S2v0Iz2Z6I6mvJ7DG5goe2jugjhALvdddOSekFeTlHMSE2FW
         ufiUKjFdg561A4dF4Ztu094t/C06s5BndE31UIRAaPne7UdZUpJv4W7MeWlFeV2zFQ7m
         Iapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685836761; x=1688428761;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jXiTnrgUYthUygSNS2TnF+eHarQQsueuQuGFlf+WVR0=;
        b=UmtqreYQjtVYLHW4G6aSD4kyZDHiTDwxVLIzSBUCVw4mEBUOZ31j3pMJNDrfbkxOOl
         rf7kI7JGrzWRFe/BJFArByaRfJqVGzukSIj/IhEiJcBpQHBEttp65qEsFle7+XjjZRKo
         8sO50S0gxdl2CB1H2Zq5sphewS8CqM6S7rBXTPy67Ty5DiAUw0ZdCuoKQmeo4yN+GjpB
         o3tuALoc0UhvCLhyrbf8t1Erb+/N/VZO+OwzpNztFzcZ1XsIQvXRZwgMVA7jbvGp/3F4
         e48rnvC2WK8anp002FKRkRtHOAgsrDuo00j7EkoaJPuBSleQBh9yR6Z57QpA1OcY1E46
         FSfw==
X-Gm-Message-State: AC+VfDyyO7C+sl/igvdegprMpuAKQLku12lJFEuFV/JP+ybMlkDMAgKV
        USjurH8bYZNHJzc85VIy84SmePwLvUDq1Q==
X-Google-Smtp-Source: ACHHUZ410/+iuIVbwlajjs7X6G0DyjP9IK76zvGwBC3vE7JDEJDiobWdbbbHCVNoTJMCNAxRqQtxXw==
X-Received: by 2002:a4a:e04a:0:b0:558:b224:ce9f with SMTP id v10-20020a4ae04a000000b00558b224ce9fmr929138oos.7.1685836761118;
        Sat, 03 Jun 2023 16:59:21 -0700 (PDT)
Received: from ?IPV6:2605:a601:ab5d:b200:ac6f:a0c:68ed:e64? ([2605:a601:ab5d:b200:ac6f:a0c:68ed:e64])
        by smtp.gmail.com with ESMTPSA id g9-20020a4ae889000000b005586008cd5dsm1890683ooe.6.2023.06.03.16.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jun 2023 16:59:20 -0700 (PDT)
Message-ID: <b748359d-b116-6354-036c-94679bc7b306@gmail.com>
Date:   Sat, 3 Jun 2023 18:59:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
Content-Language: en-US
To:     Oliver Neukum <oneukum@suse.com>,
        =?UTF-8?Q?Michael_La=c3=9f?= <bevan@bi-co.net>,
        linux-usb@vger.kernel.org
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
 <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
 <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
 <2f98290f-995b-89ff-8ba2-1463fcf78297@suse.com>
 <9a1381abe0e2b605786bc9c3b2daa3f7bdc3b64c.camel@bi-co.net>
 <e977c0e1-4604-47cc-9c53-619bc897d418@suse.com>
 <646eb1bb5218b9ce5df21e89081b09b84dbd46fd.camel@bi-co.net>
 <46e50745-63e4-7e97-739c-338f9a6445d2@suse.com>
 <c93512db198b14ff8892102cfecec3bea8688aaf.camel@bi-co.net>
 <9f8df0d2-f2af-8e62-fe34-7d826678ac7e@suse.com>
From:   Warren Togami <wtogami@gmail.com>
In-Reply-To: <9f8df0d2-f2af-8e62-fe34-7d826678ac7e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/27/23 03:05, Oliver Neukum wrote:

> On 23.03.23 22:32, Michael Laß wrote:
>>> I am asking because the device says that it is bus powered.
>>> That is, are we putting the device into some sleep state?
>>
>> This got me thinking. I am observing the behavior on a ZedBoard, a
>> development board that contains a Xilinx Zynq SoC and the Cypress UART
>> chip connected to that SoC. I now looked into the schematic of that
>> board.
>
> Are those devices out in the wild? That is can one buy them or did
> you get it through development channels?

https://blockstream.com/jade/
We have a mass produced device Blockstream Jade with USB serial chip 
CH9102F 1a86:55d4 misbehaving in the same manner. Tens of thousands of 
this device were manufactured and sold worldwide. This board fails to 
communicate with Linux cdc-acm unless autosuspend is turned off 
(power/control set to 'on'). lsusb -v similarly reports "Bus Powered" 
and "Remote Wakeup". [1]

Either of these workarounds allow this device to work by disabling 
autosuspend:

* udev rule: ATTRS{idProduct}=="55d4", ATTRS{idVendor}=="1a86", 
SUBSYSTEM=="usb", TEST=="power/control" ATTR{power/control}="on"
* usbcore.quirks=1a86:55d4:b

>> The chip is a CY7C64225-28PVXC and the datasheet has a section on USB
>> suspend and resume: When suspended, a separate WAKE input pin has to be
>> set high to issue a remote wake-up. The designers of the ZedBoard have
>> tied this pin to ground...
>
> That is technically allowed, though disappointing, but then you cannot 
> advertise
> "remote wakeup" in the device descriptor.
>> So the chip behaves as documented. If any, this is an issue with the
>> board design. Nothing the kernel could work around. Sorry, I hope I
>> haven't stolen too much of your time.
>
> The kernel could work around it. We could quirk the device to ignore
> the remote wakeup bit from this particular device based on ID.
> RESET_RESUME would do that, albeit with side effects.
>
> If such devices are found on sale we need to do something.
>
>     Regards
>         Oliver


https://datasheet.lcsc.com/lcsc/2108181630_WCH-Jiangsu-Qin-Heng-CH9102F_C2858418.pdf
The board contains the CH9102F USB to serial chip which appears in Linux 
as /dev/ttyACM#. Prior to 2021 an earlier variant had the CP210x USB to 
serial chip.

https://www.cnx-software.com/2021/09/14/ch9102f-a-replacement-for-cp2104-usb-to-uart-bridge/

During the pandemic supply chain constraints led to some switching to 
the CH9102F which is described here as *almost* a drop-in replacement. 
Unfortunately the pinout differences might have mattered. I am uncertain 
if the board design could have been better but that is now in the past. 
Too many were mass produced so I am hoping for a USB quirk to stabilize 
this going forward.

I have confirmed USB_QUIRK_RESET_RESUME allows this device to function 
for the same reason it works for the Cypress. I am uncertain if a 
narrower new quirk "ignore the remote wakeup bit" would work here. How 
can I test that?

We'd like to send a product sample to a linux-usb maintainer if they 
would like to try it. Please e-mail me directly in that case.

Best Regards,
Warren Togami

[1] lsusb -v -d 1a86:55d4

Bus 005 Device 002: ID 1a86:55d4 QinHeng Electronics USB Single Serial
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               1.10
   bDeviceClass            2 Communications
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         8
   idVendor           0x1a86 QinHeng Electronics
   idProduct          0x55d4
   bcdDevice            4.43
   iManufacturer           0
   iProduct                2 USB Single Serial
   iSerial                 3 537A009111
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0043
     bNumInterfaces          2
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup
     MaxPower              134mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         2 Communications
       bInterfaceSubClass      2 Abstract (modem)
       bInterfaceProtocol      1 AT-commands (v.25ter)
       iInterface              0
       CDC Header:
         bcdCDC               1.10
       CDC Call Management:
         bmCapabilities       0x00
         bDataInterface          1
       CDC ACM:
         bmCapabilities       0x02
           line coding and serial state
       CDC Union:
         bMasterInterface        0
         bSlaveInterface         1
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0010  1x 16 bytes
         bInterval               1
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass        10 CDC Data
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x02  EP 2 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0020  1x 32 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
Device Status:     0x0000
   (Bus Powered)


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C97E4B0597
	for <lists+linux-usb@lfdr.de>; Thu, 10 Feb 2022 06:44:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234191AbiBJFnI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Feb 2022 00:43:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234435AbiBJFmM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Feb 2022 00:42:12 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E2B2604
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 21:41:26 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id h8so5088339lfj.10
        for <linux-usb@vger.kernel.org>; Wed, 09 Feb 2022 21:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7k/rFBBX963wt54wcPAs8b7rJd9JaUNfh769iSm1U8Y=;
        b=SAbivp1NoqZ+jC7hIWAFn/QvNwIVuqPg5wn+dvKyxhzLbhFzF9i7HBvVFVycMNtogf
         Oh0g/UkUaa4pg28Kpb9GzOZe8Eg0olbklDug29n602qprInmQpa7bKb3uCBELPLRcBNx
         GvEDbQtkxm1DyBdSqLvBmiqsk1/4RjiNhB4BUyMIQh55eaXC4XZqVtqiJQVI5ezxWZnl
         EDlhBZCZJapIRS8pzdCOiclKMPXHyB/GVoUs9vs4vqbDQZJcWequ0evn3idMFnCb5oHh
         dsb8IHg84PmTycgNxR5/qTWcAYrZzSI6OgaVeAhtZCcNuPskC07gIhc49spuBVZP57V6
         5g3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7k/rFBBX963wt54wcPAs8b7rJd9JaUNfh769iSm1U8Y=;
        b=D4GWCahkfvhIL/5bJhwldKj9AuRYO0QUCi9Uzam844pmkMcN3BHpZDw6U00hCOraCe
         VGALKmWgLET1yPI8wzvDYwdvekdcAor87TxEp5Kaq27pNbL1d4fjmqqaq9AlhM5k8bRU
         09DIC/33y9/R1+/1Ydzk9qRTlwO3Bw0SEhyZWRffeSYdTZGoCTBwpNLM5kEMSvxJmsUw
         JUQ5+4hjmcGFL8zHvs+V3kzNivIrA5mS1B04EzqCdEKRCBRg1BNLroyzpahbUQlDQqsp
         jmwDFYUTT+V8YVQ0hxIRX7UnhkHwG0yLmD9UxKBXeu7hiKDx4RlR/9DQ1Wqan8F8O2VL
         ZCFw==
X-Gm-Message-State: AOAM531hG6zXp2w2VcCwaue2yx1n65Y9rOIYfneU3OBvkVrByq/8EIP5
        P7WIBFjOhP8kLeif3a6th+Tyo/biBk00lQ==
X-Google-Smtp-Source: ABdhPJySQQj+pLwbKSks3BT0dOd89zXedOzQWsXQWO95AjxsRdK2mrf12hXPEZYYr9x6oYzdfHdmHg==
X-Received: by 2002:a19:dc4b:: with SMTP id f11mr4339709lfj.152.1644471684997;
        Wed, 09 Feb 2022 21:41:24 -0800 (PST)
Received: from [159.224.14.39] ([159.224.14.39])
        by smtp.gmail.com with ESMTPSA id f11sm987171lfh.69.2022.02.09.21.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 21:41:24 -0800 (PST)
Message-ID: <02efa491-39fe-e4f3-d617-a6f17ceba6a5@gmail.com>
Date:   Thu, 10 Feb 2022 07:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] Revert "USB: serial: ch341: add new Product ID for
 CH341A"
Content-Language: en-US-large
To:     Johan Hovold <johan@kernel.org>,
        Jan-Niklas Burfeind <kernel@aiyionpri.me>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        Frank A Kingswood <frank@kingswood-consulting.co.uk>,
        Frank Zago <frank@zago.net>
References: <20220207000822.697343-1-dimich.dmb@gmail.com>
 <YgJHRKQHQheKTwjU@kroah.com> <6df2c9e6-8757-d5e4-0c27-d47f53bee2e1@gmail.com>
 <YgPNK1v541ohUMtv@hovoldconsulting.com>
From:   Dmytro Bagrii <dimich.dmb@gmail.com>
In-Reply-To: <YgPNK1v541ohUMtv@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09.02.22 16:18, Johan Hovold wrote:
> On Tue, Feb 08, 2022 at 03:34:19PM +0200, Dmytro Bagrii wrote:
>> On 08.02.22 12:34, Greg KH wrote:
>>> On Mon, Feb 07, 2022 at 02:08:23AM +0200, Dmytro Bagrii wrote:
>>>> This reverts commit 46ee4abb10a07bd8f8ce910ee6b4ae6a947d7f63.
> 
>>>> CH341A has three different modes of operation selectable either by
>>>> hardware pin connections or by external EEPROM configuration. Each
>>>> mode is represented by corresponding product ID:
>>>>
>>>> 0x5523: Asyncronous Serial Interface
>>>> 0x5584: Parallel Printer Interface
>>>> 0x5512: EPP/MEM Interface
>>>
>>> That does not corrispond with what Jan-Niklas said in the original
>>> commit.
>>
>> The page mentioned in the original commit is unavailable for me for some 
>> reason.
>>
>> I refer to the chip manufacturer documentation from here: 
>> http://wch-ic.com/downloads/CH341DS1_PDF.html.
>>
>> I have this kind of CH341A programmer: 
>> http://www.chinalctech.com/cpzx/Programmer/Serial_Module/266.html
>>
>> When mode selection jumper is set to UART:
>>
>> [52206.834474] usb 1-4.1: new full-speed USB device number 10 using xhci_hcd
>> [52206.925482] usb 1-4.1: New USB device found, idVendor=1a86, 
>> idProduct=5523, bcdDevice= 3.04
>> [52206.925494] usb 1-4.1: New USB device strings: Mfr=0, Product=0, 
>> SerialNumber=0
>> [52206.973701] usbcore: registered new interface driver ch341
>> [52206.973710] usbserial: USB Serial support registered for ch341-uart
>> [52206.973720] ch341 1-4.1:1.0: ch341-uart converter detected
>> [52206.974424] usb 1-4.1: ch341-uart converter now attached to ttyUSB0
>>
>> ch341 creates /dev/ttyUSB0 and it works as a serial port, as expected.
>>
>> When mode selection jumper is set to I2C/SPI (it uses EPP/MEM Interface):
>>
>> [52413.942116] usb 1-4.1: new full-speed USB device number 11 using xhci_hcd
>> [52414.033085] usb 1-4.1: New USB device found, idVendor=1a86, 
>> idProduct=5512, bcdDevice= 3.04
>> [52414.033097] usb 1-4.1: New USB device strings: Mfr=0, Product=0, 
>> SerialNumber=0
>> [52414.040928] ch341 1-4.1:1.0: ch341-uart converter detected
>> [52414.041930] usb 1-4.1: ch341-uart converter now attached to ttyUSB0
>>
>> ch341 creates /dev/ttyUSB0 but it doesn't work.
>>
>> To use CH341A programmer as I2C/SPI converter either external module is 
>> required or userspace tools must be used. But they don't work until 
>> ch341 handles 1a86:5512.
>>
>> If unbind device from ch341 module:
>>
>> # echo 1-4.1:1.0 > /sys/bus/usb/drivers/ch341/unbind
>>
>> I2C/SPI tools start to work correctly.
>>
>>>> (See "5.3.Function configuration" in datasheet at wch-ic.com/downloads/CH341DS1_PDF.html)
>>>>
>>>> When CH341A is configured as EPP/MEM Interface it appears as 1a86:5512 and being mistakenly
>>>> handled by ch341 USB serial driver.
>>>>
>>>> It is possible to use CH341A in EPP/MEM mode only if ch341 module is blacklisted, but it must be
>>>> unblacklisted every time to use CH341A as a serial converter. Also obviously it is impossible
>>>> to use two CH341A boards in different modes simoultaneously.
>>>
>>> Please wrap your lines at 72 columns.
>>
>> Sure. Should i submit new patch verіon then?
> 
> Please do so. But make sure you read this thread first if you haven't
> already:
> 
> 	https://lore.kernel.org/r/YJ0OCS/sh+1ifD/q@hovoldconsulting.com

Thanks. After i saw this patch i figured it out to remove and blacklist 
ch341 module to get CH341A working as I2C/SPI converter with i2c-ch341 
and spi-ch341-usb drivers.

I can confirm, CH341A works as serial converter with ch341 driver when it 
is configured as UART and has PID 5523. It can't work as I2C/SPI converter 
when configured as I2C/SPI and has PID5512 unless ch341 module is removed 
and blacklisted.

> I don't remember all the details, but judging from a quick look it seems
> we're just waiting for someone to resend the revert with a proper
> explanation.
> 
> It would be good if Jan-Niklas could chime in too and confirm if he's
> able to use the device in UART mode instead.

I'd like to take a look at that keeyees device from original commit 
message to see if it has EEPROM chip. I can hypothesize that some 
manufacturer of a CH341-based programmer could use external configuration 
EEPROM and mixed-up PID value. I haven't experiment with configuring 
CH341A with EEPROM but suppose it's possible to burn any custom VID:PID 
there. I don't think ch341 driver has to handle any of such custom 
VID/PID, especially if it conflicts with an original VID/PID assigned by 
chip manufacturer. In case of some peculiar devices it's possible to bind 
custom VID:PID to the driver via sysfs.

But it's just my hypothetical assumption how ch341-based device with PID 
5512 could work as UART in that case.

I just checked if CH341 that i have can work as UART when configured as 
I2C/SPI (PID 5512). I doesn't work: no output signal on TX pin, no 
loopback echo when RX connected to self TX.

-- 
Best Regards,
Dmytro Bagrii.

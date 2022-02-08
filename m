Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A52FC4AD9F2
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 14:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242049AbiBHNeZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 08:34:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234197AbiBHNeY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 08:34:24 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83830C03FECE
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 05:34:23 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id bx31so24545821ljb.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Feb 2022 05:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=qiREHj9RSfPg2+Fk8YP21S14KYRZ27xR6CJqC3YJQdc=;
        b=IKUmXEEJzmjPyGcpeGbZNvUXd56uS1vuwj/ApN/y8xMXXV2PWv368O81ooTeIHTX07
         TqlCC1eVqhxbGyA13s18XlJATJBOr3Oomd8Xqts5HLcQv0C9oeL+AKPh415wYuJN8+ez
         28IXqdIT4qESNFKaiAFr/4OwMrNkxa0ktgSIM0hePYs/luRjuu19W60PJw15V/tP7r6j
         DCIrvewvbAwakVqg3UjjKLUULTZwl+k7UUWBR+swwr8vJzWd4Ul6x6imZejm2TWBz9gO
         CIozq4S38ow+c/OeriWxauxT6acIIRnZgliAzijC6WutQ54tnQ4kltwTVDpUuSYcB/94
         nFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=qiREHj9RSfPg2+Fk8YP21S14KYRZ27xR6CJqC3YJQdc=;
        b=JRk+xswV80zVDOYnZ5I52afvjj3QLe+wlE7mBBWzZ9HZFP3WLHmyIigR07ghOwod8E
         Ky1LxrV8CmQEThPuJRJMKkzxB7OxkJ9f4g5euLUTIbv1iWfhFTxL4w2nPAyPe4mgFX0Y
         7/CthYFZhARw//DdzgBZ46f4kEFgOVgvjAoCfsiHqEX2eacptelr4PIq+rEXI9XQKG25
         iupDORmDEH553uBVbZPNZrzGdgvogLqRxbIR9Wfa2JU+YWEN+QjGG0ycdxVyXJV+kiA1
         hcDtlAUHXwPz8I3FmE+K/kZ7YmZgZCyELkuPFOxTKQSetLx/L1n9F3yaTo4t7EfwgBAA
         g5NA==
X-Gm-Message-State: AOAM531cgx7vZV8ACCRg86L+i6T6krU8JMw/3+LPnciJmwaR2iDjTh9D
        zeQ/KwmJm4V8m0pCNM7lzOUAJx2+yjBZmQ==
X-Google-Smtp-Source: ABdhPJyQ82ce8PFrp1774dziZR/nOLL/UX4zKVQm9Jeg7o9tU1LLKJi9ekHzHHrTKRkE0TAXB9ubEw==
X-Received: by 2002:a2e:7f10:: with SMTP id a16mr2884341ljd.48.1644327261731;
        Tue, 08 Feb 2022 05:34:21 -0800 (PST)
Received: from [159.224.14.39] ([159.224.14.39])
        by smtp.gmail.com with ESMTPSA id b5sm2065965ljk.123.2022.02.08.05.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 05:34:20 -0800 (PST)
Message-ID: <6df2c9e6-8757-d5e4-0c27-d47f53bee2e1@gmail.com>
Date:   Tue, 8 Feb 2022 15:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From:   Dmytro Bagrii <dimich.dmb@gmail.com>
Subject: Re: [PATCH] Revert "USB: serial: ch341: add new Product ID for
 CH341A"
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jan-Niklas Burfeind <kernel@aiyionpri.me>
Cc:     linux-usb@vger.kernel.org,
        Frank A Kingswood <frank@kingswood-consulting.co.uk>,
        Frank Zago <frank@zago.net>, Johan Hovold <johan@kernel.org>
References: <20220207000822.697343-1-dimich.dmb@gmail.com>
 <YgJHRKQHQheKTwjU@kroah.com>
Content-Language: en-US-large
In-Reply-To: <YgJHRKQHQheKTwjU@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 08.02.22 12:34, Greg KH wrote:
> On Mon, Feb 07, 2022 at 02:08:23AM +0200, Dmytro Bagrii wrote:
>> This reverts commit 46ee4abb10a07bd8f8ce910ee6b4ae6a947d7f63.
> 
> You forgot to cc: the author of that commit, why?
> 
> Also forgot to cc: the maintainer of the driver/subsytem?

Sorry, forgot to add them. Also adding Johan Hovold, Frank A Kingswood 
and Frank Zago in the loop.

>> CH341A has three different modes of operation selectable either by
>> hardware pin connections or by external EEPROM configuration. Each
>> mode is represented by corresponding product ID:
>>
>> 0x5523: Asyncronous Serial Interface
>> 0x5584: Parallel Printer Interface
>> 0x5512: EPP/MEM Interface
> 
> That does not corrispond with what Jan-Niklas said in the original
> commit.

The page mentioned in the original commit is unavailable for me for some 
reason.

I refer to the chip manufacturer documentation from here: 
http://wch-ic.com/downloads/CH341DS1_PDF.html.

I have this kind of CH341A programmer: 
http://www.chinalctech.com/cpzx/Programmer/Serial_Module/266.html

When mode selection jumper is set to UART:

[52206.834474] usb 1-4.1: new full-speed USB device number 10 using xhci_hcd
[52206.925482] usb 1-4.1: New USB device found, idVendor=1a86, 
idProduct=5523, bcdDevice= 3.04
[52206.925494] usb 1-4.1: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[52206.973701] usbcore: registered new interface driver ch341
[52206.973710] usbserial: USB Serial support registered for ch341-uart
[52206.973720] ch341 1-4.1:1.0: ch341-uart converter detected
[52206.974424] usb 1-4.1: ch341-uart converter now attached to ttyUSB0

ch341 creates /dev/ttyUSB0 and it works as a serial port, as expected.

When mode selection jumper is set to I2C/SPI (it uses EPP/MEM Interface):

[52413.942116] usb 1-4.1: new full-speed USB device number 11 using xhci_hcd
[52414.033085] usb 1-4.1: New USB device found, idVendor=1a86, 
idProduct=5512, bcdDevice= 3.04
[52414.033097] usb 1-4.1: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[52414.040928] ch341 1-4.1:1.0: ch341-uart converter detected
[52414.041930] usb 1-4.1: ch341-uart converter now attached to ttyUSB0

ch341 creates /dev/ttyUSB0 but it doesn't work.

To use CH341A programmer as I2C/SPI converter either external module is 
required or userspace tools must be used. But they don't work until 
ch341 handles 1a86:5512.

If unbind device from ch341 module:

# echo 1-4.1:1.0 > /sys/bus/usb/drivers/ch341/unbind

I2C/SPI tools start to work correctly.

>> (See "5.3.Function configuration" in datasheet at wch-ic.com/downloads/CH341DS1_PDF.html)
>>
>> When CH341A is configured as EPP/MEM Interface it appears as 1a86:5512 and being mistakenly
>> handled by ch341 USB serial driver.
>>
>> It is possible to use CH341A in EPP/MEM mode only if ch341 module is blacklisted, but it must be
>> unblacklisted every time to use CH341A as a serial converter. Also obviously it is impossible
>> to use two CH341A boards in different modes simoultaneously.
> 
> Please wrap your lines at 72 columns.

Sure. Should i submit new patch verіon then?

> thanks,
> 
> greg k-h

-dmytro

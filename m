Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25E24B0A6C
	for <lists+linux-usb@lfdr.de>; Thu, 10 Feb 2022 11:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235930AbiBJKS0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Feb 2022 05:18:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233859AbiBJKSZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Feb 2022 05:18:25 -0500
X-Greylist: delayed 60658 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Feb 2022 02:18:26 PST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B17B1C2
        for <linux-usb@vger.kernel.org>; Thu, 10 Feb 2022 02:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644488303;
    s=strato-dkim-0002; d=aiyionpri.me;
    h=In-Reply-To:Subject:From:References:Cc:To:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=HvAJnE9HM8sqj8Rhti0NYNYjVioS835Sig6lZwuy14I=;
    b=ZOCwCzf8hcF79EurwQRNFpALBi+eqyIjB46enXk4AK1LPDqVtmw+MwwyR3u5WpbZgq
    KtRNdMmd0C3Dea+7xNR3Qex2gGspSlNYY8Bm1VJOtIM/A2APPt0x2ovYTj93zneJfXpR
    u5/qWM0MAO3C/UsRYYroOr56R7Uav9SfxJQDPSeeRkRVDgDSeX4bLshexcNW/LdS32/E
    PoLUR1nTYfDx1KyGSoe7CMmC0Mhevq5KaEzjydxk4iEmEkeg8nA/vezupHN9hExa7CS4
    Rsi55YdHN//X32hojwm9t128HNZQi3GlIDEf173PskLoS+SdBvrwxGk7ZZYng+dOlwy3
    gCKQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":IWkkdEmxcvCtRDtHUQOu48a0Nfy9hOkbpbRt4aM2x33iJsZ8F6ZSMCbAg3MdK/jjao9W9KExQRVrIXPnZH1sy9XmmqPs7K66"
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2003:e7:9f15:755:4146:3981:c247:dd14]
    by smtp.strato.de (RZmta 47.39.0 AUTH)
    with ESMTPSA id 0eaed6y1AAIMiDF
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 10 Feb 2022 11:18:22 +0100 (CET)
Message-ID: <7e80c8cf-5940-c5b3-89d9-e4e7e53a380c@aiyionpri.me>
Date:   Thu, 10 Feb 2022 11:18:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: de-DE
To:     Johan Hovold <johan@kernel.org>,
        Dmytro Bagrii <dimich.dmb@gmail.com>,
        Jan-Niklas Burfeind <kernel@aiyionpri.me>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        Frank A Kingswood <frank@kingswood-consulting.co.uk>,
        Frank Zago <frank@zago.net>
References: <20220207000822.697343-1-dimich.dmb@gmail.com>
 <YgJHRKQHQheKTwjU@kroah.com> <6df2c9e6-8757-d5e4-0c27-d47f53bee2e1@gmail.com>
 <YgPNK1v541ohUMtv@hovoldconsulting.com>
From:   Jan-Niklas Burfeind <kernel@aiyionpri.me>
Subject: Re: [PATCH] Revert "USB: serial: ch341: add new Product ID for
 CH341A"
In-Reply-To: <YgPNK1v541ohUMtv@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello everyone.

For now I can identify two different USB-IDs depending on the Jumper 
position on the board:

1-2 connected: idVendor=1a86, idProduct=5512
2-3 or none  : idVendor=1a86, idProduct=5523

I'm not sure how I'd plug it to reach the Parallel Printer Interface 
mentioned before.

The advertised position of this Jumper is 1-2.
Both positions are labeled with two different chinese symbols, "2-3" is 
labeled with TTL as well.

Looking at the devices schematics I think its safe to revert my original 
commit and I'm sorry to have caused you all this trouble.

At the time I added the device I missidentified the Jumper as voltage 
level selector.

I had seen others using the board on youtube, with Jumper position 1-2;
and did not understand, why my system would not recognize it at all.


Sorry again and thanks for the effort
Jan-Niklas


On 2/9/22 15:18, Johan Hovold wrote:
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
> 
> I don't remember all the details, but judging from a quick look it seems
> we're just waiting for someone to resend the revert with a proper
> explanation.
> 
> It would be good if Jan-Niklas could chime in too and confirm if he's
> able to use the device in UART mode instead.
> 
> Johan

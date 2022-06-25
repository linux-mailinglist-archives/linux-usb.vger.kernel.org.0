Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC6D55A62C
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jun 2022 04:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbiFYCgB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 22:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiFYCgA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 22:36:00 -0400
Received: from mail.gtsys.com.hk (tunnel316222-pt.tunnel.tserv25.sin1.ipv6.he.net [IPv6:2001:470:35:5f1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05754F464
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 19:35:57 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.gtsys.com.hk (Postfix) with ESMTP id 2A74422A1D9A;
        Sat, 25 Jun 2022 10:35:55 +0800 (HKT)
X-Virus-Scanned: Debian amavisd-new at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
        by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mBwMJya5XdlS; Sat, 25 Jun 2022 10:35:55 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
        by mail.gtsys.com.hk (Postfix) with ESMTP id 0563922A1D96;
        Sat, 25 Jun 2022 10:35:55 +0800 (HKT)
Received: from [10.128.1.32] (unknown [182.239.122.235])
        by s01.gtsys.com.hk (Postfix) with ESMTPSA id CD287C01B49;
        Sat, 25 Jun 2022 10:35:54 +0800 (HKT)
Subject: Re: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
To:     Oliver Neukum <oneukum@suse.com>,
        "michael.lee@omron.com" <michael.lee@omron.com>,
        Lars Melin <larsm17@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
References: <85ebf554-effd-c89e-6eb8-c149442b931c@gtsys.com.hk>
 <fc9986a6-0b11-d949-2196-1ad35d3f4d98@gtsys.com.hk>
 <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
 <cbcc2071-5b56-025e-cae6-5af0210e2363@gtsys.com.hk>
 <OSZP286MB1776CCBCBFE38B25C7DB9978E1B39@OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM>
 <40395457-0927-c169-7d9f-47d1912e2c39@suse.com>
 <f3aaf9e8-07c7-2c50-48c3-723c51f9445a@gtsys.com.hk>
 <dc9f9c31-b72d-0895-544a-13764538d991@suse.com>
 <3194ea30-34da-3d34-6d4a-08dc7c8d683a@gtsys.com.hk>
 <4f4977bf-6096-592c-9c06-44aacb82ccd7@gtsys.com.hk>
 <68fffa09-1522-bef0-f76e-610e2345a70c@suse.com>
From:   Chris Ruehl <chris.ruehl@gtsys.com.hk>
Message-ID: <85ff1357-5a70-3ee1-4098-08401f522c7a@gtsys.com.hk>
Date:   Sat, 25 Jun 2022 10:35:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <68fffa09-1522-bef0-f76e-610e2345a70c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 23/6/2022 5:39 pm, Oliver Neukum wrote:
>
> On 23.06.22 10:55, Chris Ruehl wrote:
>>
>> On 23/6/2022 4:44 pm, Chris Ruehl wrote:
>>> On 23/6/2022 4:28 pm, Oliver Neukum wrote:
>>>> if you absolutely want it to be driven from CDC-ACM, try this
>>>> new attached patch.
>>>> In your original patch you used NO_UNION_NORMAL. That will allow
>>>> a device to work without a union descriptor but with the normal
>>>> two interfaces. This devices has what in terms of ACM is a collapsed
>>>> interface without a union descriptor.
>>>> The driver provides for that but then it checks for the exact
>>>> number of required endpoints, which is three. Your device has
>>>> four endpoints.
>>>> The patch ignores a fourth endpoint.
>> Apply the patch ,
>> still no /dev/ttyACM0 comes up.
> Hi,
>
> please send me dmesg. This should not happen.
>
> 	Regards
> 		Oliver
>
Hi,
sorry for let you wait but I had a bunch of testing with the b5l to deliver
my solution to the team.

here the dmesg after apply your patch & NO_NORMAL_UNION

[266005.246312] usb 2-1.4.4.1: new high-speed USB device number 19 using ehci-pci
[266005.344658] usb 2-1.4.4.1: New USB device found, idVendor=0590, 
idProduct=00ca, bcdDevice= 2.00
[266005.344666] usb 2-1.4.4.1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[266005.344670] usb 2-1.4.4.1: Product: OMRON B5L-001011
[266005.344673] usb 2-1.4.4.1: Manufacturer: OMRON Corporation
[266005.344675] usb 2-1.4.4.1: SerialNumber: 010000319A1
[266005.458809] usbcore: registered new interface driver cdc_acm
[266005.458814] cdc_acm: USB Abstract Control Model driver for USB modems and 
ISDN adapters

T:  Bus=02 Lev=04 Prnt=05 Port=00 Cnt=01 Dev#= 19 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=02(comm.) Sub=02 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=0590 ProdID=00ca Rev= 2.00
S:  Manufacturer=OMRON Corporation
S:  Product=OMRON B5L-001011
S:  SerialNumber=010000319A1
C:* #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=  4mA
I:* If#= 0 Alt= 0 #EPs= 4 Cls=02(comm.) Sub=02 Prot=00 Driver=(none)
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=03(Int.) MxPS=  64 Ivl=4096ms
E:  Ad=84(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms

-Chris

-- 
GTSYS Limited RFID Technology
9/F, Unit E, R07, Kwai Shing Industrial Building Phase 2,
42-46 Tai Lin Pai Road, Kwai Chung, N.T., Hong Kong
Tel (852) 9079 9521

Disclaimer: https://www.gtsys.com.hk/email/classified.html


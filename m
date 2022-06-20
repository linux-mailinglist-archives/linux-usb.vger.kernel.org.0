Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7225A55102F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 08:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238528AbiFTGUn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 02:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238198AbiFTGUl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 02:20:41 -0400
Received: from mail.gtsys.com.hk (tunnel316222-pt.tunnel.tserv25.sin1.ipv6.he.net [IPv6:2001:470:35:5f1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87287BE35
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 23:20:40 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.gtsys.com.hk (Postfix) with ESMTP id 5C31822A031F;
        Mon, 20 Jun 2022 14:20:35 +0800 (HKT)
X-Virus-Scanned: Debian amavisd-new at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
        by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DikUxkhzNugU; Mon, 20 Jun 2022 14:20:35 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
        by mail.gtsys.com.hk (Postfix) with ESMTP id 385F62060E6F;
        Mon, 20 Jun 2022 14:20:35 +0800 (HKT)
Received: from [10.128.1.32] (unknown [124.217.188.185])
        by s01.gtsys.com.hk (Postfix) with ESMTPSA id C2322C0363F;
        Mon, 20 Jun 2022 14:20:34 +0800 (HKT)
Subject: Re: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
To:     Lars Melin <larsm17@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Cc:     Oliver Neukum <oneukum@suse.com>
References: <85ebf554-effd-c89e-6eb8-c149442b931c@gtsys.com.hk>
 <fc9986a6-0b11-d949-2196-1ad35d3f4d98@gtsys.com.hk>
 <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
From:   Chris Ruehl <chris.ruehl@gtsys.com.hk>
Message-ID: <cbcc2071-5b56-025e-cae6-5af0210e2363@gtsys.com.hk>
Date:   Mon, 20 Jun 2022 14:20:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
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



On 20/6/2022 11:35 am, Lars Melin wrote:
> On 6/20/2022 09:44, Chris Ruehl wrote:
>> Enabled the debugfs and checked /sys/kernel/debug/usb/devices for the B5L
>>
>> T:  Bus=02 Lev=03 Prnt=04 Port=01 Cnt=01 Dev#= 17 Spd=480  MxCh= 0
>> D:  Ver= 2.00 Cls=02(comm.) Sub=02 Prot=00 MxPS=64 #Cfgs=  1
>> P:  Vendor=0590 ProdID=00ca Rev= 2.00
>> S:  Manufacturer=OMRON Corporation
>> S:  Product=OMRON B5L-001011
>> S:  SerialNumber=010000319A1
>> C:* #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=  4mA
>> I:* If#= 0 Alt= 0 #EPs= 4 Cls=02(comm.) Sub=02 Prot=00 Driver=(none)
>> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>> E:  Ad=03(O) Atr=03(Int.) MxPS=  64 Ivl=4096ms
>> E:  Ad=84(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
>>
>> Driver is not assigned.
>
>
> There is nothing CDC-ACM in that interface except for the interface 
> attributes, the interface lacks everything else needed for it to be CDC-ACM.
> Check if Omron has an updated firmware fixing the problems or if they have 
> their own proprietary driver for the device.
>
>
> /Lars

Hi Lars,

that's what I hold the Hk headquarter, they forward the request back to the 
developers in Japan.

Thanks
Chris

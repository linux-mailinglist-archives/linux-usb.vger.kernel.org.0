Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2046E0622
	for <lists+linux-usb@lfdr.de>; Thu, 13 Apr 2023 06:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjDMEux (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Apr 2023 00:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjDMEuw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Apr 2023 00:50:52 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 22B304EFD
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 21:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
        Content-Type; bh=MbFGt5t4AICX22nQNkY61M1ZAVrlvQDu3NeSa7LBH1w=;
        b=UgqcD4PU+hqHVRLATAPpVIavG1zTe00Cy8n6SV4rRHZQS5gPKeQ79WoSJ0cZrD
        Xo10/m0VrfsffuKz79PfbuGjHIMRarQClnY3z19/7dlDD28d3y1rb0OyBW7ce0m/
        W7N+KrrldVT5nX9cK6m1THPzF3hkq6btKXo4XrTuyeoFA=
Received: from [172.21.25.67] (unknown [218.201.129.19])
        by zwqz-smtp-mta-g3-2 (Coremail) with SMTP id _____wD3JRYEijdk5lheBQ--.62160S2;
        Thu, 13 Apr 2023 12:50:12 +0800 (CST)
Message-ID: <de92552a-3148-03c0-5b4b-94040d8d7969@163.com>
Date:   Thu, 13 Apr 2023 12:50:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: BUG: linux 5.15.0 hang on usb_wwan_indat_callback
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Bin Liu <b-liu@ti.com>
References: <580d8541-1eca-e7b1-ccf5-66eda3e88761@163.com>
 <2023041257-campfire-squeamish-75a4@gregkh>
Content-Language: en-US
From:   qianfan <qianfanguijin@163.com>
In-Reply-To: <2023041257-campfire-squeamish-75a4@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3JRYEijdk5lheBQ--.62160S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw18XF15Kw15Gr4DCw4kZwb_yoW5ArW3pF
        W8XFsrtw4DWr9Fy3ZxGr10kFyrX39xKrW3Jr1293yrZFnFq3WxK34vkFWFgr1DWryUGw4Y
        yF1kGry2gw48C3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2YLPUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiQgRQ7VaEE+H3ywABsm
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



在 2023/4/13 1:07, Greg Kroah-Hartman 写道:
> On Wed, Apr 12, 2023 at 07:54:28PM +0800, qianfan wrote:
>> Hi:
>>
>> The linux system maybe hang in usb_wwan_indat_callback when the usb modem
>> sudden disconnected. This problem has a very small probability and can not
>> make it repeat easy.
>>
>> hardware: allwinner R40 with 4 cortex-a7
>> software: linux 5.15.0
> 5.15.0 is _VERY_ old, sorry.  Please try using a modern kernel release,
> we can not do anything about old kernels like this.
>
> Does this still happen on the latest 6.2 release, or the latest 6.3-rc
> release?
Hi, thanks for yours reply.

My custom board is based on allwinner R40 and I had port some drivers to
linux 5.15.0, most of them are not merged by the mainline linux. So test
this on latest kernel is hard to do. I think I can do it at a later time
but not now.

When I enable the 'dev_dbg' and then pull usb-dp pin to GND to make the
modem can't response, I got this flood messages:

[ 1882.636790] option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: 
-71 on endpoint 05.
[ 1882.641053] option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: 
-71 on endpoint 05.
[ 1882.645294] option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: 
-71 on endpoint 05.
[ 1882.649555] option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: 
-71 on endpoint 05.
[ 1882.653811] option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: 
-71 on endpoint 05.
[ 1882.658058] option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: 
-71 on endpoint 05.
[ 1882.662298] option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: 
-71 on endpoint 05.
[ 1882.666536] option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: 
-71 on endpoint 05.
[ 1882.670797] option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: 
-71 on endpoint 05.
...

The system is still working, and ehci_hcd interrupt was trigger more 
than 7000
times one second.

# irqtop -d 1
...
...         7340 GICv2 110 Level ehci_hcd:usb4

Although this is not the bug maker, but we need also improve it.

I had checked the lastest mainline linux driver, the 
drivers/usb/serial/usb-wwan.c
is only 4 commit ahead of linux 5.15.0:

2022-07-25    Merge tag 'usb-serial-5.20-rc1' of 
https://git.kernel.org/pub/scm/linux/kerne...
2022-07-25    USB: serial: fix tty-port initialized comments
2022-07-25    USB: serial: usb_wwan: replace DTR/RTS magic numbers with 
macros
2022-03-08    USB: serial: usb_wwan: remove redundant assignment to 
variable i

The resubmit logic in usb_wwan_indat_callback semms need improve:

if (status) {
     dev_dbg(dev, "%s: nonzero status: %d on endpoint %02x.\n",
         __func__, status, endpoint);

     /* don't resubmit on fatal errors */
     if (status == -ESHUTDOWN || status == -ENOENT)
         return;
}

maybe this patch is better?

switch (status) {
case -ESHOTDOWN:
case -ENOENT:
case -ECONNRESET:
case -EOVERFLOW:
case -EPROTO:
     reutrn;
}

thanks.
>
> thanks,
>
> greg k-h


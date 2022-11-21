Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF36D63184E
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 02:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbiKUBtw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Nov 2022 20:49:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiKUBtv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Nov 2022 20:49:51 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2286017425
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 17:49:49 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NFr0c5bGFzRpF7;
        Mon, 21 Nov 2022 09:49:20 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 09:49:46 +0800
Subject: Re: [PATCH] usb: gadget: fusb300_udc: free irq on the error path in
 fusb300_probe()
To:     Dongliang Mu <mudongliangabcd@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <yhchen@faraday-tech.com>,
        <linux-usb@vger.kernel.org>
References: <20221120061242.261839-1-cuigaosheng1@huawei.com>
 <CAD-N9QWDG=CyM9CWHcko5uUSkWf+OKSc8-HCBvXKbfAveONfPA@mail.gmail.com>
From:   cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <4efbe4dc-5c0f-3a92-23a5-05f3c9e0ed2f@huawei.com>
Date:   Mon, 21 Nov 2022 09:49:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAD-N9QWDG=CyM9CWHcko5uUSkWf+OKSc8-HCBvXKbfAveONfPA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> it seems you need to add the same free_irq in the .remove function.
> Refer to the following patch,
>
> --- a/drivers/usb/gadget/udc/fusb300_udc.c
> +++ b/drivers/usb/gadget/udc/fusb300_udc.c
> @@ -1347,6 +1347,7 @@ static int fusb300_remove(struct platform_device *pdev)
>          usb_del_gadget_udc(&fusb300->gadget);
>          iounmap(fusb300->reg);
>          free_irq(platform_get_irq(pdev, 0), fusb300);
> +       free_irq(platform_get_irq(pdev, 1), fusb300);
>
>          fusb300_free_request(&fusb300->ep[0]->ep, fusb300->ep0_req);
>          for (i = 0; i < FUSB300_MAX_NUM_EP; i++)

Thanks for taking time to review this patch, I have made a patch v2 and submit it.

On 2022/11/20 19:01, Dongliang Mu wrote:
> On Sun, Nov 20, 2022 at 2:25 PM Gaosheng Cui <cuigaosheng1@huawei.com> wrote:
>> When request_irq(ires1->start) failed in w5300_hw_probe(), irq ires->start
>> has not been freed, and on the clean_up3 error path, we need to free
>> ires1->start irq, too. Fix it.
>>
>> Fixes: 0fe6f1d1f612 ("usb: udc: add Faraday fusb300 driver")
>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>> ---
>>   drivers/usb/gadget/udc/fusb300_udc.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/udc/fusb300_udc.c
>> index 9af8b415f303..c66a59c15003 100644
>> --- a/drivers/usb/gadget/udc/fusb300_udc.c
>> +++ b/drivers/usb/gadget/udc/fusb300_udc.c
>> @@ -1432,7 +1432,7 @@ static int fusb300_probe(struct platform_device *pdev)
>>                          IRQF_SHARED, udc_name, fusb300);
>>          if (ret < 0) {
>>                  pr_err("request_irq1 error (%d)\n", ret);
>> -               goto clean_up;
>> +               goto clean_up2;
>>          }
>>
>>          INIT_LIST_HEAD(&fusb300->gadget.ep_list);
>> @@ -1487,8 +1487,9 @@ static int fusb300_probe(struct platform_device *pdev)
>>          fusb300_free_request(&fusb300->ep[0]->ep, fusb300->ep0_req);
>>
>>   clean_up3:
>> +       free_irq(ires1->start, fusb300);
> Hi Gaosheng,
>
> it seems you need to add the same free_irq in the .remove function.
> Refer to the following patch,
>
> --- a/drivers/usb/gadget/udc/fusb300_udc.c
> +++ b/drivers/usb/gadget/udc/fusb300_udc.c
> @@ -1347,6 +1347,7 @@ static int fusb300_remove(struct platform_device *pdev)
>          usb_del_gadget_udc(&fusb300->gadget);
>          iounmap(fusb300->reg);
>          free_irq(platform_get_irq(pdev, 0), fusb300);
> +       free_irq(platform_get_irq(pdev, 1), fusb300);
>
>          fusb300_free_request(&fusb300->ep[0]->ep, fusb300->ep0_req);
>          for (i = 0; i < FUSB300_MAX_NUM_EP; i++)
>
> Fix me if I make any mistakes.
>
>> +clean_up2:
>>          free_irq(ires->start, fusb300);
>> -
>>   clean_up:
>>          if (fusb300) {
>>                  if (fusb300->ep0_req)
>> --
>> 2.25.1
>>
> .

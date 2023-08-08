Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D55BA774138
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 19:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234288AbjHHRQz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 13:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234101AbjHHRQY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 13:16:24 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD21CB2A2
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 09:06:40 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RKn9F5Hr1zrSN0;
        Tue,  8 Aug 2023 16:56:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 16:57:27 +0800
Message-ID: <1bdb47f2-5ff1-db23-9672-fa2cac7dfe1f@huawei.com>
Date:   Tue, 8 Aug 2023 16:57:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] USB: core: Switch to use kmemdup_nul() helper
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <hadess@hadess.net>, <benjamin.tissoires@redhat.com>,
        <herve.codina@bootlin.com>, <robh@kernel.org>,
        <mailhol.vincent@wanadoo.fr>, <linux-usb@vger.kernel.org>
References: <20230807124610.2283583-1-ruanjinjie@huawei.com>
 <2023080822-embark-quaking-074e@gregkh>
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <2023080822-embark-quaking-074e@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2023/8/8 16:22, Greg KH wrote:
> On Mon, Aug 07, 2023 at 08:46:10PM +0800, Ruan Jinjie wrote:
>> Use kmemdup_nul() helper instead of open-coding it to simplify the code.
>>
>> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
>> ---
>>  drivers/usb/core/message.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
>> index 0d2bfc909019..5762fd04f0d5 100644
>> --- a/drivers/usb/core/message.c
>> +++ b/drivers/usb/core/message.c
>> @@ -1029,10 +1029,9 @@ char *usb_cache_string(struct usb_device *udev, int index)
>>  	if (buf) {
>>  		len = usb_string(udev, index, buf, MAX_USB_STRING_SIZE);
>>  		if (len > 0) {
>> -			smallbuf = kmalloc(++len, GFP_NOIO);
>> +			smallbuf = kmemdup_nul(buf, len, GFP_NOIO);
>>  			if (!smallbuf)
>>  				return buf;
>> -			memcpy(smallbuf, buf, len);
> 
> But you changed the logic here, you now added an extra \0 where the
> existing code did not.  Are you sure you mean to do this?  If so, why,
> and it needs to be documented in the changelog text.

Right! There is a problem because of the ++len, and the logic has been
changed. Sorry, I'll carefully check the patches issued in the future.

> 
> What this could be is a call to kmemdup() if you really want it, but be
> careful about the ++len usage...
> 
> Also, does this need to be changed at all?  How was it tested?

It's best to keep it as it is. Sorry, just walk through the code.

> 
> thanks,
> 
> greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B33158F865
	for <lists+linux-usb@lfdr.de>; Thu, 11 Aug 2022 09:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234399AbiHKHbr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Aug 2022 03:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbiHKHbq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Aug 2022 03:31:46 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7ED8E0CF
        for <linux-usb@vger.kernel.org>; Thu, 11 Aug 2022 00:31:40 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220811073135euoutp026b11070cebc3f043a4199a062bfdaa6f~KOetjJBDb0360303603euoutp02A
        for <linux-usb@vger.kernel.org>; Thu, 11 Aug 2022 07:31:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220811073135euoutp026b11070cebc3f043a4199a062bfdaa6f~KOetjJBDb0360303603euoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1660203095;
        bh=2sLjawNyBFKEycngTg2E4o5dmCkZ37jWltWaxdWC1i4=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=Pe48ml/567kYX5UdDa2eFMu9gLyzFIozVdv7kZ/00I2yRQBOkaoe6T1m+vMWAXApD
         5IBLmqWNqtqA5oTurEXmVbqW2DkGnCEsF8fqXuKQsgAA1AMaHxi+C0wl6kmyNlMtfH
         QN3w8+MRDJS2sYppqWwDYGD8x837ZQ+1pXLRxz2Q=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220811073135eucas1p1b9c4c1e73dbb4d5dc8f0ce352a3b6687~KOetWG-vt0383403834eucas1p1T;
        Thu, 11 Aug 2022 07:31:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 0F.97.09664.750B4F26; Thu, 11
        Aug 2022 08:31:35 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220811073135eucas1p22d34a8ea89988ab5d6c255eab08287d7~KOetC9lSo0631806318eucas1p24;
        Thu, 11 Aug 2022 07:31:35 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220811073135eusmtrp17f58950cc715882cd2874a2b370e6a89~KOetCSK8l1883318833eusmtrp1Y;
        Thu, 11 Aug 2022 07:31:35 +0000 (GMT)
X-AuditID: cbfec7f2-d97ff700000025c0-bd-62f4b057efc7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F6.3E.09095.750B4F26; Thu, 11
        Aug 2022 08:31:35 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220811073134eusmtip1c5825e9b1a9806d04de43ab80287d932~KOesmQLQ50088800888eusmtip1Y;
        Thu, 11 Aug 2022 07:31:34 +0000 (GMT)
Message-ID: <febf579a-6451-1dc6-b583-0ba1a76344a6@samsung.com>
Date:   Thu, 11 Aug 2022 09:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] USB: gadget: Fix use-after-free Read in
 usb_udc_uevent()
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <YvQH7IMTIFO0OCnG@rowland.harvard.edu>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djPc7rhG74kGSz+J2NxrO0Ju0Xz4vVs
        FouWtTJbHO89wGQx4fcFNosbW+YyO7B57Jl4ks1j8wotj02rOtk89s9dw+4x++4PRo/Pm+QC
        2KK4bFJSczLLUov07RK4Mg5emcJe0KRaMX3ZPOYGxj2yXYycHBICJhL9P4+zgthCAisYJd4e
        1uhi5AKyvzBK/JrVzAjhfGaU+Lb8JztMx6SWf+wQieWMEjM+LWOCcD4ySmx+MokJpIpXwE7i
        1to3YDaLgKrEksl7oOKCEidnPmEBsUUFkiWe/V8MNImDQ1jAX+La7BSQMLOAuMStJ/PBykUE
        tCQ2N71kBpnPLHCYUWLLlplgCTYBQ4mut11sIDangLHE4hmf2CGa5SW2v50D1iAhcIdD4sm6
        64wQZ7tItL39wQphC0u8Or4F6h0ZidOTe1hAjpAQyJf4O8MYIlwhce31GmYI21rizrlfbCAl
        zAKaEut36UOEHSW6FkCcLyHAJ3HjrSDEBXwSk7ZNZ4YI80p0tAlBVKtJzDq+Dm7nwQuXmCcw
        Ks1CCpNZSJ6fheSXWQh7FzCyrGIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAhMPqf/Hf+0
        g3Huq496hxiZOBgPMUpwMCuJ8JYt+pwkxJuSWFmVWpQfX1Sak1p8iFGag0VJnDc5c0OikEB6
        YklqdmpqQWoRTJaJg1OqgUlj9vQz7PzuzycH/xZac/HEbO5HL1arec66Hl4nyc6sKrK+X0dg
        7VI+42vGFos84zQmHOs2Lsg+9MHP5dKZnwuWht2o3pcqt8ZMVGPJqTkXFkfxCu56EVL20iM0
        eM8JyyeC+5rWrPO4MufSAV8eE57Krwf/TNv84HKjVfr2v9ml4gldkim1zHm6V+ffEc5qeZm6
        /vErHbk/awRE5S88mhR/RieKSZG7bh93hmztW5nCiweOnt9zJ/jCCvuTRjzl94+tiLkhcP3P
        2cUdPiyxV522rItymNzkVzixYEPnr1lxSxa8/x/xbd7t2CQ37iZxu+u7BP7JXOf1Oj0h8B+r
        YPBjs7o0Ub2cLLsVh0+WnFJSYinOSDTUYi4qTgQAOuxN6q0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xu7rhG74kGdw9xG1xrO0Ju0Xz4vVs
        FouWtTJbHO89wGQx4fcFNosbW+YyO7B57Jl4ks1j8wotj02rOtk89s9dw+4x++4PRo/Pm+QC
        2KL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mg5e
        mcJe0KRaMX3ZPOYGxj2yXYycHBICJhKTWv6xdzFycQgJLGWUuHrlAytEQkbi5LQGKFtY4s+1
        LjaIoveMEq0HVzGBJHgF7CRurX0DZrMIqEosmbwHKi4ocXLmExYQW1QgWWLBoaVgtrCAr8Sc
        bf3MIDazgLjErSfzwepFBLQkNje9ZAZZwCxwmFFiw8pjLBDbHjBJnPx0EqyDTcBQoustyBmc
        HJwCxhKLZ3xih5hkJtG1tYsRwpaX2P52DvMERqFZSA6ZhWThLCQts5C0LGBkWcUoklpanJue
        W2yoV5yYW1yal66XnJ+7iREYd9uO/dy8g3Heq496hxiZOBgPMUpwMCuJ8JYt+pwkxJuSWFmV
        WpQfX1Sak1p8iNEUGBoTmaVEk/OBkZ9XEm9oZmBqaGJmaWBqaWasJM7rWdCRKCSQnliSmp2a
        WpBaBNPHxMEp1cDkmeg5W4z34rVLer7LJkv9eey1+UeZqnrEIZvyxdvCWjcHvAvoems5KdFF
        437re/En04/bLVx08rrsWcl752UEn0hYXY2VbF2TbHiBt1Zm+34Hs0Xzu33nNbDetjD8Ove3
        kkB4lLHiV+kjMU2TmxlnslrfebMw6cvHns1Ns0u+eqbInJPUFSg7FlsorTZVcmfWhWWzm9jb
        Dzw/9nxd86d1PmbOJ4S8Xqz1bPBWnr3k8S3jLcytNgvf2CjYxhwUW7xJ9Ioi680nLtPSRR7f
        XPfwT7WoTm1xxb/ZS9pKn/S6G+bMems7d34tk3uY/1wJu+igrUo5K+8nfFjN9jk6Ot3gxpp5
        myTdH57RsPzr7rpBiaU4I9FQi7moOBEA41qu8UQDAAA=
X-CMS-MailID: 20220811073135eucas1p22d34a8ea89988ab5d6c255eab08287d7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405
References: <YtlbkmVGJyhO4kR6@rowland.harvard.edu>
        <000000000000acc0e905e4517fa0@google.com>
        <YtlrnhHyrHsSky9m@rowland.harvard.edu>
        <CGME20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405@eucas1p2.samsung.com>
        <b2ba4245-9917-e399-94c8-03a383e7070e@samsung.com>
        <YvFxiXmPlJc9wLZT@rowland.harvard.edu>
        <YvQH7IMTIFO0OCnG@rowland.harvard.edu>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On 10.08.2022 21:33, Alan Stern wrote:
> On Mon, Aug 08, 2022 at 04:26:49PM -0400, Alan Stern wrote:
>> On Mon, Aug 08, 2022 at 04:57:35PM +0200, Marek Szyprowski wrote:
>>> This patch landed recently in linux-next as commit 2191c00855b0 ("USB:
>>> gadget: Fix use-after-free Read in usb_udc_uevent()"). Unfortunately it
>>> fixes the issue by introducing another one. It doesn't look very
>>> probable, but it would be nice to fix it to make the lock dependency
>>> checker happy.
>> Indeed.
>> I suspect the problem is that udc_lock is held for too long.  Probably it
>> should be released during the calls to udc->driver->bind and
>> udc->driver->unbind.
>>
>> Getting this right will require some careful study.  Marek, if I send you
>> a patch later, will you be able to test it?
> Here's a patch for you to try, when you have the chance.  It reduces the
> scope of udc_lock to cover only the fields it's supposed to protect and
> changes the locking in a few other places.
>
> There's still the possibility of a locking cycle, because udc_lock is
> held in the ->disconnect pathway.  It's very hard to know whether that
> might cause any trouble; it depends on how the function drivers handle
> disconnections.

It looks this fixed the issue I've reported. I've checked it on all my 
test systems and none reported any issue related to the udc.

Feel free to add:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> Alan Stern
>
>
>
> Index: usb-devel/drivers/usb/gadget/udc/core.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/gadget/udc/core.c
> +++ usb-devel/drivers/usb/gadget/udc/core.c
> @@ -736,7 +736,10 @@ int usb_gadget_disconnect(struct usb_gad
>   	ret = gadget->ops->pullup(gadget, 0);
>   	if (!ret) {
>   		gadget->connected = 0;
> -		gadget->udc->driver->disconnect(gadget);
> +		mutex_lock(&udc_lock);
> +		if (gadget->udc->driver)
> +			gadget->udc->driver->disconnect(gadget);
> +		mutex_unlock(&udc_lock);
>   	}
>   
>   out:
> @@ -1489,7 +1492,6 @@ static int gadget_bind_driver(struct dev
>   
>   	usb_gadget_udc_set_speed(udc, driver->max_speed);
>   
> -	mutex_lock(&udc_lock);
>   	ret = driver->bind(udc->gadget, driver);
>   	if (ret)
>   		goto err_bind;
> @@ -1499,7 +1501,6 @@ static int gadget_bind_driver(struct dev
>   		goto err_start;
>   	usb_gadget_enable_async_callbacks(udc);
>   	usb_udc_connect_control(udc);
> -	mutex_unlock(&udc_lock);
>   
>   	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
>   	return 0;
> @@ -1512,6 +1513,7 @@ static int gadget_bind_driver(struct dev
>   		dev_err(&udc->dev, "failed to start %s: %d\n",
>   			driver->function, ret);
>   
> +	mutex_lock(&udc_lock);
>   	udc->driver = NULL;
>   	driver->is_bound = false;
>   	mutex_unlock(&udc_lock);
> @@ -1529,7 +1531,6 @@ static void gadget_unbind_driver(struct
>   
>   	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
>   
> -	mutex_lock(&udc_lock);
>   	usb_gadget_disconnect(gadget);
>   	usb_gadget_disable_async_callbacks(udc);
>   	if (gadget->irq)
> @@ -1537,6 +1538,7 @@ static void gadget_unbind_driver(struct
>   	udc->driver->unbind(gadget);
>   	usb_gadget_udc_stop(udc);
>   
> +	mutex_lock(&udc_lock);
>   	driver->is_bound = false;
>   	udc->driver = NULL;
>   	mutex_unlock(&udc_lock);
> @@ -1612,7 +1614,7 @@ static ssize_t soft_connect_store(struct
>   	struct usb_udc		*udc = container_of(dev, struct usb_udc, dev);
>   	ssize_t			ret;
>   
> -	mutex_lock(&udc_lock);
> +	device_lock(&udc->gadget->dev);
>   	if (!udc->driver) {
>   		dev_err(dev, "soft-connect without a gadget driver\n");
>   		ret = -EOPNOTSUPP;
> @@ -1633,7 +1635,7 @@ static ssize_t soft_connect_store(struct
>   
>   	ret = n;
>   out:
> -	mutex_unlock(&udc_lock);
> +	device_unlock(&udc->gadget->dev);
>   	return ret;
>   }
>   static DEVICE_ATTR_WO(soft_connect);
> @@ -1652,11 +1654,15 @@ static ssize_t function_show(struct devi
>   			     char *buf)
>   {
>   	struct usb_udc		*udc = container_of(dev, struct usb_udc, dev);
> -	struct usb_gadget_driver *drv = udc->driver;
> +	struct usb_gadget_driver *drv;
> +	int			rc = 0;
>   
> -	if (!drv || !drv->function)
> -		return 0;
> -	return scnprintf(buf, PAGE_SIZE, "%s\n", drv->function);
> +	mutex_lock(&udc_lock);
> +	drv = udc->driver;
> +	if (drv && drv->function)
> +		rc = scnprintf(buf, PAGE_SIZE, "%s\n", drv->function);
> +	mutex_unlock(&udc_lock);
> +	return rc;
>   }
>   static DEVICE_ATTR_RO(function);
>   
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


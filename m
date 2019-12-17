Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC2431226A3
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 09:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfLQI02 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Dec 2019 03:26:28 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40208 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLQI02 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Dec 2019 03:26:28 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so5757715plp.7
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2019 00:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=S2Skdp7hS9krrVvP+8yI4uqmy9Q/+8wRFcVLiEJ+V24=;
        b=iQE+8/VIE4T7FF51Z/S+7HcHM7naWQn2dz3RQzgVEDwbueubrTwq+PMNDCL79jNmKj
         3/iEA9ONnfnKW+BL1dCmpVc7X8H7y1YsA3hUZO1PUqAnxbD4c+ZGRO9U+Ft4IxBC3VcM
         ZrzwiabunN6hgLlRorxyTOeDeKGxCLep17TyrfOVigIK49E2fZ5aYBzwA34rL4b8GOj8
         aZw9RsVISPa/ShKvo6xSomf6lqlZ0udwfxHgyMgIOgokNKV6zzvi1EGcPwbOP5TX/Y5q
         hjdy0i1dSJCFZ/Cw+PJ1KmUt5/1saUX3jaLAu1qkNoT3PthD3Ap4LVvM5+a7LGI/XVah
         jdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=S2Skdp7hS9krrVvP+8yI4uqmy9Q/+8wRFcVLiEJ+V24=;
        b=cFyOgEZKtXGENhTbk8wcXc8FlQnnZKoi5zXZUSDW3LCLTOvXAMVugOkTvwBJSO2YGd
         5Hg8P7GBrxjoZA8wnlnjSJlT9nzl5pjaRmTw0okEsIdebKktXIC3ZdOthmszK91KVL4P
         scKzJwu0dtfHZ2+6X9vphBMAZnNzZQ/3gAJ+ELQWUmiCmfQM/ChuXRyzhytrqdekJ8Vb
         IwOLtoJvKr1NSY+4sa/H0t5cnIXe5DcKnkFIpkcts/K4ipLmT60CprLaANN8M6cZVnGz
         z+4fHO26gsX6GJQGVR169vOw5Udrv6Rycdryr39GsxoNQLgIhYEzuEOyw9WZ4sULdILm
         /5ng==
X-Gm-Message-State: APjAAAXcrT+RHDcyDV8Mms+AegjSDBkGwIn3UWW1aUa9MWgXAOQpF1vy
        i0Gy7P5ieOg6U1ztGL7KTMoaKxzB
X-Google-Smtp-Source: APXvYqxbje+ww4GgayK30RSeHbsNkhRzXUUetv5l9AD6w9hijHFs90YeLNiCLxfCLC0XRkSWfLkv9Q==
X-Received: by 2002:a17:902:6bc3:: with SMTP id m3mr20601625plt.185.1576571187173;
        Tue, 17 Dec 2019 00:26:27 -0800 (PST)
Received: from ?IPv6:2402:f000:1:1501:200:5efe:166.111.139.134? ([2402:f000:1:1501:200:5efe:a66f:8b86])
        by smtp.gmail.com with ESMTPSA id l186sm25310857pge.31.2019.12.17.00.26.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 00:26:26 -0800 (PST)
Subject: Re: [PATCH 2/2] usb: musb: Fix a possible null-pointer dereference in
 musb_handle_intr_connect()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org
References: <20191210165454.13772-1-b-liu@ti.com>
 <20191210165454.13772-3-b-liu@ti.com> <20191211080910.GA426347@kroah.com>
 <dc1cbf76-a2c4-a861-0847-d3434b843fee@gmail.com>
 <20191211092055.GA505396@kroah.com>
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <07ac273c-46f1-3f18-9d94-c643ded4fb5f@gmail.com>
Date:   Tue, 17 Dec 2019 16:26:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191211092055.GA505396@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2019/12/11 17:20, Greg Kroah-Hartman wrote:
> On Wed, Dec 11, 2019 at 05:10:17PM +0800, Jia-Ju Bai wrote:
>>
>> On 2019/12/11 16:09, Greg Kroah-Hartman wrote:
>>> On Tue, Dec 10, 2019 at 10:54:54AM -0600, Bin Liu wrote:
>>>> From: Jia-Ju Bai <baijiaju1990@gmail.com>
>>>>
>>>> In musb_handle_intr_connect(), there is an if statement on line 783 to
>>>> check whether musb->hcd is NULL:
>>>>       if (musb->hcd)
>>>>
>>>> When musb->hcd is NULL, it is used on line 797:
>>>>       musb_host_poke_root_hub(musb);
>>>>           if (musb->hcd->status_urb)
>>>>
>>>> Thus, a possible null-pointer dereference may occur.
>>> Maybe, if musb->hcd really ever could be NULL.
>>>
>>> In looking at the code, I don't see where that could happen, do you?
>>> Why is that check there in the first place?
>>>
>>> What sets musb->hcd to NULL in the first place?
>> In fact, my static analysis tool identifies an if check about musb->hcd, so
>> it infers that musb->hcd could be NULL here.
>> But it does not try to find any explicit place that set musb->hcd to NULL.
> Can it do that?

Not yet...

>
>> If musb->hcd is never NULL here, we can just delete the related if check.
> I agree :)

Okay, I will send a new patch that delete the if check.


Best wishes,
Jia-Ju Bai

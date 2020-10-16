Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F35290A32
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 19:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410989AbgJPREC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Oct 2020 13:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410528AbgJPREB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Oct 2020 13:04:01 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57D0C0613D3
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2020 10:04:01 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id z2so3391511ilh.11
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2020 10:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nrXZT1NSneKmXGXvDV7/6n23kcrvfeFmh1gJOAKmVU4=;
        b=MvkqmVew7lrU/VxTo0f57KdRMcxJLRETE2OsPfuvXJ6w2GVXQvEPvbXdx0lrTbufde
         nCKNLz5Ur2ar8ErXe9lg7UuJTXFuOx4jCN92rlduTz/5I+UpX68CXOsQC5WscAIr/GRE
         ekAnhX8Wlf535PPmfS1HzlGajNWQOTl988S7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nrXZT1NSneKmXGXvDV7/6n23kcrvfeFmh1gJOAKmVU4=;
        b=jq/+7lAifZjqhnuDgHQg/2gSwwGUP8mAhKJS33DZUs3L78XDfirV0eTrg6dfldZpeb
         6g2F8Vhluhxc1tww0ElxPzyvTjr+MGXuijvTuTRuulTV4Qq3wpZiRhheM/rKGTSIJPUK
         7shzvSjndkdDOpGbXiovwdQ1lOqnr1MJrr9IkXcu4Q9P0w5QP0Oaq83S8UBtSRkZhGt8
         OSNZRMIrzPxYXPLBzVijhvRxXmBiGjHsubr9o61WwrQwmWTY69s9aoNJJqm4erooyOex
         YTgazMoSJ894oOzwEty2yUYA6+GIhvPv6XZ5P3hTrcccSYh6dJZHkbinbK4Dh1BsCRG6
         NBXw==
X-Gm-Message-State: AOAM532Yuc0bpdCccvjVAKs7T1Gld/I41GI44i78ocBMX8xcH9T2jyrX
        qpyNn3k1kqmxICEGgKR4oZL+Tg==
X-Google-Smtp-Source: ABdhPJwvSYsL4onTjRI8p1kVAz8AVrFmM4IfxZzeotZQNiynr6bqTtSKNN8s5yTLv5OD5L7hrXX/WQ==
X-Received: by 2002:a05:6e02:e46:: with SMTP id l6mr3496414ilk.8.1602867841067;
        Fri, 16 Oct 2020 10:04:01 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c1sm2744116ile.0.2020.10.16.10.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2020 10:04:00 -0700 (PDT)
Subject: Re: [PATCH v2] kcov, usbip: collect coverage from vhci_rx_loop
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Shuah Khan <shuah@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Nazime Hande Harputluoglu <handeharput@gmail.com>,
        Nazime Hande Harputluoglu <handeharputlu@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <c07a2deae7a75e394de272c1a33cfcc1f667af92.1602522185.git.andreyknvl@google.com>
 <dddca63c-088c-d87c-370f-e8f02d1b0d04@linuxfoundation.org>
 <CAAeHK+zdH0WqihL-394p88VM8tkMztdagR=_KuOSwteEdLsFgg@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <eaa06c4f-5947-c24e-1415-71c625b1c84c@linuxfoundation.org>
Date:   Fri, 16 Oct 2020 11:03:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAeHK+zdH0WqihL-394p88VM8tkMztdagR=_KuOSwteEdLsFgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/16/20 8:18 AM, Andrey Konovalov wrote:
> On Tue, Oct 13, 2020 at 7:28 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 10/12/20 11:10 AM, Andrey Konovalov wrote:
>>> From: Nazime Hande Harputluoglu <handeharputlu@google.com>
>>>
>>> Add kcov_remote_start()/kcov_remote_stop() annotations to the
>>> vhci_rx_loop() function, which is responsible for parsing USB/IP packets
>>> coming into USB/IP client.
>>>
>>> Since vhci_rx_loop() threads are spawned per vhci_hcd device instance, the
>>> common kcov handle is used for kcov_remote_start()/stop() annotations
>>> (see Documentation/dev-tools/kcov.rst for details). As the result kcov
>>> can now be used to collect coverage from vhci_rx_loop() threads.
>>>
>>> Signed-off-by: Nazime Hande Harputluoglu <handeharputlu@google.com>
>>> ---
>>>
>>> Changes v1->v2:
>>> - Fix spacing issues.
>>> - Add ifdef CONFIG_KCOV around kcov_handle in usbip_device struct.
>>>
>>
>> Does this compile without CONFIG_KCOV?
>>
>>> ---
>>>    drivers/usb/usbip/usbip_common.h |  4 ++++
>>>    drivers/usb/usbip/vhci_rx.c      |  3 +++
>>>    drivers/usb/usbip/vhci_sysfs.c   | 12 +++++++-----
>>>    3 files changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
>>> index 8be857a4fa13..0906182011d6 100644
>>> --- a/drivers/usb/usbip/usbip_common.h
>>> +++ b/drivers/usb/usbip/usbip_common.h
>>> @@ -277,6 +277,10 @@ struct usbip_device {
>>>                void (*reset)(struct usbip_device *);
>>>                void (*unusable)(struct usbip_device *);
>>>        } eh_ops;
>>> +
>>> +#ifdef CONFIG_KCOV
>>> +     u64 kcov_handle;
>>> +#endif
> 
> Hi Shuah,
> 
> We could have this field always defined, which allows us to not check
> CONFIG_KCOV in the places where it's used (this is what we do for
> vhost; the kcov functions will be optimized away). Or we could keep
> the ifdef CONFIG_KCOV check here, and then add the same checks to
> other places.
> 
> What would be your preference here?

Let's keep it in ifdef CONFIG_KCOV and add checks to keep this
limited to just the kcov case.

thanks,
-- Shuah





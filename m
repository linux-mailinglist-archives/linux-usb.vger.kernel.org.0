Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD132588E3
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 09:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgIAHUK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 03:20:10 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59901 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726006AbgIAHUJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 03:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598944807;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NYs5D15nDt7sh4xdYXRddb406m8WZQTGSZSNtOR5yPo=;
        b=FgOosxa/7CvuIAuXgBmbfw7vdMy2zIviZ8F7QPg7OqaOga5kaPCzj69Lhp0AZbPAW3cVfB
        XCmXoCTHeoxlXGMI1a5WY+LU9hCOjGUzhCFVJnqeyaimp2sND/Zy440lmY4XvzuKppjVwE
        LZ0jWgrcOUrx+xSZ8Yexiay7+nE28kw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-AmcTNVJoMGGUIdw6p9DIHg-1; Tue, 01 Sep 2020 03:20:04 -0400
X-MC-Unique: AmcTNVJoMGGUIdw6p9DIHg-1
Received: by mail-ed1-f72.google.com with SMTP id c3so155868edm.7
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2020 00:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NYs5D15nDt7sh4xdYXRddb406m8WZQTGSZSNtOR5yPo=;
        b=DSgMUi7qtbeikOEORoQ2KKgbRPWEVXG2z1iHK6YiXjfa3VxabV+GK4ZM2M0oxu37mL
         SgnLeAo+4D6QckXt3hhzgs7QoVtdDe/RV7VqqDfw+5IO4r0K7EWIlaQUZW6/ZcN89P6/
         zLfchdr8T08VgStQnDO1j+AZKkeU60LxghHj6qA/8m4/ZZ1ymWX/dJxyr4xYhYBV+uU3
         yGPF3gF0A96yguNKu+b75kKPd395F7yQUJL4b5b8T8ZvKtQhqF0t4UWvHqDrcV3Ccl6m
         sbknNg5i7B2LxMlwSB2JWpITP3DMc/Eixs2dfq9ShWnCpEIiES9cUziCB5fYf/SDGpQy
         DEPQ==
X-Gm-Message-State: AOAM5327uwbs6xd1gCMnY5yJh9lHFG/d7iEys20E9iVA0zrOs9Y6iKHg
        8XdZ2ueosylbCm6DSQsS/Sa46joYgKPH3xRuyxIWljlgnKk9bB2u+c33yxOn/CQ7LPB+I/vCVmv
        qWTFwT7k5RR1TvL5AdUHG
X-Received: by 2002:a17:906:4e4a:: with SMTP id g10mr291515ejw.274.1598944803508;
        Tue, 01 Sep 2020 00:20:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwPqsc4Oa96UwuF7zKI9yUPWtTpfnd4fIFJTiq2Tw5JhJmWMfK6h6yVx4wIY7+f+6KM4vtwQ==
X-Received: by 2002:a17:906:4e4a:: with SMTP id g10mr291503ejw.274.1598944803301;
        Tue, 01 Sep 2020 00:20:03 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id c5sm307852edk.63.2020.09.01.00.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 00:20:02 -0700 (PDT)
Subject: Re: [PATCH 08/32] usb: typec: tcpm: tcpm: Remove dangling unused
 'struct tcpm_altmode_ops'
To:     Badhri Jagan Sridharan <badhri@google.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        USB <linux-usb@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20200706133341.476881-1-lee.jones@linaro.org>
 <20200706133341.476881-9-lee.jones@linaro.org>
 <ca14707c-7d40-07ac-da1d-ca27a2e93dcd@redhat.com>
 <20200706142051.GA3500@dell>
 <65f27abc-69c8-3877-be5b-e5e478153af9@redhat.com>
 <20200714135456.GB1398296@dell>
 <CAPTae5L3cVYc+00-bPzDADXRjzFCOGPB5NnmSZ4_c=0D5Mxikg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5950abe7-b3cc-72db-3e24-167c87e5e264@redhat.com>
Date:   Tue, 1 Sep 2020 09:20:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPTae5L3cVYc+00-bPzDADXRjzFCOGPB5NnmSZ4_c=0D5Mxikg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 9/1/20 4:32 AM, Badhri Jagan Sridharan wrote:
> Hi Hans,
> 
> Kernel test robot is still reporting this issue. I have my repo synced
> to ToT usb-next:
> Output of git repo:
> 5fedf0d295d3 (origin/usb-testing, origin/usb-next) Merge 5.9-rc3 into usb-next
> f75aef392f86 (tag: v5.9-rc3, origin/usb-linus, origin/main) Linux 5.9-rc3
> e43327c706f2 Merge branch 'linus' of
> git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
> dcc5c6f013d8 Merge tag 'x86-urgent-2020-08-30' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> d2283cdc18d3 Merge tag 'irq-urgent-2020-08-30' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> 0063a82de937 Merge tag 'sched-urgent-2020-08-30' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> 
> Were you able to get your patch merged ?

The patch is in the review process. It looks like it needs one more
revision and then it should be on its way.

Regards,

Hans



> 
> Thanks,
> Badhri
> 
> 
> On Tue, Jul 14, 2020 at 6:55 AM Lee Jones <lee.jones@linaro.org> wrote:
>>
>> On Tue, 14 Jul 2020, Hans de Goede wrote:
>>
>>> Hi,
>>>
>>> On 7/6/20 4:20 PM, Lee Jones wrote:
>>>> On Mon, 06 Jul 2020, Hans de Goede wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> On 7/6/20 3:33 PM, Lee Jones wrote:
>>>>>> Looks as though a079973f462a3 ("usb: typec: tcpm: Remove tcpc_config
>>>>>> configuration mechanism") pulled out the only use of 'tcpm_altmode_ops'
>>>>>> last year.  No need to keep it around.
>>>>>>
>>>>>> Fixes the following W=1 kernel build warning(s):
>>>>>>
>>>>>>     drivers/usb/typec/tcpm/tcpm.c:1551:39: warning: ‘tcpm_altmode_ops’ defined but not used [-Wunused-const-variable=]
>>>>>>     1551 | static const struct typec_altmode_ops tcpm_altmode_ops = {
>>>>>>     | ^~~~~~~~~~~~~~~~
>>>>>>
>>>>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>>>>> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>>>>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
>>>>>
>>>>> This is necessary for adding Display port over Type-C support
>>>>> on devices using the tcpm code, rather then firmware, to do
>>>>> the Type-C alt-mode negotiation.
>>>>>
>>>>> I have a local patch in my tree which adds support for this.
>>>>>
>>>>> But Heikki did not like my approach, so that patch
>>>>> (which needs the bits you are removing) never landed
>>>>> upstream:
>>>>>
>>>>> https://patchwork.kernel.org/patch/11199517/
>>>>>
>>>>> Which is somewhat old now.
>>>>
>>>> Yes, that's a just a little old now.
>>>>
>>>> If it drags on for much longer, perhaps consider taking it out for the
>>>> time being and adding it back when you start to make use of it again?
>>>
>>> Ok, I've just submitted a reworked patch-series upstream which
>>> actually uses this code. So please drop this patch from your
>>> patch-set.
>>
>> No problem.
>>
>> Thanks Hans.
>>
>> --
>> Lee Jones [李琼斯]
>> Senior Technical Lead - Developer Services
>> Linaro.org │ Open source software for Arm SoCs
>> Follow Linaro: Facebook | Twitter | Blog
> 


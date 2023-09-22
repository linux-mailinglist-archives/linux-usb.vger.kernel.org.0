Return-Path: <linux-usb+bounces-505-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 944117AAD0C
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 10:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by am.mirrors.kernel.org (Postfix) with ESMTP id 15A8F1F225D5
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 08:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32A514F6F;
	Fri, 22 Sep 2023 08:47:11 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE3E441E
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 08:47:09 +0000 (UTC)
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7663C99
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 01:47:08 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6c4a25f6390so754982a34.2
        for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 01:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695372428; x=1695977228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3L+fgCmwP3ti8Dz5yUQvIDXFyHSzCQotBOy+ySjShrE=;
        b=cZ6ttfcfBjs5Bj9V33dOiLFAjCuqtVMHku8C9OxvLX8a28OOQQ693Cohgdn0u73WRG
         ZXIZXoKha9Ww2wfXKpdjMK6TuTEg9/DlZ6wWoDgdcnp4aQj6CekWjrh49hsaaK9hggNY
         Ay+BXPP/Zv5Wacc+yXd8poz86BahiiSgtDrkYUYgDVEJ+1ed+8JhuOz9F7bT3gat+Jnm
         xYOj2k4jAP3jBWwJMaxA/aAizJeBrxM5ulj92QOdHlSgItzk5PzYn4g6uX5+qaBBjNPU
         Nzx4UiE9Kz67WLuZ5eKO09Q6DPSNim7Tyh68vFx4QeYUGwO9roPI+atu9vQ1AKaDfPyB
         v2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695372428; x=1695977228;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3L+fgCmwP3ti8Dz5yUQvIDXFyHSzCQotBOy+ySjShrE=;
        b=NUBzaP3gjSdzwEt2aZcxeUjGUkTDcyu2qkEKs/UJJNyTTIeD76g5XPOEozk0cf/lMM
         SdqpdRgaRZ/jfML4MBKOvDP4AhJ8vTId4ypBFBrolbE8ZnU1916mPnJzo3qbx56dbCm2
         223cZuzdG+w2ETLbgA1ZAoGef48X2ik9PVIaO5Of7r5OUFlIJvpIEv+XdYG4eKZvtfzO
         5uBjhewMXVQ4LuELcNVy/MKBzoKWCYgqWfXmwRxaBlQJsFf55pM7RggfLtQ9dRbv8/LQ
         ALnwMnPWI7D6zVfNzgQZPsZy5AkbafOZQcB0c80YFVHPAPYfWLqX+J6IidmXXiQsTZw2
         hepA==
X-Gm-Message-State: AOJu0YyeuTJ2LNxDhAg+jrlEocJUJRw2l1HWTD1xP3VffkWm3HrpjXOw
	hEwVO+4ZRMGjdau7b7nSQCsL+UtWxQY=
X-Google-Smtp-Source: AGHT+IGxQV+uQ7jjfn32wmjQkC4xgQZ/HG6mTuGRiyrdKh/VkFalFuV9Gzyd1t2v99CvJLDkH490IA==
X-Received: by 2002:a05:6358:2491:b0:13e:bf50:73af with SMTP id m17-20020a056358249100b0013ebf5073afmr7661465rwc.18.1695372427541;
        Fri, 22 Sep 2023 01:47:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a22-20020a62e216000000b0068fe3a6c312sm2679127pfi.62.2023.09.22.01.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 01:47:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <048122d1-dbf3-7784-0c4a-8a85635407b7@roeck-us.net>
Date: Fri, 22 Sep 2023 01:47:05 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [EXT] Re: [PATCH v2 1/2] usb: typec: tcpci: add check code for
 tcpci/regmap_read/write()
Content-Language: en-US
To: Xu Yang <xu.yang_2@nxp.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Jun Li <jun.li@nxp.com>
References: <20230914121158.2955900-1-xu.yang_2@nxp.com>
 <ZQgl8byyZNqe5Af1@kuha.fi.intel.com>
 <22c69730-43b5-9c48-da21-03f0441eecbb@roeck-us.net>
 <DB7PR04MB4505B1D473B05CCE21F4AB588CFFA@DB7PR04MB4505.eurprd04.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <DB7PR04MB4505B1D473B05CCE21F4AB588CFFA@DB7PR04MB4505.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 9/21/23 23:47, Xu Yang wrote:
> Hi Heikki & Guenter,
> 
>> On 9/18/23 03:26, Heikki Krogerus wrote:
>>> On Thu, Sep 14, 2023 at 08:11:57PM +0800, Xu Yang wrote:
>>>> The return value from tcpci/regmap_read/write() must be checked to get
>>>> rid of the bad influence of other modules. This will add check code for
>>>> all of the rest read/write() callbacks and will show error when failed
>>>> to get ALERT register.
>>>>
>>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>>>
>>>> ---
>>>> Changes in v2:
>>>>    - remove printing code
>>>> ---
>>>>    drivers/usb/typec/tcpm/tcpci.c | 34 +++++++++++++++++++++++++---------
>>>>    1 file changed, 25 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
>>>> index 0ee3e6e29bb1..8ccc2d1a8ffc 100644
>>>> --- a/drivers/usb/typec/tcpm/tcpci.c
>>>> +++ b/drivers/usb/typec/tcpm/tcpci.c
>>>> @@ -657,21 +657,28 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>>>>       int ret;
>>>>       unsigned int raw;
>>>>
>>>> -    tcpci_read16(tcpci, TCPC_ALERT, &status);
>>>> +    ret = tcpci_read16(tcpci, TCPC_ALERT, &status);
>>>> +    if (ret < 0)
>>>> +            return ret;
>>>>
>>>>       /*
>>>>        * Clear alert status for everything except RX_STATUS, which shouldn't
>>>>        * be cleared until we have successfully retrieved message.
>>>>        */
>>>> -    if (status & ~TCPC_ALERT_RX_STATUS)
>>>> -            tcpci_write16(tcpci, TCPC_ALERT,
>>>> +    if (status & ~TCPC_ALERT_RX_STATUS) {
>>>> +            ret = tcpci_write16(tcpci, TCPC_ALERT,
>>>>                             status & ~TCPC_ALERT_RX_STATUS);
>>>> +            if (ret < 0)
>>>> +                    return ret;
>>>> +    }
>>>>
>>>>       if (status & TCPC_ALERT_CC_STATUS)
>>>>               tcpm_cc_change(tcpci->port);
>>>>
>>>>       if (status & TCPC_ALERT_POWER_STATUS) {
>>>> -            regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
>>>> +            ret = regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
>>>> +            if (ret < 0)
>>>> +                    return ret;
>>>>               /*
>>>>                * If power status mask has been reset, then the TCPC
>>>>                * has reset.
>>>> @@ -687,7 +694,9 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>>>>               unsigned int cnt, payload_cnt;
>>>>               u16 header;
>>>>
>>>> -            regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
>>>> +            ret = regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
>>>> +            if (ret < 0)
>>>> +                    return ret;
>>>
>>> I think you still need to clear TCPC_ALERT_RX_STATUS in this case.
>>> Guenter, can you check this?
>>>
>>
>> If reading from or writing to the status register failed, we are pretty
>> much messed up anyway, so I don't think it really matters.
>>
>> I think the more severe problem is that this is an interrupt handler,
>> which either handles the interrupt or it doesn't. It does not have the
> 
> Yes, I agree.
> 
>> option of returning an error (negative error code).
> 
> Normally speaking, it means the device has successfully handled the
> interrupt event if an interrupt handler return IRQ_HANDLED, and the
> interrupt event doesn't belong to this device or not be handled if the
> interrupt handler return IRQ_NONE. However, the irq core will regard
> an negative error code as IRQ_NONE as far as I know. And when IRQ_NONE
> or a an negative error code is returned, irq core will judge if the irq
> is bad or if there is need to disable this irq. Therefore, the irq handler
> returns an negative error code should be ok if it's threaded.
> I just do the same thing as max_tcpci_irq() in tcpci_maxim_core.c.
> 

Unless that behavior is documented, I'd rather not depend on it.
Regarding "because this other driver does it" ... telling police that you only
drove faster than the speed limit because everyone does it isn't usually a well
received argument.

Guenter



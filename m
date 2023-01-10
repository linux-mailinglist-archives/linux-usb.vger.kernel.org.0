Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 401E96643ED
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jan 2023 16:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233988AbjAJPCQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 10:02:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238404AbjAJPB7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 10:01:59 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68CC5B16D
        for <linux-usb@vger.kernel.org>; Tue, 10 Jan 2023 07:01:57 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id e17-20020a9d7311000000b00678202573f1so7102286otk.8
        for <linux-usb@vger.kernel.org>; Tue, 10 Jan 2023 07:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KSfPEw872+aT41ANQLJfiQuHXf6/auArXgd/LZDQ0iU=;
        b=gHXLzdgeZr+9qO5xkGYkZgsM67BbGi+NtgEbLmeYId1gaSqqBahAjjrWxN7SRP0m42
         bWfHi+hoed04b6+/FvshUbSV46cLCQOYuEH4TzdO5Bm/SsxCI0MQXDiR4IRZyl4tPPEj
         yzH7z6CPff1qv6j2/4fxoyKaRfttCMIWD6983J/8551LhQtaGjsEkpws1ejBu8vN+LFB
         tu33bu6IcydvFBeHKJ9s7UV8yKMZoPFR1pVzRoy9HXeASkt56LfQf9zVxCGAySU8MUiO
         ZeIPhwxA6RFD/mYDpL/WFceiZyda071sjqpTqUAxch0Z8+aOhkeOQWz3Qnptr1j4rzRd
         2WWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSfPEw872+aT41ANQLJfiQuHXf6/auArXgd/LZDQ0iU=;
        b=rGS6z7X+N1eOvVMilKHm/njdeOzXFN83JUlsOS1UH10cLXusEt949kURCONUlQj8e9
         tQ9q1EE+1zClMMCBCBjpLqFseQfTIzwwGjp6Wphu58IvcxOg9KNBY6+GffkXSUkqYkSQ
         sPmmfdxhpgs9kdVDbMIye9xAzq+cEP6rXJMFfGx49CRs0gMP/7KycE6kIEUS1PY1yapG
         Qd7UVhg81fDcpd3SYdnW4ZxRjG73LALQvpAvht1t488H8bJOnMU4plqnDED/9FcAlpq2
         Rq7c8YTh7ojqz0q19v1mc5cMOimLGuhTo3//aE37cPAIM/pNhARlA+AK+TD07ImHy/VL
         0OFg==
X-Gm-Message-State: AFqh2kpkIhIfw0zpBQdz/uO0i2mMuU1M1diHxMmispKS5KBiL417dWeM
        dKuDs7AsYLyBRePM8P+EgaQnEVGwR2Q=
X-Google-Smtp-Source: AMrXdXs2mRLDQuuIGyBrh6NPmMdnIkUFzhilEFHFXkdguGHRdEzIlpv8zeQdi8flbBO4Jg+7fkF2GQ==
X-Received: by 2002:a05:6830:1d6b:b0:684:a369:df2d with SMTP id l11-20020a0568301d6b00b00684a369df2dmr778072oti.37.1673362916905;
        Tue, 10 Jan 2023 07:01:56 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f38-20020a9d2c29000000b0066e7e4b2f76sm6135442otb.17.2023.01.10.07.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 07:01:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c69a0f75-f8ca-4a91-f363-eb74bc961895@roeck-us.net>
Date:   Tue, 10 Jan 2023 07:01:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
References: <20221216033150.2683718-1-xu.yang_2@nxp.com>
 <acf0485c-8061-ef12-83d9-c3b22dc235ad@roeck-us.net>
 <PA4PR04MB959190B619279B290630D8018CE69@PA4PR04MB9591.eurprd04.prod.outlook.com>
 <DB7PR04MB4505A0A29918EC71FDF5C8BC8CFE9@DB7PR04MB4505.eurprd04.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [EXT] Re: [PATCH] usb: typec: tcpm: fix create duplicate
 source/sink-capabilities file
In-Reply-To: <DB7PR04MB4505A0A29918EC71FDF5C8BC8CFE9@DB7PR04MB4505.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/8/23 16:35, Xu Yang wrote:
> Hi,
> 
>> -----Original Message-----
>> From: Xu Yang
>> Sent: Friday, December 16, 2022 2:41 PM
>> To: Guenter Roeck <linux@roeck-us.net>; heikki.krogerus@linux.intel.com
>> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Jun Li <jun.li@nxp.com>
>> Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpm: fix create duplicate source/sink-capabilities file
>>
>> Hi Guenter,
>>
>>> -----Original Message-----
>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>> Sent: Friday, December 16, 2022 1:13 PM
>>> To: Xu Yang <xu.yang_2@nxp.com>; heikki.krogerus@linux.intel.com
>>> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Jun Li <jun.li@nxp.com>
>>> Subject: [EXT] Re: [PATCH] usb: typec: tcpm: fix create duplicate source/sink-capabilities file
>>>
>>> Caution: EXT Email
>>>
>>> On 12/15/22 19:31, Xu Yang wrote:
>>>> After soft reset has completed, an Explicit Contract negotiation occurs.
>>>> The sink device will receive source capabilitys again. This will cause
>>>> a duplicate source-capabilities file be created.
>>>>
>>>> And the kernel will dump:
>>>> sysfs: cannot create duplicate filename '/devices/virtual/usb_power_delivery/pd1/source-capabilities'
>>>>
>>>> This will unregister existing capabilities before register new one.
>>>>
>>>> Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Capabilities")
>>>> cc: <stable@vger.kernel.org>
>>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>>> ---
>>>>    drivers/usb/typec/tcpm/tcpm.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>>> index 904c7b4ce2f0..02d8a704db95 100644
>>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>>> @@ -2371,6 +2371,9 @@ static int tcpm_register_source_caps(struct tcpm_port *port)
>>>>        if (IS_ERR(port->partner_pd))
>>>>                return PTR_ERR(port->partner_pd);
>>>>
>>>> +     /* remove existing capabilities since got new one */
>>>> +     usb_power_delivery_unregister_capabilities(port->partner_source_caps);
>>>> +
>>>>        memcpy(caps.pdo, port->source_caps, sizeof(u32) * port->nr_source_caps);
>>>>        caps.role = TYPEC_SOURCE;
>>>>
>>>> @@ -2394,6 +2397,9 @@ static int tcpm_register_sink_caps(struct tcpm_port *port)
>>>>        if (IS_ERR(port->partner_pd))
>>>>                return PTR_ERR(port->partner_pd);
>>>>
>>>> +     /* remove existing capabilities since got new one */
>>>> +     usb_power_delivery_unregister_capabilities(port->partner_sink_caps);
>>>> +
>>>>        memcpy(caps.pdo, port->sink_caps, sizeof(u32) * port->nr_sink_caps);
>>>>        caps.role = TYPEC_SINK;
>>>>
>>>
>>> Shouldn't usb_power_delivery_unregister_capabilities() be called from
>>> the SOFT_RESET state handler ?
>>
>> Although this issue is triggered by soft reset event, there is also
>> other possibilities which may produce this behavior. Such as received
>> 2rd source capability or use Get_Source_Cap message. It's a dynamic
>> process even after source/sink is ready. So I think it's better to handle
>> it in tcpm_register_source/sink_caps(). Not sure if this is reasonable.
>>
>> Thanks,
>> Xu Yang
> 
> Do you have any other comments or suggestions with this patch?
> 

First of all, the current code is obviously wrong. If soft reset results in
pd capabilities to be invalid, that should be handled in soft reset,
just like it is handled in hard reset. Otherwise there would be stale pd
devices around which are no longer valid.

Second, if it can indeed happen that multiple source capabilities
messages are received, this should be handled as defined by the protocol.
Either the second set of messages is expected to be ignored, or it is
expected to replace existing capabilities. Either case, that situation
should be handled consciously: unregistering and re-registering
capabilities results in removal and re-creation of devices. Just doing
that unconditionally even if unnecessary (if capabilities are the same)
needs more discussion, and should not be hidden in another patch which
is supposed to address a different problem.

Guenter


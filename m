Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90C924D383C
	for <lists+linux-usb@lfdr.de>; Wed,  9 Mar 2022 19:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235893AbiCIR5h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Mar 2022 12:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235405AbiCIR5f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Mar 2022 12:57:35 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2C45FB6
        for <linux-usb@vger.kernel.org>; Wed,  9 Mar 2022 09:56:35 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AACE83F1D0
        for <linux-usb@vger.kernel.org>; Wed,  9 Mar 2022 17:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646848593;
        bh=ywWEngNkae6mKxGv+1cfuhQRhz77SMjtBbNBkeG8nw8=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=e5q+qBAXGYAdQHNHhA/QFJAzD5z2psKGXIm50Ao3aoTsjwV3RQNM9Qwptz3epQKFg
         79werHXY/0RPl7V6XpWIm/NCZoPRS+xdcbkO+RK2sFohhBnmG26KpbZ4Nea6xuDc3k
         HYRUWT4khxsQewKqgEpmp8PLbfd+oyTxK+x6ZxpP3WF/4Vgx7p5O0/nVN7pQLPgo7O
         Pi/VSetqSCFTx7TeqnMAU1bvzYlaP8tIeKsH3NunJiq1tQpZttOw6yA43671kIvj6b
         JszfAqlcXJlBl6IRXLghlHCfPRWozrxPji2EJBZFmr2cp7aYM3tlhhuP8eXyAEuqU2
         mKRmz3Ur7DjJA==
Received: by mail-ej1-f72.google.com with SMTP id k16-20020a17090632d000b006ae1cdb0f07so1696981ejk.16
        for <linux-usb@vger.kernel.org>; Wed, 09 Mar 2022 09:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ywWEngNkae6mKxGv+1cfuhQRhz77SMjtBbNBkeG8nw8=;
        b=ab6JVEoZJ2UCuRJaTtDzu2QPlqdzUnUdk98rxMRnZ2SK3wmDW5B/kZVA8D+qFH3bs4
         rxRxl69P2QRQQCholNcrJ1l7k38OtqF5Q/EP51iAOFfdH4aWs3s0VyZ2/0YBbW6vTq3B
         Rzym9O4KuSqpmxBMvBAiaNZruZz+wTHhVjdJIsyjhng+Su5PWaL6+g+wSyB9IPVHPGzJ
         oj07CYlDPxvmkjyAnfZNc64xJpARHPq6wLP6ItUwdO+5P0t9iO0ECzrYFGHcP2O6Hxyt
         eDbOPPkxtsx4Oxyy4MNDIIV3Jr/kwWBugWsEq2WkyE3RovoLGkEa3Lqt+338XB4lGqDi
         igJw==
X-Gm-Message-State: AOAM532YeIjqmTgSwaMbmgyE/hll/hOorze7fl9bcd1vVFDCcN/yUWkA
        nqAfS1Bl8nhICg61yzPl585rU6ofolQyrDAF/1FN6S8TQ8OUnBzRMsyET8qefYPa7IU9+hAIjIN
        WyPwVPPhUB4lYYK1RuZaNLop/y9zU1keACrWkaQ==
X-Received: by 2002:a17:906:69d1:b0:6ce:7201:ec26 with SMTP id g17-20020a17090669d100b006ce7201ec26mr866304ejs.105.1646848593316;
        Wed, 09 Mar 2022 09:56:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwN6yRIxH1ByXIFcKPd19wdA/C3x9ZhriHZnykAidYhzyn7sr4M8QeESi5VszJkWH2JSACfjQ==
X-Received: by 2002:a17:906:69d1:b0:6ce:7201:ec26 with SMTP id g17-20020a17090669d100b006ce7201ec26mr866289ejs.105.1646848593018;
        Wed, 09 Mar 2022 09:56:33 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id h8-20020a50ed88000000b004160630c980sm1095553edr.62.2022.03.09.09.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 09:56:32 -0800 (PST)
Message-ID: <6867439a-b995-86e7-6136-bcb8709eeb90@canonical.com>
Date:   Wed, 9 Mar 2022 18:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 14/26] usb: gadget: s3c-hsudc: remove usage of list
 iterator past the loop body
Content-Language: en-US
To:     Jakob Koschel <jakobkoschel@gmail.com>
Cc:     Greg Kroah-Hartman <greg@kroah.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Felipe Balbi <balbi@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Al Cooper <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:USB GADGET/PERIPHERAL SUBSYSTEM" 
        <linux-usb@vger.kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>
References: <20220308171818.384491-1-jakobkoschel@gmail.com>
 <20220308171818.384491-15-jakobkoschel@gmail.com>
 <a3fb72da-a9e3-04af-fa19-62765bf81c2b@canonical.com>
 <B269AAED-135D-4EAB-AA7C-26219581FB40@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <B269AAED-135D-4EAB-AA7C-26219581FB40@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09/03/2022 18:36, Jakob Koschel wrote:
> 
>> On 9. Mar 2022, at 18:25, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 08/03/2022 18:18, Jakob Koschel wrote:
>>> If the list representing the request queue does not contain the expected
>>> request, the value of the list_for_each_entry() iterator will not point
>>> to a valid structure. To avoid type confusion in such case, the list
>>> iterator scope will be limited to the list_for_each_entry() loop.
>>>
>>> In preparation to limiting scope of the list iterator to the list traversal
>>> loop, use a dedicated pointer to point to the found request object [1].
>>>
>>> Link: https://lore.kernel.org/all/YhdfEIwI4EdtHdym@kroah.com/
>>> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
>>> ---
>>> drivers/usb/gadget/udc/s3c-hsudc.c | 12 +++++++-----
>>> 1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/usb/gadget/udc/s3c-hsudc.c b/drivers/usb/gadget/udc/s3c-hsudc.c
>>> index 89f1f8c9f02e..bf803e013458 100644
>>> --- a/drivers/usb/gadget/udc/s3c-hsudc.c
>>> +++ b/drivers/usb/gadget/udc/s3c-hsudc.c
>>> @@ -877,7 +877,7 @@ static int s3c_hsudc_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>>> {
>>> 	struct s3c_hsudc_ep *hsep = our_ep(_ep);
>>> 	struct s3c_hsudc *hsudc = hsep->dev;
>>> -	struct s3c_hsudc_req *hsreq;
>>> +	struct s3c_hsudc_req *hsreq = NULL, *iter;
>>> 	unsigned long flags;
>>>
>>> 	hsep = our_ep(_ep);
>>> @@ -886,11 +886,13 @@ static int s3c_hsudc_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>>>
>>> 	spin_lock_irqsave(&hsudc->lock, flags);
>>>
>>> -	list_for_each_entry(hsreq, &hsep->queue, queue) {
>>> -		if (&hsreq->req == _req)
>>> -			break;
>>> +	list_for_each_entry(iter, &hsep->queue, queue) {
>>> +		if (&iter->req != _req)
>>> +			continue;
>>> +		hsreq = iter;
>>> +		break;
>>
>> You have in the loop both continue and break, looks a bit complicated.
>> Why not simpler:
>>
>> if (&iter->req == _req) {
>> 	hsreq = iter;
>> 	break;
>> }
> 
> Ultimately I changed this based on the feedback from Linus
> (Link: https://lore.kernel.org/linux-kernel/CAHk-=wheru6rEfzC2wuO9k03PRF6s3nhxryCAnwR5bzKwPV2ww@mail.gmail.com/).

Not cleaner to me at all, but it's all personal opinion. :)

>>
>> ?
>> Less code, typical (expected) code flow when looking for something in
>> the list. Is your approach related to some speculative execution?
> 
> no relation to speculative execution.
> 
> I have no preference for one over the other, so I'll just change it to
> however it is desired.
> 
> It would just be great to have a (somewhat) consistent way so I can prepare
> the rest of the patch sets accordingly.
> 

Yeah, I understand. The code itself looks good, so:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

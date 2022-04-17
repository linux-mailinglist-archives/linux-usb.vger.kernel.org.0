Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8FB85047D1
	for <lists+linux-usb@lfdr.de>; Sun, 17 Apr 2022 14:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbiDQNAY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 17 Apr 2022 09:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234109AbiDQNAW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 17 Apr 2022 09:00:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 424B13388F
        for <linux-usb@vger.kernel.org>; Sun, 17 Apr 2022 05:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650200266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4wdQ0q4P0LXwRB+NkpVGYT9mjf1M/uUKkfK7twib41w=;
        b=UnpnJfqamkE77QrYAxeROts0ANgwDSLsCeJztaZWqDBxzMj2GMiUUeMNv/mc549GiB52S/
        VDjmq9E3Li92/N4hru6dqIO5QuuaiO66Q+cmTIvDmoGEZj+WWFuDieVWv9DugoRGbuAALU
        sQUQN2P758NsT6f1uNiVKo+lDDFRMk4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-9ViPtcvePCmqyjtZlBHLcg-1; Sun, 17 Apr 2022 08:57:44 -0400
X-MC-Unique: 9ViPtcvePCmqyjtZlBHLcg-1
Received: by mail-qk1-f198.google.com with SMTP id bq12-20020a05620a468c00b0069c6527969dso7684077qkb.8
        for <linux-usb@vger.kernel.org>; Sun, 17 Apr 2022 05:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4wdQ0q4P0LXwRB+NkpVGYT9mjf1M/uUKkfK7twib41w=;
        b=66CoaXc9JMiS98xl5DArGDvyr3eIwQ8IaTSk0cfw2zrOy09U9FQprDjEFUOD/uedaQ
         7iLE3APZNTrldUDctoHDM4z49KVY4DrPeLGzvnlfYcob14rK/vQJ5hvPmOLqfEKlgp4O
         3iRTvV3LdCPzWgMB9gIbNGJBJYselS8cGIU6EgjWvN36pVTFC0lAfbPOb2FlhEgvgT9b
         2LfHFLeRemFLz+GUWyh6NP65jwWwxKO4mpBY2ABCTSvSAYETrysJAsO0Sm8B2nDyQ3/e
         yIjj7hl0sRR2sfz7TNjsnL3ZEPqDtD3dVqeDw2SACaisNRKJbwvXoGq2cP63vmy020Gy
         okeA==
X-Gm-Message-State: AOAM5305Whiyo82ps0jUimv6MqXTFYOfc5VQ+4kutB1h20tO2RFM9S2d
        RAZvRgRM+gXuP7+CUp30kOZkSuFOmpL/qeKj5vCGhIx9sjp0y7KslfL6iyr/GcjyoupG8jfRnnA
        zBH8u63n5aI/l9vkV6ClV
X-Received: by 2002:ac8:7dcf:0:b0:2f1:fe8b:467a with SMTP id c15-20020ac87dcf000000b002f1fe8b467amr419245qte.275.1650200263922;
        Sun, 17 Apr 2022 05:57:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwBWBUto++2LNai0MzuJGRDIZtTFSoKrXibH0BRAXvYRyhc7gH/Fe4MVuDf8ga82pR/M8gpQ==
X-Received: by 2002:ac8:7dcf:0:b0:2f1:fe8b:467a with SMTP id c15-20020ac87dcf000000b002f1fe8b467amr419236qte.275.1650200263715;
        Sun, 17 Apr 2022 05:57:43 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id h5-20020ac85845000000b002edfd4b0503sm6321265qth.88.2022.04.17.05.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Apr 2022 05:57:43 -0700 (PDT)
Subject: Re: [PATCH] usb: gadget: tegra-xudc: clean up comments
To:     Joe Perches <joe@perches.com>, balbi@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, waynec@nvidia.com,
        rikard.falkeborn@gmail.com, zhangqilong3@huawei.com,
        jakobkoschel@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220416223921.2881719-1-trix@redhat.com>
 <817a2890f5483e9a4b51ff6cc3eaab966e4f0537.camel@perches.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <3b20d6f6-9eab-b1bd-3ff5-ed9efdba6639@redhat.com>
Date:   Sun, 17 Apr 2022 05:57:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <817a2890f5483e9a4b51ff6cc3eaab966e4f0537.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 4/16/22 5:36 PM, Joe Perches wrote:
> On Sat, 2022-04-16 at 18:39 -0400, Tom Rix wrote:
>> Spelling replacements
>> cancelled to canceled
> cancelled is a generally accepted variant.
>
> https://www.dictionary.com/browse/cancelled
>
>> endpiont to endpoint
> ok.
>
>> Compliance to Compliance
> huh?  a == a

I missspelled.. from below it is

Compliacne

>
>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/usb/gadget/udc/tegra-xudc.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
>> index d9c406bdb680..0aaf01e1551f 100644
>> --- a/drivers/usb/gadget/udc/tegra-xudc.c
>> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
>> @@ -1330,7 +1330,7 @@ static void squeeze_transfer_ring(struct tegra_xudc_ep *ep,
>>   	bool pcs;
>>   
>>   	/*
>> -	 * Clear out all the TRBs part of or after the cancelled request,
>> +	 * Clear out all the TRBs part of or after the canceled request,
>>   	 * and must correct trb cycle bit to the last un-enqueued state.
>>   	 */
>>   	while (trb != &ep->transfer_ring[ep->enq_ptr]) {
>> @@ -1343,11 +1343,11 @@ static void squeeze_transfer_ring(struct tegra_xudc_ep *ep,
>>   			trb = ep->transfer_ring;
>>   	}
>>   
>> -	/* Requests will be re-queued at the start of the cancelled request. */
>> +	/* Requests will be re-queued at the start of the canceled request. */
>>   	ep->enq_ptr = req->first_trb - ep->transfer_ring;
>>   	/*
>>   	 * Retrieve the correct cycle bit state from the first trb of
>> -	 * the cancelled request.
>> +	 * the canceled request.
>>   	 */
>>   	ep->pcs = pcs_enq;
>>   	ep->ring_full = false;
>> @@ -1434,7 +1434,7 @@ __tegra_xudc_ep_dequeue(struct tegra_xudc_ep *ep,
>>   		return 0;
>>   	}
>>   
>> -	/* Halt DMA for this endpiont. */
>> +	/* Halt DMA for this endpoint. */
>>   	if (ep_ctx_read_state(ep->context) == EP_STATE_RUNNING) {
>>   		ep_pause(xudc, ep->index);
>>   		ep_wait_for_inactive(xudc, ep->index);
>> @@ -3423,7 +3423,7 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
>>   	}
>>   
>>   	/*
>> -	 * Compliacne suite appears to be violating polling LFPS tBurst max
>> +	 * Compliance suite appears to be violating polling LFPS tBurst max
>>   	 * of 1.4us.  Send 1.45us instead.
>>   	 */
>>   	val = xudc_readl(xudc, SSPX_CORE_CNT32);
>


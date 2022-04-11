Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE3244FBB3F
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 13:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344766AbiDKLvZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 07:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344882AbiDKLvX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 07:51:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 44370D9B
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 04:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649677747;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C47F8Jf0+w7gVUhWNRSlQXSM6c8V9lKVzHcSZtA8aT0=;
        b=BOWRda3qMo3DvNfpioY0rlvydpLPkLNnqZsFO+iNIA6eRw0r5HreODBw0qU+VJuStQBymE
        5S3Ve1PmFN+iBJVim8YTDvbl/fqPs7QktlFStv7Jw3OGTwkFM5H/Jx7YiBllQ4WiaHkjz0
        1NWIALNHOhOxZAWgQt+55/aubT1lweU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-GmmTiiZ0OfmRjQIG4q-8JQ-1; Mon, 11 Apr 2022 07:49:06 -0400
X-MC-Unique: GmmTiiZ0OfmRjQIG4q-8JQ-1
Received: by mail-qv1-f72.google.com with SMTP id im8-20020a056214246800b00443d3d3956dso15423642qvb.22
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 04:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=C47F8Jf0+w7gVUhWNRSlQXSM6c8V9lKVzHcSZtA8aT0=;
        b=DQPB6mae5CBvc54rYC6PcVCp8PgoXmppDEWwmGcqmPrSmV4krKiS4y/ekc5C3EOFRh
         XW+uhF1Eta/m2b+hGEQQz7h4RAG4auLp0n/6dKcNZZleo9sW0A/nlvBCaYZePhhFJDh2
         RcpqjG7QMlt0vhHAc9K47CVMSS0R4gyNt1oL1a5PGl75GvirGL3oswrfPvrfcjCbvQbA
         vRtBu3u7JBT4ZVziqMtzPuNH7xNVyJyl3hYkrGSLCAspeUPlQ++leZM4Wm5AQz8Kj6Yk
         vjH+Mc1x4d+bp5mLyAebrDOA5XJPSKooU7av31IzePgT2y5iOBpldpEVovbpvFK3Z6g/
         EE9Q==
X-Gm-Message-State: AOAM530kvT66QEJEBO2Q6cNKG4pTW0KyhFW1kmg9txY0/QmGyQ/8bc5a
        SOkdMSC/B2/HbLRGs7XTd+uX1DsDF+uEedjFZ9t6OtMP+GEKs8bCUXrp6lXxeYSLRxMTt/YOsOG
        zv9ZXamANQMnbVyfeV7qJ
X-Received: by 2002:a05:620a:471e:b0:69c:2e29:7b4c with SMTP id bs30-20020a05620a471e00b0069c2e297b4cmr1110884qkb.65.1649677746249;
        Mon, 11 Apr 2022 04:49:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcqVRzfFf+DL9+gv5UvinGvDX/+g+sbF3Fgbqad296zbxs7VMoB+NJJ4/qusVtoIB9uMIObg==
X-Received: by 2002:a05:620a:471e:b0:69c:2e29:7b4c with SMTP id bs30-20020a05620a471e00b0069c2e297b4cmr1110871qkb.65.1649677746034;
        Mon, 11 Apr 2022 04:49:06 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id r123-20020ae9dd81000000b0069c362d5cb6sm138083qkf.105.2022.04.11.04.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 04:49:05 -0700 (PDT)
Subject: Re: [PATCH] usb: gadget: udc: clean up comments
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, joel@jms.id.au,
        andrew@aj.id.au, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        alcooperx@gmail.com, christophe.jaillet@wanadoo.fr,
        cai.huoqing@linux.dev, benh@kernel.crashing.org,
        neal_liu@aspeedtech.com, miles.chen@mediatek.com,
        balamanikandan.gunasundar@microchip.com, macpaul.lin@mediatek.com,
        s.shtylyov@omp.ru, jakobkoschel@gmail.com,
        stern@rowland.harvard.edu, quic_wcheng@quicinc.com,
        yashsri421@gmail.com, rdunlap@infradead.org,
        linux-geode@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org,
        bcm-kernel-feedback-list@broadcom.com
References: <20220410150828.1891123-1-trix@redhat.com>
 <YlQBgnjpkSurf9PZ@smile.fi.intel.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <ecd8609b-2c52-5fb8-7820-191559d76011@redhat.com>
Date:   Mon, 11 Apr 2022 04:49:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YlQBgnjpkSurf9PZ@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 4/11/22 3:22 AM, Andy Shevchenko wrote:
> On Sun, Apr 10, 2022 at 11:08:28AM -0400, Tom Rix wrote:
>> SPDX
>> *.h use /* */ style comments
>>
>> For double words, remove
>> with, also
>>
>> Spelling replacements
>> wayt to way
>> wakup to wakeup
>> Contrl to Control
>> cheks to checks
>> initiaization to initialization
>> dyanmic to dynamic
> Something really wrong with indentation above.
>
> ...
>
>>   drivers/usb/gadget/udc/amd5536udc.h       | 2 +-
>>   drivers/usb/gadget/udc/aspeed-vhub/core.c | 2 +-
>>   drivers/usb/gadget/udc/aspeed-vhub/ep0.c  | 2 +-
>>   drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 2 +-
>>   drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 4 ++--
>>   drivers/usb/gadget/udc/at91_udc.c         | 2 +-
>>   drivers/usb/gadget/udc/bdc/bdc_core.c     | 4 ++--
>>   drivers/usb/gadget/udc/core.c             | 4 ++--
>>   drivers/usb/gadget/udc/trace.h            | 2 +-
> I believe that Greg's bot asks to split on per-driver basis.
> OTOH I don't see anything that can be problematic if in one
> change. So, it's up to maintainers then.

Yes, whatever folks want. I can split these.

I have been cleaning up the comments in other areas and am trying to 
strike a balance between too big of a patch vs peppering with many 
single changes.

Tom

>
> ...
>
>> --- a/drivers/usb/gadget/udc/amd5536udc.h
>> +++ b/drivers/usb/gadget/udc/amd5536udc.h
>>    * amd5536.h -- header for AMD 5536 UDC high/full speed USB device controller
> At the same time you may drop the filename(s) from the file(s) as this very
> one shows why it's good not to have a filename inside file.
>


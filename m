Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89C654FBC90
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 14:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346369AbiDKM4o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 08:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346317AbiDKM4j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 08:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 05F952CE29
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649681648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/1ACZnv4dSvd+7MrAGFUMxiOskXRQlu4NrC+OOGZ4+w=;
        b=QB/xXUDsbSXdfjtJMmC8aC25UIgx3ADE6MsgEyjVAqyd6+lr6Ua0MKw7B0TB76rMCp2pwf
        y/VtSUVg5QWASEg6CXGeSH/I85GzCvwedfDGu042XCD0uHSUh1Ovk0V0roePW827HwAJfZ
        scPtxeC1oZcy625wIlJNQFyGojJFS6M=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-Ox4g1woKP3q7vKBwKBNUwQ-1; Mon, 11 Apr 2022 08:54:07 -0400
X-MC-Unique: Ox4g1woKP3q7vKBwKBNUwQ-1
Received: by mail-qv1-f69.google.com with SMTP id eq9-20020ad45969000000b0044444f71bb4so2377391qvb.3
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 05:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/1ACZnv4dSvd+7MrAGFUMxiOskXRQlu4NrC+OOGZ4+w=;
        b=uUGWR2e5Mtyow6t7KLdG3RhWQUMPat8TvgcD/QUb0m4AiumMu5LHv1Y4V54qxj9zEg
         MuXjZek4Nr3Ro4EXgEsZl3+7N8L/luKu7LCqkWIyYx9Vu1WqeInrDR2FN5iZ1ReiiLsh
         ZEA//SbozQSWljEZQAz84KlJ3/xzEouqDq1JNEGLYkZrkrcxCjTR+ZLQNELlBqff84mT
         QxUohlBMPLF8+03lQndy1Nmvt2/oPAmk2iM65HqK/CqrlKT+gj1Nia4kV7pQWgSiFm8m
         D7dJQ2p6uwnvnAZapzU1S/Uq2cI2xkLMNlR3GrigtSJ2THqXkOcWjywXldGDN5NvN/+f
         XZog==
X-Gm-Message-State: AOAM532oPpHvsthMy5WhafhdgkhiHZ65RxYHlfAXuKZ5KUDIiPE8Nrfd
        pDlclboBLGmrNC0Y1USYMI8/HLRdP2Koe2q/jSSkZkKYusrTfUjU+rgqOMJUQOomc7WWzbdULty
        fQFWp5w48iWcvKcTRoW3Q
X-Received: by 2002:a05:622a:c3:b0:2e3:4bd0:16c2 with SMTP id p3-20020a05622a00c300b002e34bd016c2mr25226572qtw.575.1649681647019;
        Mon, 11 Apr 2022 05:54:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIV5iyeYsK7wzpSCFV5IpaPDdchJGJP14JRpC3RjdeYl2PVrL9nHiY7ZV4YJ2cEFBR1V74hQ==
X-Received: by 2002:a05:622a:c3:b0:2e3:4bd0:16c2 with SMTP id p3-20020a05622a00c300b002e34bd016c2mr25226533qtw.575.1649681646673;
        Mon, 11 Apr 2022 05:54:06 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id x82-20020a376355000000b0069b971c58c1sm6531215qkb.60.2022.04.11.05.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 05:54:06 -0700 (PDT)
Subject: Re: [PATCH] usb: gadget: udc: clean up comments
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        balbi@kernel.org, joel@jms.id.au, andrew@aj.id.au,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, alcooperx@gmail.com,
        christophe.jaillet@wanadoo.fr, cai.huoqing@linux.dev,
        benh@kernel.crashing.org, neal_liu@aspeedtech.com,
        miles.chen@mediatek.com, balamanikandan.gunasundar@microchip.com,
        macpaul.lin@mediatek.com, s.shtylyov@omp.ru,
        jakobkoschel@gmail.com, stern@rowland.harvard.edu,
        quic_wcheng@quicinc.com, yashsri421@gmail.com,
        rdunlap@infradead.org, linux-geode@lists.infradead.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org,
        bcm-kernel-feedback-list@broadcom.com
References: <20220410150828.1891123-1-trix@redhat.com>
 <YlQBgnjpkSurf9PZ@smile.fi.intel.com>
 <ecd8609b-2c52-5fb8-7820-191559d76011@redhat.com>
 <YlQeEC41m3UeOeiE@kroah.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <2f22174f-8618-8f5a-6adf-3d2befa8450a@redhat.com>
Date:   Mon, 11 Apr 2022 05:54:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YlQeEC41m3UeOeiE@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 4/11/22 5:24 AM, Greg KH wrote:
> On Mon, Apr 11, 2022 at 04:49:00AM -0700, Tom Rix wrote:
>> On 4/11/22 3:22 AM, Andy Shevchenko wrote:
>>> On Sun, Apr 10, 2022 at 11:08:28AM -0400, Tom Rix wrote:
>>>> SPDX
>>>> *.h use /* */ style comments
>>>>
>>>> For double words, remove
>>>> with, also
>>>>
>>>> Spelling replacements
>>>> wayt to way
>>>> wakup to wakeup
>>>> Contrl to Control
>>>> cheks to checks
>>>> initiaization to initialization
>>>> dyanmic to dynamic
>>> Something really wrong with indentation above.
>>>
>>> ...
>>>
>>>>    drivers/usb/gadget/udc/amd5536udc.h       | 2 +-
>>>>    drivers/usb/gadget/udc/aspeed-vhub/core.c | 2 +-
>>>>    drivers/usb/gadget/udc/aspeed-vhub/ep0.c  | 2 +-
>>>>    drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 2 +-
>>>>    drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 4 ++--
>>>>    drivers/usb/gadget/udc/at91_udc.c         | 2 +-
>>>>    drivers/usb/gadget/udc/bdc/bdc_core.c     | 4 ++--
>>>>    drivers/usb/gadget/udc/core.c             | 4 ++--
>>>>    drivers/usb/gadget/udc/trace.h            | 2 +-
>>> I believe that Greg's bot asks to split on per-driver basis.
>>> OTOH I don't see anything that can be problematic if in one
>>> change. So, it's up to maintainers then.
>> Yes, whatever folks want. I can split these.
>>
>> I have been cleaning up the comments in other areas and am trying to strike
>> a balance between too big of a patch vs peppering with many single changes.
> Patch series are much easier to review and is just as simple to apply as
> a single patch, so that makes it overall better for you to do.

ok

Tom

>
> thanks,
>
> greg k-h
>


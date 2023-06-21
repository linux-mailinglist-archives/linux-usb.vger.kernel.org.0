Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38D677381CC
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 13:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbjFULIL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 07:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbjFULIK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 07:08:10 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023E1BC
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 04:08:10 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-98502b12fd4so168598866b.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 04:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687345688; x=1689937688;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qgwJh3nP4bBkQph3UskAxTkcRpVZYBo0dWwZIgtM8KY=;
        b=bYedRmc3kiDytbUcIgLIyAdsHC68pAlRf7ZSYoNNQfGadScxw0VkqO9+VDXcCIvRru
         0SmTsQvsVpeZEXAJUGTmblq+5LRPTOZnoeboPf5H1g3HKJHGi05lgC0u1LFaSM7IWLmA
         ANlGjrgPpjsvY9nsJ4MPJo8uB1Tur5Sjx+Qq73V3E3W9e+7OYDONXOb+XN11CuKlN0+Z
         qebknnwrO/WnAcZQGVg5gQFMQtjyM9RvigPiG0I/+/go4+2c4haHeNyspbA6APSczeNE
         DupHBqTZi2VSSHEnSZQ+0NblzifIhuvLq+aXnX8KfHQA2odo+RakQRcaklMLGCMQM3iO
         Jmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687345688; x=1689937688;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgwJh3nP4bBkQph3UskAxTkcRpVZYBo0dWwZIgtM8KY=;
        b=LbvSzY6FjYE0fVdHJt+SHWEhK1ins0b+R6zV2B28czKcnGcltxl6cHNpuQzY76Rt9V
         vk3O3iPvugZvUcmg430baKOE0SZWyJeuYjchHnmehm+r53wJnXnH0qV25epl1k9aP1p/
         ESIF3KxFvPShLfwFAgD6lieQudgF0L3vNQMUocom8AIcjgD/Hcua5a4n2p9u8dvy7g+s
         znM7MuP6UrRb3ZDFf4xfWmRpsY7oG/RMSFGsSFCH1Ulg/qr3NE8Kx+w00cboyEeepyQC
         8C+23fMJtwhe9E7MW74MBJQHmDNjKnjJIe8VyYIgupuJjOFPcj0+3PS8QeIimqM3sN+H
         x5rA==
X-Gm-Message-State: AC+VfDypFZaJ/P1+u01NLMXj+xfyRvwhp81sMdaHhy1x4JTdSGnZ/2kA
        QMc5U7/4dwWXEOhX3AXPTM4Rb4Mnin5acZhH
X-Google-Smtp-Source: ACHHUZ7qpfTFBuvx55onb2km4TM2Ie3uE3Rnom8YXeuzcAGGpGHnoQWxDf62pWPk2B8QbGUjw+oUXg==
X-Received: by 2002:a17:906:7793:b0:974:5de8:b5ce with SMTP id s19-20020a170906779300b009745de8b5cemr10665977ejm.2.1687345688197;
        Wed, 21 Jun 2023 04:08:08 -0700 (PDT)
Received: from [10.10.19.80] ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id fy25-20020a170906b7d900b00969f25b96basm2861156ejb.204.2023.06.21.04.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 04:08:07 -0700 (PDT)
Message-ID: <33236558-8987-0b84-bef0-613fec01f965@gmail.com>
Date:   Wed, 21 Jun 2023 15:08:07 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 6/6] USB: file.c: make usb class a static const structure
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20230620094412.508580-7-gregkh@linuxfoundation.org>
 <20230620094412.508580-12-gregkh@linuxfoundation.org>
 <2023062000-consuming-crusher-8a92@gregkh>
From:   Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <2023062000-consuming-crusher-8a92@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20.06.2023 18:22, Greg Kroah-Hartman wrote:
> Is this structure needed anymore at all now that the thing the kref was
> "protecting" is gone?  I think it can be dropped entirely, right?
> 
> thanks,
> 
> greg k-h

As I understood after reading the code, this kref is used for checking 
how many devices uses our class and testing when we can unregister it.

As we register our class only when the first device is registered, I 
think the best solution is to move this kref structure out of the 
usb_class structure as we still need it for detecting when we could 
finally unregister our class. What do you think about it?


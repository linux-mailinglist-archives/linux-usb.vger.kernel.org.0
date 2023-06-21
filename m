Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BABA738463
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 15:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbjFUNGk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 09:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbjFUNGj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 09:06:39 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875DE199C
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 06:06:38 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31114d47414so1316084f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687352797; x=1689944797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gTAxdFNz+1n6CVVb5l/ny1f2Lu2U7XtXZ6eLpgY62Uc=;
        b=FLHt89m0wrH7LFz477HzO4Dd+s6zYU53Eov0gCIhvZdXVjOMXNuN/0x9gdHpqOGEhq
         ApAI09bf4c2lfrTEzUS6/7bnveJMSHGPQn4hs3NhUeB2P07Vc6TPOnOd2JfOXpozicfs
         40IMfa9nRmeHZmB21olElU66KkdVLAbUtjz4IIxPq4oD9XH9C78Axaecpfh3XLNy78Yo
         ZNu2VsxOucQP5Ru/kosAuayudorHaksHBGhvCoqF8gfycYnCtdgwnU8VmdWl2lmU1c5M
         /z0HovPcccZTH3l9NY5eos3tA7xP6grxRBlA73pGXkzB6/K+se267zvS1yewTy4CqLnu
         Hq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687352797; x=1689944797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gTAxdFNz+1n6CVVb5l/ny1f2Lu2U7XtXZ6eLpgY62Uc=;
        b=CoU/9uhZkDQsAvkM+++faTW7tXLyTd8bPI6Dwr2rok1mSpdvJY4TCrt09Q4282I2h3
         oiMKg8GqIqb7pxqWvZpyzjyjDCmoE2oYWcM35hw2Q2RzEWEKuz2VinC8+GtjiXzOoPj7
         dUaT5Gw7hV1SWMpGQLkWVkhLhOvgmRUzIYrDmGOdkLU+FCZ30sck5MrvdpRXaQp7qdES
         yoSH3r6wUP+OA44do4J59ZoP1pRngEgCWNsPpwTjtuX0pzIcZm1gA5Kw67WjwLnbw8EW
         LjBW3G/RTjbF9uQ6t+AVFzCWaHPHUNVghRhinfeWqGa0giTErX7D3KWh+wHKmrwR6PEk
         s2sg==
X-Gm-Message-State: AC+VfDwx5ZTIaWCWrAP7ZAFVKjWwUViJSf0D5Qf85qVPMZl8fnEdsYQn
        hqF3U0RNrHZwaqRmABl9I/a1/MEAzS3H7DRW
X-Google-Smtp-Source: ACHHUZ5kulW/Dh8HYP2GWtndH6SU+hjKg/LUhgXc/N1LGVypp2zTgnnSm0FV96OR2sxlifeoSRy7oA==
X-Received: by 2002:adf:ec45:0:b0:2c7:1c72:699f with SMTP id w5-20020adfec45000000b002c71c72699fmr12867435wrn.4.1687352796632;
        Wed, 21 Jun 2023 06:06:36 -0700 (PDT)
Received: from [192.168.10.191] ([141.136.95.75])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d5442000000b0030789698eebsm4463876wrv.89.2023.06.21.06.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 06:06:36 -0700 (PDT)
Message-ID: <abc79c1b-f12e-50fc-5351-b62462125c57@gmail.com>
Date:   Wed, 21 Jun 2023 17:06:34 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] USB: file.c: make usb class a static const structure
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <20230620094412.508580-7-gregkh@linuxfoundation.org>
 <20230620094412.508580-12-gregkh@linuxfoundation.org>
 <2023062000-consuming-crusher-8a92@gregkh>
 <33236558-8987-0b84-bef0-613fec01f965@gmail.com>
 <2023062111-uptown-unpack-0fb1@gregkh>
From:   Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <2023062111-uptown-unpack-0fb1@gregkh>
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

On 6/21/23 16:48, Greg Kroah-Hartman wrote:
> I think we should make it simpler, allocate the class when we start up,
> and free it when we shut down, which guarantees that all users of the
> class are removed at that time as this is part of the usb core code.
> 
> No need to be fancy anymore with the dynamic creation/removal of the
> class, it's just not worth it :)
> 
> thanks,
> 
> greg k-h

Alright, it sounds really reasonable, let's do it in this way :)

I'll add init_usb_class call to the 'usb_init' function and the 
corresponding releasing function call to the 'usb_exit' function in the 
'drivers/usb/core/usb.c' file. So we would register class at startup and 
unregister it when shutting down.


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB8C62271A
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 10:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiKIJer (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 04:34:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiKIJeq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 04:34:46 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4BD9FDE
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 01:34:44 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso1286169pjg.5
        for <linux-usb@vger.kernel.org>; Wed, 09 Nov 2022 01:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WFSSdVklwFsT0FnXDKy+AASSNrfWR6TVw+PL7Udgr8I=;
        b=FfFAHzQ9kGO9EYb6Y1yvgno3odA/iXwfY5iTYNiCNhqtwNyONZJNwtoLGp9NgfnJ0o
         iP1aTTnltSabyWjBceWx0n5yajHNzyOAVqj+BWceR8CRREmQO2OClEuJdbrXoQ2jK+sk
         xBn03dPJ+hyeFSoFdpcfrKw7fuDcJjzl/C7aSuq/FcNnlUrPZzQOjnFnQmxK94lqSkAC
         zeLEKPGAG3E4wkVoXLim6Gmqb1RuOEEaPAR3MfJdnN9S1C4GpMWSBhQsOT44KF4v1wRZ
         jx/Xm/zGFxqk3Y3EyeGzBu0fjuOizHOAOttIw9ILueB90+jKHA6aX34MLxW8r9BmmZTQ
         c/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WFSSdVklwFsT0FnXDKy+AASSNrfWR6TVw+PL7Udgr8I=;
        b=eVdvuOxeYBHMOqukNh8IgtX9v9W25nfpMyyxMc8oENawKPOypOr2bCNgHhuCGVqJg5
         mCHDpjIhG1bfLSntejOJKKrV/8VG5ak81Jpb5PCcV3jPpFCPUFDdnrBfA7BNw8rhSv02
         zvM6IH4hscD+Q5sOj62vm6K3ojJK1c3HpDE7fTVB9jbZ+odFu6wfOWloVvF+uAYj2Yry
         F8hh4wuSqps0mD9ZBND7aefxQW33XzqSR0FeQS0xehhwYIRhMTU7wIsTJ7Uv2Vut+8lG
         GnfrONvj8UxgwSd/4X5NVssCfrakPL0MTL8VLu49RQs0ZvLEy3Nr9pt5PA+NLd+2g1ZT
         EKaQ==
X-Gm-Message-State: ACrzQf100rZRIkU6tbMO9JykjkEWNVaGraP/aiXTgeLsA+XxhdAtlIiw
        Vk7S6xf/xOs1Y5p7uCzs0EU=
X-Google-Smtp-Source: AMsMyM4YYZd/ju+yCuQ8DrTc1ydRXjgatYZ0xJ8zU0weMTcjWSxeGPsCKHj4An/VKI8U6QqSoSBvXA==
X-Received: by 2002:a17:902:aa01:b0:187:2e5a:5bcf with SMTP id be1-20020a170902aa0100b001872e5a5bcfmr45983308plb.63.1667986483805;
        Wed, 09 Nov 2022 01:34:43 -0800 (PST)
Received: from [192.168.1.5] ([61.7.181.142])
        by smtp.googlemail.com with ESMTPSA id i36-20020a635864000000b00464aa9ea6fasm7118396pgm.20.2022.11.09.01.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 01:34:43 -0800 (PST)
Message-ID: <6572c4e6-d8bc-b8d3-4396-d879e4e76338@gmail.com>
Date:   Wed, 9 Nov 2022 16:34:35 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 1/3] USB: serial: option: remove old LARA-R6 PID
Content-Language: en-US
To:     Davide Tronchin <davide.tronchin.94@gmail.com>, johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marco.demarco@posteo.net, cesare.marzano@gmail.com
References: <Y1qRkuOghwRCGZIT@hovoldconsulting.com>
 <20221108163001.18454-1-davide.tronchin.94@gmail.com>
From:   Lars Melin <larsm17@gmail.com>
In-Reply-To: <20221108163001.18454-1-davide.tronchin.94@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/8/2022 23:29, Davide Tronchin wrote:

> The LARA-R6 module old PID (defined as: UBLOX_PRODUCT_R6XX
> 0x90fa) has been removed since is no longer used by the
> current u-blox LARA-R6 product.

UBlox is not the only company reselling these dongles/cards, a quick 
google of "vid_05c6&pid_90fa&mi_00" shows that another two resellers has 
Win drivers for it, GosuncnWelink and Meig.
You are now removing the linux driver support that a customer
of them currently have.

If you are a UBlox employee/representative then I suggest that you tell 
UBlox that reselling dongles/cards with Qualcomms vid:pid is a bad idea. 
Qualcomm can provide UBlox with software to personalize the product with 
UBlox own vid:pid.


thanks
/Lars


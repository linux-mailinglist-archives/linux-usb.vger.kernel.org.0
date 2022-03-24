Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07784E6966
	for <lists+linux-usb@lfdr.de>; Thu, 24 Mar 2022 20:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346712AbiCXTkR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Mar 2022 15:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239779AbiCXTkQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Mar 2022 15:40:16 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435FB20182
        for <linux-usb@vger.kernel.org>; Thu, 24 Mar 2022 12:38:43 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id lr4so2817055ejb.11
        for <linux-usb@vger.kernel.org>; Thu, 24 Mar 2022 12:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JsC1ljWQ7PaTxrkJOFLNJfWF+WnCziDIYzUHRZWy+Ko=;
        b=fP/2Gp9Fli8rKY53x0KQ6VK5CryYZPCdLOr4PgkyqSjuyklJcEAf/zwLmZypNMjpVd
         i9l71LLgC3cb7adqtq4BbPc2chJyBHEzU1lw26/EOMJo8kL8T2mJfJ3gaKV3PV+q7xjL
         m2/JoNZFo6NFjy3X9QNOvNIsRNA53XBZZMFCtKAc4UeeZO8XB7R1bc9pLV7qZ+Me8twH
         ai9Q4o/vJ8ZYz5X5INdNBxRaEc68FqieSva9+YZ2HQu+Naqz+8ZT5Pj7eOtQepxfcdME
         je1ZfjBspNFYhi76QLMzs4YmFJ/K3cPgeFQSXdf08au73PZc1APfp1WGOD98bpuRi3iM
         hz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JsC1ljWQ7PaTxrkJOFLNJfWF+WnCziDIYzUHRZWy+Ko=;
        b=Shxtw1CCS6UH4O3kaOh3Jc0gKu07+XbD/RqVS1FMpRyeuZBOYd7X8O0okZ6kxrgo2Q
         18139vGmmpncnUWQ4YsxFUDjvfU150mUB//SGHQGYHgjrWdqm2UGai0ieGd2aJKmJBdN
         3ugpyr2VwsS67wh+bqQNxZorAc/4iN6ixnj2PJzq0YcrH4wff3+OtEjkstxwjVBWxYgS
         pYSu2vkXKIxNWPvnC8UTsOyBO1hQ5Ti1PtbCdVyd8zjJZP2x2POT41PUSwEpi9dvtiox
         4o51L7FPtxGJOdZFt/COSMkO2fyCvzR84+AUdfdgI0KrhC74J8H9bd3xtSz3CB1IXBsC
         XptQ==
X-Gm-Message-State: AOAM533TXxfVCwXmzdnXH1JcnBrL15vGqkflacqW66Lb18wCYymab9Yv
        TwgszJK6SQ70SInToZbgwuE=
X-Google-Smtp-Source: ABdhPJxvdkXfoQh474U14neRpshTh8VhbYLeeo+iE+AqbZs1MHO6EKV8GAK/ZSuYwKUOZ0nAsIinnA==
X-Received: by 2002:a17:906:4fc3:b0:6e0:66a5:d59c with SMTP id i3-20020a1709064fc300b006e066a5d59cmr7364347ejw.131.1648150721627;
        Thu, 24 Mar 2022 12:38:41 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6f59:e300:1c54:60b6:3fbf:1a8e? (dynamic-2a01-0c22-6f59-e300-1c54-60b6-3fbf-1a8e.c22.pool.telefonica.de. [2a01:c22:6f59:e300:1c54:60b6:3fbf:1a8e])
        by smtp.googlemail.com with ESMTPSA id r11-20020aa7cfcb000000b0041902ac4c6asm1791177edy.1.2022.03.24.12.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Mar 2022 12:38:40 -0700 (PDT)
Message-ID: <73b6b3aa-b38e-bf28-59e0-7c58afaadf9d@gmail.com>
Date:   Thu, 24 Mar 2022 20:38:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/5] usb: host: xhci-plat: omit shared hcd if either of
 the root hubs has no ports
Content-Language: en-US
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
 <cd18385f-cc94-45fc-4a39-60e05dd6031e@linux.intel.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <cd18385f-cc94-45fc-4a39-60e05dd6031e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.03.2022 10:23, Mathias Nyman wrote:
> On 17.3.2022 0.08, Heiner Kallweit wrote:
>> I have a system with a low-cost Amlogic S905W SoC that supports USB3
>> but has a USB3 root hub with no ports. This results in an error
>> message and a hcd that is good for nothing. The USB2 root hub has
>> ports and works normally.
>> I think we can do better and omit creating a shared hcd if either of
>> the root hubs has no ports. This series is based on discussion [0].
>>
>> The series works as intended for me. What I couldn't test is the case
>> of the USB2 root hub having no ports.
>>
>> Follow-up to this series could be applying the xhci-plat extension
>> to other xhci drivers.
>>
> 
> Thanks,
> Patches look good but something must have changed since you submitted them.
> I can't apply them neatly on usb-next, usb-linus, 5.17, or 5.17-rc8
> 
> 
> On top of usb-next I get:
> Applying: usb: host: xhci-plat: create shared hcd after having added main hcd
> error: patch failed: drivers/usb/host/xhci-plat.c:313
> error: drivers/usb/host/xhci-plat.c: patch does not apply
> Patch failed at 0003 usb: host: xhci-plat: create shared hcd after having added main hcd
> 
The series was based on linux-next. Seems you're missing 8e10548f7f48
("Revert "usb: host: xhci: mvebu: make USB 3.0 PHY optional for Armada 3720"").

> -Mathias

Heiner

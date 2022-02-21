Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C15B84BDE3F
	for <lists+linux-usb@lfdr.de>; Mon, 21 Feb 2022 18:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358816AbiBUNQP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Feb 2022 08:16:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358753AbiBUNQO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Feb 2022 08:16:14 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0021EED2
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 05:15:50 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 998F33F1E6
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645449348;
        bh=Es9XoqDzc+XWo5HeKssQ2Qd3khvL/eUQQBYKpuxtUzw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=feW+INuwh1XsMiP9jpL20uOwUNwZtKCZdZhKvciIQ7kC7ePtr4nX7+np7FV68JBbm
         kageVBT6EoBFw4B0b93XKKXd0zYJh79Aqc86zulnWZ3YdUO51QP8rbztADszlmGYsP
         ExebJlkYVthXOKxZFMd9krK0BsXyMJ1rQn2Wy12Qj5NNKdKm23KmJHf5fcBEnQTfW7
         6h/F8sADHC4rK4q36LuLwwJ/Y7i2+6UcLzMm+5YkCetoCkoR4fIkp3xPUPHgSMPED8
         bo3dyvaP6yPHYVv1JBfYDlFnYN9TNw7Bn5uS7/EE2SoZpr86E9FYi/2otBD3dgwGmB
         LvUZSJgw6g0bw==
Received: by mail-ed1-f70.google.com with SMTP id g5-20020a056402090500b0040f28e1da47so10159017edz.8
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 05:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Es9XoqDzc+XWo5HeKssQ2Qd3khvL/eUQQBYKpuxtUzw=;
        b=ZAEatdl3JFbyzcyGAWgPFjRNvoTgq9b29AGMXsrf/AcXsjUU8/bpR8/H09+UhWG9Sc
         qNXCSQt8YjLSW8IZaML0n53nSTpzYPGhtxGO2xNNWyf8xiNYMNrZQK8Dgh3AceVY0qpT
         ReKDn9BQ4PDMvEFHy3Cl458c+aV1u+D3PMi2/iznZAibAed1zxEzYXXRIjtkVYuu7M9Z
         6AS5AH0Vah+ejUGGDfM2MMzkfwViFUGVxzJxYwBg3a5D0SJU6S0OcSSy2ZzbEn4f88hI
         EWV8S8lJ7Mxeh8NWcM6xFeBfJbzlsmYhbQ/H7krGxMpi9LX6aJYCNsyX2mIUecrepEJL
         dC2g==
X-Gm-Message-State: AOAM530pen2EKbpP/ui83GW8xgAcV1aPhpe8d8/6TjuNAmH7J/DjKqAb
        htOm24Y90SMrbjf++J234xuBEJOXdkZfcm/PUT1MD21pHJHE3tC+bhKHUK8jQujZKVFts7H4RAo
        uFZCoKnUnkTNl3HUg1kS1tGW1JCElCwqKW4xicw==
X-Received: by 2002:a17:906:280b:b0:6ce:f3c7:688f with SMTP id r11-20020a170906280b00b006cef3c7688fmr15562640ejc.468.1645449347889;
        Mon, 21 Feb 2022 05:15:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuy81icsVEjaCaH7G2+WD5zYXLkCxa7+Jwo5rHs+bQ/goVg3qMuL4OpMFfXLgQ1wYmm3LjPA==
X-Received: by 2002:a17:906:280b:b0:6ce:f3c7:688f with SMTP id r11-20020a170906280b00b006cef3c7688fmr15562624ejc.468.1645449347695;
        Mon, 21 Feb 2022 05:15:47 -0800 (PST)
Received: from [192.168.0.122] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id 17sm5098684eja.57.2022.02.21.05.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 05:15:47 -0800 (PST)
Message-ID: <7448b9b3-78f9-6f33-ae8d-d099bc64abe4@canonical.com>
Date:   Mon, 21 Feb 2022 14:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: update Roger Quadros email
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>, Roger Quadros <rogerq@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
References: <20220221100701.48593-1-krzysztof.kozlowski@canonical.com>
 <2e33c00b-8460-3d85-92aa-2c3257725c2c@kernel.org>
 <YhOIHARSdIliVWjW@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YhOIHARSdIliVWjW@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21/02/2022 13:39, Lee Jones wrote:
> On Mon, 21 Feb 2022, Roger Quadros wrote:
> 
>> On 21/02/2022 12:07, Krzysztof Kozlowski wrote:
>>> Emails to Roger Quadros TI account bounce with:
>>>   550 Invalid recipient <rogerq@ti.com> (#5.1.1)
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>
>> Thanks so much!
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> 
> I assume you mean Acked-by (if you are the maintainer) or Reviewed-by?
> 
>>> ---
>>>
>>> Roger,
>>> You should also add a mailmap entry for your inactive emails.
>>
>> OK. I will send out a patch for this. Thanks for the hint. :)
>>
>>> ---
>>>  .../devicetree/bindings/mfd/ti,j721e-system-controller.yaml     | 2 +-
>>>  Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml         | 2 +-
>>>  Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml         | 2 +-
>>>  Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml     | 2 +-
>>>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> What's the merge-plan for this Krzysztof?

First-in-first-served? :) or Rob?
It's a small change and I think non-controversial, so whoever could pick
it up first, should do it.

Best regards,
Krzysztof

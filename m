Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55463662F73
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 19:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbjAISqm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 13:46:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234251AbjAISqk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 13:46:40 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F0A19C23
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 10:46:39 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id ay40so6974634wmb.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Jan 2023 10:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ryYeof+OnTJkbTULSprBr4AoCSxqK4qFss+JGLsx80U=;
        b=wSfxtYUUzxGBncWxkFa/2vTAsXeNJj0rj+FowRo7KAOkSud9BpogV0/U3pBs1nCi06
         1wUb3i+I0z+5YPxiBI+vQOyGQenuy11Twz17GhwhXG3By+5SQiRSopTnW4zmNYLjA0nl
         R4FuE12VZazAurC+ZalkVGh5Ejm+Xw7cHEirIR8IGC9hScWtymG/rnnQG18ye4bJKDpV
         n9UJ82nWb4EkgKRiYbj5/UNcQrxac7VQs+J+37cm/q0tYWgIhLhIDnpVhigTs94tcwCj
         BKXJvgQK5g2vZmckC0yaaJcCOn4Akbd1JeldGqymuoigYz0zl0J+5RlKsMdz7g78TCzp
         r0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ryYeof+OnTJkbTULSprBr4AoCSxqK4qFss+JGLsx80U=;
        b=xUe+QDmeyTsRbNwc19f+u6NWFxOqTpymzlnnXPdEQ4+2kmzJldngRld+XU3je6wrez
         YahkHV0gyk6hlsCLq33Al7298r05VyEd4YpjXu1J/CX57xin001mkLxxakgusXvw4Za0
         eW8LClDAssIoVeq9cfv7iBKx3JxreLgJ0D44dcxmGs3yNL0G5e//vg27PDFbMVMemoYs
         Z/7pAqVhNp9lH/RCzboEB9a/NreHvAku0PpyhqMY9vtelgzLf07+yOSxDG/BqgGj9+CI
         TR1T1T/MTjYk5oYAevLt6wAn3PHailJsoV6h2q3Fj0flTqwJo7uU0g3xVaUosjmXRLK1
         I4yQ==
X-Gm-Message-State: AFqh2kqaKl9VoQRwxOhYKe6YxxAvcjL7hTw0IL57HpDJR/B/DjdOC2f8
        b5Ud/s5+HpXjrdSfoL8GHpy5gA==
X-Google-Smtp-Source: AMrXdXvO/d7RLU5wZZgySN5QAdoZ6t6S+IeacfwC7pCnKdTpjpVTQk3Drj8MCGo0KedoGjneH3ObsQ==
X-Received: by 2002:a05:600c:1c11:b0:3d1:e583:51a0 with SMTP id j17-20020a05600c1c1100b003d1e58351a0mr48945787wms.25.1673289997815;
        Mon, 09 Jan 2023 10:46:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003c6b7f5567csm26127542wmo.0.2023.01.09.10.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 10:46:37 -0800 (PST)
Message-ID: <101fbe16-69f0-d0c1-168a-1e267e22289d@linaro.org>
Date:   Mon, 9 Jan 2023 19:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V5 1/6] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host
 controller binding
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        waynec@nvidia.com, Thierry Reding <treding@nvidia.com>
References: <20230106152858.49574-1-jonathanh@nvidia.com>
 <20230106152858.49574-2-jonathanh@nvidia.com>
 <b1485d8a-71ea-7b75-74ab-77eef595ae10@linaro.org>
 <73bfb6ca-663e-b73c-b9a1-4727ae7217d1@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <73bfb6ca-663e-b73c-b9a1-4727ae7217d1@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09/01/2023 18:00, Jon Hunter wrote:
> 
> On 08/01/2023 15:21, Krzysztof Kozlowski wrote:
> 
> ...
> 
>> On 06/01/2023 16:28, Jon Hunter wrote:
>>> +  phys:
>>> +    minItems: 1
>>> +    maxItems: 8
>>> +
>>> +  phy-names:
>>> +    minItems: 1
>>> +    maxItems: 8
>>> +    items:
>>> +      enum:
>>> +        - usb2-0
>>> +        - usb2-1
>>> +        - usb2-2
>>> +        - usb2-3
>>> +        - usb3-0
>>> +        - usb3-1
>>> +        - usb3-2
>>> +        - usb3-3
>>
>> Why do you have so many optional phys? In what case you would put there
>> usb2-0 and usb3-3 together? Or even 8 phys at the same time? IOW, what
>> are the differences between them and why one controller would be
>> connected once to usb3-2 and once to usb3-3 phy? And once to both?
> 
> 
> Here is the description from the device documentation ...
> 
> "The NVIDIA Orin series System-on-Chip (SoC) has one xHCI host 
> controller and one USB 3.2 Gen1 x1 device controller. The two 
> controllers control a total of up to eight exposed ports. There are up 
> to four USB 2.0 ports and up to four USB 3.2 Gen1 x1 ports."
> 
> So there are eight phys and we could have 4 USB2 and 4 USB3. Depending 
> on which pins you want to use, you could have various combinations. I 
> can add these details to the binding doc if that helps.	

Yeah, could solve some questions.

Best regards,
Krzysztof


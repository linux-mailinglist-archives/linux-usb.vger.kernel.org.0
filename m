Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30DD96C0606
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 23:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjCSWcL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 18:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjCSWcJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 18:32:09 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57141631E
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 15:32:07 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id i9so8738286wrp.3
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 15:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679265126;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fohqGcHXJxV4OWB96+iPZX24oSGOImwXoZzdgKcxYbA=;
        b=oJDSyzTDL9K5tMgpjKbldsRlri8RTOqyjjZATADTdtWaw6oQBmcVjsAHS3D9CoEiOy
         LrLaZMTvF/3XPLCpRvMRGEsl+xEA+DyC3frPnzAr5iJzFjTZ7s+kfZVlZ50DOboTxARK
         Vww53pOimMRjKHSEY/0ITGe0sDXLrd6+IbyhB06i4qg23klCrEh3s0nV3HS08eFcDJbS
         Ghygmnx9X6TLA9rQ9NjAwCmNZGPD+Lw/AJwb/VgScMrX8CoHxAQHt/51FymxiQ+J0NjO
         HPCq0+WoYH615RJmI0QWy92APkZaazOHaMCUSIZelLTHzHHzcoiqw7POLXsRKeewP3mF
         /2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679265126;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fohqGcHXJxV4OWB96+iPZX24oSGOImwXoZzdgKcxYbA=;
        b=wuDbspe+Tjnmhgq3Nhvuuv9ztLROmWHjJywZksN0iSMQfCYC9DNyNeI14e/T82ircS
         OLAnHDRd1FZsWXnTyaKEKbksI7Ba2FKYCIoZf+Gffm7BWwM3uOj7Pv4hTWmwdgaVdfuy
         0FiqJCQivibeH1Jd6eRW9xWoxNcq/m55rRkQM70sBuAUld88U+YbejwgisVyZ17P6xhn
         I8ovtKoyrTQ3eisKfW3GZ0XjUPKa1/6EeLE8lRiSq8zbohThapAayn16EhS9WQUpA9/g
         1FjudLMSmErcwyqWtS3hGUiRDFmA6Duq4NzJTVS5SzvL24qys5Y6OwrC0cQ5L2rK+Tlq
         AnIQ==
X-Gm-Message-State: AO0yUKXJNhsTJ2Ff0CMWOV7OYWEA1HJsE9u66S4Y0G8pZX77dJMnNpNU
        zMLmuUL+Oi5goelHL5V3bkEsMQ==
X-Google-Smtp-Source: AK7set/t9OHwOuBXjXm73Rue333WtHHPoZX5P4YAE1iEt6CP26hTl1d/NnFGyPOSCCTSdSw93F8hZg==
X-Received: by 2002:adf:dd85:0:b0:2c8:e09:9335 with SMTP id x5-20020adfdd85000000b002c80e099335mr11891458wrl.46.1679265126138;
        Sun, 19 Mar 2023 15:32:06 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b5-20020adfee85000000b002c573778432sm7359863wro.102.2023.03.19.15.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 15:32:05 -0700 (PDT)
Message-ID: <deee073d-0f84-eb64-3485-fb4a9418c2f5@linaro.org>
Date:   Sun, 19 Mar 2023 22:32:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 09/18] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML
 schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-10-bryan.odonoghue@linaro.org>
 <7cd51a8d-7b23-7895-7c06-07dc98924931@linaro.org>
 <a4da1f8f-333e-9ded-d784-7f86c45c7156@linaro.org>
 <346ecd20-d64f-1d47-4860-861e142f9700@linaro.org>
 <aa5d1492-906f-9e30-8f97-6321db692c73@linaro.org>
 <c5ac0d15-4651-318e-4dd2-37b2f90b2ba0@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c5ac0d15-4651-318e-4dd2-37b2f90b2ba0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/03/2023 17:50, Krzysztof Kozlowski wrote:
>> So this comment from Rob is what I was aiming for
>>
>> "Your other option is instantiate your own device from the virtual
>> driver's initcall based on presence of the 2 nodes above. "
>>
>> rather than two mush the pdphy and typec into one device, which they are
>> not.
> Sure, but you did not instantiate anything based on these two or one
> nodes. You added virtual device node.

Yes true, but I see the distinction you are making.

> 
>> I guess what I'm trying to understand is how you guys would suggest that
>> is actually done.
> You have there already node for the PMIC USB Type-C, so this should be
> part of it. I really do not understand why this is separate device lying
> around in parallel like:
> 
> pmic {
> 	usb {
> 	};
> };
> 
> virtual- pmic-tcpm {
> };
> 
> What hardware piece does such description represent?
> 

None, yes its a "HLOS" convenience, I take your point.

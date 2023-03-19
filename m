Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FEA6C02E9
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 16:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjCSPuS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 11:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjCSPuQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 11:50:16 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCDC17CC6
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 08:50:15 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso7766538wmb.0
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679241013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X4czx9tA1HUqBAlDkv/jkPT3tRpMiU0R2k2/njPI7W0=;
        b=ltG9twIe84qt1LrDyZRz60XRnLpY52hVYiqIYG0NxPm750D+cckOV5oWloJa7gYg1k
         GDkJgLtMBMNGeuRQZfLyBHaXfk2golI5UTeToSMxqbp2btTGZNoqFenOnXryDCln3qMo
         vTg+fHIFI9uo5MNRttUHbZraATzo5+zcaChY/8cuMCG5EJK6rbE9obiDOwy5qa+zzY7N
         WcpWutnoToxfmdKwOIj1gzR3QvetJZ/nxoMrT6Z+lLPdF/r8aFhq0ochzxa2+kHzR77N
         2SxDjzzQO89wcsjF9zT6AEN9Z/tn7edfAmv+ih9l7UgPdOk3n1b6y8y4M0z31y464nGe
         /VQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679241013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4czx9tA1HUqBAlDkv/jkPT3tRpMiU0R2k2/njPI7W0=;
        b=lWSDrsO1Ea2mjlEXQ1QeF1k8yFQkyv8sZV3V0BGa1q3PB7U4NhfHflixSGnbzj/1Ov
         xld5trUddqZ92nMQG43TZV0hBb8nH/qakvaGa/AN4bopIZHSGDiPJbOJHdmcHkh9fxwG
         gXAGdytXuynfB4FuUhK5iutu8xPa0GkzpT9UHqErjFllpxp3gaRe2FcWcOtlYyzro2/k
         FCapnneam7FN4sv9cUNZgnEfaYAM52X1ve1y8PkEBPCtIG/m+RDLjVUcavvRvCOckvvz
         q/EVk2TpH1nlH1G0jPdOhqukHRfT2BL+rEWRe2dUEV6JWif/1jgWcKAd1O0KYX5r0yOi
         E2tQ==
X-Gm-Message-State: AO0yUKXlgXwI88d7hyxOcUVgW3nS65jjnmi+ghDFIrPlp6CP11JhNwbL
        cFMJsvB9ZwzUtfMuCxmTmev3Lg==
X-Google-Smtp-Source: AK7set9TKTKEV3DmvG0D6ZMt/puh1YRthWJQDtQYNEiGq1Qd41PTZLtWwokVjNY9kmJisUsEnL6+dQ==
X-Received: by 2002:a05:600c:46ca:b0:3ed:4818:be62 with SMTP id q10-20020a05600c46ca00b003ed4818be62mr12694036wmo.34.1679241013538;
        Sun, 19 Mar 2023 08:50:13 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w16-20020a05600c475000b003edc9a5f98asm3323053wmo.44.2023.03.19.08.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 08:50:13 -0700 (PDT)
Message-ID: <115e84d3-e21e-1c21-2fc1-b3f2eef640eb@linaro.org>
Date:   Sun, 19 Mar 2023 15:50:12 +0000
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
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <346ecd20-d64f-1d47-4860-861e142f9700@linaro.org>
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

On 19/03/2023 15:10, Krzysztof Kozlowski wrote:
> What is tcpm? Linux driver? Then not. You cannot have device nodes for a
> Linux driver.

Hmm. Well, actually I'll just - concatonate these into one node but, it 
will have to be called something like "typec" and encompass both 
hardware blocks.

I'll try to make the name of that make sense.

---
bod

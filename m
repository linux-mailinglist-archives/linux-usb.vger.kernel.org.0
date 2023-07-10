Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 085E574D325
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jul 2023 12:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbjGJKR0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jul 2023 06:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233340AbjGJKRH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jul 2023 06:17:07 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831FF198
        for <linux-usb@vger.kernel.org>; Mon, 10 Jul 2023 03:17:06 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b6f0508f54so64798461fa.3
        for <linux-usb@vger.kernel.org>; Mon, 10 Jul 2023 03:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688984225; x=1691576225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i4Yt6jByRQ8UFPjX+QYfSMRSiYEbxoGiK3g/FogftK4=;
        b=G/7a8B9oypDnplk+bFg+3MgAW/haXS8YLKQrYfcxBf9zakdsQfp+hWaBPtjqYtt/6p
         Q0htW6PGzDMFw4pLOOa0K+Z+r/djCYtb5Xl/1CWrNxzmXszjKs2VdjiuDfCLbXlTAAF9
         hZWC21BFQ6tLs+4awGemf8HeOd9+90XXhe6fziqxj+ia3/WQ2oBXtRFfpSfwN/pKs2JI
         x4OfqczhvqSejdWFr0PCb1fGeCF05sZAwoO/aJVUHCwKovCpsC73u4QxpM7n8OWcroyY
         rkuZFMMsMbwMJTsLP6QrKtURxPQ+dQHXh7VVrzOfmIJ0bBXg8I8WcjJ5AilpNtCqXTbF
         F+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688984225; x=1691576225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i4Yt6jByRQ8UFPjX+QYfSMRSiYEbxoGiK3g/FogftK4=;
        b=ZkljbgDTIZn64omY2ja0hvf50BuUiccOjF3VpalFy3BHvk5PIzWow6AWU5M1wZw6kX
         GJKURyoCVEDaohI5ZuZjpKRwmVMmfGlhnFB7QZ8tgUgZRnXKHMPgbgNLUh3wytjCZ9Rc
         U8FBQievewNLTujD1RSjpepYDhWRp/LH9tEJc3IdFCkciCoB40Oyojk0Z0iA/SGiK51Z
         4KIPu3SfOrkhXv7Bl/R7lLFjsiPfoREx7pfbJg4LCxMgd9cqt5lqTsupO0YYBtRrbFuy
         g0lrMPWVEZuMcqcfUF/3RHOi+EJkPZCsYIpSLkr3WUFjwD1mC8d86tySMyzNdaNbCagH
         Ny3Q==
X-Gm-Message-State: ABy/qLaJXohJtJ/Ify6w+KALKHDYuAuuD6b033YVJLVnrJeFx9q2CieH
        YbnFhIJ/M1DSTRwCrOMQPlrwhuf2/kFEX70jc3haQQ==
X-Google-Smtp-Source: APBJJlGcqkp5rqwlLnxdIkdWpmebSjbzBOnq/8Gzu2xJq62n8aShR/Rwsgt6EBSo80iaOQjXU74kqA==
X-Received: by 2002:a2e:b781:0:b0:2b7:7b9:4767 with SMTP id n1-20020a2eb781000000b002b707b94767mr8820763ljo.41.1688983473701;
        Mon, 10 Jul 2023 03:04:33 -0700 (PDT)
Received: from [192.168.1.101] (abxj141.neoplus.adsl.tpnet.pl. [83.9.3.141])
        by smtp.gmail.com with ESMTPSA id p1-20020a2ea401000000b002b6c92fa161sm1866277ljn.61.2023.07.10.03.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 03:04:33 -0700 (PDT)
Message-ID: <74aa7196-e76c-a1c8-9b0f-1d5f236d3467@linaro.org>
Date:   Mon, 10 Jul 2023 12:04:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] usb: typec: qcom-pmic-typec: register drm_bridge
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230709201309.274306-1-dmitry.baryshkov@linaro.org>
 <20230709201309.274306-3-dmitry.baryshkov@linaro.org>
 <0408a6f6-356e-af6a-3e32-1781aec2854f@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <0408a6f6-356e-af6a-3e32-1781aec2854f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10.07.2023 12:02, Bryan O'Donoghue wrote:
> On 09/07/2023 21:13, Dmitry Baryshkov wrote:
>> The current approach to handling DP on bridge-enabled platforms requires
>> a chain of DP bridges up to the USB-C connector. Register a last DRM
>> bridge for such chain.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/usb/typec/tcpm/Kconfig                |  1 +
>>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 39 +++++++++++++++++++
>>   2 files changed, 40 insertions(+)
>>
>> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
>> index 5d393f520fc2..0b2993fef564 100644
>> --- a/drivers/usb/typec/tcpm/Kconfig
>> +++ b/drivers/usb/typec/tcpm/Kconfig
>> @@ -79,6 +79,7 @@ config TYPEC_WCOVE
>>   config TYPEC_QCOM_PMIC
>>       tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
>>       depends on ARCH_QCOM || COMPILE_TEST
>> +    depends on DRM || DRM=n
>>       help
>>         A Type-C port and Power Delivery driver which aggregates two
>>         discrete pieces of silicon in the PM8150b PMIC block: the
>> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
>> index a905160dd860..0722fb8d75c4 100644
>> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
>> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
>> @@ -17,6 +17,9 @@
>>   #include <linux/usb/role.h>
>>   #include <linux/usb/tcpm.h>
>>   #include <linux/usb/typec_mux.h>
>> +
>> +#include <drm/drm_bridge.h>
>> +
>>   #include "qcom_pmic_typec_pdphy.h"
>>   #include "qcom_pmic_typec_port.h"
>>   @@ -33,6 +36,9 @@ struct pmic_typec {
>>       struct pmic_typec_port    *pmic_typec_port;
>>       bool            vbus_enabled;
>>       struct mutex        lock;        /* VBUS state serialization */
>> +#ifdef CONFIG_DRM
>> +    struct drm_bridge    bridge;
>> +#endif
> 
> IMO there's no reason to ifdef the structure. Its up to you if you want to change it nor not, I have no strong feelings about it.
+1, there's no ifdefs in the drm_bridge.h header that would make this not compile

Konrad
> 
> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---
> bod

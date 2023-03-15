Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055666BA9DB
	for <lists+linux-usb@lfdr.de>; Wed, 15 Mar 2023 08:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbjCOHti (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Mar 2023 03:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbjCOHt2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Mar 2023 03:49:28 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B3164210
        for <linux-usb@vger.kernel.org>; Wed, 15 Mar 2023 00:49:06 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w9so1133050edc.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Mar 2023 00:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678866545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lb/9je8AC4WWvWgALFPncJ3g6+TfSkql/bB/zRqIhuU=;
        b=TKHm1ve40cTp7feXZePnxnQmAdVamPh1xDDrhObIjRzRvmhxJtAeRYRJX5Nko90LSN
         NAYmwJ521vYiSQsF6k+hnwD7VuiHNoa3iMQP+wLmQ6/eUym5qRnLIEypflxnM0SObP2+
         XtotY+Hr7T4vAjlWaRvqODTkeUtprBxa4T0pgZz/Ii6WhwFHAV/ZD3O76T6cXUeUfpLk
         HQEsdKv6uTKcQHJDDafghxsXAixQEe66Rmfd5VXWDajPiu4/uQy27gv6PWj6q8cOJkZL
         qOyIJZS6696PLH0OtvG2KzUZrH9bK+3ziOHCHVwTFGozo10EqkfbDxRosAFhHDpv7WLO
         fQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678866545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lb/9je8AC4WWvWgALFPncJ3g6+TfSkql/bB/zRqIhuU=;
        b=QsJ3Z48CCO8vEqQdjejgHkxBqmf8tfgVbfuFQrwDNBibfXArJaKMYNWCPgPA6CiqAi
         X8F6DfUUTiKAXCUKEio3477JNV8R1yzVTgYShFllh9AFKIU+QR+1+WEmIE+wcZJ3kTAn
         kwSmkpOrWRWiFsG3hKu0nA75SN3fDN1UA7fDilIHbWw14FTfFNf4AloDnexDXkR7/jbz
         1ToWgoVbyZeRH/74CuaxzCSZi2oG6KtGQ7Aw7j6Zg4Xx71sip72OENRgUhy1pF/c76k3
         Fy11UlC6FOeZJqchCQwQV1VQzXbbv2IPXDGJqlP1xQ2TZ7F1TJzRlrRJrSQGFVtc1c83
         HVmw==
X-Gm-Message-State: AO0yUKXkdpn4XERTtW+QE2ELE3RR7IWWq2kNMrR0UgPEyIQeoPyGiw7H
        p8Sucpnff/a3jdigFJMRu5YHOQ==
X-Google-Smtp-Source: AK7set8CnWc8IL5h3bQPkwS12bd6ca1GAoTNED6zEBXpW7nSwHoaFxs+9Y+1BxEMwqbbJA1ETWsw4g==
X-Received: by 2002:a17:907:8c07:b0:926:fce:c080 with SMTP id ta7-20020a1709078c0700b009260fcec080mr5743112ejc.17.1678866545172;
        Wed, 15 Mar 2023 00:49:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id mh19-20020a170906eb9300b009200601ea12sm2102426ejb.208.2023.03.15.00.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 00:49:04 -0700 (PDT)
Message-ID: <42bd4fff-aca3-4138-2662-7db6e2bb87e8@linaro.org>
Date:   Wed, 15 Mar 2023 08:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/6] dt-bindings: mmc: sdhci-msm: Document QCM2290 SDHCI
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
References: <20230314-topic-2290_compats-v1-0-47e26c3c0365@linaro.org>
 <20230314-topic-2290_compats-v1-4-47e26c3c0365@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314-topic-2290_compats-v1-4-47e26c3c0365@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14/03/2023 13:52, Konrad Dybcio wrote:
> Document the SDHCI on QCM2290.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


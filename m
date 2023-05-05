Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1F4A6F8980
	for <lists+linux-usb@lfdr.de>; Fri,  5 May 2023 21:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbjEET0g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 15:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbjEET0e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 15:26:34 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD2246A8
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 12:26:33 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2a7af0cb2e6so24500131fa.0
        for <linux-usb@vger.kernel.org>; Fri, 05 May 2023 12:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683314791; x=1685906791;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3iZJ9fGhjhbbNzeAFBlmfcQc+gjKnOZ5KfzSZflffhY=;
        b=MVs6djWgRKnZBGYNxps9/00kkcIaVpTanY0bv6lV+9QuA7oAe+zMsz/Z9EBDcKc5jl
         0bqAauyycDZjfZh1tkcrdMerW9qhOGSVeeYM4Fd6ZlZNFK6+cdVq0a+UL/rxP6xwo4IY
         S63BnY3xe3LWVd49BKJaKOA7Urzl2zKsNijhneotxntoU1K40jMqh+zqtBv0Rn34ki/1
         9n67nRds4PjfHaAPCTyIZkogoQtU23tkya5NLJWqZDASMq8Ln+Xy6lgTaVVwE94O93Cu
         sNmWOMTBAaL1qlI0iEpgjS9M/pOeVNknYAGpwJfX7m7Uo3VrhkJzQYkn8sixe31WzEg0
         zXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683314791; x=1685906791;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3iZJ9fGhjhbbNzeAFBlmfcQc+gjKnOZ5KfzSZflffhY=;
        b=BUIbKvpkQeL1EmntArmpG3qEn0ZotQLOk1+0z8ZiCJZJu4jHX9tI488d3filjickyG
         ce8RgW0g7J7Fk8nOu03oCqfllY6OOV5+CKyLTjOaET/6oupb0hALXuM/nw+qF6QJvgpa
         HbOo3Eb12ogOs5ZBetLYpRHfyNAHaLcYXfOPPdWwI5nN79tKIuamz7s75XFzUCtEI+dY
         RSSxcPv4eynROoIzzrDBl0y9jcRpQ74NvYkVQm5vN9oSe3+MSuMb8MUPov44n+1vlh5I
         Z0+JqLWQqLTaTJUfvEP1/OunAnIMaK65blmpPoXcQ6OJl3btmRoEOIr5932u/cqPkGSB
         SO3g==
X-Gm-Message-State: AC+VfDwGYsjQ+6sTOqFjhyuyvKcg875R3xKal5ZVovq5NImSyMC2rHIY
        VOFP7pUFFchgAnLKMbufy7+/DQ==
X-Google-Smtp-Source: ACHHUZ7BIu14SzjFhQTIytIPXgPw1F11LQCkHeaQR0KLUgWzQKpVnrM71jbROal0OQ7L/ot5xDESgg==
X-Received: by 2002:a05:6512:3905:b0:4a4:68b9:1a14 with SMTP id a5-20020a056512390500b004a468b91a14mr743687lfu.60.1683314791074;
        Fri, 05 May 2023 12:26:31 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id n6-20020a056512388600b004eaeb0a984csm387537lft.88.2023.05.05.12.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 12:26:30 -0700 (PDT)
Message-ID: <958fec66-2978-1d45-baad-c735fab85108@linaro.org>
Date:   Fri, 5 May 2023 21:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v10 8/9] arm64: dts: qcom: ipq9574: Add LDO regulator node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1683183860.git.quic_varada@quicinc.com>
 <8894bf2c44eaf4959c7a1966b66229e6cf5cda96.1683183860.git.quic_varada@quicinc.com>
 <CAA8EJppvj2nzqwdsC+Xct4cJg2-_yPpiGDELjHJG4HyAH3zGMA@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJppvj2nzqwdsC+Xct4cJg2-_yPpiGDELjHJG4HyAH3zGMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 5.05.2023 11:29, Dmitry Baryshkov wrote:
> On Fri, 5 May 2023 at 11:23, Varadarajan Narayanan
> <quic_varada@quicinc.com> wrote:
>>
>> Add LDO regulator node
> 
> As this LDO is provided by the PMIC, it would be nice to know why it
> is modelled as an always-on regulator instead of the proper PMIC
> regulator. Up to now we were doing this only for the outstanding power
> rails like CX/MX or EBI.
(which we then stopped registering as regulators and started
to manage through rpm(h)pd drivers and the genpd framework)

Konrad
> 
>>
>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> ---
>>  Changes in v10:
>>         - Add LDO regulator node
>> ---
>>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
>> index bdc1434..1f5d14f 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
>> @@ -60,6 +60,13 @@
>>                         regulator-min-microvolt = <725000>;
>>                         regulator-max-microvolt = <1075000>;
>>                 };
>> +
>> +               mp5496_l2: l2 {
>> +                       regulator-min-microvolt = <1800000>;
>> +                       regulator-max-microvolt = <1800000>;
>> +                       regulator-boot-on;
>> +                       regulator-always-on;
>> +               };
>>         };
>>  };
>>
>> --
>> 2.7.4
>>
> 
> 

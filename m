Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D041C6F425B
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 13:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233907AbjEBLNQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 07:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjEBLNO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 07:13:14 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275D7526B
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 04:13:13 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2a8ba5f1d6bso34647591fa.2
        for <linux-usb@vger.kernel.org>; Tue, 02 May 2023 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683025991; x=1685617991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UnVYWj5xPWY/m7D8adizrBPOFdgKen1k/+SyuHo7cjg=;
        b=LKBhk3BmOlhQyCFb2X3jjwO0SaGDqF9aDLFBy3Joo0y4eaPOB2i4wUJ+VxIY48WOWh
         SrT97QjDE0BL7mvp4IO1DiM3doN4fsI8LdicHcP4zzsRXe/qNMguEdzMSY2ShG0CCnI4
         VGf77M06C9umz2EB+PKxL5o1To8k/3XmFy5AyW8hrAiVQUeJHi0H575pouCQAI+bCXaP
         R06sSJ+EYUNROmtsHMluk3tyqrdrq6zHgS4k937qLfh6PAdgeaCn/8OaajbxSFqm93oY
         GDtlc3sUw027gAOkoBVkygPQicL3wzo3cGXoT4N4ifz5CciJWHYYKXs3sKAV6ylGpWV9
         05kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683025991; x=1685617991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnVYWj5xPWY/m7D8adizrBPOFdgKen1k/+SyuHo7cjg=;
        b=ilUKzBwQFirGrmEZ+dPbWzdV181h3H5f0X0mBs/wdkT8YhLLhMA7q8CnxUaCxhNELq
         yD3yWlbGMa51JNfBxbGUfPnHlnqiAJEKtcjcI3+RS7X/x4kY5SpaN/Y7Qn2ikfVQPASZ
         cYjFsWjZC0FVjkQ97AbHkT7EVIIkyLeF7DeyIdsudpJA8gCsbX7vuxzFc3bhNENdwtFK
         fiKcal2StNySDKX8NO8FoxzxPDsGVLDid3OIbZRquVdlxjBfkPpPwhrenBLlvvyn7a4f
         8EdSKUvTh6F2EZnEzZ1v2TDz2Ygx7qFYRCFo67BmNA1lecQRxlTA8vsc1KP3VyWSo/yf
         bMcw==
X-Gm-Message-State: AC+VfDxgZB/CLiMGLSgI3PIJlrSSIEq0QSc4k0ob3QVEACYUDoEvp34I
        MtNQ2xi4Fpb8SAh+JxOrVR6UMQ==
X-Google-Smtp-Source: ACHHUZ4vYM0BPN8EjS0h4Heha5KHPG6RO9skTE1BEOMUqjpMEHbkGBzmP42J6P845qSlP7nfD+cUwA==
X-Received: by 2002:a05:651c:154:b0:2a7:76ab:c4c with SMTP id c20-20020a05651c015400b002a776ab0c4cmr4818689ljd.8.1683025991214;
        Tue, 02 May 2023 04:13:11 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id l16-20020ac25550000000b004edc16dbdfasm5280650lfk.119.2023.05.02.04.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 04:13:10 -0700 (PDT)
Message-ID: <41581143-2caa-bac1-479c-c8feaf2de1b9@linaro.org>
Date:   Tue, 2 May 2023 13:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 12/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 usb-role-switching for usb_1
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-13-bryan.odonoghue@linaro.org>
 <109dc9fe-5ca7-1a98-3222-8c2297f4e8ce@linaro.org>
 <b4bfe2f6-7ea3-fca5-9dc6-12270b3bbc42@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <b4bfe2f6-7ea3-fca5-9dc6-12270b3bbc42@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2.05.2023 13:03, Bryan O'Donoghue wrote:
> On 02/05/2023 12:00, Konrad Dybcio wrote:
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            port@0 {
>>> +                reg = <0>;
>>> +                pm8150b_role_switch_out: endpoint {
>> Similarly to the QMPPHY, the port definition can be moved to
>> the common node in the SoC DTSI
> 
> But then the connector would have to be defined in the SoC dtsi and not all derivatives of SoC can be assumed to have a usb-c-connector.
Not quite!

You can define an empty endpoint (like we do with DSI<->panel ones) and
fill it in on the device side.

Konrad
> 
> grep "usb-c-connector" arch/arm64/boot/dts/qcom/*
> 
> ---
> bod

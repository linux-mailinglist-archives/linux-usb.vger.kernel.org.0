Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2888672DD15
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jun 2023 10:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239303AbjFMIyS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jun 2023 04:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241834AbjFMIyK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jun 2023 04:54:10 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BAE611C
        for <linux-usb@vger.kernel.org>; Tue, 13 Jun 2023 01:54:08 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f7368126a6so38489305e9.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Jun 2023 01:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686646447; x=1689238447;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NDiNhm2Y6nRuk/DDc8nzD8Q/rYbk+v+INjp84dQ4Gsk=;
        b=jOtPBGa+GRY0pIqESl8Ji3GBrr+XDllWpqEsa7or8ljLDZwrpneARdDnvSnZC34rQn
         fcI2uF7QFFzG9XIJNe6ffH4f4mr+7oj7frdUPNbE5wdgAnrg2Fe9K8JPs6OW3PMfWDUX
         FFJ7ZmSXqtcA5EJjAa5JaAVkRRATKlpNU4qk2NLXoZq1wviRUy9tgXMXbCZnZApnWiCu
         zViBQtFFxm3EMCpB1tXHZK74SgWz4DHIwbxWoU9KtNTisc60umEcb7iR7mlMtAo0qAOk
         koi5vJN8M9RU16ER7rOXW5KEqFiWy+a2sIcqcYi7e/yYyfMC5opqD7VuXpI+MkHcna3F
         eTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686646447; x=1689238447;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDiNhm2Y6nRuk/DDc8nzD8Q/rYbk+v+INjp84dQ4Gsk=;
        b=Bj4/1LniYsywq8LHz0NumFJmuXyUHIO61HSmOC+C71zbSFG5C2YTt+Kl7UIFqoZw8L
         7q9XXHLZQfLh4GaG5jCbdTChMVtYaN4GSbSd7yuGQbN5VGd7T1CbY6fxCyeKlW6zi5Sq
         Av3VvQy11xlYx25zAN7MuIBR3nX7fnZUN9DJfMdr96gqGUGWiQyGkQpfDcFTp9h0tZbU
         tlC06DAI89l1zMjvs0SVR/a6OYcDxzHU/2MHO+Wp4GGur5VzkRoLvsP8sSKRl/2NOVDq
         /K3VMgeqDjuqJ2oDHggjnvV2qYr6LOYArDgHLV3oZqKv176APytRGWustqxjM4fLpaRu
         lfkg==
X-Gm-Message-State: AC+VfDxDp0noRAJwco7Ogm0V/DlBfnY4M0QCAgHnwS8iMDuQshrtMgc2
        EdV+cFJ8iSSXpgg+ziOmVtgAHA==
X-Google-Smtp-Source: ACHHUZ45G18QLIN7+wDdZTsNEbpK70h739qxBNPbqmKWAndC1h4UuqNPazu8rDUPziKR7UcgGS2Mcw==
X-Received: by 2002:a05:600c:22cc:b0:3f8:153b:a521 with SMTP id 12-20020a05600c22cc00b003f8153ba521mr4718978wmg.26.1686646446774;
        Tue, 13 Jun 2023 01:54:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:48b:b939:c60e:e1ba? ([2a01:e0a:982:cbb0:48b:b939:c60e:e1ba])
        by smtp.gmail.com with ESMTPSA id r11-20020a05600c2c4b00b003f7eb5375ddsm13829675wmg.15.2023.06.13.01.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 01:54:06 -0700 (PDT)
Message-ID: <cfa788c3-be57-5109-73df-b82099dd17a0@linaro.org>
Date:   Tue, 13 Jun 2023 10:54:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/8] dt-bindings: connector: usb-connector: add a gpio
 used to determine the Type-C port plug orientation
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20230601-topic-sm8550-upstream-type-c-v3-0-22c9973012b6@linaro.org>
 <20230601-topic-sm8550-upstream-type-c-v3-1-22c9973012b6@linaro.org>
 <e26878e5-fedc-b2fb-2213-5afd8479de4f@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <e26878e5-fedc-b2fb-2213-5afd8479de4f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/06/2023 10:13, Krzysztof Kozlowski wrote:
> On 13/06/2023 09:55, Neil Armstrong wrote:
>> On some platforms, the Type-C plug orientation is given on a GPIO line.
>>
>> Document this optional Type-C connector property, and take the
>> assumption an active level represents an inverted/flipped orientation.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Rob had here objections as these are bindings for the connector, not
> PMIC glink/altmode. I still doubt that Qualcomm USB Type-C connectors
> have such pin exposed. If you open the schematics, the GPIO is actually
> coming out from PMIC and is nowhere around the connector. Please drop my
> Ack.
> 
> This however could be a pin of the PMIC because it clearly is on the
> schematics.

Yes it comes from the PMIC, but this part of the PMIC is handled by
the PMIC_GLINK firmware service, so the logical place would be into
the pmic_glink node with a gpio array in order to handle multi-ports.

Thanks,
Neil

> 
> 
> 
> Best regards,
> Krzysztof
> 


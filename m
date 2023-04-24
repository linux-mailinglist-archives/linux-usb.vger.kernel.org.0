Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47E066E3AD9
	for <lists+linux-usb@lfdr.de>; Sun, 16 Apr 2023 19:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjDPRuq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Apr 2023 13:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjDPRup (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Apr 2023 13:50:45 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4EB1BEE
        for <linux-usb@vger.kernel.org>; Sun, 16 Apr 2023 10:50:43 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id q23so48988494ejz.3
        for <linux-usb@vger.kernel.org>; Sun, 16 Apr 2023 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681667442; x=1684259442;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ArQgtD3XSqkYnGRgmzJbWKvwHilfmpOzjhORldjiTRk=;
        b=pjh6Cixrsx8Hh512bQNyQ6zvHY998f+4aIajXuk5EHdzmo5iT6u3GlXVbpaMV38yos
         YpFwr+V5uPby5XRdL3RkmIfpnFq2AWq7G6UZ7ia+8RncjR9w9Xan+3GKbSZ8m4Baox1U
         HNHJzW+OH4DoL6PAGYseKkrKSbr/Px4FVq/kHeg8jB2uXJ0YVMLf3qLjeXI9IZq7qqmE
         tGihYj7Lko1JPhUxqH6jN9ilObc9x6emMwwv4Xf9kRfX/EbhI8uDU8f7SbdaBt67s3MS
         A21fcWQsFMWRwq4fyiYIIr4fd19bKIXGRTXZyH077fSLsSf1b69G0GR5Q/3qVLwYu9Q9
         hImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681667442; x=1684259442;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ArQgtD3XSqkYnGRgmzJbWKvwHilfmpOzjhORldjiTRk=;
        b=G2wrfiIPhpjyJtKXr3wst4YV6UkBZu6dXPmK/ng88ldtB+pqqO3cROB+R8OlVH7KuE
         FWm0b57XvjCzbje+IlXCdXuNpj36mTMzxCdFqSIWVVzkHRMGl+Zh77InABKl2j98zSdj
         LF68jm5kDAqew1WsLDZnSsUjT/4blSB0/R7nr3VUIf6s9TgTpksjQEF54CgTBALpXZQQ
         NG8LG7+5jh6XC9Vo4uI8XpUv9z6JhVeJJ/8YOnmKbWg+XgfoP1YE9+BOsCDWFoDCnvrv
         o9RPTGAaDnu3QIGNNfuXnAulYq1eNYPDh8M9pY4tnDNMqAzpHghbSamr4oCwhewkXEKK
         ilqg==
X-Gm-Message-State: AAQBX9cjxmiamNaI9gNs8S5di2aGF0eje73vixh55fQeSxC34ciHQcbZ
        W3fYv7u7V61VAQtvm5llaxcUX2vTOvciexrqEAg=
X-Google-Smtp-Source: AKy350bi5SNwJCsq1S0JAPIIz20WwvLuMxekPOjUVrH+1IolwM3A1B+tOdwmSN/EadbYy+1HMOa5vA==
X-Received: by 2002:a17:906:52d6:b0:931:1e69:e1da with SMTP id w22-20020a17090652d600b009311e69e1damr4736891ejn.7.1681667442258;
        Sun, 16 Apr 2023 10:50:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id gn42-20020a1709070d2a00b00930525d89e2sm5397950ejc.89.2023.04.16.10.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 10:50:41 -0700 (PDT)
Message-ID: <4c453fdf-0405-518c-0e2d-50cabc61bacd@linaro.org>
Date:   Sun, 16 Apr 2023 19:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 06/14] dt-bindings: mfd: qcom,spmi-pmic: Add typec to
 SPMI device types
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <20230413113438.1577658-7-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230413113438.1577658-7-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/04/2023 13:34, Bryan O'Donoghue wrote:
> Add the PMIC Type-C port driver to the list of devices.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This depends on previous patch, so should go together. You should
clearly communicate dependencies/merging in cover letter. At the top of
it, so maintainers will know they *cannot* pick it up independently.

Best regards,
Krzysztof


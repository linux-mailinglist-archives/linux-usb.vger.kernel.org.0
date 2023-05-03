Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC1C16F5037
	for <lists+linux-usb@lfdr.de>; Wed,  3 May 2023 08:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjECGdS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 May 2023 02:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjECGdR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 May 2023 02:33:17 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CAA359B
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 23:33:16 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-94f1d0d2e03so800095366b.0
        for <linux-usb@vger.kernel.org>; Tue, 02 May 2023 23:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683095594; x=1685687594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUfDTtPAs1VWSq2y6k2Y/B2HUp9LdmNS7Q2wGxGx+BM=;
        b=Hj0MG7ZSFYFCnFWJIfNXbW8h0OOyZyXTI4v4wD8YLPGZuFyXyO+cPtRxSbXeTPvBZE
         kPl5difWvM1C+1xukigJm+oR10UbqpLjOT0TjHsYF5wkxebpau1+kuVn77U9q+STJeJb
         WhzFCYGhOUF0I8WfEr+RP+Yw96TwXCTrv1+XAoJ6htEUR3U38YjlRKuYI/B+hM7RK/5v
         YhLhnnJScgNIZX7J9TJMQ0Atdm/UyNwHCWkpIwt5jp1PmVVOgkY2CBUxksj72nlheUOA
         URoyGz1XlRE4NwhWHFr/uwBKivOTwNHLZFZ5mTsVGnx2aM0ngqHGNOxo2gOXnzMcrv9i
         cHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683095594; x=1685687594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUfDTtPAs1VWSq2y6k2Y/B2HUp9LdmNS7Q2wGxGx+BM=;
        b=QHcDkZPQ8l9bQPHGvvz1WROkpkYEvewzmYqDFiSUYzwolkU3ZiWZ06jEKe0YqBZGHP
         wRLWENPdsWiHPGxk8QrdykZEo8RXIpNv6mGScKG5fYvLXfafJed4xaLWeWx6S8qShlqB
         EAON4wuj66A0AnOAgb0dwZ5QX/pqMvR4wR/qRbV+0dA96RrMUROGsGzfYfWbkceR7gor
         86ub9YTOpaiFf3HbknQWup8oxQgg/WFRu2Gc/hzspQRW1oS47xmQTpUZugetk0mX9osu
         AN+MZiH3vII0MWTqqpQz2X57wUjEWeVoM8jMhTAgSqnJlwQlnmR9L/ejb+nS7KPthQxf
         Pw3Q==
X-Gm-Message-State: AC+VfDxW61dEWNkuwlp9UlwDcl/Bo4kFXMdRFrkAOHqXDAGE19iyrlms
        niaP6T39xdGQYtvqS681G+lIMw==
X-Google-Smtp-Source: ACHHUZ6sUA3+dOmkpHHCog4RHngkJAQVGrhsV30sYHwumv1fCJ3ZkHaXNLuTjSQVW998HfnO6D8dag==
X-Received: by 2002:a17:907:3686:b0:94b:b4a5:30f with SMTP id bi6-20020a170907368600b0094bb4a5030fmr2653324ejc.55.1683095594686;
        Tue, 02 May 2023 23:33:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a40b:9d8:1fa0:ecc5? ([2a02:810d:15c0:828:a40b:9d8:1fa0:ecc5])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906048a00b0094eeea5c649sm16917107eja.114.2023.05.02.23.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 23:33:14 -0700 (PDT)
Message-ID: <06c35008-3547-10be-2578-4d78c66b805e@linaro.org>
Date:   Wed, 3 May 2023 08:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/2] dt-bindings: soc: qcom: eud: Fix compatible string
 in the example
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org
References: <20230502093959.1258889-1-bhupesh.sharma@linaro.org>
 <20230502093959.1258889-3-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230502093959.1258889-3-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 02/05/2023 11:39, Bhupesh Sharma wrote:
> As noted by Konrad while reviewing [1], the example node in the EUD
> yaml documentation has a compatible string with no space after a comma.
> 
> Fix the same.
> 
> [1]. https://lore.kernel.org/linux-arm-msm/20221231131945.3286639-1-bhupesh.sharma@linaro.org
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


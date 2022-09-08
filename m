Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEE25B17C8
	for <lists+linux-usb@lfdr.de>; Thu,  8 Sep 2022 10:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbiIHIx5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Sep 2022 04:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbiIHIxr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Sep 2022 04:53:47 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B095E6B8D
        for <linux-usb@vger.kernel.org>; Thu,  8 Sep 2022 01:53:45 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x14so11225984lfu.10
        for <linux-usb@vger.kernel.org>; Thu, 08 Sep 2022 01:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=9VquOKQ3hKK4VW69duKHqam2B9oML/lOcHv1HNPnEmA=;
        b=DB7qj/3lifsH8Ly2TJe/zzZdOFOyFijp7RptdtdBcsW8wQUZtDpQESqx3Vnq7I0VXE
         9SHdT6AtmEImEgTN2AiQGYkN5Nqf+RwhQfIBBULoFvCriWLOBp6rXnNzluUgnZri4hlc
         NTCOAEfkS3c3s0/6qAe4gaDZBj00ohmpjXivIXBinMQSMoCE2P9p14MFl302C/XwplG8
         rIYJlO8MPS9DPBOBkCzuG9QJbpWK8aOsQxUqwoYXLyxL0z7hIo2mp6fg4CBiaYZmv0rq
         T9MVBMSlPYWnL/sHFpZkNsLPiEqhvm430q3lymG7+4bQ6Kzo5+UpXhf8hSYt3og+MWnh
         nf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9VquOKQ3hKK4VW69duKHqam2B9oML/lOcHv1HNPnEmA=;
        b=TY2MEephaO8HT1VjC9KCqCZgGyGWKZI2pfmds40rSQ22NLzutCZcy3qdP8rl5FqEZ3
         kNh6tnqEIMWJ8+6+irUt/JCfpudTehfasnyRphKuXc0KWkFnk0WQOqGNMYELdhpkGTXh
         M9DrZvpjKfoDttCS0dLqN4LX6LVt/DgLudwxD33mqaFyJQjNZoI1dIaD2VXlYNZ82F+d
         TBl452LeCviu2tiyDmHEKmL01Uw/ioU2huAoS5rBRnhdeujF4pSFfAgYwUqtSitGaMtd
         OwhU4rfWsICPUH7wCtiu5QLisAaqw9H4xCHXYrXH42ImYI+UW1GkCVplAMd3r87vTWUP
         QjoQ==
X-Gm-Message-State: ACgBeo2iUoCXdxoe95Igt7G7PiCzjcc9n14emXMjeJFfEELWag80KkBJ
        j0EfF8WoDrhzlwCTdhRV0tTpCQ==
X-Google-Smtp-Source: AA6agR5d9Kr7OR2aZotVHTJ06sSnIQxXzgza6rDlRHbtVbyZcqSkboT1leot3yaDXuIbY10+N2GMQg==
X-Received: by 2002:a05:6512:e97:b0:492:c677:f867 with SMTP id bi23-20020a0565120e9700b00492c677f867mr2476900lfb.190.1662627223427;
        Thu, 08 Sep 2022 01:53:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s26-20020a05651c201a00b0026a999966bbsm1661652ljo.24.2022.09.08.01.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 01:53:43 -0700 (PDT)
Message-ID: <456b1bd4-e3bd-1806-8af9-45c6ab9c289d@linaro.org>
Date:   Thu, 8 Sep 2022 10:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] dt-bindings: usb: dwc3: Add
 gfladj-refclk-lpm-sel-quirk
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Li Jun <jun.li@nxp.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220907144624.2810117-1-alexander.stein@ew.tq-group.com>
 <20220907144624.2810117-2-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907144624.2810117-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07/09/2022 16:46, Alexander Stein wrote:
> This selects SOF/ITP to be running on ref_clk.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

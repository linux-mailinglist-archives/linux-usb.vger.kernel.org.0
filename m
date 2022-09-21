Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00FA55BF7C1
	for <lists+linux-usb@lfdr.de>; Wed, 21 Sep 2022 09:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbiIUHce (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Sep 2022 03:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiIUHcc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Sep 2022 03:32:32 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114FD7FF99
        for <linux-usb@vger.kernel.org>; Wed, 21 Sep 2022 00:32:31 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id j24so5400874lja.4
        for <linux-usb@vger.kernel.org>; Wed, 21 Sep 2022 00:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=7JnyjGpATcgNnreZxcfkb+tq461mqhrMUKVJHIj5DbQ=;
        b=vLFU7P0JUVxQwOQIwPN3s8EzOvkEvnQUUIFTWMHjnKADIVVn4W1UGRHPn53b9fj8AK
         +0ouEq/nVkmiq5TrtOG2AIzkCUAJf9fTrxRTV+YrQC5C2FgRQhJNix7sVi7v7g73K9kj
         0ShtvgtF16s/6cwsT2jk9N5Xou7/qJ0holB0980EIpkHruaZEwvowJfAKfiNRs7g/4ae
         5nBuNMN5auKV9iNAW4G+pDySil1/Pf5qaxHp1nnycjMsoCwFCdWjnyW+kFMQs0YrCmHb
         VIy9ga2JQjHBWYjcZnIQzawK7wDwuxgfMAosmkAueEa1w7UWx+vff+eaub7Xcz5n7ifV
         Y8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=7JnyjGpATcgNnreZxcfkb+tq461mqhrMUKVJHIj5DbQ=;
        b=jcbEd8uU+XtQfyJA9EgpSJgx+MIyhG1iItdT4lWFTd5t74CBhlm15z+Lok9jmb41bC
         CCEhmxrOg0lZLiEsgvGX9tgCLGPB/5OJnTLztWSqmc6gz0VZ+vVGnAQRg05Aoe8NVJfb
         +HRmrTQcXqq6oGu6h58qiWxYgEaGgmUm28uMkhB7k+VnsZCX26TPvh+p8lLiFI7SX+Fg
         WhlRQCSISZuNbFjP3rnolmYmeFiyPmAMPGZb4DmknxYSiTBP0I/2cLViZqDSqslJ8dYU
         ux1svLG+FNQbnx5kSaU847sjC1+9ax+mf5Z5o22ESfqCYE7oXZpsIZF/s/CmJqyE2F14
         iMHg==
X-Gm-Message-State: ACrzQf2ViTe6UQbQJcvjDmVT/1axOXp3nQ5q0qxDU4KuOyijpX8itmux
        a79DZtURLt9zf/hVDqbaqw71HA==
X-Google-Smtp-Source: AMsMyM7pGy1YVzFvNrD56K13wYvuEXn7Yf2+HAavQCUFPDqZERqo62flx03xCE0JQukad7Ad5dV3Uw==
X-Received: by 2002:a2e:a448:0:b0:262:f7c4:31ad with SMTP id v8-20020a2ea448000000b00262f7c431admr8145408ljn.283.1663745549394;
        Wed, 21 Sep 2022 00:32:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f13-20020a2eb5ad000000b0026ab83298d6sm316063ljn.77.2022.09.21.00.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:32:28 -0700 (PDT)
Message-ID: <adc622c8-d2b4-5867-60eb-49eaf10cf701@linaro.org>
Date:   Wed, 21 Sep 2022 09:32:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/3] dt-bindings: usb: dwc3: add sdm670 compatible
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20220920224320.152127-1-mailingradian@gmail.com>
 <20220920224320.152127-3-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920224320.152127-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21/09/2022 00:43, Richard Acayan wrote:
> The Snapdragon 670 has DWC3 USB support. Add a compatible to reflect
> that.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Missing changes in allOf?


Best regards,
Krzysztof

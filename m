Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9DC86B394D
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 09:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbjCJIx6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 03:53:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbjCJIvx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 03:51:53 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8630310113C
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 00:50:27 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id u9so17578251edd.2
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 00:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678438226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipfX94R9wbmrYkXyBfnbFGquCgHOanUWP3JAxF36ZcA=;
        b=CWyJs+HWQi1vX3RPNnm/J6gE4kcyoJbjzCVEOr5t+k6oH1rq9W3mljVyz2njWhuMu5
         gUCw6m97KV6iRT101NgZRNtiRFiDbz9U55ShEvv5dWXno7YmYWH7aRLy7SlAqpPIkPPt
         DshBMRc7B0KKO93e0ndoTfQueqnPIE6RZPwvH8zGvU2yLW3/e3/3sZugcpFDiGvKn97F
         GvPgx53wUbuCPxQ7ATQQPenbXkM79AXzK1ev1axdgKPHV4wVwBi1uZaC+7PnbQc1Qt8/
         a/cWJeoQHup9sAQHHKBiA3CyFERBbQDdcDuFgpbmA8PhRpXONoGSsyjYW3Y1ckTLR5ir
         blqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678438226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipfX94R9wbmrYkXyBfnbFGquCgHOanUWP3JAxF36ZcA=;
        b=sMA0vqXtbWV2aEX2Ll9KCJECL3IRR8KSczvgyeph7xZBNS5VeS94vmjIm3cWqi93QG
         0Wy5CG7Z4lwWYBdAHh+c4I7OLfDS+iHE18whkkKQMSs2lVJuRK9p4kOg3B93XDR4RMli
         Yy6iWS/5+jrPwuxSGd4C7vpJyVCu058Z6EC6Sy590GHPjrp1Yal5xUQryZvxTXF5v4Fg
         YDwxniSYut/vy7lslrwfSJmGE/7/FH5YrZj+sDl2KMEY95NFp6FG/BNHCWWA/xQ5aUyS
         Z70l+iIzMs9d/izDEbc4lKjG0j3eTHXBWhXwzuG3OSaY5J+MvUuBsVSg0Xua7/X4AJcY
         Em3A==
X-Gm-Message-State: AO0yUKUYLOy6FftlP51olkeDRY44PMxjYfmBLQ65WP4qD82MjV5dhQ7g
        yWFBs/W5gw2rKqWCp5KWCkYeQA==
X-Google-Smtp-Source: AK7set+E/4fAteq3rh76C+cieesyxjxboaO7qVk8PaVAPoe5+SoyWke2NX6ryFSI3UcOSVu5Y66lsA==
X-Received: by 2002:aa7:d7c5:0:b0:4ae:f496:1372 with SMTP id e5-20020aa7d7c5000000b004aef4961372mr21528108eds.36.1678438226060;
        Fri, 10 Mar 2023 00:50:26 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id e5-20020a50d4c5000000b004c0057b478bsm562719edj.34.2023.03.10.00.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:50:25 -0800 (PST)
Message-ID: <7f0fd384-936b-02f9-c067-1e680b04ec95@linaro.org>
Date:   Fri, 10 Mar 2023 09:50:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 11/28] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Content-Language: en-US
To:     Wesley Cheng <quic_wcheng@quicinc.com>,
        srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
        perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
        andersson@kernel.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, tiwai@suse.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, quic_jackp@quicinc.com,
        quic_plai@quicinc.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-12-quic_wcheng@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308235751.495-12-quic_wcheng@quicinc.com>
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

On 09/03/2023 00:57, Wesley Cheng wrote:
> Add a new definition for specifying how many XHCI secondary interrupters
> can be allocated.  XHCI in general can potentially support up to 1024
> interrupters, which some uses may want to limit depending on how many
> users utilize the interrupters.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


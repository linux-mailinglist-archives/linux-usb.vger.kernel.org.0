Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B0F52CFC9
	for <lists+linux-usb@lfdr.de>; Thu, 19 May 2022 11:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236342AbiESJxH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 May 2022 05:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236312AbiESJxF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 May 2022 05:53:05 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B727CDE4
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 02:53:03 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id l13so1516034lfp.11
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 02:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ImTMJ7NEr3jThpzaHgd3rGMXcI9+OPwGlMvh89jjfd8=;
        b=yFxY0RmYLbckm7L7RyIXbZBUMKidQnhhLcgwm2rTjG3bG+Sj3j6g3shaZoH7IfNFhL
         IpaTcCNYQVguPwfqcMcqEwciIJcGEuhQChcA5XDy3H9PCRF0A9BMMti6BPy8KgNyw/a7
         iPBzn2wrjxio8ZkE8oS5a5lOLLPYi1sQxHoXblkmr6DZgZus5UXyZC5pB+lFGx3Oj7F/
         UG9rHPROa0J78RDjFqzNmmwIA3+b6wnD6R1rjaDTexKuldKmDYPlKoNQn40mS7tO/A0j
         a4v7X9NidVIrvmDIw5AcM0qrK8yNz92cQFjmxlUYKuhdvD+ibzy27JHPHdJocz6X8hnx
         C8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ImTMJ7NEr3jThpzaHgd3rGMXcI9+OPwGlMvh89jjfd8=;
        b=mXPjgE1nYFCLA0X7hcN84BI4RytZKqxVzNvlpgZYE6Afar2l+XyP1MxFfYmveiXfAw
         ZceN903DyCvoWnh08zGX5bzZSxyMM2AVc04JPr8RGYfboCw+Oqc3i+XHq6a9uDZWIyrj
         LqB8FeV6sS/EegY43KPBQLf0TTg+Sbda5DARNp6D8ac/RDB4A3bU5cZO4z9J4f06DWkD
         +Ks/K/vm1u39wzPh4K13RoIvk3nmYbNZyhpDhvwIDEkRQwMGduWFS3V0AoDv8Zgt8AMr
         GB9ULckkOax4Q94YzcTrSsma9REaFXbaj8rXHw8DxMwX2s/NiAlI1ryw+d6bljgSKfpt
         MQeg==
X-Gm-Message-State: AOAM531UjOiqxQ2RdyYidIRJ4b+240RoZcY8rJ+JLpLyPszUK2nL5P+p
        h3EZRUmvKi10to/BNNB8LQTGZg==
X-Google-Smtp-Source: ABdhPJzZrjcDsXy7nuFWUJ9mKFNUWqpakjcu2AWzmGzIYI+ju02ZJBQZ3RBGJDWYSaml+jR2/C612Q==
X-Received: by 2002:a05:6512:31d2:b0:473:a0c7:ffea with SMTP id j18-20020a05651231d200b00473a0c7ffeamr2688485lfe.271.1652953982021;
        Thu, 19 May 2022 02:53:02 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s5-20020a2e83c5000000b0024f3d1daf04sm511024ljh.140.2022.05.19.02.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 02:53:01 -0700 (PDT)
Message-ID: <bc740a3c-5c12-f9f7-5518-f6f1121d44a4@linaro.org>
Date:   Thu, 19 May 2022 11:53:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 2/3] phy: qcom-snps: Add support for overriding phy
 tuning parameters
Content-Language: en-US
To:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com
References: <1652934489-23386-1-git-send-email-quic_kriskura@quicinc.com>
 <1652934489-23386-3-git-send-email-quic_kriskura@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1652934489-23386-3-git-send-email-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/05/2022 06:28, Krishna Kurapati wrote:
> Add support for overriding electrical signal tuning parameters for
> SNPS HS Phy.


> +
> +static const char *phy_seq_props[] = {
> +	"qcom,hs-disconnect-bp",
> +	"qcom,squelch-detector-bp",
> +	"qcom,hs-amplitude-bp",
> +	"qcom,pre-emphasis-duration-bp",
> +	"qcom,pre-emphasis-amplitude-bp",
> +	"qcom,hs-rise-fall-time-bp",
> +	"qcom,hs-crossover-voltage-microvolt",

Please test your DTS with dtbs_check.


Best regards,
Krzysztof

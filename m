Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 134A9766DA4
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jul 2023 14:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235969AbjG1MzZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jul 2023 08:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234632AbjG1MzX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 08:55:23 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F9D3580
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 05:55:18 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fe12baec61so1275605e9.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 05:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690548917; x=1691153717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pnb+Pp6eWPhE2kCvGdnRU+RBf18lPBnMdMKsMK2Fy18=;
        b=T5fHi6JL3PVme0GcIyBA3jTh0OoTrTT9lQVKjCQkswd+E46nVLzVZRAufMw68yFC9W
         I0/RO5R434eR8bgY1iXxbBXKhbcFFKVtmzxJA2H1FvSfP8hwx3Z58rGyOboRE2OU00Pu
         xSragdcsQHM+3jsAfOWkesfCg9zwV9vT3xtzUHkmsk9nje992S8ZDiFIFKzauSdhGeUG
         hIDgBMn4d5l6xijlVTr4+0aVSK8BzxsgSQ33kY3pXYcw4Ty9K25wF6mJ0n6Oc3ii5Un4
         yvOrGyycMtu21T85PKn80uwzblh3f631qD6buah4TCk3tY/AE21gbfPN8AyaMhvzfHL/
         J75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690548917; x=1691153717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pnb+Pp6eWPhE2kCvGdnRU+RBf18lPBnMdMKsMK2Fy18=;
        b=MgiLSdD5JGz/QAqfX7w4YERYKOHCmmaB7HCGKyykjVLSaO9s/3imvY2rFRvb3QPK8T
         siYevQmY1fod9wOLjmQyvNlrPcwFHylE7wTTd9TV4ZuJ+l3ThgQWSPGUAqitk30oMf8S
         WAzj/fyM/b6wMMmDSo6uiM5HQ7Eb1/rYs+oMVjcmlBuBMAD7Etr0fTIEttuCMikiQ+8J
         0Jh7wENYiXZWuwgx/wcJnFjXkmVcpIYcCv72acnP6J/GdWZUO+8jL8kHxI6Uikr2eLHm
         YZ5PQ8lOLZYQnIsOJLapyeZnRAfWVPslhN3Yf6I+1IxW7KOrRT2AbBEWibGl7jvNX4ff
         DVQw==
X-Gm-Message-State: ABy/qLa5Sy4QsNWyPLCb06jca/TW5I8NUfLI4gX77hkVVI4PIsN8IxO3
        YfqpDsLU4IhDAGjxoab1YfHPRA==
X-Google-Smtp-Source: APBJJlEMT3xCWnSmZcv6naKYtm/R5wV9+HzRKgDz95CGJSKOUIacmuHMrfBFlx60+ZbuncOlGyrPfA==
X-Received: by 2002:a05:600c:252:b0:3fa:770c:5918 with SMTP id 18-20020a05600c025200b003fa770c5918mr1732362wmj.9.1690548917089;
        Fri, 28 Jul 2023 05:55:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id k10-20020adff28a000000b00311299df211sm4773050wro.77.2023.07.28.05.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 05:55:16 -0700 (PDT)
Message-ID: <0ff72903-c38f-9217-9cbc-bdf6c6c75007@linaro.org>
Date:   Fri, 28 Jul 2023 14:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v10 01/11] dt-bindings: usb: qcom,dwc3: Add bindings for
 SC8280 Multiport
Content-Language: en-US
To:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com, ahalaney@redhat.com,
        quic_shazhuss@quicinc.com
References: <20230727223307.8096-1-quic_kriskura@quicinc.com>
 <20230727223307.8096-2-quic_kriskura@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230727223307.8096-2-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

On 28/07/2023 00:32, Krishna Kurapati wrote:
> Add the compatible string for SC8280 Multiport USB controller from
> Qualcomm.
> 
> There are 4 power event irq interrupts supported by this controller
> (one for each port of multiport). Added all the 4 as non-optional
> interrupts for SC8280XP-MP
> 
> Also each port of multiport has one DP and oen DM IRQ. Add all DP/DM
> IRQ's related to 4 ports of SC8280XP Teritiary controller.
> 
> Also added ss phy irq for both SS Ports.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.yaml    | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


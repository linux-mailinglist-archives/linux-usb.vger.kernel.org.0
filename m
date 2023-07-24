Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB4EA75FCE2
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 19:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjGXRFp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 13:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbjGXRFo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 13:05:44 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0350CE4
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 10:05:42 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99357737980so772023366b.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 10:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690218340; x=1690823140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/1LJDLgyxtYwLLVQ7MqhyHlHTh4bPkUiDIcho+GZfM=;
        b=oqaIWLHBsBokwzA8MU+vTILFZrNZ6gabOBrfMq5TqHeSuEGcOEG8pjJxJhmUcCmP2A
         RX+9KSZzq0KUfvi1SqYUjU4rqMKnHfAIpv00i5Z4VlDfx8qZJ74b/FVlZDIex9Zy4M7f
         bt7La3JPALRHslMF4UJNLDeC3p2mmD3XN9+c5l4lvvIG26LdD/pxyKBcxwGbiV7/ltwz
         VivBiO4h5xsYHke9MNNmaH4cBH+8SAohDxQ3JcBGSiUfKyYY/6E63fxUyrLpnP5gIlqx
         lS4/RGpo4UCYHxC4Ljczy7g+AI9odUzxdAILOVqY+2Y95pXeaTLBbHIKj6ElsdFoQN3k
         lZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690218340; x=1690823140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/1LJDLgyxtYwLLVQ7MqhyHlHTh4bPkUiDIcho+GZfM=;
        b=gDHunmZ1zAzNAQxTAGbn9pD/Z4+iotcy4wUIERQUTroC2ebiKOI1LM3AoZrAOORhOp
         bVptjmRRE53yoQwM/rpxZw52ds7DfMl7JL4yW0s29lmP2m4MDXf7z1wU/Z/Nx3lx0Q6z
         fJg2+la2Drewwr0CYa5Iog+ig8eX5LKEYYQpQAMB73G+IVv7uFBoAKKWhazbJtfSCpbj
         RbYTnSJlLvtOSM+YyaEpzSm6rotXiLjxbqxmg4S5HwphytosdswM2dBHDiQ80YiVzAoO
         Rd9nJ/RmFFKH4v7dx5aJTXiddnxbnq3u3Vq6VnRoHV0J9+h44EXyo5ZjgMSdwiffOXUG
         bRCQ==
X-Gm-Message-State: ABy/qLZkoUdlppiJ3t1wvWfPI6hg34C+G8JuztkgPvo3V4X7iUqQ3kAZ
        QHhctWAV0+J1TjaYxw8ktoHRrQ==
X-Google-Smtp-Source: APBJJlHwPcKTKIL8LVd0DfZgwQQ01hah+RbyGAamj9A4ipk0zwj2sUnqzG9iAqwMWQ1mO1hBmRf/Yw==
X-Received: by 2002:a17:907:2e0b:b0:96b:e93:3aa8 with SMTP id ig11-20020a1709072e0b00b0096b0e933aa8mr9577637ejc.21.1690218340090;
        Mon, 24 Jul 2023 10:05:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id qc12-20020a170906d8ac00b0098866a94f14sm6974227ejb.125.2023.07.24.10.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 10:05:24 -0700 (PDT)
Message-ID: <60e7e772-bf0a-264d-abac-4ed72766a2d0@linaro.org>
Date:   Mon, 24 Jul 2023 19:05:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: usb: add missing unevaluatedProperties on
 USB connector
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Jagan Sridharan <badhri@google.com>,
        ChiYuan Huang <cy_huang@richtek.com>,
        Min Guo <min.guo@mediatek.com>,
        Gene Chen <gene_chen@richtek.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230723071105.40157-1-krzysztof.kozlowski@linaro.org>
 <20230724162638.GA3784203-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724162638.GA3784203-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24/07/2023 18:26, Rob Herring wrote:
> On Sun, Jul 23, 2023 at 09:11:05AM +0200, Krzysztof Kozlowski wrote:
>> The usb-connector.yaml schema allows any additional properties, thus its
>> usage should finish with unevaluatedProperties: false.
> 
> Is it problematic if usb-connector.yaml is restricted?

Yes, a bit.
1. Missing reg/unit-address:
Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
I guess this could be easily solved.

2. phy-supply:
arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
(and more of armada)
This is a bit odd:

phy@18300 {
  compatible = "marvell,comphy-a3700";
  comphy0: phy@0 {}
  comphy1: phy@1 {}
  comphy2: phy@2 {
    connector {
      compatible = "usb-a-connector";
      phy-supply = <&exp_usb3_vbus>;
   };
};

I would assume that phy-supply should be a property of the phy.

Best regards,
Krzysztof


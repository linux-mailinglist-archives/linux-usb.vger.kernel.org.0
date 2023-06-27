Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB1D173FD30
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 15:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbjF0Nte (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 09:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbjF0Ntc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 09:49:32 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDC72D61
        for <linux-usb@vger.kernel.org>; Tue, 27 Jun 2023 06:49:24 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9920b4d8a89so110181066b.3
        for <linux-usb@vger.kernel.org>; Tue, 27 Jun 2023 06:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687873763; x=1690465763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjzAtSsUnoiViDhxlYstizqeG3gV5lHKEHOvIWWGEvc=;
        b=WzzrQitVIZaaF4EPnSlfE6Y0INMHwd9HVk83s40UpzvYnZr5EUweJ0A3yEkhv61tEH
         74r6ooCsr3i7VEjBenCCsVj5PwHp0MDIb1ESsDIJe2SyO9T8N2fcYOO55Y3R+oC9y90w
         paeoEg21okEkWb7QjvcRSzuRose0g46zAVQRm+XWBddPvb+xoq2sab9JeNS1ZH1x3uqg
         gO86MeGEOLpORPHe7+32lYejqyD/RqMzBabzPIAs/qgpBsFAxyf9Lkja79QapzOskwX5
         qtEUn0+fgxkBi3hMCSmlvF1lo5ohOcfnfShb2MqT/zkQWKITD6ydqt61NEVFHiBCWLBM
         eFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687873763; x=1690465763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjzAtSsUnoiViDhxlYstizqeG3gV5lHKEHOvIWWGEvc=;
        b=AxFIHJsYksAqR7Q8PQz1ChkAyAsT3MnApJvww/lDZH6KEurIQWTM9OeAsg1UO4tFK3
         ROJ9u5aEsyeKXICyIh55mi3HkJAUbBXAedcQwXMBSNCMKvoFVOlMXAefCRQMRqYwse6w
         7XY9NkLgKpCFK2zzY7YhbiAQh4kYZsIvZNUAKpzti8WPnTjjgz+CwCG7KkXRgrjAzKfK
         dFQWb6fxcn0J16rRPKVUBfXmleB2tBpLMN8+zjZTNPQNMBXw5AFZIXn0WRvibyW0swCK
         G+T3kx9Kd2g6ffBFslXkAb4n4sbDQ5ufV11MgaD2ogrfX6dLrF61OBtADAraMPltpcma
         oUMQ==
X-Gm-Message-State: AC+VfDy1S3t9jvj6pd/sgKu3w5pSicZl9FPcUk8fTI4AunE535IiRlhy
        Qvjv8kJIypGmsYSeUn76e2OKQA==
X-Google-Smtp-Source: ACHHUZ7Duzi+xrx51YKQp39TZMoR7EqaHPBiZwrwYQ3VqHuPl3kJuQw5RSFjzC3QlhXG7gj+iEkyzw==
X-Received: by 2002:a17:907:7b96:b0:973:9f60:c57e with SMTP id ne22-20020a1709077b9600b009739f60c57emr31458434ejc.2.1687873763316;
        Tue, 27 Jun 2023 06:49:23 -0700 (PDT)
Received: from [10.230.170.72] (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id n14-20020a170906118e00b0098ce63e36e9sm4641771eja.16.2023.06.27.06.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 06:49:22 -0700 (PDT)
Message-ID: <90422bdb-4385-b42c-b5f8-541c6c14be6b@linaro.org>
Date:   Tue, 27 Jun 2023 15:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: ci-hdrc-usb2: add
 fsl,picophy-rise-fall-time-adjust property
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, peter.chen@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gregkh@linuxfoundation.org
Cc:     conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-imx@nxp.com, peng.fan@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, jun.li@nxp.com
References: <20230627112126.1882666-1-xu.yang_2@nxp.com>
 <20230627112126.1882666-2-xu.yang_2@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230627112126.1882666-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27/06/2023 13:21, Xu Yang wrote:
> The fsl,picophy-rise-fall-time-adjust property can help to adjust the
> rise/fall times of the high-speed transmitter waveform. The value can be
> 0~3. It has no unit. According to the description of USBNC_n_PHY_CFG1
> register, the rise/fall time will be increased or decreased by a certain
> percentage relative to design default time if a value is given to this
> property.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


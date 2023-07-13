Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9982752013
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jul 2023 13:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbjGMLhy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jul 2023 07:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233390AbjGMLhx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jul 2023 07:37:53 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C328D1980
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 04:37:41 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3159d75606dso706651f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 04:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689248260; x=1691840260;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3afv1tSDU+ds9Iq1atb1848uSvv71WrQkCzCJYr8Bqs=;
        b=tSq8h2z1jv2RYQQbrpUcMJPfWS6sp/lKir2DVDt9mM9qskZiWfnPgd7oSiNUBKfyYy
         YLuRtG9KkSzbuQzOEkv1lcPTMPmGuwVvkAqjHV6Cdm90Jsyfu2yIjZGg/Rs+fokaK+kY
         S7Zw/J4pHwJH3nArFvtTEpZSQZhlEfurqlTUlBu0s0LgWaxkVO4t5zBn/z9sAhQWS8du
         6WcyHesVmsA4n5p4DeiywZmHk503oxOeIYWKIOorrmKgJ1NWQqiX7Z5jUyBIOfo+lrxQ
         BW0ulKZ2Og58U4e+2oz3C04uWD/z6cngbW/nDFdk9myFW+DagCED0iSrAolVJqWRg6YQ
         dQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689248260; x=1691840260;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3afv1tSDU+ds9Iq1atb1848uSvv71WrQkCzCJYr8Bqs=;
        b=TKpsWOyKGoFXi7YXsTXb3ODXmzjhNm+9AGd1JwlKbvYM7hGLMhMEr3iogtAOhF+p4W
         F1vKj3erguDnwbQGS7rVXOeHVyHtuZftnArRQVQre6haRtEU0u1tm5IvIHLXWfmiYJfn
         BWOSLSSy1+kDdQksfIe+F3msBjjr9r4I/sXM4I29NO/k8uxnCgh4N3EWhKd9FS2pHYz9
         jH8vuf8Cgvo6H5yTapEbd/ecGB9qMp4qg00W1MGnN4VXIVKKDQoh3k/ttjldNwA315Pa
         ZgeXZzsa06DIeTiz7rDeeJAcKoV8UA25oCP5VNJIIeVOZla7BeoyYB32qtKtd5CGT5PV
         /rYg==
X-Gm-Message-State: ABy/qLbJIiXv+sqn76s6S25ZLk/Rch9yFAWU4HCwQsD5NwJoL/NJFFkJ
        NSPiFiZIDLDMT9YnEI4IdOB9nw==
X-Google-Smtp-Source: APBJJlGSdUl2/024KdAAcm1SL/4eEW6C1Ed46QDF+qd36ywSCEPwDoG8NweOZ+ffKG0UE87W0Lom6w==
X-Received: by 2002:a05:6000:87:b0:314:449e:8536 with SMTP id m7-20020a056000008700b00314449e8536mr1287763wrx.10.1689248260130;
        Thu, 13 Jul 2023 04:37:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d5182000000b003143aa0ca8asm7748394wrv.13.2023.07.13.04.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 04:37:39 -0700 (PDT)
Message-ID: <da502dd4-2718-ae9c-51c2-7c9da5c3208f@linaro.org>
Date:   Thu, 13 Jul 2023 13:37:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/6] dt-bindings: phy: qcom,m31: Document qcom,m31 USB
 phy
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, p.zabel@pengutronix.de, arnd@arndb.de,
        geert+renesas@glider.be, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl,
        quic_srichara@quicinc.com, quic_varada@quicinc.org,
        quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1689160067.git.quic_varada@quicinc.com>
 <e3a6e5cf68d67637fa541f6dc690dbcabd5e3fec.1689160067.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e3a6e5cf68d67637fa541f6dc690dbcabd5e3fec.1689160067.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/07/2023 13:38, Varadarajan Narayanan wrote:
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq5332-usb-hsphy.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,ipq5332-usb-hsphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: M31 USB PHY
> +
> +maintainers:
> +  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
> +  - Varadarajan Narayanan <quic_varada@quicinc.org>

Still wrong email. You should also receive the bounces, didn't you?

Best regards,
Krzysztof


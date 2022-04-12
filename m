Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38AB74FDFD2
	for <lists+linux-usb@lfdr.de>; Tue, 12 Apr 2022 14:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353991AbiDLMVN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Apr 2022 08:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355119AbiDLMSo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Apr 2022 08:18:44 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE823EF12
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 04:20:05 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id i27so36648697ejd.9
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 04:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pff1FHkCzScGhiiEwscLj/w2S5pj9koRwn3saxgH7gk=;
        b=iMXBoYnS396Cd/Z+uDskKSV6GYGldeE+FiJxAXFy4SMbtEadb6SXLg+SZtCgJFcpwO
         1PswoQ9HFZw0tcMl83sL4QZCUhUHOK/RKv+ZLhynmhwMDsIX0sR0Q0TGvB+jGLEBA1Yk
         +D0LJX/1W7OT+dUU8SH6UFl/w7JyLrIw9ehApCD1x3c8BHI+d8SPXrRcC3GLo2B3pZ8W
         CvLGPPaUnp7Z5e2JvoeyEJOir0Tb8uofelZqeL8wcXDA68yYcj6iaMY3PYZMaTKA6v97
         BKMbd9FmIcVXAQ+ysfy9+gki/rOeNR/6iPLVjkMBl/KuCpn6hn1AuUoTUTy9gXQtbFzJ
         Pwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pff1FHkCzScGhiiEwscLj/w2S5pj9koRwn3saxgH7gk=;
        b=ebuE4KvOrkOCu+fFylxZEmBhdyo8Fs0T6NeTge52FEQMgrt8sfGQ1VWbODe2EKnbVM
         YfDttkrbUWIXCNYCUrnCuk2J+HFdLqzpsHN554ucRozb3ZNschf+rhe5FoyEP3p5cFZ4
         7YxQ76KmkpiJRSun2F6GgIhiBSj1qSpbRBYXATxLx+LeVpRJRhDTJWY9inKizKTPIo6P
         DndJ1p+omg/zE+jFhiTRgBHZm740IFIArNB82eavZddM8GDRKO0EoYtArnqBnKSQ4uoZ
         BFdcwk/H4awd4ePzJG/Pw0xz8r8pgdtL9LDpBWTfNei2f3gBspp0BUzJ3WRaY4qGokkH
         B2Fg==
X-Gm-Message-State: AOAM5321+sPOhhaSKhrAwTohb5BPqm+4FKh4RyDlLiVLcOSL9/hxXC5f
        Ie7VDmN9axlRUvlwKSoWeIWyoEx2hVwtE/DZ
X-Google-Smtp-Source: ABdhPJzNuI3Vu8v6VQW4RdewzbUaT+T480WzP+CA3K9YR5xfQbYVRphQElyLFwUwVG6pacJaYioVKA==
X-Received: by 2002:a17:906:7742:b0:6e8:3f85:4da1 with SMTP id o2-20020a170906774200b006e83f854da1mr22145291ejn.495.1649762404342;
        Tue, 12 Apr 2022 04:20:04 -0700 (PDT)
Received: from [192.168.0.194] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id f3-20020a056402004300b004162aa024c0sm16592968edu.76.2022.04.12.04.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 04:20:03 -0700 (PDT)
Message-ID: <8f4714f8-b528-42d9-de55-aedc1bbc11af@linaro.org>
Date:   Tue, 12 Apr 2022 13:20:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/4] dt-bindings: usb: qcom,dwc3: Add binding for SDX65
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1649761414-19217-1-git-send-email-quic_rohiagar@quicinc.com>
 <1649761414-19217-3-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1649761414-19217-3-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/04/2022 13:03, Rohit Agarwal wrote:
> Add devicetree binding for SDX65 USB controller based on
> Qcom designware IP.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

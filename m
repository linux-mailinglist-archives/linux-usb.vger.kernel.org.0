Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D86BC77D9E7
	for <lists+linux-usb@lfdr.de>; Wed, 16 Aug 2023 07:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241945AbjHPFom (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Aug 2023 01:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241949AbjHPFoa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Aug 2023 01:44:30 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC062117
        for <linux-usb@vger.kernel.org>; Tue, 15 Aug 2023 22:44:29 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so95469701fa.3
        for <linux-usb@vger.kernel.org>; Tue, 15 Aug 2023 22:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692164667; x=1692769467;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p1Cm3rJor+XGdM+JIjydBHGbLEQZZ1g1LuWvc+gZ0Ws=;
        b=aRueGjQacY6wEgWZGOweUYdzMfdD0aYJNkkXYRhF4sNem4ZuqZ0eALGamCCY9cRVfd
         CeN4vPFV/aBN+BL3bnrRR5hZyZxd33Umc7ORjtrImrxYofsVh5EBK7/gu0PK/0iIJgzm
         L4PA1UjhUYi9DEp/canKyjkmCSrJb5pe5YZhWU9xGHfzzWHhgDfKGjHnUwCI0YLnvSvK
         /PrwgXJHZi1TIZIMhnT9eZu3MxYscEwUqAPzV8FxWt39NH2GbQ67x2sVhrcG4e+hhN6O
         Q1ZwScyBzhZcfAKpMIs90B/oKNmGIhgqH5pFU4cPxfs7YKG34yJYCrscL7bwF9Sge9TJ
         fTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692164667; x=1692769467;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p1Cm3rJor+XGdM+JIjydBHGbLEQZZ1g1LuWvc+gZ0Ws=;
        b=Xzca33W5tPbMeCylkJmEEUnHB/QPmbhKYA+Rq6lvKf51z7FbLqVm0A65KYA2Y88hol
         6HmTlCquKIjmWVNhMLoq6MDV0SRg6m+JU48Bi1FYaGXPDABNXt6Dk1H0ovnXWTQ0OznA
         FA91SFEVHRCnyjuv4u2nHTfKJ+EnRgvmK7S6t9tq/bY7qCJorVbvZxsXUny2Kzj5ISfg
         ikQIMR/vFGxtYzjpjKzN+kpbLLm67THi9ZVoOJBBz3O8xEuo8OlDzxbAZ3PrG47QnDLQ
         /dtxndB9+MC6IQYf+iNvMmvB00Rn0B21RYHcam3Iom6piWlsWeM4RhoRltIacQavZDKQ
         xWrQ==
X-Gm-Message-State: AOJu0Yxq3tb5vu5qF7I9GFnOnvzQ6syg7zxWWSSsr86OcpJi+NDygFfE
        dGLO7yjNTQZ55OjZtfgAH80mwg==
X-Google-Smtp-Source: AGHT+IENB/+/1yCrgGPWlxAVOLiWjZiIUENth9HghBcpRunhKp0CjXWEK4UXuzlDgMFSy68BFO/+ZA==
X-Received: by 2002:a2e:9b0d:0:b0:2b9:e501:a6a6 with SMTP id u13-20020a2e9b0d000000b002b9e501a6a6mr819956lji.30.1692164667394;
        Tue, 15 Aug 2023 22:44:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6283000000b00317643a93f4sm19907832wru.96.2023.08.15.22.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 22:44:26 -0700 (PDT)
Message-ID: <a77403f5-8b99-3012-3843-1999ee8d12ce@linaro.org>
Date:   Wed, 16 Aug 2023 07:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 2/3] dt-bindings: usb: snps,dwc3: Add
 runtime-suspend-on-usb-suspend property
Content-Language: en-US
To:     Elson Roy Serrao <quic_eserrao@quicinc.com>,
        gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
        rogerq@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230814185043.9252-1-quic_eserrao@quicinc.com>
 <20230814185043.9252-3-quic_eserrao@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230814185043.9252-3-quic_eserrao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14/08/2023 20:50, Elson Roy Serrao wrote:
> This property allows dwc3 runtime suspend when bus suspend interrupt
> is received even with cable connected. This would allow the dwc3
> controller to enter low power mode during bus suspend scenario.
> 
> This property would particularly benefit dwc3 IPs where hibernation is
> not enabled and the dwc3 low power mode entry/exit is handled by the
> glue driver. The assumption here is that the platform using this dt
> property is capable of detecting resume events to bring the controller
> out of suspend.
> 
> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index a696f23730d3..e19a60d06d2b 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -403,6 +403,11 @@ properties:
>      description:
>        Enable USB remote wakeup.
>  
> +  snps,runtime-suspend-on-usb-suspend:
> +    description:
> +      If True then dwc3 runtime suspend is allowed during bus suspend
> +      case even with the USB cable connected.

This was no tested... but anyway, this is no a DT property but OS
policy. There is no such thing as "runtime suspend" in the hardware,
because you describe one particular OS.

Sorry, no a DT property, drop the change entirely.


Best regards,
Krzysztof


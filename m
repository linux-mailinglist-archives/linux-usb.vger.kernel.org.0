Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E13758DFB
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jul 2023 08:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbjGSGj1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jul 2023 02:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbjGSGjY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jul 2023 02:39:24 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3941FD8
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 23:39:22 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51e5e4c6026so9262495a12.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 23:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689748761; x=1692340761;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FkYcA/qG9jmDR//bHA4TMNeynT6TeOA+h1nLtEf6hYw=;
        b=JjlB3wjWE06Kz96Bwnsiuf10N99M+n4lkVQzefLjb/9vTzHznBONpd+6Qji16CkyT6
         kNIh4Y2d5xOsOWj0jVRyhH5STDoLXBit8aXZkw/ztDSPpfQxGc/uvmtiUS+/mX1ZKv3p
         PbaxGm9pWLFUNRxY5enilifh765Kk8HX9JGESqfl+LbjqDB9JmM+tILofgD64OccmNaE
         35TYRpCehDVBIdbHK1GaUld57csHY1RefRRo2CmPq8GRqGyEp1fkZN6QtXXTSqvLvQjo
         rPxKAJXDycMQHoSrVdiWpwQ8zxpORiHCZ1DPntyBFWHDQngAdwBy1OU4GwXH7D5des68
         XB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689748761; x=1692340761;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkYcA/qG9jmDR//bHA4TMNeynT6TeOA+h1nLtEf6hYw=;
        b=XmAdBSHM5eofjXX4iUgYKzSbL3Uv89IyT4fuwCfqMjtcTaKF202LSA0rLWHNoHYmAh
         2v5U5kHi1LDMSfxEobolaLphHyd/yGbOfJi2tSgNXPxeLpLfF8PWIQwDPFCQZj7vCqPV
         l6YC7qAM8ty/SmGRgWwQWxaX6ZHTS+5l3GDlw5ahQGtLvPLzrfZwdGbqjgul7RnqazVJ
         pO8o0+/LQUgW3Pw/cQeIyLR1NhSUXhB/ZwRXbMzqV0WaTFop+4togrLLI3fCcyK0IyFt
         gxiIhmr55BnEwotcM1NrALQP1c0WQZdWETMheun9Q8jHBcK0E6SBTsULUmi0C/8k/50h
         POpA==
X-Gm-Message-State: ABy/qLbPID+GzyXL5RtYuW3optOaQzOtbsaGnXMSYu7sN/i6LJ887HUH
        XD7UhiHngwoPmUqUxXxslkzLeg==
X-Google-Smtp-Source: APBJJlFeM5UlgZygOPuiVhdu1mcPY3p3Gj/OOrFdxdWDZUSCCBvwFF58vuybpXJ6JQqTIHleL9Am7Q==
X-Received: by 2002:a17:906:2457:b0:987:5147:7498 with SMTP id a23-20020a170906245700b0098751477498mr1651514ejb.32.1689748760757;
        Tue, 18 Jul 2023 23:39:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709061b4100b00982a92a849asm1894498ejg.91.2023.07.18.23.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 23:39:20 -0700 (PDT)
Message-ID: <488835c0-e08e-c0cc-abac-192f658b093f@linaro.org>
Date:   Wed, 19 Jul 2023 08:39:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] dt-bindings: usb: dwc2: add compatible
 "intel,socfpga-stratix10-hsotg"
Content-Language: en-US
To:     Meng Li <Meng.Li@windriver.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dinguyen@kernel.org, hminas@synopsys.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20230719025509.3007986-1-Meng.Li@windriver.com>
 <20230719025509.3007986-4-Meng.Li@windriver.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719025509.3007986-4-Meng.Li@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/07/2023 04:55, Meng Li wrote:
> Add the compatible "intel,socfpga-stratix10-hsotg" to the DWC2
> implementation, because the Stratix DWC2 implementation does
> not support clock gating. This compatible is used with generic
> snps,dwc2.
> 
> Signed-off-by: Meng Li <Meng.Li@windriver.com>

Missing changelog, missing versioning. This is v3 or v4.

> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
> index dc4988c0009c..f90094320914 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -51,6 +51,7 @@ properties:
>                - amlogic,meson-g12a-usb
>                - amlogic,meson-a1-usb
>                - intel,socfpga-agilex-hsotg
> +              - intel,socfpga-stratix10-hsotg

So you just sent the same patch as before. I pointed you to the proper
solution with compatibility.



Best regards,
Krzysztof


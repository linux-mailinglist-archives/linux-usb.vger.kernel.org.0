Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6215FFA9E
	for <lists+linux-usb@lfdr.de>; Sat, 15 Oct 2022 16:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiJOOxJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Oct 2022 10:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiJOOxI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 Oct 2022 10:53:08 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6AE1ADAF
        for <linux-usb@vger.kernel.org>; Sat, 15 Oct 2022 07:53:06 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id f14so5021178qvo.3
        for <linux-usb@vger.kernel.org>; Sat, 15 Oct 2022 07:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=88WC5jIChAYLUSvt04TISDWdxjeq13jePC9D4qLSNO0=;
        b=tyXyF6TXOsCJlKTa0DfLiNo4wrtdicZqB037P7Iqhh40t4rHXSt5NCsmv52NIqotJA
         wrSTm/GNFPzIRJufPCIe2D4EYoL+3aUEgcFx3tLH336OF/+h4lG0st1KAwGTl6uVRsQ9
         wfh9e+eOj2zPn1DYcT7gbsxzIR9+z6InGiSklalVTr1A5Hho0VTcasDTEgeRZdxn2ax1
         lgb8mfv8Yrhp8ea9nFu9cG4fSnOElwhx53owZj8TVkhK4eSrkGN62PWRXtXcAzxAYpxt
         0gvgcDQO8w9/yXpkT3HGcJlqNPIGCB36RPHHxeEgwTMcUrIPgLctPXMVv5wGiA0iWdMR
         zoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88WC5jIChAYLUSvt04TISDWdxjeq13jePC9D4qLSNO0=;
        b=zyD+lGpYaXrl5taqdmiPcNuScIt1lcSSfQ8V9kqaZ8/oTWWcFhdj4Qcwyk5j1OifI5
         uooMU4022biSvzkNJfPASW68jAvmImFaxnoIRETuVz9VPQEvbqolqOqNNEz1AmUSNz+o
         Z+uQLd50i5fzwION9rwY0BmVCA1Rts2FfPFo4zio3R3kVlRVPHDlwISRGrNx8xO55ISH
         DJ246g6uFMm2nw4mLeYxQPkDtSc8+XvoMwh/PlSxNeeg7rgICti0n0n1YGNYDDUJ6FNX
         QCCj4Nzi3V/2IlNiUJjOd0T7XyMrPEuwXK37tciQy7mZzqLhGk5VESqGYqxPw/fk5RKj
         6BZw==
X-Gm-Message-State: ACrzQf2UqcMfSawmSFK5j/d+S1daNz9XsDgHM2wtOeflq2VaYHqhC3zC
        sLDp4r6cc0rQwtjgiNJSmWWcFA==
X-Google-Smtp-Source: AMsMyM47JDNqgPT1g5fQYVnWpWDb0wXQ4D/OB5heLkv4SDyCO2WY62hNqcOsXuClKenn9tb13LDSwQ==
X-Received: by 2002:a0c:8ccc:0:b0:4b2:382e:ddaa with SMTP id q12-20020a0c8ccc000000b004b2382eddaamr2245679qvb.33.1665845585780;
        Sat, 15 Oct 2022 07:53:05 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9477:c2f0:ddea:ea08? ([2601:42:0:3450:9477:c2f0:ddea:ea08])
        by smtp.gmail.com with ESMTPSA id u9-20020ac80509000000b00399813f4d5bsm4016472qtg.72.2022.10.15.07.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 07:53:05 -0700 (PDT)
Message-ID: <359bc301-fed6-80eb-6945-caeb7fbb319d@linaro.org>
Date:   Sat, 15 Oct 2022 10:53:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH V2 1/6] dt-bindings: usb: usbmisc-imx: convert to DT
 schema
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, xu.yang_2@nxp.com
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jun.li@nxp.com, Peng Fan <peng.fan@nxp.com>
References: <20221014095148.2063669-1-peng.fan@oss.nxp.com>
 <20221014095148.2063669-2-peng.fan@oss.nxp.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014095148.2063669-2-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14/10/2022 05:51, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert usbmisc-imx to DT schema format.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/usb/fsl,usbmisc.yaml  | 52 +++++++++++++++++++
>  .../devicetree/bindings/usb/usbmisc-imx.txt   | 18 -------
>  2 files changed, 52 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/usb/usbmisc-imx.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> new file mode 100644
> index 000000000000..c83ffb6729b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/fsl,usbmisc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX non-core registers

You sent v2 before we finished this topic. Is it correct? Even if TXT
had such title, let's don't keep the wrong name.

If it is non-core registers, why it is in USB? Why it is an usb-misc device?

> +
> +maintainers:
> +  - Xu Yang <xu.yang_2@nxp.com>
> +

Best regards,
Krzysztof


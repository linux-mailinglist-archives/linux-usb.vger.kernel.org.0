Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33A38658BA6
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 11:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233318AbiL2KZE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Dec 2022 05:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233194AbiL2KYh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Dec 2022 05:24:37 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D67E13DDB
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 02:23:05 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b3so26960379lfv.2
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 02:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xT1pcIHoVC+1Kb3uKk2wZih8Ww6QX+aLdKaotJW20mU=;
        b=NxVs//1rsJfC8Xq6Fxx8I/9s10fHxROXpoiHgzhOwM/wFk2aGYViA9Bd8tVJ1z9wXF
         rUljgrbdKizmoFK4g105uBaUZKD9tDjMeSLM6/jKe3ZNUi1aPLmyU+/F7gZF5xbedLny
         R8oKCUwJ3qA2GQMEGU5wbsBte813yqJs6TSdHqoms0VJmgIS8oqdCuH73svzQxrD/et2
         anJFvY02Pt8ZQ9NKYGXkSysMzxdWyH99OAmqOroNRKsm1zKv1/0O2IqL/lJOqzujtM+u
         O9baICV29kw4+NcAPMXjJ+ybVRv1dKNnBe4+PDcNyUxcVeb3y+F86uBSVx32iEWW5cuc
         PCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xT1pcIHoVC+1Kb3uKk2wZih8Ww6QX+aLdKaotJW20mU=;
        b=TinfpWBIgbNTX7I4LgRvkEM6haN3Vp69gv2MRjsLiD8Oqrp3DvavFCo0MaVUbTrh/5
         ELGeTvOO8yNJBaYoLrvpplPhtWkgWmKkotbMy/l5hZ0g2PpuPT9mHWC2VvMdqj1rJ/eq
         LQGZLhVPFZYHKY6KOGrWVzjk/dbHCpXkVmfMMBs48UQEsbFJkAd5CbqHBAYLrtiTOMc7
         85ROsPIjw9vsqvO7bOu9vEV3EPza+k2YR1HrgChogAfEc3xKqKqavMhgPZqZp7kYsiQY
         sO1kuG86KJJkkkcn/vBrRsklYI+pLAf8id4X91GlpvliZUy+RsHwXwRIVdWUZOPsbSSv
         CiCA==
X-Gm-Message-State: AFqh2kqfhavIHEgnV0jqZjnmouTYhzqEVHoZzLg6x7XoocEEE06xSBZG
        U/Mg3OoD9OnEd4TuA2IrEB3hrw==
X-Google-Smtp-Source: AMrXdXuejIrgLC617Mnl3g4WkCNbIZz1YM58zJh2SFp42JdgDiuwOxHKRRlnkX9vo6cIau7UJ5fAuQ==
X-Received: by 2002:a05:6512:4005:b0:4b5:9183:5ad0 with SMTP id br5-20020a056512400500b004b591835ad0mr10354256lfb.63.1672309383759;
        Thu, 29 Dec 2022 02:23:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s16-20020a056512203000b004b4a0482a53sm2986603lfs.231.2022.12.29.02.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 02:23:03 -0800 (PST)
Message-ID: <f9b59733-61b1-67d8-01fa-fb3d3d7fbe0e@linaro.org>
Date:   Thu, 29 Dec 2022 11:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v2 3/3] dt-bindings: usb: snps,dwc3: add generic-xhci
 as child
Content-Language: en-US
To:     Daehwan Jung <dh10.jung@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, sc.suh@samsung.com,
        taehyun.cho@samsung.com, jh0801.jung@samsung.com,
        eomji.oh@samsung.com
References: <1672307866-25839-1-git-send-email-dh10.jung@samsung.com>
 <CGME20221229100416epcas2p18f7600737b8f4149a1d75d2d8db3317a@epcas2p1.samsung.com>
 <1672307866-25839-4-git-send-email-dh10.jung@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1672307866-25839-4-git-send-email-dh10.jung@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 29/12/2022 10:57, Daehwan Jung wrote:
> Currently, dwc3 invokes just xhci platform driver(generic-xhci) without
> DT schema even though xhci works as child of dwc3. It makes sense to add
> xhci as child of dwc3 with DT schema. It also supports to use another
> compatible in xhci platform driver.

You use some driver as an argument for hardware description, which is
not what we need. Describe the hardware.

> 
> Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
> ---
>  .../devicetree/bindings/usb/snps,dwc3.yaml    | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 6d78048c4613..83ed7c526dba 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -360,8 +360,22 @@ properties:
>      description:
>        Enable USB remote wakeup.
>  
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  ranges: true
> +
>  unevaluatedProperties: false
>  
> +# Required child node:
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    $ref: generic-xhci.yaml#
> +    description: Required child node

DWC does not have another piece of controller as child... DWC is the
controller. Not mentioning that you now affect several other devices
without describing the total hardware picture (just some drivers which
is not that relevant).

> +
>  required:
>    - compatible
>    - reg
> @@ -388,4 +402,19 @@ examples:
>        snps,dis_u2_susphy_quirk;
>        snps,dis_enblslpm_quirk;
>      };
> +  - |
> +    usb@4a200000 {
> +      compatible = "snps,dwc3";
> +      reg = <0x4a200000 0xcfff>;
> +      interrupts = <0 92 4>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      xhci: usb@4a200000 {
> +        compatible = "generic-xhci";

There are no such device...

> +        reg = <0x4a200000 0x7fff>;
> +        interrupts = <0 92 4>;
> +      };
> +    };
>  ...

Best regards,
Krzysztof


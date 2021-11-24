Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A7745B2B4
	for <lists+linux-usb@lfdr.de>; Wed, 24 Nov 2021 04:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbhKXDkQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Nov 2021 22:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240852AbhKXDkQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Nov 2021 22:40:16 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 253F0C06173E
        for <linux-usb@vger.kernel.org>; Tue, 23 Nov 2021 19:37:07 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso2183594otf.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Nov 2021 19:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cSojQgWVI70xFELLZ9LKlswFsQwLPJCCjKLcraHpAns=;
        b=DT6reKslBDazrRcxRvN7xpxlNXt0ujE1ASiyQXjVfRlovHjjtBHcFzok+Ujg4fYhBv
         ryLGo4w7+JwD5vhQdZw/4NPDyEpeJF++10wr0vm7loxvvW6EMXgIbQcjC/Z1FNvgHvQd
         eg/ZP9QivEaZ4WLwO0CjMK79P9zm0yt1/MK6PQotF+9Z7Hb6AHBy+Stbd28pT4pphxu1
         bkmNPsEtqbi9dpnxQr825ScQ/NTI/E+lQ6VVCle/KSM9eYirVfwlcLthEyXrmLigbbja
         SQcJlJ/7jhRFYqzB/y4YT3qvpz/wLRQ1YsEPMBXedqskO7DuWKHcAD/wUamJa/Ehqhnm
         GT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cSojQgWVI70xFELLZ9LKlswFsQwLPJCCjKLcraHpAns=;
        b=zM6cF+jjDuOOaWFbNLFu1h0ADvsApXDCErvVshGqzkuwT886sPJOesjhrkJFfdFosm
         5IDRwgLC8zj3dhSFY2X5KQD8fESMWEf0SFg4KbWcGad0DVE3Vd/GP2dUTKVOSMKyIVTL
         4X9i7Em4k0qFX1duftgXcMF7fUInadOAhdf3HPHQxzJl2B38TJ38EgSStXR46Vvbz+87
         aaaqpD6+ECy1grA9YtV0t7WSgxXHisvztbX4jrloKrwujCgIcPWBr5z059tSW9+E/kFJ
         gWd4o3HPjCsS9QMLuxiXcvhk0Y7FKJwxTbTgluXHzjPIvtvsqkvKcsMgyty9SSYWB+VM
         OtnA==
X-Gm-Message-State: AOAM530/W+oyCBBx9JMudnnEmHVHwEGVprzEVs9fZg+JfghFe0rtLiD+
        cnZ7DDXX80RoWFeBhwSx187JLw==
X-Google-Smtp-Source: ABdhPJzzJsQtWENwW+RRtXMsmysbAYT6Nhcrzvh3DI3n8gae24yorvr4VWITF/xXj/IuFzSRZ68Avw==
X-Received: by 2002:a9d:61d4:: with SMTP id h20mr9728757otk.202.1637725026311;
        Tue, 23 Nov 2021 19:37:06 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bj8sm3020632oib.51.2021.11.23.19.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 19:37:05 -0800 (PST)
Date:   Tue, 23 Nov 2021 19:38:47 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, pure.logic@nexus-software.ie,
        greg@kroah.com, linux-kernel@vger.kernel.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org, rnayak@codeaurora.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        quic_schowdhu@quicinc.com
Subject: Re: [PATCH V1 1/8] dt-bindings: Add the yaml bindings for EUD
Message-ID: <YZ2zx4/8+yCcls/G@ripper>
References: <cover.1637639009.git.schowdhu@codeaurora.org>
 <472de38309fd5d773f903f7a0cfb4440ae1dd380.1637639009.git.schowdhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <472de38309fd5d773f903f7a0cfb4440ae1dd380.1637639009.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon 22 Nov 20:28 PST 2021, Souradeep Chowdhury wrote:

> Documentation for Embedded USB Debugger(EUD) device tree
> bindings in yaml format.
> 
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> new file mode 100644
> index 0000000..724552c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,eud.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Embedded USB Debugger
> +
> +maintainers:
> +  - Souradeep Chowdhury <schowdhu@codeaurora.org>
> +
> +description: |

The '|' indicates that the formatting is significant, but it's not.

> +  This binding is used to describe the Qualcomm Embedded USB Debugger, which is
> +  mini USB-hub implemented on chip to support USB-based debug capabilities.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,sc7280-eud
> +      - const: qcom,eud
> +
> +  reg:
> +    items:
> +      - description: EUD Base Register Region
> +      - description: EUD Mode Manager Register
> +
> +  interrupts:
> +    description:
> +      EUD interrupt
> +
> +

Drop one of these two empty lines please.

> +  port:
> +    description:
> +      Any connector to the data bus of this controller should be modelled
> +      using the OF graph bindings specified, if the "usb-role-switch"
> +      property is used. See graph.txt

This description does unfortunately not help me to understand what to
point this port to.

What's "the data bus"?

Is usb-role-switch a property to be put in this node? Doesn't it need to
be mentioned as a valid property?

> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    eud@88e0000 {
> +           compatible = "qcom,sc7280-eud","qcom,eud";
> +           reg = <0 0x88e0000 0 0x2000>,
> +                 <0 0x88e2000 0 0x1000>;

The example is compiled with #address-cells == #size-cells == 1, so drop
the four lone 0s from the reg.

Regards,
Bjorn

> +    };
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 

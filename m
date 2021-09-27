Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFED419ECC
	for <lists+linux-usb@lfdr.de>; Mon, 27 Sep 2021 21:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235819AbhI0TC1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Sep 2021 15:02:27 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:39609 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235693AbhI0TC0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Sep 2021 15:02:26 -0400
Received: by mail-oi1-f175.google.com with SMTP id a3so26910042oid.6;
        Mon, 27 Sep 2021 12:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3ZLzcZefcsSNoUH8+eqz/u6GfOHxaYYcKo55P/iMgSE=;
        b=jLT617AaRUMaQoggtczbLncKluPZ34b/wLHpHou/r8bhsEJ1ntc3uVjRpguVUdqFcg
         Jxh99Xw0/sRs9hDS2xrAI29zkFBppbnc+yhxiUDgvG6NVDpUJQQhBL3hrZIGEeVvXNF7
         cU+MFhhRBldN72FwV2swdfzLATMoMA2mmbALJgvopvXs32qpj0yDyqBzs57W9cYRUnZh
         /0VUxKagJmnF7crufQVO5rPCxzhJfbsjM1nhbLuMz2y3OAmMt/UQEl2RTj2rsaJoHBPn
         mZQF4biNp6rhfD/VdYGcCYPlMAzC34wV7ABePiDoW/RYp8hxQe5rz0iJWrhxOPS2GvZ+
         +stw==
X-Gm-Message-State: AOAM5313nNWBEklIo8c8hL6cn1vEAsLxD96/YImp4rPFs4s+P5Omr5MO
        4BY7eLRu4rZvUCNuoc6VFQ==
X-Google-Smtp-Source: ABdhPJztunahmm91WjGv8lkmKizseoxUnp9C/P7jH+iQr6pg93ZYYrZLchm7E3kGvDHuGwh0LtGg4Q==
X-Received: by 2002:aca:d6cc:: with SMTP id n195mr510866oig.116.1632769247699;
        Mon, 27 Sep 2021 12:00:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a19sm2850790oic.25.2021.09.27.12.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 12:00:47 -0700 (PDT)
Received: (nullmailer pid 3669168 invoked by uid 1000);
        Mon, 27 Sep 2021 19:00:46 -0000
Date:   Mon, 27 Sep 2021 14:00:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, shubhrajyoti.datta@gmail.com,
        git@xilinx.com
Subject: Re: [PATCH v3 1/2] dt-binding: usb: xilinx: Add clocking node
Message-ID: <YVIU3gnpGe8JVdz/@robh.at.kernel.org>
References: <cover.1632307026.git.shubhrajyoti.datta@xilinx.com>
 <625a34188da7fcc4132b8717afd3d69e6bdc3316.1632307026.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <625a34188da7fcc4132b8717afd3d69e6bdc3316.1632307026.git.shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 22, 2021 at 04:41:25PM +0530, Shubhrajyoti Datta wrote:
> Add a clocking node for xilinx udc.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  Documentation/devicetree/bindings/usb/xlnx,usb2.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
> index b8acc415eaf1..39213806ac79 100644
> --- a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
> @@ -24,6 +24,14 @@ properties:
>        If present, hardware has dma capability.
>      type: boolean
>  
> +  clocks:
> +    minItems: 1
> +
> +  clock-name:

I think you meant 'clock-names'.

> +    const: "s_axi_aclk"

Don't need quotes.

> +    description: |
> +      Input clock name.

That's every 'clock-names'. You can drop description.

> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.25.1
> 
> 

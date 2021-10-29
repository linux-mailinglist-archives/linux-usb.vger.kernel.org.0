Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83C543F4D0
	for <lists+linux-usb@lfdr.de>; Fri, 29 Oct 2021 04:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhJ2CLg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Oct 2021 22:11:36 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:33689 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbhJ2CLf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Oct 2021 22:11:35 -0400
Received: by mail-ot1-f52.google.com with SMTP id 107-20020a9d0a74000000b00553bfb53348so11540229otg.0;
        Thu, 28 Oct 2021 19:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cWT55KoR46afDHHTQr+hX72a4Tyq57TAn7zjfIMOc1U=;
        b=N/VM1+wY2gfoSxEOhetbz+TCZViHfSkDOxzwU/Z9gSjXhzUew2nA/TxQQCDVB28aiv
         kKOJ+4MPzajB7P0t0RM3HJV/sHQbSW2P4MtzztIXmNunRv6CsPEaJf1NJwTQI1SQ3lc0
         AXxke5mOHa4bYEDMuwScCUFwxNuRooOJXnJc2gyvDWkbriaQYOMFGNSbU2nCgfkWaRkB
         KBXWARoABMG/915LxLOcYnSRbYZXesDXTkK7NV7773zqv/1kRRJTJS96tPna4pn1plmY
         NIKhBo57/L4DYK6q9m7N28xdMuv15L7M5gn/ruipnERNDfaLygVNFToSrZq1nsVSk4Ul
         uKwA==
X-Gm-Message-State: AOAM530h6e1FIQegXetdQEuOFzMi0wcLfjoxudRg2qHV54wrPSdVKzKJ
        kc//aERJAhTu1u7CqfazSyKiQnO9lA==
X-Google-Smtp-Source: ABdhPJzaWCjjFr1fS5Jxk1z/oZsTLBNd6jBpfBqk1GK/TBDa+H96OL9Ovs2kTaM8jPuEgKUqN2sM9g==
X-Received: by 2002:a05:6830:4106:: with SMTP id w6mr6385835ott.55.1635473347721;
        Thu, 28 Oct 2021 19:09:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w18sm1695511ott.29.2021.10.28.19.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 19:09:07 -0700 (PDT)
Received: (nullmailer pid 1015369 invoked by uid 1000);
        Fri, 29 Oct 2021 02:09:06 -0000
Date:   Thu, 28 Oct 2021 21:09:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: dwc2: Add otg-rev property
 documentation
Message-ID: <YXtXwhXcGOqj8Pv8@robh.at.kernel.org>
References: <20211024003652.227772-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211024003652.227772-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Oct 24, 2021 at 02:36:52AM +0200, Marek Vasut wrote:
> Copy the otg-rev property documentation from usb-drd.yaml into the DWC2
> binding document, since some users of the DWC2 IP like STM32MP1 use the
> otg-rev property in DT bindings for this controller.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> NOTE: Shouldn't this somehow be part of the USB core bindings instead?

Yes, usb-drd.yaml IIRC

> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
> index 10c7d9b6cc53f..254436c19870b 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -120,6 +120,16 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      description: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
>  
> +  otg-rev:
> +    description:
> +      Tells usb driver the release number of the OTG and EH supplement with
> +      which the device and its descriptors are compliant, in binary-coded
> +      decimal (i.e. 2.0 is 0200H). This property is used if any real OTG
> +      features (HNP/SRP/ADP) is enabled. If ADP is required, otg-rev should be
> +      0x0200 or above.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0x0100, 0x0120, 0x0130, 0x0200]
> +
>    snps,need-phy-for-wake:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description: If present indicates that the phy needs to be left on for 
> -- 
> 2.33.0
> 
> 

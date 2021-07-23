Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80BE83D42B9
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 00:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbhGWVfC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 17:35:02 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:41602 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbhGWVfC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jul 2021 17:35:02 -0400
Received: by mail-io1-f54.google.com with SMTP id r6so4271067ioj.8;
        Fri, 23 Jul 2021 15:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8VpOpdMI56wWAkj6aPBnW7egxkynjdSmdBCLRJSRl6I=;
        b=Y83/d5Ma+n046lokRe7Qrj/KbG3Lfu8Ci1+yNRLwqHFt0mpWhGASNgP9reoKCQeqh+
         p1amMK+8MVcWUeVH/YeYhHTHX+kgRFTWEtCUtJtHIB9T978eXcAeDO7ZvbOZChZ5bMcX
         sACKPkfTx7BuS1dGyplxHxzPZzLilzoJpaC9H8pOOym5O/iwdpPk6W4nyYEcUJljdwfR
         VQcdZ1/eEgW7b90huSzcehnuGel/MwcmugMIisGikHuy3JXRE0YHpPYQo8up+vHdgDZD
         6xWNNY1H58qewV2oExns7xC1GoY8DcnnMI8HfzvdbtJsrCwAxUJ7l4vqsNbB18akv0sb
         codA==
X-Gm-Message-State: AOAM53246WA560vH/pu7GRRrbCpSlwN1OXCIykDM6QgTGIhusYWUpUjB
        pQkdUq+6fD7Lod1Ei+eWCA==
X-Google-Smtp-Source: ABdhPJxR6Rd6/8jGdufV11O47kcty8d3BHkNbsWeraol8KOjCzvkehOf/GjlJN9WblKe/cu4kXhiDQ==
X-Received: by 2002:a5d:8186:: with SMTP id u6mr5498860ion.45.1627078534202;
        Fri, 23 Jul 2021 15:15:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w17sm14659643iom.20.2021.07.23.15.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 15:15:33 -0700 (PDT)
Received: (nullmailer pid 2693115 invoked by uid 1000);
        Fri, 23 Jul 2021 22:15:30 -0000
Date:   Fri, 23 Jul 2021 16:15:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 35/54] dt-bindings: usb: dwc3: Fix usb-phy check
Message-ID: <20210723221530.GA2684283@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-36-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-36-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 21, 2021 at 04:04:05PM +0200, Maxime Ripard wrote:
> The original binding was allowing any combination of usb2-phy and
> usb3-phy in the phys and phy-names properties.
> 
> However, the current binding enforces that those properties must be a
> list of usb2-phy and usb3-phy, with exactly one element, effectively
> making usb2-phy the only value being valid.

Huh? If 'maxItems' is not specified, then it's the length of 'items' 
list.

> Let's rework the properties description to allow either one or two
> element picked with values either usb2-phy or usb3-phy. The rest of the
> tooling makes sure that we don't get any duplicate value, so this should
> be what we want.

Is it really valid to have only a USB3 PHY and what you want here? That 
would mean the USB3 phy also handles USB2, right?

> 
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 41416fbd92aa..6c3f7c9a76c0 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -73,15 +73,15 @@ properties:
>  
>    phys:
>      minItems: 1
> -    items:
> -      - description: USB2/HS PHY
> -      - description: USB3/SS PHY
> +    maxItems: 2
>  
>    phy-names:
>      minItems: 1
> +    maxItems: 2
>      items:
> -      - const: usb2-phy
> -      - const: usb3-phy
> +      enum:
> +        - usb2-phy
> +        - usb3-phy
>  
>    resets:
>      minItems: 1
> -- 
> 2.31.1
> 
> 

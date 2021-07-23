Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47D03D42BB
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 00:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbhGWVfT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 17:35:19 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:38740 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhGWVfS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jul 2021 17:35:18 -0400
Received: by mail-io1-f53.google.com with SMTP id a13so4304170iol.5;
        Fri, 23 Jul 2021 15:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S6atiZy6VypfYRyyoiAFZUAaayfcl2QZSjEkS2K+r1M=;
        b=r6dwD/V6cB9zFXHNSWcmpcCmt1Ya4Tn1dJQwh34jiP9wfLMEXPqCrhZsxDj5pnRwUV
         Ir5F+fwNBqXXrUN+lq+SI3CVj3845wutn+sPwBGXcjbwXQ8wo9fRNDtLM1DB7FuGIIB1
         Vaqizkh6gB79UL7LmALeSmjgWMSON6vqQOuF8e7UAfEZAZi/J3RLYLTuAwsMA7V0Sk8y
         LAD/QZVVVDuOYFXFYaJvd1LDXstgqhUCz4Il5hk/mQkld4DfQHE9sg8/N8LhXE418tDf
         Qdy2OKhKJHMrlnU+EnLhVwJN+k/Wql11+iJZ6dxM3XYeN9F4ASNufrLi/pFQvj40HGmZ
         5K/g==
X-Gm-Message-State: AOAM533vG2StAaJCTXuefaIG7VskKyomVxUMCGdmYXipILs8/ykr1LSp
        SQR5UOxwgl7lSC7yV6+S8g==
X-Google-Smtp-Source: ABdhPJz/RBxHecvP3wDiuoizRl74o3YJWWDHXYF12X7/VWeGhbpw4BJHDZnMvOZTqimwhluESaHbQg==
X-Received: by 2002:a02:11c6:: with SMTP id 189mr5912610jaf.20.1627078550369;
        Fri, 23 Jul 2021 15:15:50 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f16sm16997853ilc.53.2021.07.23.15.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 15:15:49 -0700 (PDT)
Received: (nullmailer pid 2693690 invoked by uid 1000);
        Fri, 23 Jul 2021 22:15:47 -0000
Date:   Fri, 23 Jul 2021 16:15:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-usb@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 36/54] dt-bindings: usb: ehci: Add Allwinner A83t
 compatible
Message-ID: <20210723221547.GA2693660@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-37-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-37-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 21 Jul 2021 16:04:06 +0200, Maxime Ripard wrote:
> The A83t EHCI compatible was introduced in device trees, but it was
> never documented.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

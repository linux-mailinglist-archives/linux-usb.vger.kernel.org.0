Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4164A2A09B8
	for <lists+linux-usb@lfdr.de>; Fri, 30 Oct 2020 16:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgJ3PZs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 11:25:48 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42058 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726624AbgJ3PZs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Oct 2020 11:25:48 -0400
Received: by mail-oi1-f194.google.com with SMTP id w145so1352469oie.9;
        Fri, 30 Oct 2020 08:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eVlfecRsljnFgbFMOUHTKFb6JlrnJizsfjizeraSx2o=;
        b=Zn2C3DcgXRmi9Nv1NfCbjy2ES2Pz0noBT7vQBaGI7XAa2jPd3NGuL5oFwky9w34j3d
         5Up5LILV5/mLd0XYzgD3sPC5AaayJmdHoPmB56A3nYAog5vCJVXMC1mCh8k8vOe2Lhz9
         tSfxPBmngriefalml9YUuCPgPJtUC2YyH9Lsyup5yxsLZIowVNcWTzk3W5hk27X/k2Dj
         GiOtdJtpooh7yqlOZN22n/JI481sdJYBmlqDNUy4ntsvRuJDHh95yOizDZ8HC9C5UHif
         ROhNvfyIytG+proIw2riL7ISxmc5IQ3/HpsF6y1biCO29lCGTflw80VjK8JiVz26G5GC
         6nnw==
X-Gm-Message-State: AOAM530P6zzgHW92BAbiAXRy5RvJV/jBunK2a4o1RxOW2cx4D3Ibw6DN
        pNT10iXMeZ6WjYJJBJRUjkD2rZGgvg==
X-Google-Smtp-Source: ABdhPJxXBgaKbqBl7GF61BxhMK2M/RRjdqELmL6mXKvw40yfLS+Dm7gjILFxFQfXKCwxeQvxRQco5w==
X-Received: by 2002:aca:b644:: with SMTP id g65mr1930080oif.164.1604071546089;
        Fri, 30 Oct 2020 08:25:46 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 61sm1399602otc.9.2020.10.30.08.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 08:25:45 -0700 (PDT)
Received: (nullmailer pid 3873227 invoked by uid 1000);
        Fri, 30 Oct 2020 15:25:44 -0000
Date:   Fri, 30 Oct 2020 10:25:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: usb: Add undetected disconnection
 quirk
Message-ID: <20201030152544.GA3868912@bogus>
References: <770d7a50caad241f07d656e29e89e282f727f5da.1603343705.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <770d7a50caad241f07d656e29e89e282f727f5da.1603343705.git.Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 21, 2020 at 10:15:43PM -0700, Thinh Nguyen wrote:
> Synopsys DWC_usb3x host controllers will not detect enhanced super-speed
> (eSS) device disconnection if it has active isochronous IN endpoint(s)

Why do you need a DT quirk if it's all DWC3? Imply it from the 
compatible.

> behind one or more eSS hubs. Introduce a quirk to workaround this for
> xhci and dwc3 device tree.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt     | 3 +++
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 2 ++

These are getting converted to schema.

>  2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 1aae2b6160c1..b23b52f5842a 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -105,6 +105,9 @@ Optional properties:
>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>  			enable periodic ESS TX threshold.
> + - snps,blocked-disconnection: enable workaround to undetected disconnection
> +			while isoc endpoint(s) are active for DWC_usb3x
> +			controllers operating as host

We certainly don't need 2 versions of the same property.

>   - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
>   - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 0c5cff84a969..60812ae74d46 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -28,6 +28,8 @@ Optional properties:
>    - quirk-broken-port-ped: set if the controller has broken port disable mechanism
>    - imod-interval-ns: default interrupt moderation interval is 5000ns
>    - phys : see usb-hcd.yaml in the current directory
> +  - blocked-disconnection: workaround undetected disconnection while isoc
> +		endpoint(s) are active
>  
>  additionally the properties from usb-hcd.yaml (in the current directory) are
>  supported.
> 
> base-commit: 270315b8235e3d10c2e360cff56c2f9e0915a252
> -- 
> 2.28.0
> 

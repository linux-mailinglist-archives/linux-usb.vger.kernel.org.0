Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3179A2A09A5
	for <lists+linux-usb@lfdr.de>; Fri, 30 Oct 2020 16:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbgJ3PWU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 11:22:20 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44531 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbgJ3PWU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Oct 2020 11:22:20 -0400
Received: by mail-ot1-f66.google.com with SMTP id m26so5825363otk.11;
        Fri, 30 Oct 2020 08:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cTujnyYgl0gjcK7z9TcAr2g0h67W+mGONIlJcbtOj4Q=;
        b=HvnQcUcqlw6FwFeGYh12GLB9kWrB1BRbQ4lZjnLQv9m5wZlJF0v2XM1LyBILqE6xIe
         THvE6nom2dE/Hpz5WelKBXCgiooP+L7B9Z2mgg19fFiSCYnxaGNKqwxgt4NXT7BVdFOR
         tQZ+BZj1BsVYY42mUwmNG8gm90NXoNPF3gb53MebdL4wGe3OULblTGgMxz04fIPVyx7g
         P+rH5uFjHWI0jQvYk8pg5wz4NAr68TlWcqThC7LLZSHiGNcduoITawqKY8am7AQbNpeC
         yBkth00e3x7vpskBMSvstG6ahDQuGndp0A1eaJi8l/FeMc4WNjuvE0GmHCRv8X8p94+f
         d53A==
X-Gm-Message-State: AOAM533txOtfpkewPl+7ST7ONUDrs4OtK+ikPCFONHdeq2eubEyEDasJ
        +VbUwWMlQ8xDeEbGBYtHPA==
X-Google-Smtp-Source: ABdhPJzbvaGgWRQDnM1xwbJLBYdkZhlr1wgk4zyv6PsUhqcJFTrrYgO1tTasZcyERF92DpN+weHyiQ==
X-Received: by 2002:a05:6830:4033:: with SMTP id i19mr2175043ots.127.1604071339232;
        Fri, 30 Oct 2020 08:22:19 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j186sm86272oib.38.2020.10.30.08.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 08:22:18 -0700 (PDT)
Received: (nullmailer pid 3868615 invoked by uid 1000);
        Fri, 30 Oct 2020 15:22:17 -0000
Date:   Fri, 30 Oct 2020 10:22:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, pawell@cadence.com, rogerq@ti.com,
        jun.li@nxp.com
Subject: Re: [PATCH 6/6] doc: dt-binding: cdns,usb3: add wakeup-irq
Message-ID: <20201030152217.GA3866290@bogus>
References: <20201022014411.2343-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201022014411.2343-1-peter.chen@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 22, 2020 at 09:44:11AM +0800, Peter Chen wrote:
> To support low power mode for controller, the driver needs wakeup-irq
> to reflect the signal changing after controller is stopped, and waking
> the controller up accordingly.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> index ac20b98e9910..0171e64ef95e 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -30,12 +30,15 @@ properties:
>        - description: OTG/DRD controller interrupt
>        - description: XHCI host controller interrupt
>        - description: Device controller interrupt
> +      - description: interrupt used to wake up core, eg: when usbcmd.rs is
> +      cleared by xhci core, this interrupt is optional.

You need 'minItems: 3' here and below to make this optional. I guess we 
don't have an example for this binding or it would fail.

>  
>    interrupt-names:
>      items:
>        - const: host
>        - const: peripheral
>        - const: otg
> +      - const: wakeup
>  
>    dr_mode:
>      enum: [host, otg, peripheral]
> -- 
> 2.17.1
> 

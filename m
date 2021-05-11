Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A26437EE51
	for <lists+linux-usb@lfdr.de>; Thu, 13 May 2021 00:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347034AbhELV14 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 17:27:56 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:38638 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385233AbhELUHj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 May 2021 16:07:39 -0400
Received: by mail-oi1-f177.google.com with SMTP id z3so22166346oib.5;
        Wed, 12 May 2021 13:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q1bsjpibxY4vSndOmGyVKlDUeJKyU1XJtINm6rWKkL8=;
        b=TFc/Y355HC9olHFx6NcL/vQtep4WrMN58v+1rFyze1ulvlSHuVwL1jsWM1rpyAxMB2
         jVDTHveFVuuqNfM7mtxfCZl/9Qi5Rvr9CH176FcP24NzMNaADiPV987VNZ7SJTItmmRX
         OKkaYa57hys+GhFYnHYKphkxTO5TyqsRD3+OJBz/Zaxgwbj+hYGSh0H9a0LIYsdiWaJn
         dvAbW2hA+e5HQdTkhzxKH498OAqxpGi9c2jNDeGY7NYm4T8xisNR1f76H8iaBbOK1BFM
         owxohvl/SaJG6rqFsm1OZCwowFQa+4bSyKXiiynvVgmxuQ6Jlsa33wRto5od8jjYbLGC
         cvbQ==
X-Gm-Message-State: AOAM5303dju0CxUqa++IUcBF26fd/iBlKy1nJ7gTdCwN3LcO074s0iTa
        jHFYaaQVBeYTstttqv1Ogg==
X-Google-Smtp-Source: ABdhPJw3vTu+YFhWy6LQjgdQoteEwiGAAnmDs42jwQIf9w2M7E4uPdxXw/qYDwuJwtXohXHC7GnEZw==
X-Received: by 2002:aca:2818:: with SMTP id 24mr26567355oix.67.1620849991216;
        Wed, 12 May 2021 13:06:31 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 128sm222074ooh.45.2021.05.12.13.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:30 -0700 (PDT)
Received: (nullmailer pid 2458331 invoked by uid 1000);
        Tue, 11 May 2021 19:22:13 -0000
Date:   Tue, 11 May 2021 14:22:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 8/9] dt-bindings: usb: nxp,isp1760: add bindings
Message-ID: <20210511192213.GA2451465@robh.at.kernel.org>
References: <20210511085101.2081399-1-rui.silva@linaro.org>
 <20210511085101.2081399-9-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511085101.2081399-9-rui.silva@linaro.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 11, 2021 at 09:51:00AM +0100, Rui Miguel Silva wrote:
> The nxp,isp1760 driver is old in the tree, but did not had a bindings
> entry, since I am extend it to support isp1763 in the same family, use
> this to add a proper yaml bindings file.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  .../devicetree/bindings/usb/nxp,isp1760.yaml  | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
> new file mode 100644
> index 000000000000..0d76529e9662
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/nxp,isp1760.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP ISP1760 family controller bindings
> +
> +maintainers:
> +  - Sebastian Siewior <bigeasy@linutronix.de>
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |
> +  NXP ISP1760 family, which includes ISP1760/1761/1763 devicetree controller
> +  bindings
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,usb-isp1760
> +      - nxp,usb-isp1761
> +      - nxp,usb-isp1763
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

In the 1761 datasheet, looks like there's a separate host and device 
irq.

> +
> +  bus-width:
> +    description:
> +      Number of data lines.
> +    enum: [8, 16, 32]
> +    default: 32
> +
> +  dr_mode:
> +    enum:
> +      - host
> +      - peripheral
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: true

Like what? 'true' is only correct for common collections of properties.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    usb@40200000 {
> +        compatible = "nxp,usb-isp1763";
> +        reg = <0x40200000 0x100000>;
> +        interrupts-parent = <&gic>;
> +        interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +        bus-width = <16>;
> +        dr_mode = "host";
> +    };
> +
> +...
> -- 
> 2.31.1
> 

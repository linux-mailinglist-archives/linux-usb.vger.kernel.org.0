Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B118410B75
	for <lists+linux-usb@lfdr.de>; Sun, 19 Sep 2021 14:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhISMIh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Sep 2021 08:08:37 -0400
Received: from rosenzweig.io ([138.197.143.207]:46662 "EHLO rosenzweig.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229954AbhISMIe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Sep 2021 08:08:34 -0400
Date:   Sun, 19 Sep 2021 07:25:59 -0400
From:   Alyssa Rosenzweig <alyssa@rosenzweig.io>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alexander Graf <graf@amazon.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RFT PATCH 1/9] dt-bindings: usb: tps6598x: Add Apple CD321x
 compatible
Message-ID: <YUceR+9p8YS1HeCt@sunset>
References: <20210918120934.28252-1-sven@svenpeter.dev>
 <20210918120934.28252-2-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210918120934.28252-2-sven@svenpeter.dev>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>


On Sat , Sep 18, 2021 at 02:09:26PM +0200, Sven Peter wrote:
> A variant of the TI TPS 6598x Type-C Port Switch and Power Delivery
> controller known as Apple CD321x is present on boards with Apple SoCs
> such as the M1. Add its compatible to the device tree binding.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  Documentation/devicetree/bindings/usb/ti,tps6598x.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> index f6819bf2a3b5..a4c53b1f1af3 100644
> --- a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> @@ -12,10 +12,14 @@ maintainers:
>  description: |
>    Texas Instruments 6598x Type-C Port Switch and Power Delivery controller
>  
> +  A variant of this controller known as Apple CD321x or Apple ACE is also
> +  present on hardware with Apple SoCs such as the M1.
> +
>  properties:
>    compatible:
>      enum:
>        - ti,tps6598x
> +      - apple,cd321x
>    reg:
>      maxItems: 1
>  
> -- 
> 2.25.1
> 

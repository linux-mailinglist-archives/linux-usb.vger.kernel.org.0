Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF87A3FDC00
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346063AbhIAMqW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 08:46:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:42970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245055AbhIAMmg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 08:42:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED3D7611F0;
        Wed,  1 Sep 2021 12:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630499869;
        bh=Vz1TA47llC7a59hhyNGoaeEiKl47puwT1GS5TQq5ado=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=YdxJ445rGLT787Ao50jV8Np6uKoGqrJdbGH9KahNCNKH/45AAoVWJAx5KWZdNEg/7
         JMEGKO849LZKAoBLVIwYNSuQEmPNjT939maSN46cIfLRHKn56Q9eGLg0IMzcc8MiAO
         MBr+YdTOrCy2We2dTlXfDnbNwmm582bhnn6iOlPY5RSIacLhnBuK+DdR22fUwuXQP0
         N1UY7QoOcDuWzgBg201DHlnLGb1CTSo4wLgNg9lJYmlqrFhpYTJBOWi1gjYf68l28+
         cSp5H5BVsu1v+P6hskX8HYLCzadfrpX/jVZqHfWZ2u+jMxvjpET9odm57F6+YAI7SB
         rVmXtHwMQIJhw==
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-38-maxime@cerno.tech>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 37/52] dt-bindings: usb: dwc3: Fix usb-phy check
Date:   Wed, 01 Sep 2021 15:36:35 +0300
In-reply-to: <20210901091852.479202-38-maxime@cerno.tech>
Message-ID: <87a6kwcvzb.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Maxime Ripard <maxime@cerno.tech> writes:

> The original binding was allowing any combination of usb2-phy and
> usb3-phy in the phys and phy-names properties.
>
> However, the current binding enforces that those properties must be a
> list of usb2-phy and usb3-phy, with exactly one element, effectively
> making usb2-phy the only value being valid.
>
> Let's rework the properties description to allow either one or two
> element picked with values either usb2-phy or usb3-phy. The rest of the
> tooling makes sure that we don't get any duplicate value, so this should
> be what we want.
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
> index 078fb7889593..c1c970073681 100644
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

I'm not sure you should enforce a maximum of 2 PHYs. Some systems may
use more than one USB2 PHY to take care of different parts of the USB
link.

IIRC N900 was a USB2-only system which shipped with two USB2 PHYs: one
handling the communication proper and one handling charger detection and
the like.

-- 
balbi

Return-Path: <linux-usb+bounces-1696-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 208527CB215
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 20:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF45A281682
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 18:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB3E34CC9;
	Mon, 16 Oct 2023 18:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jcY1Mg2a"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB06339AD;
	Mon, 16 Oct 2023 18:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE11C433C9;
	Mon, 16 Oct 2023 18:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697479405;
	bh=cDqOHBDA5sbY8y5If7BevRuuz2CJcTopzlG8CQRr2AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcY1Mg2aUxBHZjp+t2axFYVkPigBmbnkMqlmGGzpE7BagcZmgjaVOPsQdyXhSLPgj
	 8MJOGK07bmGeYKXvVWGxW9sPe7m1H1cyZHKRE50A+5DhQxCyhi5SJIf0LdSpbqXaCZ
	 xJH5Qhom2DGL9r8fJX0YeNJSoe1IPqGacKpdTG+0=
Date: Mon, 16 Oct 2023 20:03:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: ti,tps6598x: Disallow undefined
 properties
Message-ID: <2023101616-fantastic-spearman-b1e4@gregkh>
References: <20231016155527.2973385-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016155527.2973385-1-robh@kernel.org>

On Mon, Oct 16, 2023 at 10:55:27AM -0500, Rob Herring wrote:
> Device specific bindings should not allow undefined properties. This is
> accomplished in json-schema with 'additionalProperties: false'. With this,
> the 'connector' child node needs to be defined to prevent warnings.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/ti,tps6598x.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> index 5497a60cddbc..6ab674dea4c6 100644
> --- a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> @@ -32,11 +32,14 @@ properties:
>      items:
>        - const: irq
>  
> +  connector:
> +    $ref: /schemas/connector/usb-connector.yaml#
> +
>  required:
>    - compatible
>    - reg
>  
> -additionalProperties: true
> +additionalProperties: false
>  
>  examples:
>    - |
> -- 
> 2.42.0
> 
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


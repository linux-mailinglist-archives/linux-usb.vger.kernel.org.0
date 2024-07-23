Return-Path: <linux-usb+bounces-12339-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D1E93986B
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 04:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 337CD1C21951
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 02:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC31C13B599;
	Tue, 23 Jul 2024 02:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4bcjXKl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D312F32;
	Tue, 23 Jul 2024 02:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721703073; cv=none; b=hh4/yCTZjiNS8WkI9rnzlSPtJALOG6zERE0Lw6cCInCxXafISWzGWDINfQBLgspD5AFZJHPgiJnEfnMFd4X3iXJmbWyRf67ieeflvfSXRSnALB5ezfKHFV6LMPJ8IlzE48sp4X/oIjWlzWFHEal6j3IdHdyhWAD8YKxlObIemSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721703073; c=relaxed/simple;
	bh=8f4JRcrwXHy++9/5/z8Qgm+dkVwDQLC/tLAYNCJRVqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HN9t0DCZQbn2aL+IqsZITpQdHcJOZwiZn8tA58SG54se38BytyKZPY78U7l5BZs3RIMXf7km4sIUZgib3T+4ThsWAuBm+QSscvfU+CgSbGbeKBs+mkQtRtllXJc1rwWnelwhcNCKsYM3yAPmGpKxASV9Rt3u8PCIrPLlr+0qZuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4bcjXKl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD138C116B1;
	Tue, 23 Jul 2024 02:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721703073;
	bh=8f4JRcrwXHy++9/5/z8Qgm+dkVwDQLC/tLAYNCJRVqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4bcjXKlbq3vK4A9Yxj2HSavSoovc0HlmseEJt4vDSZcNzer0SiJ/s+E9VTqaUbrU
	 LaLyhBgjeNWPjj3LUSmxQik0aF/cd9dq5919wLw4/zkF8Eu9Ysu0/bOv59SmU6QiVH
	 453v6jicu2ak8/Bs74njb+yZEFa9g/mLr7Gd6bdBVjiViXztkcgwPI49ZQA96gYLOg
	 gdtKUzDyjLRSZy8dMXbRB91A8T0VqgsU2jUO512Ze/v8TBsW4rIXXyK79mvQqYmwyx
	 JdTiOUdOECE+H9EelMvQYBUQMkjJ1f76XM9wzJDhBR18sfLqrgnzERxBV4jkYuk38/
	 3TSKVzFGpi6qA==
Date: Mon, 22 Jul 2024 20:51:10 -0600
From: Rob Herring <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH 3/6] dt-bindings: phy: mxs-usb-phy: add nxp,sim property
Message-ID: <20240723025110.GA199927-robh@kernel.org>
References: <20240718102637.3964232-1-xu.yang_2@nxp.com>
 <20240718102637.3964232-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718102637.3964232-3-xu.yang_2@nxp.com>

On Thu, Jul 18, 2024 at 06:26:34PM +0800, Xu Yang wrote:
> i.MX7ULP need properly set System Integration Module(SIM) module to make
> usb wakeup work well. This will add a "nxp,sim" property.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  .../devicetree/bindings/phy/fsl,mxs-usbphy.yaml    | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> index f4b1ca2fb562..2141f271f8f1 100644
> --- a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> @@ -87,6 +87,12 @@ properties:
>      maximum: 119
>      default: 100
>  
> +  nxp,sim:
> +    description:
> +      The system integration module (SIM) provides system control and chip
> +      configuration registers.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
>  required:
>    - compatible
>    - reg
> @@ -110,6 +116,14 @@ allOf:
>        required:
>          - fsl,anatop
>  
> +  - if:
> +      properties:
> +        compatible:
> +          const: fsl,imx7ulp-usbphy
> +    then:
> +      required:
> +        - nxp,sim

       else:
         properties:
           nxp,sim: false


> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 


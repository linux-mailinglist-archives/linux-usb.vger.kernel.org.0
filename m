Return-Path: <linux-usb+bounces-34128-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDaDN/UjqmkPMAEAu9opvQ
	(envelope-from <linux-usb+bounces-34128-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 01:46:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D867219F4E
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 01:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F878306809F
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 00:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD092EC09B;
	Fri,  6 Mar 2026 00:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7PFHuzx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0894288C30;
	Fri,  6 Mar 2026 00:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757934; cv=none; b=Pk4In4E2skqGxbRwJPEFdQ+urEdBSDiV+JApikRr+Dj5i429YT/CGcIdvQjyEuWniYCuvY6OSLR9oCH/gBpv3hCzHlW1Y+DL1EgYEOx5iLP/f5pekajOFQ4PXILi1eFoMC+4wb21g3nO5VYL8UOzco70EdVvLXaqyzhq2djf1s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757934; c=relaxed/simple;
	bh=RfZ6JfMteBUvtPa+L1il2dXvDwwhTUW7cGhcZfzVpl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELyxKiJglmJN5N4RNOBpc2ilvi5FBHFrLlu7ezRPExXkJ8D8YtgM5v0yDiPUGr8OcVjLSuaJF4JVmJmdbQLQ3g/lfQ/eIDKEMVFhFXV8qgYdZABDuFU6+u5EOE4pUoTgEnSVe+5H8mq+VqYULw/4sGNhQU1PwxqKPYpyrKSOZu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7PFHuzx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A96C116C6;
	Fri,  6 Mar 2026 00:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772757934;
	bh=RfZ6JfMteBUvtPa+L1il2dXvDwwhTUW7cGhcZfzVpl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7PFHuzxFF2xXjeSHFWX9UKCutem6Sp6gftOvOM80oDAJlI5qKbdGXhziaAjxDOqb
	 juukfdodr41K3ImYrEeas+GnrL9FrrcyveNHXn5tgXQpPIW1YHOY/kFFYf+YXfBVY9
	 sRYMqE6K/uim4woWg8ygo8Dot5HRkAquC/LH5D8+qKEuKN+SvXgInXAPgVrRj2d+32
	 OxtYCaadBseZsR/VmsTYmIwZmBFwUP/OgMGjjrDIkgdZfJpQ2TNSGHy5OXQjfQbOAL
	 1U4qAnFk5mKaMzfPbuVJMoQrzfUdBa03R1oy9uJUiiZJPosuE0rnVzjcVVyCuuyuS+
	 MMeqIALwU9PXQ==
Date: Thu, 5 Mar 2026 18:45:33 -0600
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Herve Codina <herve.codina@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: generic-ohci: add AT91RM9200
 OHCI binding support
Message-ID: <20260306004533.GA870954-robh@kernel.org>
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-1-6d6a615c9c47@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-atmel-usb-v2-1-6d6a615c9c47@gmail.com>
X-Rspamd-Queue-Id: 8D867219F4E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34128-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 01:12:58PM +0000, Charan Pedumuru wrote:
> Add binding support for the Atmel AT91RM9200 OHCI USB host controller
> to the generic OHCI schema.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/usb/generic-ohci.yaml      | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> index 961cbf85eeb5..ab8a49142386 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> @@ -55,6 +55,7 @@ properties:
>            - ti,ohci-omap3
>        - items:
>            - enum:
> +              - atmel,at91rm9200-ohci
>                - cavium,octeon-6335-ohci
>                - nintendo,hollywood-usb-ohci
>                - nxp,ohci-nxp
> @@ -137,6 +138,16 @@ properties:
>        The associated ISP1301 device. Necessary for the UDC controller for
>        connecting to the USB physical layer.
>  
> +  atmel,vbus-gpio:
> +    description: GPIO used to control or sense the USB VBUS power.
> +    minItems: 1
> +    maxItems: 3
> +
> +  atmel,oc-gpio:
> +    description: GPIO used to signal USB overcurrent condition.
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> @@ -144,6 +155,22 @@ required:
>  
>  allOf:
>    - $ref: usb-hcd.yaml
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: atmel,at91rm9200-ohci
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: ohci_clk
> +            - const: hclk
> +            - const: uhpck
> +
> +      required:
> +        - clocks
> +        - clock-names

       else:
         properties:
           atmel,vbus-gpio: false
           atmel,oc-gpio: false

>    - if:
>        not:
>          properties:
> 
> -- 
> 2.53.0
> 


Return-Path: <linux-usb+bounces-33433-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOj6MWRtlWk2RAIAu9opvQ
	(envelope-from <linux-usb+bounces-33433-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 08:42:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C095153BD3
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 08:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFD6C3013A43
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 07:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE82430F819;
	Wed, 18 Feb 2026 07:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/5mWpkb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2EE38D;
	Wed, 18 Feb 2026 07:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771400537; cv=none; b=dI+2ksXjHzVpICSvtQDm46Cpjme+X3M1u1Wkp0KADimssB9PioO3IiGvFBqleBE0B1/wJVoshUYel2rOvHkJ7I7+s9H+HcIOO3IbBBbuztx3urZpy8PqDg9aODCBAO9GbImZoAnxBJH1Vdbw9Kk3COalW/ovUpD+c7eKRJvoueM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771400537; c=relaxed/simple;
	bh=jcMnCozEI8eJNdxonGZxqWb8wVWlpDHbonfw1Xiz8B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hp10PxHfNAcZBc6VYcFAf2LkWc/bf40HFozbuFCaVIcjFA2mN6LoUf8/g/9QDJQjo0BREMrJ+ef3GsjHBOfF7eg1xvmveHhJJhkZ98LGriE+BdtapZIB+paLoJCrM1ESGaXw6P899xZY5EcvpIMe2npI0saQGWgFIhSGlMwF1jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/5mWpkb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EB9C19421;
	Wed, 18 Feb 2026 07:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771400537;
	bh=jcMnCozEI8eJNdxonGZxqWb8wVWlpDHbonfw1Xiz8B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/5mWpkbb9hJHuOG9R+ag1fuszszszomrrJc+Rn39EAuIcX9U+lIHT6s/PKFUsIzB
	 vHwbra5XxHPYpJn4aAhahc9CsmXA/F4HNZJWDd6vdsSAkArdoE9LIhJ7VuAeLuMbPo
	 UjLB1oM3zrdXz3DSyur4M8aFWKzpDCQ2i/8hvr/iBIg/K0Ekcgvvh+yTY5qnlcBxkh
	 DPpsO8U6cn0m2q6T4mIVP2HbR3iUxb7fZwDHO/LxqmY3s5pTMOIaLmQ0I3Cfe7BVmG
	 SG08xM4Ge9sRAFiBzOq1Z4e46isRksa/vJRlorPFP+r0rQ5DFZEE23yQZmBvbeYfiv
	 Q7RvnssSxP75A==
Date: Wed, 18 Feb 2026 08:42:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: st,st-ohci-300x: convert to DT schema
Message-ID: <20260218-loose-rose-anteater-01abef@quoll>
References: <20260217-st-usb-v1-1-ba347f30d0e0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217-st-usb-v1-1-ba347f30d0e0@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33433-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C095153BD3
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 02:55:34PM +0000, Charan Pedumuru wrote:
> +description:
> +  The STMicroelectronics USB Open Host Controller Interface (OHCI)
> +  compliant USB host controller found in ST platforms. The controller
> +  provides full- and low-speed USB host functionality and interfaces
> +  with an external USB PHY. It requires dedicated clock, reset, and
> +  interrupt resources for proper operation.
> +
> +allOf:
> +  - $ref: /schemas/usb/usb.yaml#

You should reference rather usb-hcd.yaml

> +
> +properties:
> +  compatible:
> +    const: st,st-ohci-300x
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2

Drop

> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: ic
> +      - const: clk48
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    items:
> +      - const: usb
> +
> +  resets:
> +    minItems: 2

Drop

> +    maxItems: 2

Best regards,
Krzysztof



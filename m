Return-Path: <linux-usb+bounces-37664-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFGEIs4aDGpJWQUAu9opvQ
	(envelope-from <linux-usb+bounces-37664-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:09:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DE7579B35
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42196301FE4A
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 08:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C943E0C4A;
	Tue, 19 May 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOj9IbSo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C033E022B;
	Tue, 19 May 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178110; cv=none; b=mzmApftifVZelvJvJM3ycbl+Srw4OHR7pk/W7PENPz5YP0EynQXPe+83Ol9suKj3VYgddIjLt9Mur8Bus7nMU7Prp0cd2aaHS2RDCHY1DI01Jr/BpTmEYfte3b6rG7BtUKC3KIGFw3MQusUhBGkszOA4INgdvsAVqclDnzKQfwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178110; c=relaxed/simple;
	bh=+Pjj5zLSZ5ShLOqsfLZZs22XNQmwWmMDzVfZFHN6fU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEOrahCMiYrO0OF3oZ7fCX7lPY6rrQEnVebu8goEbGwmZSSTMkXqvDm0tkeUv0aC7lWEcoXdJPg+uwnHlP0N/axTwlm5oPmCXW4d0knWwAUZ8g58VWIRbcSFj0xlusJ58yJD7yOKWCvv/aI/ITurXqJYk0Hhr6Tfwrz3rg6BJvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOj9IbSo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0ABC2BCB3;
	Tue, 19 May 2026 08:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178110;
	bh=+Pjj5zLSZ5ShLOqsfLZZs22XNQmwWmMDzVfZFHN6fU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOj9IbSo3Dk1zup9WniMiHuzAGq1xgadXeHaAQUKCWlL141ZAV4OnnMfpjyAJ5ia2
	 4+E3shAAqp2qxGhNQS1At0oD4N19nun7/GwQC6XuF77PrF3tSb3xb+xUtUDMxNzkmf
	 2VqWryiI77P2xEwukVaoU7e7Ugv69ie1Ns06ZT13QJz3RyKTATspWAKP+YVPQsqC9S
	 a2Dg4fTt73MqVINxQN4WpEby+lOKBA/f3t+pogz4Jwk8KKvy94zzdWjcaUVw7+4z31
	 JMpoXygVk/c0YBxblLjjWJ72K6LigIxLNnldzYERxxy5/8DNAbOjvKhOrriFo/HzSn
	 Gn3PRH2oW/+ug==
Date: Tue, 19 May 2026 10:08:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, gene_chen@richtek.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: richtek,rt1711h: add missing
 'port' property
Message-ID: <20260519-quixotic-lobster-of-experience-b894cb@quoll>
References: <20260518162014.18251-1-akash.sukhavasi@gmail.com>
 <20260518162014.18251-3-akash.sukhavasi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518162014.18251-3-akash.sukhavasi@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37664-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,4e:email]
X-Rspamd-Queue-Id: 89DE7579B35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 11:20:14AM -0500, Akash Sukhavasi wrote:
> The schema declares 'additionalProperties: false' but omits the
> top-level 'port' property, which hi3660-hikey960.dts uses to
> describe the role-switch graph endpoint. This causes dtbs_check
> to emit:
> 
>   hi3660-hikey960.dtb: rt1711h@4e (richtek,rt1711h): 'port' does
>   not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Add the missing property using /schemas/graph.yaml#/properties/port,
> following the pattern used by realtek,rts5411.yaml and other USB
> controller bindings.
> 
> Update the example accordingly.
> 
> Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> ---
>  .../devicetree/bindings/usb/richtek,rt1711h.yaml    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> index 7ded36384..05ffc33a2 100644
> --- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> +++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> @@ -52,6 +52,13 @@ properties:
>      description:
>        Properties for usb c connector.
>  
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      OF graph port describing the connection to the USB role switch
> +      consumer (e.g., a dwc3 controller with usb-role-switch), used to
> +      convey type-C data-role changes signaled by the TCPC.

I don't think this is right. There is no such data link for "role
switch", so this should be part of standard connector ports.

And the only other binding (I found) having these two is
qcom,pmic-typec, which in practice only uses connector in all of DTS
files.

Best regards,
Krzysztof



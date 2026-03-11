Return-Path: <linux-usb+bounces-34557-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOIwMM9nsWnsugIAu9opvQ
	(envelope-from <linux-usb+bounces-34557-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:02:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 596992640F5
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA2A3317798F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 13:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81B8199EAD;
	Wed, 11 Mar 2026 13:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzZZuffu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3499119C553;
	Wed, 11 Mar 2026 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234024; cv=none; b=myxsMSz/ABB1/XSqp3kt5qiN6f2aQn7lM97e7HvE0mYPF55jQViKdayr5Q9gbF4kbz8sP5GqI/kguNb77P1ydUXPeGGKDVpR/d5Z0Lz1XVSGjA44k/dm3pgHmtlc+OaecPKvwh3eX1futZjJWxH/Kuvghne/bCLb0DgMOqsjkwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234024; c=relaxed/simple;
	bh=qzYLhXLgRjSjugWhsh8t1thCU79w5nXSfLEvHb6aj40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKH09jW7LrUIBw6bHD6JYrXdL9l9guGMOoD2/pAPbz/sKkS6K8VlsK7r+fYtBavS2u9dMRlJtgFurmtVnzvjQrkcoDFaHUI2YtC3YOjTmigwvULifqtzpoHgWbJQgGJqnaKPBraDP413qAU54V+oguLds4Zm7JlXMfh6aJIgE0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzZZuffu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437B8C4CEF7;
	Wed, 11 Mar 2026 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773234023;
	bh=qzYLhXLgRjSjugWhsh8t1thCU79w5nXSfLEvHb6aj40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzZZuffukP8dY5Jo9slB7oc8Txyoz/97VNolTPeuFG82MkSOcXSCMYwPrF95KKyLt
	 iDEmpaLQ7rhWVkwNbv384NbFn/b3sT5vPUDjU4xFlBgGf7VNFiQ06ASndK39sH33pU
	 ZPRgIpUPfyJuX3cyAxhJX3c88XxlaMrp9CV+gONKaldqEed0fU1l15H9dIhoka5sTD
	 cr1eZQ3eSFWmuPVFmpzQv/fZzq/BuCdSpw11ADaaPs6UdLJblDJjvfL2XMT5M9AIpf
	 oyoD9V0wPh2PhidmfQi/IzrKqu58gHsJKTdzaK4xg1T5PNBGwxc7LchR+DpyL8X9PF
	 63V9bmq+rOD8w==
Date: Wed, 11 Mar 2026 14:00:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: nxp,ptn5110: add optional
 orientation-gpio property
Message-ID: <20260311-spry-honored-sheep-de9d7a@quoll>
References: <20260310-support-setting-orientation-use-gpio-v1-0-da31dc6cd641@nxp.com>
 <20260310-support-setting-orientation-use-gpio-v1-1-da31dc6cd641@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-support-setting-orientation-use-gpio-v1-1-da31dc6cd641@nxp.com>
X-Rspamd-Queue-Id: 596992640F5
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
	TAGGED_FROM(0.00)[bounces-34557-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 04:13:56PM +0800, Xu Yang wrote:
> The Type-C chip know the cable orientation and then normally will set the
> switch channel to correctly configure the data path. Some chips itself
> support to output the control signal by indicating the capability in
> bit[0] of STANDARD_OUTPUT_CAPABILITIES register and do it in
> CONFIG_STANDARD_OUTPUT register. For other chips which don't present this
> capability currently there are no way to achieve the orientation setting.
> Add an optional "orientation-gpio" property to achieve the same purpose.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> index 65a8632b4d9e..866b5d033f4e 100644
> --- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> +++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> @@ -26,6 +26,11 @@ properties:
>      $ref: /schemas/connector/usb-connector.yaml#
>      unevaluatedProperties: false
>  
> +  orientation-gpio:

Ah, and you cannot have "gpio" property. It's also typeless and
constrain-less, so looks like you create some random code here. :/

From where did you take such syntax?

Best regards,
Krzysztof



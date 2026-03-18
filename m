Return-Path: <linux-usb+bounces-35026-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF8NKG9iumneVwIAu9opvQ
	(envelope-from <linux-usb+bounces-35026-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:29:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A7B2B8047
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A6E4305B52A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 08:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D881137F75A;
	Wed, 18 Mar 2026 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6ajskU6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622D9285C80;
	Wed, 18 Mar 2026 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822446; cv=none; b=k3yoFebCNOPcw5n+7aUv9EbHjdvTFjHfsPWhaDdOon1N/+KHsph5DeQXccuHzyLuF3auKzfwNl+Fsd80f/AMWiIsTeiGmPgz6uy5NrdT+GXMBHnYGVFoM+n3jrWXVLkx1Y/MfLh0AHSzVhGS3Vo5BihOcjR69/Py+W0lIa1dNaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822446; c=relaxed/simple;
	bh=Hi3hzNyZGmtOncTUdUioP6nbrDWYPkzKwQ9RvgPq/nA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLnnjb5dCdGF3KLe+yLd4RN5yE9fmt+3oG81KN6wQQR1YX3Gkl37lc+UuuYqj0NTmUS35Z+oZ2se4NvT0byNbqNgSLaaiqhe4Bslm6fAQ+xmU3jNhtBUHOO1DCf2PeTsc6MzRihKrmSQcaL1aMdM+YpXOxQHkVjof0UjPu0XznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6ajskU6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8ECC19421;
	Wed, 18 Mar 2026 08:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773822446;
	bh=Hi3hzNyZGmtOncTUdUioP6nbrDWYPkzKwQ9RvgPq/nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G6ajskU63S3EFTNIwp4YHWo6qdxEdWRKXMkER5n04Z3wOu41qna+J2lLHyClcFng5
	 5Mh4lWK0aBZTeHX8gSg1GfvQaT2sEojl5d9NJgbBSpG+1LgSy1IDWUYdHjj3dOVFpM
	 d4JO44X5BewPDSNn1nnycSi4ScjIXjWGLvx1prksmEKdlXjNV333lSiIJqXwklcfcS
	 a0mLXXPyHBFbpkYaRCvlFbx7kerVCak068MPplIxaQZBf3v4k73VpjMsCPy6ZhUEnU
	 a8JhWdlzapMUHcBBuyrkjKdAM3bFFxrDPSG8HSZYXSqfl/u0V6vig4OpfbpPfxh7EB
	 HQpSIENGclXxA==
Date: Wed, 18 Mar 2026 09:27:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Junzhong Pan <panjunzhong@linux.spacemit.com>, Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Terminus
Message-ID: <20260318-quick-nickel-cow-7a10f7@quoll>
References: <20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org>
 <20260317-03-usb-hub-fe1-v1-1-71ec3989f5be@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317-03-usb-hub-fe1-v1-1-71ec3989f5be@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35026-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,chromium.org,linux.spacemit.com,gmail.com,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 20A7B2B8047
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 08:55:02AM +0000, Yixun Lan wrote:
> Terminus is a Taiwanese fabless chip company specialized in high-speed
> serial-bus based, IC products for PC peripheral, consumer electronics.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



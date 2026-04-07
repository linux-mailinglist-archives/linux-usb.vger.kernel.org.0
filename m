Return-Path: <linux-usb+bounces-36054-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIXmEdtW1Wmu4wcAu9opvQ
	(envelope-from <linux-usb+bounces-36054-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 21:11:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2953B3441
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 21:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 617253036761
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 19:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0629934B669;
	Tue,  7 Apr 2026 19:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTVT5w2t"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A322083;
	Tue,  7 Apr 2026 19:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589073; cv=none; b=ujyhDAlpzRhldxImitdfaWXXCNU3IMBDa+cuzlbFrU6psUpmUeD9rKXZ9GxNb80JbAScXmQmuVUtb878h3zt9pcD7kPJnXjAVF/L9PHb5h95DVPgVHUm0CmvIe7MfyOGNUW+QzHfDEKz9a/ZRZJL7vtARe+CwLz05V3CxAHwqTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589073; c=relaxed/simple;
	bh=i+fig20ggwsT9pZlJH2S534mhEFL//GXWbZnSmgwt9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aq2grc62fNCJ/ReA1pFrta6SbL5YjYzqH6DJyjJnf3l5zMh27Ff/2MDrh6p0o7ci78366pBq+z+zPCiGfbBn9mcJeaveYeFCz9st1Nx0Ye1DO16CI41KvkmvwjxMYFoQbfGFrOdBIOhj5dDRLWIP4eNdZqbPXw1lr0UILcx5MhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTVT5w2t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0373AC116C6;
	Tue,  7 Apr 2026 19:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775589073;
	bh=i+fig20ggwsT9pZlJH2S534mhEFL//GXWbZnSmgwt9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTVT5w2tU4EyoSvbsHol1yPfBqgnOVuEharMt+6ku2UFnYRiD7BhFCTiuee+ijdYQ
	 3ulJOpGs1IJ0PDBq7YCzgKKDqSg6T2dLqJ0/7vErGxpbxe4ExmP2871k7vcqq3WCGU
	 3jbjOAye9CbG8NYZcrIvhzCTFhG9M5F4vnBQaPWOSh6CWe5a70CZRrim2VLPNmVwqw
	 BVRg9v2Q0Hg4RFQ5ZyhNkXTJJDHftAj8RfQC/sUB+IkyF8LZguqaHNrIo3nrT6fpxA
	 gpISpS64OkOCkS/z13OPMRJjVN+EC50vcVC/o3RTaYvVorj8srS5te3BihkiC2KJdg
	 SwruxLCf6+neg==
Date: Tue, 7 Apr 2026 14:11:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Herve Codina <herve.codina@bootlin.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v4 5/5] dt-bindings: usb: atmel,at91sam9rl-udc: convert
 to DT schema
Message-ID: <177558906473.3430958.14870529222355203210.robh@kernel.org>
References: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
 <20260327-atmel-usb-v4-5-eb8b6e49b29d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-atmel-usb-v4-5-eb8b6e49b29d@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-36054-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DC2953B3441
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 16:47:46 +0000, Charan Pedumuru wrote:
> Convert Atmel High-Speed USB Device Controller (USBA) binding to DT schema.
> Changes during conversion:
> - Make the "clock-names" property flexible enough to accept the items
>   in any order as the existing in tree DTS nodes doesn't follow an order.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../bindings/usb/atmel,at91sam9rl-udc.yaml         | 74 ++++++++++++++++++++++
>  .../devicetree/bindings/usb/atmel-usb.txt          | 46 --------------
>  2 files changed, 74 insertions(+), 46 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



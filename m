Return-Path: <linux-usb+bounces-31043-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FB4C92CCD
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 18:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 048274E20D8
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 17:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A8133291B;
	Fri, 28 Nov 2025 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYkSpEqa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B0832ED26;
	Fri, 28 Nov 2025 17:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764351132; cv=none; b=fSSpgPTOARjAHM8HJcQaFLsxpABBOCorUlxrYqwGXftmsg4sDke4RgTT8Nt71zFgyPWirfV4HSHHpXN3xs2et+fMnVsdXvK4xPvox/1YyuP6awFWspH3XNZUpn9HSU69WS+eCuZP9B3wmSIk7a12+BQjDXJKFFUAxICEopvNda0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764351132; c=relaxed/simple;
	bh=DXtdLdYNGI2Def47xLdO+K+KvZUz52lKdw1ZAleee5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiNN97nJwkjmwKnzd58p9Ig/+48M1v0hU1j8xpo9mCWe0bXY0JyRK8ZIlFuZXUTlyxv0+mgGVr4lg2cSWWY92c8HEnGuADJPtDxoxBkW56XBrk//iC27cozzgk7Ri9T3+lvh/Ugcb7Qt9SJFCupn1MGGFjlMRROVhDc2PiMPsIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYkSpEqa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C628EC4CEF1;
	Fri, 28 Nov 2025 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764351131;
	bh=DXtdLdYNGI2Def47xLdO+K+KvZUz52lKdw1ZAleee5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYkSpEqaLqnSBU6hF/5r6RXEsVVv5oXSmgzA8qNIH9Fn1IBazC9GKCNNXu3o6nbjM
	 mN8A+4UefvGHlGZG6yDmLE6EV/tKM0faRfVmKcw01Z4KRYVy1d9Q8bHRCdaNvZ2AMn
	 kjId8/Wqf2dDVWYrgRNTbeeZvlPSY3/3J3GSiaQ9pwebN+K/859W0Q/5Hu1M1CNLph
	 4pRhmMizHErz/2hqh8Z238J8fb9mkTwDKyFaud4dOg3SJSlx875Jv5YnqMl7qo1WJ8
	 ZKAXDbBGG7ug66gJLSVIF+7p4BNrbzSvPwvgum0Uvdnk2OPDDRHVVbn+RyJ3rwy+En
	 Jbr9/wLCexsUw==
Date: Fri, 28 Nov 2025 17:32:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: aspeed,usb-vhub: Add ast2700
 support
Message-ID: <20251128-ajar-headcount-a8589beec00c@spud>
References: <20251128-upstream_vhub-v2-0-1fa66a5833c2@aspeedtech.com>
 <20251128-upstream_vhub-v2-1-1fa66a5833c2@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PTCSciaf+pNNOYVt"
Content-Disposition: inline
In-Reply-To: <20251128-upstream_vhub-v2-1-1fa66a5833c2@aspeedtech.com>


--PTCSciaf+pNNOYVt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 08:27:30AM +0800, Ryan Chen wrote:
> Add the "aspeed,ast2700-usb-vhub" compatible. The ast2700 vhub
> controller requires an reset, so make the "resets" property
> mandatory for this compatible to reflect the hardware requirement.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--PTCSciaf+pNNOYVt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSnckgAKCRB4tDGHoIJi
0lyuAQDcadUyChIKt4hLNny6wAUoqQNARS1SLjiQFJLqGfv2rAEA6tf88roWmvmr
QQPQ4wsg2bKnhY9WdzB5cH62ydNRGAc=
=yqmb
-----END PGP SIGNATURE-----

--PTCSciaf+pNNOYVt--


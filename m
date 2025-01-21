Return-Path: <linux-usb+bounces-19569-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D033A182D6
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 18:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF22B3A2B1B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 17:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D341F540A;
	Tue, 21 Jan 2025 17:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJM2RjjO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF351BF7E8;
	Tue, 21 Jan 2025 17:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737480334; cv=none; b=ZXi5aCD+qnkdKJeyd456wNgQ92B+pt34wlCmENJHNBwQH52yfLGtO3uj2b56/4MA9sHHryNAkhx4x84ldddR1VYOrbVeLR3QagEwVXk+qgNfq3YRtQhUK81GMEadtRWVsaCbDC2jrjwsymNiYskmdkoj9s8UQuBj+aCMBNyUcM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737480334; c=relaxed/simple;
	bh=Mv8sfZsbNuXy8HpvmcyPTWZbajZCLInWCqjNzAr1TQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqyQzgu8betOqhsXxtDX3HmWpypb3eYV1Qbb0Rbd9FYL4NmKwqwTo8bBHvudB+609yjudFI+ZHXtwzd9czXz9wMPCXoZVPrnKhJV1lL5vT0xIHHTiEZj3OXRiMmzDv20pe9EE49LqE7+fPxUQ8AKPenq683BxYGQ/f+Pd3dsn3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJM2RjjO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05501C4CEDF;
	Tue, 21 Jan 2025 17:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737480333;
	bh=Mv8sfZsbNuXy8HpvmcyPTWZbajZCLInWCqjNzAr1TQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJM2RjjOEuytnCBUoX0xR2V+17hKtv7DBCF2//wj782/IR8GOc0Q925org/AmlUk7
	 kTBt++RDNxk9hUEt9NqGYDNeMKfsz3fuMerurUTxRyUzfyOzgFyUs5BDmRk5gO3F74
	 n+tj2KOLSPbVlyRwXr9kR+Q8B1vg59gaOSnt0FTlu2PuwbLD5QK3TCLTu2jOcQqKh0
	 EI74Zyq07xijfO0n7jATWCUV/v9U3KnhYDH9tqxzW8saqyzL1Hjhgzr6nh0KXJhFgd
	 CmAPwmJmEOqWHBIHxNXMXs9dNiyHkjrpRzM58e0h2QkNgrgV6vCpZOY9k/SP6B4EUb
	 N+ar9+2TFsARw==
Date: Tue, 21 Jan 2025 17:25:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: mtk-xhci: add support mt8196
Message-ID: <20250121-thank-catty-2a990676de84@spud>
References: <20250121145008.22936-1-chunfeng.yun@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e+9Aubm7RzjHfXdG"
Content-Disposition: inline
In-Reply-To: <20250121145008.22936-1-chunfeng.yun@mediatek.com>


--e+9Aubm7RzjHfXdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 10:50:05PM +0800, Chunfeng Yun wrote:
> There are three USB controllers on mt8196, each controller's wakeup
> control is different, add some specific versions for them, and add
> a new compatilbe for mt8196.
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--e+9Aubm7RzjHfXdG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4/YiAAKCRB4tDGHoIJi
0mH0AQDsIXcEb6Ul237gLkmPofWGZ9+utoDcEN+AGpxmsLFnyAD+LxoWLtPTgpoT
/iqCykPZpGp6Nl72HkV9nDdRbMEODQY=
=rPkF
-----END PGP SIGNATURE-----

--e+9Aubm7RzjHfXdG--


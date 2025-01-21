Return-Path: <linux-usb+bounces-19568-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4167A182D3
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 18:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8357188BED2
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 17:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692AC1F5405;
	Tue, 21 Jan 2025 17:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="deGKfUGw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9981187FE4;
	Tue, 21 Jan 2025 17:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737480309; cv=none; b=H8rjHudL60d6i8bk3szUGBUV9A6/2LaNebZdncYHhSLyivExcUH+zhX/ZOAfMiNIxU3YDDVAlC3uu2t1kv++ooP+JBPAE6pAeDJfQeXVdTpR0JinruXor5rLm+PwcK2aN3THoWy4yH0FnAMpIjO3Fx6czk/ag8nnsCuBvvgM0uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737480309; c=relaxed/simple;
	bh=S3W7a9VUjLLF7r1+nzcT41cJzX0iut4Kv6V0hvau/Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUtqPX1wK73lRTm/Y0BF7CEnDRcHV4rQ73dX03S3zWWOKOrMd4GYqKZB0Ig3+lpcWeHpDFfTiUDBPIOVrK8cU3yyd/usXUTbfNpGu462wQxGpFK24dwtGbQ6U/3LjMsCGmisZBInhkhMNm6tj0boiAEeKUlUwpq4bBEFi4rnEzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=deGKfUGw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D646DC4CEDF;
	Tue, 21 Jan 2025 17:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737480308;
	bh=S3W7a9VUjLLF7r1+nzcT41cJzX0iut4Kv6V0hvau/Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=deGKfUGw/ZU86f8kQ56115ihAYlfj/xC/2OsTd60Tf9VQse+n7Qh8lA6w//xdYtPI
	 7TeARxhNzyiB3tXaP+hHCeXxlaw037M4XIvJ1pUl0CPaZQGaMjAr7Arsd1HjBg5byU
	 YoCqRv0vM6+Mo186lfv/AsHSIXQEgtKfCwzFpTion+WbRx5YajmcMPrWZWMw1jO+H6
	 G4IUXmyCDHu6InHsWlfA9i7vlI4aKxguy+rrUsVXNIS17DfrdmWBW0S0BZrDv8Vomd
	 gXbHy5f6qM2Pv76spGxPOyn1ri9n69ul84Fr5+tp9IGttFQxkkqkyeRys7LW/KVIJc
	 FFXQ6UwI2Y1gA==
Date: Tue, 21 Jan 2025 17:25:03 +0000
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
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: mtu3: add support mt8196
Message-ID: <20250121-monotone-almost-6783e9b84c79@spud>
References: <20250121145008.22936-1-chunfeng.yun@mediatek.com>
 <20250121145008.22936-2-chunfeng.yun@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JmWqviSEfWIjwwOl"
Content-Disposition: inline
In-Reply-To: <20250121145008.22936-2-chunfeng.yun@mediatek.com>


--JmWqviSEfWIjwwOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 10:50:06PM +0800, Chunfeng Yun wrote:
> There are three USB controllers on mt8196, each controller's wakeup
> control is different, add some specific versions for them, and add
> compatilbe for mt8196.
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--JmWqviSEfWIjwwOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4/YbwAKCRB4tDGHoIJi
0i7jAQCavjjyh+Qpp+QoqcLU0QVGsL9cjBas1QZbQvg6DipQEwEA+jjel9pmIqcl
5rxZsQgBc1z2KT8MvA2RTt9FTHXj0gc=
=yG5o
-----END PGP SIGNATURE-----

--JmWqviSEfWIjwwOl--


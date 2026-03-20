Return-Path: <linux-usb+bounces-35258-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD4yCgyGvWnQ+gIAu9opvQ
	(envelope-from <linux-usb+bounces-35258-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 18:38:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7352DEC69
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 18:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28ACF30F3BC2
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 17:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED8C3CD8B4;
	Fri, 20 Mar 2026 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLV9ebbE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7432D0607;
	Fri, 20 Mar 2026 17:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027843; cv=none; b=SaUVDYv8anJDjN3nIJPQcziMVIr28GnXRcY7ls5DhkXr9m40Kv3nIE/PfccGJ4xGTT/5llyTX5dJHgWrMLlEUfb7osZhhkypFg34FJEo7t9FscNcHL13GXtEI5uxDtZedeX2MemcW4fm/0Ltq+VXCpqGu47lgW3j+EpHgXrpAXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027843; c=relaxed/simple;
	bh=W4IB0KIghH5BlR6smfsAiYWJPXaF2WzggB/xByUYJXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FENRQFjZWXOZXucMetjgM1+4VkbrFwK3vm41iTCgydPogITbMgeodY7+D1EeqQiWUcicmzTcBRku/DhBe0wct9etaDpDFWgADn8sItBuVj8tTKjgZLffIjSKezm7mrZu3wrECnPoyK/THDvPH4dC/MGmZvF+09LHCHbbKXWoXrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLV9ebbE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98F8C4CEF7;
	Fri, 20 Mar 2026 17:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774027843;
	bh=W4IB0KIghH5BlR6smfsAiYWJPXaF2WzggB/xByUYJXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLV9ebbEeJiBIRsIU6LNMkM0fPKZZgFkx0VF9RBD1vN2HCShG8ZoRTRmha8W9iFwD
	 NEmCARqbZ7qDuS306SS5i1psrb/8RlYsKUsB24PH9KQNgZ82MT0Gez1//M8B3l53QX
	 Q5u35gAUQGowt9ZzSy+yY9NOXHW5yXl+RUqzHH+tsBpdfm4DxF4KKYrwXyLGaHxTQR
	 0Er3a32Kbv7HFD+ZRbvpf222WssTkCTucO+b013KA13Guzp/MuH7iGrjxd7jspXq0t
	 Zxb3MiBB2YH9Jl5Fz2rpdwxwtJSj6peRyHhJLfVkOtL1pxQq7MYIs+J1RGYl8a/QrE
	 Zdt4pVQmnM71g==
Date: Fri, 20 Mar 2026 17:30:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: dwc3: spacemit: add support for
 K3 SoC
Message-ID: <20260320-rival-distill-c9021491769a@spud>
References: <20260320-02-k3-usb20-support-v2-0-308ea0e44038@kernel.org>
 <20260320-02-k3-usb20-support-v2-1-308ea0e44038@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iISLEgBV6Hhio30Z"
Content-Disposition: inline
In-Reply-To: <20260320-02-k3-usb20-support-v2-1-308ea0e44038@kernel.org>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35258-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux.dev,synopsys.com,esmil.dk,spacemit.com,gmail.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.942];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: BF7352DEC69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--iISLEgBV6Hhio30Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 07:15:37AM +0000, Yixun Lan wrote:
> Add compatible string for DWC3 USB controller found in SpacemiT K3 SoC.
>=20
> The USB2.0 host controller in K3 SoC actually use DWC3 IP but only support
> USB2.0 functionality, thus in the hardware layer, it has only one USB2 PH=
Y.
> While in K1 SoC, the USB controller has both USB2 and USB3 Combo PHY
> connected, but able to work in a reduced USB2.0 mode which requres only
> one USB2 PHY, leaves the USB3 Combo PHY to PCIe controller. So both K1
> and K3 SoC are able to work in the USB2.0 mode which requires one PHY.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--iISLEgBV6Hhio30Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCab2EPgAKCRB4tDGHoIJi
0joxAQC5+AAtgwRmBNAtvgPpwSU6oenwPm4CK2S4y2xpyBIyCwEAlWW9LD7E7Nu0
eRC9bXUrVLtn+AyWk+Qy/EtcHcqKxQs=
=Exu8
-----END PGP SIGNATURE-----

--iISLEgBV6Hhio30Z--


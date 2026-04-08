Return-Path: <linux-usb+bounces-36077-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFQyOluP1mmEGQgAu9opvQ
	(envelope-from <linux-usb+bounces-36077-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 19:24:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8233BF790
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 19:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D338530164B2
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2026 17:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16F33D6CB4;
	Wed,  8 Apr 2026 17:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIZEx5KZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DEC3D668E;
	Wed,  8 Apr 2026 17:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669080; cv=none; b=kehdR7Bj1eI2U51jXxCQR10AtaFWt7aybtZZBHsmNSZjrKs8qlubyIuYrVvLrrOHvWyjak75InlBjz9TaXayCP+sHtl6Av2lc2HdNkdn57nlvz0qxo11qYk0dyMQOxvOOea085Hh7ZTf+dk8wwjbmgJQCROCc10Lzaa9S4oPZ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669080; c=relaxed/simple;
	bh=MK3OdHDO9fSjROZASm6TWIVJYSRBGTs0fe4IjjpvRYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E75azEBfTyT5oB3xhK182O0FdhnNId0hIKaYLu3FDmpxp1IfDeRpGp8x6Z27ZVMWiLKJkp7puNPlCk6KB3fdf5SaNTqq9F05Xhm0Aeerysclik9vVVJEPBIcjl10y3hi7j5sfpdH3we790hOULoJYk7poyIJqQjfgVtLNLGg4AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIZEx5KZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB3CC19425;
	Wed,  8 Apr 2026 17:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775669079;
	bh=MK3OdHDO9fSjROZASm6TWIVJYSRBGTs0fe4IjjpvRYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DIZEx5KZfj26ZM2tZW9ibEEb5l0WmoEA41i6ctO/8uyLwMyOphbm+ZYuuare11AoB
	 RCFfnnDZvBdEpXeyToqcY61dSPa9TeEAYq5vqfNiA7dAB4UiROFOFe0xRbwuYFjjmi
	 I/dm/FdZS+PUmi7FhliReXiqNR6OsIyKalPIxxx10QzZ077Oy73pPyvncGlV82d/s6
	 8VmQktEVHp39WUSo5E1rxICVo2oyolIQhkSUpZzViQKZGu7s1g1LBQnINBhJfNOSO1
	 e1w3KHNqwpqDYb2p2VR8ERPc8URHF5CjDr+bJ54OyTadZiErpQE5sn6w9BCa8FdzYS
	 +r+833DRTETxA==
Date: Wed, 8 Apr 2026 18:24:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: caohang@eswincomputing.com, gregkh@linuxfoundation.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Thinh.Nguyen@synopsys.com,
	p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v1] dt-bindings: usb: Fix EIC7700 USB reset's issue
Message-ID: <20260408-designed-broadband-332044a2d1fb@spud>
References: <20260407061703.1564-1-caohang@eswincomputing.com>
 <20260408-ginger-grouse-of-virtuosity-b3ee92@quoll>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d3MQLvYUs1nDlAoN"
Content-Disposition: inline
In-Reply-To: <20260408-ginger-grouse-of-virtuosity-b3ee92@quoll>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36077-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,eswincomputing.com:email]
X-Rspamd-Queue-Id: 8F8233BF790
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--d3MQLvYUs1nDlAoN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2026 at 09:48:43AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Apr 07, 2026 at 02:17:02PM +0800, caohang@eswincomputing.com wrot=
e:
> > From: Hang Cao <caohang@eswincomputing.com>
> >=20
> > The EIC7700 USB controller requires a USB PHY RESET operation.PHY RESET
>=20
> Missing space after full stop.
>=20
> > operation was missed in the verification version, as it was performed in
> > ESWIN's U-Boot.
> >=20
> > If a non-ESWIN provided loader is used, this issue will occur, resulting
> > in USB not work.This patch does not introduce any backward incompatibil=
ity
> > since the dts is not upstream yet.
>=20
> So U-Boot will be affected, no?

Is it even really affected? I don't think there's any bootloader for this
other than what ESWIN is shipping downstream, outside of people's developme=
nt
trees. And any software that expected two resets will work just as badly as
it always did when a third one is added.

> And even if DTS is not upstreamed, what about all out of tree DTS?
> This is an already released ABI, so at least explain that driver does
> not care about resets here and grabs them all.
>=20
> >=20
> > Fixes: c640a4239db5 ("dt-bindings: usb: Add ESWIN EIC7700 USB controlle=
r")
>=20
>=20
> Best regards,
> Krzysztof
>=20

--d3MQLvYUs1nDlAoN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadaPUgAKCRB4tDGHoIJi
0mIjAQCR+qcYJ+Gl4+y+9XEfiQCCj+QDZh48fUGeUieaoSsIcAD/UJcpqBJOASfs
Y6WECnQpbbxhmJshFEk6n9xZnxmCnQg=
=8Pli
-----END PGP SIGNATURE-----

--d3MQLvYUs1nDlAoN--


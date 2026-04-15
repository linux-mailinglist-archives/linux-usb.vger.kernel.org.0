Return-Path: <linux-usb+bounces-36257-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO2iAjSl32miXAAAu9opvQ
	(envelope-from <linux-usb+bounces-36257-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 16:48:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAC04057C3
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 16:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 671FC301FCAE
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 14:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4A53D75DD;
	Wed, 15 Apr 2026 14:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vu6hFCAr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B973D566C;
	Wed, 15 Apr 2026 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776264449; cv=none; b=LIbi9JrR0lRWslwf/S2Z8QPWrmYw1Urr83Kgm/xSPdGeBX2cnUT/ru6bXJYoqn6oTDlJ6nXblGEZI85LOXcWYhwpl6JbNHQPobsc693luxPsTXc92EseKHeRyfRHnHZHLdBBUish5XjXBt2/mGW8q8AXjhY71M4Uflj0Qrv+0bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776264449; c=relaxed/simple;
	bh=VlRI5S6/EKWMryZiCAdrRWfUyjP1Q3iu79l43NAcXbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyxQkbAGAYNl5iNOlTqsiarrJKY42VtcznyzhlCu3cc4jElEXxnBumE5hdx2JWIhi8rYtWmONjmSGaUN6ZDDiQKRFJx6W2S1n9HcYFeA8LatgxDmefup06m6TJ/fAN6B7Mt3C560PrFVvcB/AAJ0802Yxr/kxmtilKmo/sHyAB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vu6hFCAr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB24C2BCB3;
	Wed, 15 Apr 2026 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776264448;
	bh=VlRI5S6/EKWMryZiCAdrRWfUyjP1Q3iu79l43NAcXbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vu6hFCArYBqgJNOsuMT6ycfPQqyCZOG7ELAKSDwG06T4fmv6V9yMbaTWUP2U4EQ33
	 aSI/wAr5ycZm4NN9oL/9Zj0JMYReUMrKZrW8NFHtrILNxppYpjRGYBbTdoyb6Fzvwc
	 5NQClpHCjot2lbYlv7RqhiiOLFf33nBa+KJy+S1qPiaOZZE3aR518Y1LQLKkMnLHIt
	 vDczLHF8NaBltX5z21I37fkpHCALZ7QELW6gkrugXr+A8dVd14bf96OyK9s9Vp/Nzk
	 F6CmMPKxl8w7nxtguFzUE0jq0NMyKjwfUdlDwxh2BhQyH33xuu6ya0YrOXgSLfD7Hk
	 vuIX3rI0F5tmQ==
Date: Wed, 15 Apr 2026 15:47:23 +0100
From: Conor Dooley <conor@kernel.org>
To: caohang@eswincomputing.com
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Thinh.Nguyen@synopsys.com,
	p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v2 1/1] dt-bindings: usb: Fix EIC7700 USB reset's issue
Message-ID: <20260415-overprice-fragment-e067eddefbd2@spud>
References: <20260415064056.1757-1-caohang@eswincomputing.com>
 <20260415064238.1784-1-caohang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HAKvTjPjG1HJUTqh"
Content-Disposition: inline
In-Reply-To: <20260415064238.1784-1-caohang@eswincomputing.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36257-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,eswincomputing.com:email]
X-Rspamd-Queue-Id: ADAC04057C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--HAKvTjPjG1HJUTqh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 02:42:38PM +0800, caohang@eswincomputing.com wrote:
> From: Hang Cao <caohang@eswincomputing.com>
>=20
> The EIC7700 USB requires a USB PHY reset operation; otherwise, the USB
> will not work. The reason why the USB driver that was applied can work
> properly is that the USB PHY has already been reset in ESWIN's U-Boot.
>=20
> However, the proper functioning of the USB driver should not be dependent
> on the bootloader. Therefore, it is necessary to incorporate the USB PHY
> reset signal into the DT bindings.
>=20
> This patch does not introduce any backward incompatibility since the dts
> is not upstream yet. As array of reset operations are used in the driver,
> no modifications to the USB controller driver are needed.
>=20
> Fixes: c640a4239db5 ("dt-bindings: usb: Add ESWIN EIC7700 USB controller")
> Signed-off-by: Hang Cao <caohang@eswincomputing.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--HAKvTjPjG1HJUTqh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCad+k+wAKCRB4tDGHoIJi
0uLaAQCXuBqrLnjuZ6816td8w0KY6sJyw83jGnyyeGPsTbK4QwEA5lYW+X5eFJml
+L0RNQ8mjgM25sMKF31Bh7z7bSIe+Qk=
=hRPj
-----END PGP SIGNATURE-----

--HAKvTjPjG1HJUTqh--


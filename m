Return-Path: <linux-usb+bounces-34608-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCi6F7a4sWmTEwAAu9opvQ
	(envelope-from <linux-usb+bounces-34608-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:47:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9649E268D0C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C0FE304A334
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 18:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571D335DA59;
	Wed, 11 Mar 2026 18:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4owwLaY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CA71A682F;
	Wed, 11 Mar 2026 18:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254646; cv=none; b=OjccFS/pHEVCsQsGf/iuRAvUcLrUtFRjOw5eaAEgnCYZ4VwjuqswvR0FkPz1mFthUD78YoRvdTTw53wzCcUJ05JifqJrg0OmO71Lah7OmtzwLEU2k/GGpw2i0KFFnHdHaGkScMWhHdYd/Z8D0U2cA21fDfqmpPlvbApmzudhC+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254646; c=relaxed/simple;
	bh=lLDUMyEV38aCw8V0nWb79qsOsKSW/XYdptR0FCzveEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6hQ/VAlS+m8weHQcFBQdKHL4SgSH0vjlJx0L4fdouCn+obNeR542+x9wO5vTAOUk9MnsGw3a2Ow8g2dTDIrTCt7uD95V54MvZlVYKIiwjodjPI0W7fAPeT1PBaHZXEkK9efqJnYf3BCPOXCPuvlHv8yKodKy7/k14tXh6ekFnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4owwLaY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95FB5C4CEF7;
	Wed, 11 Mar 2026 18:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773254646;
	bh=lLDUMyEV38aCw8V0nWb79qsOsKSW/XYdptR0FCzveEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4owwLaY8gUh5KvDcwuiCGIjbcjFnjtNWloM7SvYoLRNw2XPzaLn8ALVMaGsClunf
	 Y02IqO/fbSwQZolDqguxzkqi/3UbV9LlW9JUx4IEuQJlFfi/J4TfmFbxMM1aD3l0B1
	 1EJ1xg4Jibth4F2LL/GMO/HeLzUSVzz1sFcf/oO0v4P3yizU/gyttVNGCYtPZQB6Qg
	 CfC1R3/ogp2CNuH6rqyioEcElXbdCblXEMkUpxQTRVS0V7lK1QfqGgi5rnUfcTPfEr
	 ahAN99L18pEAkHj0RjuTOAKgDbYpOzWsh3HURZpwTm5iGfWcDAvt7HHCxcLM2eYiYH
	 B5GoeWzRLxQJw==
Date: Wed, 11 Mar 2026 18:44:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Corechips
 Microelectronics
Message-ID: <20260311-lubricate-figment-ec2fcf71f786@spud>
References: <20260311-sl6341-v1-0-0a890056f054@flipper.net>
 <20260311-sl6341-v1-1-0a890056f054@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SjfPcaz6RMqsvFCA"
Content-Disposition: inline
In-Reply-To: <20260311-sl6341-v1-1-0a890056f054@flipper.net>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34608-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[corechip-sz.com:url,flipper.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 9649E268D0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--SjfPcaz6RMqsvFCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 07:20:21PM +0400, Alexey Charkov wrote:
> Add Shenzhen Corechips Microelectronics Co., Ltd., which is a company
> producing chips for USB accessories
>=20
> Link: http://www.corechip-sz.com/enproducts.asp
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sure.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SjfPcaz6RMqsvFCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabG38gAKCRB4tDGHoIJi
0tOsAQDSlEn8I+c5I8GGpZl8hvteI6FGHPixABlqDJMULTAkhAD/ab7Mem0iZLZb
pRuCoURzJNJ/+qJ+jDEBq6rxwMvOpgg=
=qNPp
-----END PGP SIGNATURE-----

--SjfPcaz6RMqsvFCA--


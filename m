Return-Path: <linux-usb+bounces-34604-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDAZNHq1sWlYEwAAu9opvQ
	(envelope-from <linux-usb+bounces-34604-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:33:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2762F268A84
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77B1E30879C2
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 18:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5047A3E6DD5;
	Wed, 11 Mar 2026 18:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqqHsTW1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09D982866;
	Wed, 11 Mar 2026 18:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253836; cv=none; b=Z6+FuBxVHXHbL1WF7DVzKxZBtdQHbbei1ZonOt/C+xF4f/d9tx8DUwYUjVm0iaNQpipdxdyUZhmERtC2ooqgrUMOS0Uq90hrcWKpnnkUqjMRcZXxFG5G37UHc85mjtQL1L/7dNvAGjrdL7a1Gj1NdMj7JpsPRRaLOzugqLLbsBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253836; c=relaxed/simple;
	bh=H9iyV4BAqADOKjQtFBjZoNRoOzXo2dCNmcaw6qiOPDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMPRJ+5gQUJ2pOiTyLI5I8tKqz2G8wvaNpq5w/RCHU09WnTPba8ot7DX2xfYr1+cSb6gmw0IEUWIp74JkTvRjtdM6H1bXPfMq/Gi1GlPDb6TZMwxgWIZb7UVw2I1RAogwwqwCIaYXZGAHgk3ysgINo0kROv4iXgFJ1PaBx0S57c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqqHsTW1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E320DC4CEF7;
	Wed, 11 Mar 2026 18:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773253836;
	bh=H9iyV4BAqADOKjQtFBjZoNRoOzXo2dCNmcaw6qiOPDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqqHsTW1FNZIUsSzpeDcTSk3ohzzEYANXyL8xJAX2cnewL2+GpBLJLoDT2mU/GEXj
	 332g818ldYAMvyp95Txb58wONuGezP9nnKjG0WFE9NoTuU5Wjc6IX84Jlbqcp8dakS
	 WQqKMiGsRe4aZ9IK3PgaEU2akJ1qoF+4ZAYQckeFEaNqLIHS8YxdRbBBGILA0051hT
	 iTZPnIujwO6WMGicVHf994zoxjT2wx+8746ioxZVQghm+uObypYaGy6HjibN/8l+qa
	 +Cn6Avd37scMH7gOY1/s8YgRG1sO5ZUuQfd8eMlkeWxC9WqVHUl/s2/Ka3vC8I0MDK
	 Ss5kgSlKosaJw==
Date: Wed, 11 Mar 2026 18:30:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Hynetek
 Semiconductor Co., Ltd.
Message-ID: <20260311-reprise-cartridge-a8f9c470c243@spud>
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
 <20260311-husb311-v1-1-f25bcb58cff7@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g9wwrn7c0e9Ducz2"
Content-Disposition: inline
In-Reply-To: <20260311-husb311-v1-1-f25bcb58cff7@flipper.net>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34604-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2762F268A84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--g9wwrn7c0e9Ducz2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--g9wwrn7c0e9Ducz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabG0xwAKCRB4tDGHoIJi
0lz1AP4haoaHSQSCTFXf2VkikeqNx9Iano/zc6eK3AkPkUhT1wD+Pz67k5Ynrl1g
BhHnDtJhHMCBkhuW1qQ51yemvru8iQI=
=t7Zv
-----END PGP SIGNATURE-----

--g9wwrn7c0e9Ducz2--


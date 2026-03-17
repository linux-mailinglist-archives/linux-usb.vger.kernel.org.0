Return-Path: <linux-usb+bounces-34930-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFUSNVxQuWmuAQIAu9opvQ
	(envelope-from <linux-usb+bounces-34930-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:00:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1082AA53F
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82AC6312CD20
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 12:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BD13C6A20;
	Tue, 17 Mar 2026 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+p6n/jl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56B73A3E75;
	Tue, 17 Mar 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752131; cv=none; b=EQyIpJZeBV7m6sZ20DQ15LIcC1Z4/IahXr0Ly0ezR+fD0mR9vWGM5nKXODmwCLraVb2jQj2c9g3PYRiN6hgQUwX1LgA7tmYMrDoi4o6xVbHGlM+sQ4vKsUAoxm2+6m4vwsCl8k+xqqMEpym4pFFGsf/1SnUhtc1bTVSkp/sva1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752131; c=relaxed/simple;
	bh=JjzTP7hmp1XcE7FvW69lGHkfiLxgys4jXR9NwDPJZHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrsyvtV71wzDY6sBw7IjmIrQcriaAB1QXBZKOXbO2kRNQGPdNIBgmPLP77/OtFrw5RmTeFqOGZ1ejxPM9Yod3HkorqwPDxKdZ+7Pvd9Lx9u2nxNosL8FW7/zx5ejjHfkBZwdll+JAmyWjVGqHucdfl/UCZjRm5r+CZ7FhmwAvcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+p6n/jl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9B3C19425;
	Tue, 17 Mar 2026 12:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773752131;
	bh=JjzTP7hmp1XcE7FvW69lGHkfiLxgys4jXR9NwDPJZHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+p6n/jlYOqTL1GKPlXe3s+fY4jFeIO+PMtxymQ8kOyB4MOY7pNsK/41pb0AkU1kI
	 eHuo1eN6Il+Z7yn2xOVcpip3IKqn6pYPlN2isod5lb+sYPJWt5mmPHzvEidB4JmosI
	 WtHWZNfFzG9WFcm8irnejmYHX3V1/IcJnLkRbs50tzmnq/jNthYGMcspArBxmoCQBX
	 BSe8NkzR4pX/7VmsMBx36/Rwj+tzxREi6pie0juXYfsOhUjDPdGoDCFzL4LFlTZNB7
	 Mj83zJsmPb/FlrD714JrJ0G2iJWssWHDT50k2wln0tiP7zdL0tQc0tiWKfSjw2SDQU
	 nPQlHQTKAZ6Hg==
Date: Tue, 17 Mar 2026 12:55:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: spacemit: add support for K3
 SoC
Message-ID: <20260317-shortness-gecko-72f14fbc79f2@spud>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EuN2sbgx2TXCBXAM"
Content-Disposition: inline
In-Reply-To: <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34930-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux.dev,synopsys.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,esmil.dk,spacemit.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F1082AA53F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--EuN2sbgx2TXCBXAM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 11:53:02AM +0000, Yixun Lan wrote:
> Add compatible string for DWC3 USB controller found in SpacemiT K3 SoC.
> The USB2.0 host controller in K3 SoC actually use DWC3 IP but only has
> USB2.0 functionality, and requires only one USB2.0 PHY connected.
>=20
> Explicitly reduce number of phy property to minimal one.

Is this valid for the existing compatible, will it work with only one
clock?

>=20
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml =
b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> index 0f0b5e061ca1..cc27b363ca79 100644
> --- a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> @@ -27,7 +27,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: spacemit,k1-dwc3
> +    enum:
> +      - spacemit,k1-dwc3
> +      - spacemit,k3-dwc3
> =20
>    reg:
>      maxItems: 1
> @@ -42,11 +44,13 @@ properties:
>      maxItems: 1
> =20
>    phys:
> +    minItems: 1
>      items:
>        - description: phandle to USB2/HS PHY
>        - description: phandle to USB3/SS PHY
> =20
>    phy-names:
> +    minItems: 1
>      items:
>        - const: usb2-phy
>        - const: usb3-phy
>=20
> --=20
> 2.53.0
>=20

--EuN2sbgx2TXCBXAM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCablPPQAKCRB4tDGHoIJi
0kOzAP9IrBhz/9lUWu6n36ZzFVdy7rbYI2ZzdxCKDRsfR4RKowD/UYnpNrGUAgeX
VhlMZkWPWooLosGBq/M0pO1VFGiCvQ8=
=DUTM
-----END PGP SIGNATURE-----

--EuN2sbgx2TXCBXAM--


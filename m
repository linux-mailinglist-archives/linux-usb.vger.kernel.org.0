Return-Path: <linux-usb+bounces-35071-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EsvGcHgummDcwIAu9opvQ
	(envelope-from <linux-usb+bounces-35071-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 18:28:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C602C043B
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 18:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43EB930F4C75
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 17:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2311EFFB7;
	Wed, 18 Mar 2026 17:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ER13sYwt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AC82C11E6;
	Wed, 18 Mar 2026 17:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854521; cv=none; b=fBlK+CVYBNpyWoPTth+suHp0oSJcetN8HNuM9bEYOCYLLY+OxT7LapETdESdGl6Rt2PRljHZIF9LKKnBZd6g0BTRWTKfmUve97CnVlC4l4VYtPYPsCZMXL8joUWKbl3yHIZbAOZUWi+gNu740OQ4mZ9cVlyDqI37cf4xq8bctGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854521; c=relaxed/simple;
	bh=RbflVVAPE2po6tgMjPMGmvrHAg0qgOj85Ij3mwxQhb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptFTZfZ/R0CTeoLYQs50cwjH6KU2sn2CiukR0MYdMDvFmcXkG7MuI5t9aRLfAtlHjr96slNdpxDWvYo8X3gBwX1b2rS+Ep8yea4Uvl5eU/0KqgEJBAwIHpRhLpwtJAjbp0osVOuvMi+azN/753JrS/vKgZvjz++P1sNovxPhEVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ER13sYwt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62995C19421;
	Wed, 18 Mar 2026 17:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773854520;
	bh=RbflVVAPE2po6tgMjPMGmvrHAg0qgOj85Ij3mwxQhb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ER13sYwth0Kfn2l7L6Hfue8AMtL/49O0yjz2cvqpEBQuRu5NkihEHp38ocVegTQ+6
	 HZMdVrIkIPy0RtRRkbN0cmK2B1emb4URSXCfZZybD4tAO061iWSScTAWwecSkGGWdb
	 qgD5bbT31BcMuFVhF3iW8i9wiZxgVfxjeOJu075+uMu4KG5CD/C/Hb5n5wy5kuC5hf
	 jyMirTdwy4pP84fU078nVeK9F8t/kAXONcFwk9qoZSRSx1F8mXQeOcvU7ssYApSlrD
	 4gYnrCP/cShX7AKMCG47TwZq9D63ve17ler1ZAId8UPIARwpanjB8U44aIit2WrQ/Q
	 mtqjCRGrzwInA==
Date: Wed, 18 Mar 2026 17:21:55 +0000
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
Message-ID: <20260318-crock-tinderbox-ae12024627d9@spud>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
 <20260317-shortness-gecko-72f14fbc79f2@spud>
 <20260317214435-GKA453922@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l9yXgHBynxFH/8bE"
Content-Disposition: inline
In-Reply-To: <20260317214435-GKA453922@kernel.org>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35071-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux.dev,synopsys.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,esmil.dk,spacemit.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.955];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D9C602C043B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--l9yXgHBynxFH/8bE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 05:44:35AM +0800, Yixun Lan wrote:
> Hi Conor,
>=20
> On 12:55 Tue 17 Mar     , Conor Dooley wrote:
> > On Tue, Mar 17, 2026 at 11:53:02AM +0000, Yixun Lan wrote:
> > > Add compatible string for DWC3 USB controller found in SpacemiT K3 So=
C.
> > > The USB2.0 host controller in K3 SoC actually use DWC3 IP but only has
> > > USB2.0 functionality, and requires only one USB2.0 PHY connected.
> > >=20
> > > Explicitly reduce number of phy property to minimal one.
> >=20
> > Is this valid for the existing compatible, will it work with only one
> > clock?
> >=20
> I didn't change clock binding, do you mean phy?
>=20
> Both k1 and k3 work with one clock (no change here)
>=20
> for phy, the existing k1 requires two. for k3, one controller requires
> one phy due to only has USB2.0 support, other controllers requires two
> phys - USB2, USB3 PHY

Yep, phy is what I meant. Sorry bout that. Since you're relaxing the
constraints for the k1, can you please add a conditional section to the
binding to enforce 2 phys min for k1?

>=20
> > >=20
> > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml | 6 ++++=
+-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.y=
aml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > > index 0f0b5e061ca1..cc27b363ca79 100644
> > > --- a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > > @@ -27,7 +27,9 @@ allOf:
> > > =20
> > >  properties:
> > >    compatible:
> > > -    const: spacemit,k1-dwc3
> > > +    enum:
> > > +      - spacemit,k1-dwc3
> > > +      - spacemit,k3-dwc3
> > > =20
> > >    reg:
> > >      maxItems: 1
> > > @@ -42,11 +44,13 @@ properties:
> > >      maxItems: 1
> > > =20
> > >    phys:
> > > +    minItems: 1
> > >      items:
> > >        - description: phandle to USB2/HS PHY
> > >        - description: phandle to USB3/SS PHY
> > > =20
> > >    phy-names:
> > > +    minItems: 1
> > >      items:
> > >        - const: usb2-phy
> > >        - const: usb3-phy
> > >=20
> > > --=20
> > > 2.53.0
> > >=20
>=20
>=20
>=20
> --=20
> Yixun Lan (dlan)

--l9yXgHBynxFH/8bE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabrfMwAKCRB4tDGHoIJi
0uYgAP4hNROGafNxKj4L7xTfPFe4fXHdldzt4A56nNUAqNTlDwD/cLpaVshh9YeN
cHdEm4s7WhmsyY96RlR4h00BLzlh3gc=
=hS48
-----END PGP SIGNATURE-----

--l9yXgHBynxFH/8bE--


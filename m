Return-Path: <linux-usb+bounces-35158-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULBGIiULvGkArgIAu9opvQ
	(envelope-from <linux-usb+bounces-35158-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 15:41:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4B92CD09A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 15:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60DF93053CE2
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594FD1F09AD;
	Thu, 19 Mar 2026 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvUwICwb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7EF3D47AF;
	Thu, 19 Mar 2026 14:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930975; cv=none; b=GA+JcZCqEVcIegMWa7dKJKz974wsvRPiYbv19gVAjlqN+oGFrAzdaPRKiQsfJR32R+kFV6cP1JHSEnBNEBExyg95CD2Z7VpRIKh1/6NMJ2jbfgCmI4JvT4/Z+3DNowNTFpxWqqCNIw9ZgtYyAgTW+j1T5CBiOxcDzsLIMAD2EX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930975; c=relaxed/simple;
	bh=0sWepENTLCOfrxR5/+c2+51Ax84QGBYsq5KpzSjrIW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHlDiv+SO8lk+p4YPVsyLpuZYwIwocESJdZX3XzLcrwIOyC9BAezwVnbYLBY7Tbt4E/GFTMcFRPbpr7YcDevkWM61WxhMwobSn7panbZ3KnjI+hW7NU0ln7mZWeoCB61zqwe01QnxzALqkYhT+i9KUUK7UfuBhQadtnZj2nHZ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvUwICwb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F69AC19424;
	Thu, 19 Mar 2026 14:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773930975;
	bh=0sWepENTLCOfrxR5/+c2+51Ax84QGBYsq5KpzSjrIW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvUwICwbqieYDdbpxY5iLebUupFiC2wVL8ay+ylWDUNlIuiVGw8/F5wNm3tcOxksu
	 RCp3W1hwcaffTSx66C0edF7Yh17YFHjch+ErvwR/Cdwl/zrbzfKGbhorLeBrgJv6HX
	 Qi7utROptr6/Eg4YARflKNpC6eZIeFszZe6pMNQju5ASLMzui6VdzrRSgqQg1mPwwo
	 OkFMbWehAhExqwlWkgZ0UdrRaa8KkqDesVAcEXtFUT9fH5GbzbS2T6mhBEHKM0wZ/0
	 cwv/BbFBEMgkWe9/szEEGBWWpR/HzAHtwDLrvc6VSkNTUkp//hnT+VafrYCPmKofTW
	 m4Qp3r1iojKlw==
Date: Thu, 19 Mar 2026 14:36:09 +0000
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
Message-ID: <20260319-garbage-scrunch-37dc1b72d56c@spud>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
 <20260317-shortness-gecko-72f14fbc79f2@spud>
 <20260317214435-GKA453922@kernel.org>
 <20260318-crock-tinderbox-ae12024627d9@spud>
 <20260319024124-GKB489299@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3mKkiWYjZ1K2L1Tq"
Content-Disposition: inline
In-Reply-To: <20260319024124-GKB489299@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-35158-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux.dev,synopsys.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,esmil.dk,spacemit.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.959];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E4B92CD09A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--3mKkiWYjZ1K2L1Tq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 10:41:24AM +0800, Yixun Lan wrote:
> Hi Conor,
>=20
> On 17:21 Wed 18 Mar     , Conor Dooley wrote:
> > On Wed, Mar 18, 2026 at 05:44:35AM +0800, Yixun Lan wrote:
> > > Hi Conor,
> > >=20
> > > On 12:55 Tue 17 Mar     , Conor Dooley wrote:
> > > > On Tue, Mar 17, 2026 at 11:53:02AM +0000, Yixun Lan wrote:
> > > > > Add compatible string for DWC3 USB controller found in SpacemiT K=
3 SoC.
> > > > > The USB2.0 host controller in K3 SoC actually use DWC3 IP but onl=
y has
> > > > > USB2.0 functionality, and requires only one USB2.0 PHY connected.
> > > > >=20
> > > > > Explicitly reduce number of phy property to minimal one.
> > > >=20
> > > > Is this valid for the existing compatible, will it work with only o=
ne
> > > > clock?
> > > >=20
> > > I didn't change clock binding, do you mean phy?
> > >=20
> > > Both k1 and k3 work with one clock (no change here)
> > >=20
> > > for phy, the existing k1 requires two. for k3, one controller requires
> > > one phy due to only has USB2.0 support, other controllers requires two
> > > phys - USB2, USB3 PHY
> >=20
> > Yep, phy is what I meant. Sorry bout that. Since you're relaxing the
> > constraints for the k1, can you please add a conditional section to the
> > binding to enforce 2 phys min for k1?
> >=20
>=20
> To be explicit, the change should be applied to both K1 and K3, even in K1
> use case, it's perfectly fine for designer to choose enabling USB2.0
> only, and leave the comb phy to pcie contoller, so only one phy required

In that case, can you be more clear in the commit message about why this
is also being done for the k1 please?

--3mKkiWYjZ1K2L1Tq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabwJ1QAKCRB4tDGHoIJi
0oqyAP4nXoDLetxoQs642+vVHye9yDClNXYMEPidUjtskTK5NwEA3z4OdmCZisdC
OPflp/85AHIauaJjUPhuhi0GguyjGw0=
=S1Ui
-----END PGP SIGNATURE-----

--3mKkiWYjZ1K2L1Tq--


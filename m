Return-Path: <linux-usb+bounces-34677-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIIaNg2hsmkOOQAAu9opvQ
	(envelope-from <linux-usb+bounces-34677-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 12:18:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1FE270C4A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 12:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 173A830DAA03
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 11:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0D23AE6E1;
	Thu, 12 Mar 2026 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVs8wrlI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78464823DD;
	Thu, 12 Mar 2026 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314271; cv=none; b=lqb4Nc4oqAEpItQ/jtiSBDyJF/xvh3WFbmWsDrO2BQ7hjyoRAgCYlTaq9/TnY3pB35Polnacxjlc9PkD2T3VqyXWmPWmkdrMsIOw3bnE3olXJ9bL15VeI//hcCAEdYhQSxLJedevEOHpkSv31QJJKAqBpXEYAw5acN1RPj8EGJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314271; c=relaxed/simple;
	bh=wBedHcPA+Jr+vf+qz66g3+kvQVhwPxMWfDbP3CM01lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsQig55WMeZvtcntTb4eSZboUIg+8pd9W6gdJXwEt7LdyJgLj9FHV5Uvuf2Xbx3T4/NjqYwFSeLPb/p8BFHEWD77jCoSXSPtx/QZJejFf2pVQNTmaqm/KtirFXgeMVbzEFvGinAl5IxaJ6Rj/3HElWJNIDdcVtaRHA/lZEh+yR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVs8wrlI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DECC116C6;
	Thu, 12 Mar 2026 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773314271;
	bh=wBedHcPA+Jr+vf+qz66g3+kvQVhwPxMWfDbP3CM01lA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVs8wrlI91czMoggK0JSP9g8pChndUrcaYTLje9aIDwaobXvtLF5yzouiYPuJAf9D
	 BQtSjkyoL4qEaPUeQTw6b9FlDP0m3HgB2FNzFy1HVzWFh0u9yUBn+cNd9K0XMBb/mY
	 koTrTBKkI5FGPIhHw+uVBwzjAFR0HFUbWpWH9c2H9xzCr1ydJMLjsMcTHi1Zqe57TE
	 EKKyIPWzPeiuFPszClrntZ5mbiJkWb/eBzGmJRT5i5sw3k14YsyBe9dwmc9scNgZ1z
	 VICWYtn1PrwyGmeNHE0PVkhZytFNzf+bRoEw2RQlveiEYnFZA8IWmRyVYa9LMShJ/p
	 JR0qEpZE78ySA==
Date: Thu, 12 Mar 2026 11:17:46 +0000
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
Subject: Re: [PATCH 3/4] usb: typec: tcpci_rt1711h: Add support for Hynetek
 HUSB311
Message-ID: <20260312-malformed-cruelly-b27dc90fffff@spud>
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
 <20260311-husb311-v1-3-f25bcb58cff7@flipper.net>
 <20260311-married-democrat-f6eb1c651e97@spud>
 <CAKTNdwFQnySkhpLDrFh5kwX=_tvci=g0Y6Q5y-15Qsogd=FxOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="288jPNk02s7OMmIL"
Content-Disposition: inline
In-Reply-To: <CAKTNdwFQnySkhpLDrFh5kwX=_tvci=g0Y6Q5y-15Qsogd=FxOw@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-34677-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[flipper.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,xkwy2018.com:url]
X-Rspamd-Queue-Id: 7C1FE270C4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--288jPNk02s7OMmIL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 11:09:43AM +0400, Alexey Charkov wrote:
> On Wed, Mar 11, 2026 at 10:33=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Wed, Mar 11, 2026 at 08:20:46PM +0400, Alexey Charkov wrote:
> > > HUSB311 is a pin-compatible and register-compatible drop-in replaceme=
nt
> > > for RT1711H, so add its IDs to the existing driver.
> > >
> > > Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535=
-4f09-bacd-0440d2c21088.pdf
> > > Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20B=
ranch_Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%202021=
0526.pdf
> > > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > > ---
> > >  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 21 +++++++++++++++++++--
> > >  1 file changed, 19 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typ=
ec/tcpm/tcpci_rt1711h.c
> > > index 88c50b984e8a..ac5917c1e253 100644
> > > --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > @@ -18,6 +18,9 @@
> > >  #include <linux/regmap.h>
> > >  #include <linux/regulator/consumer.h>
> > >
> > > +#define HUSB311_VID          0x2E99
> > > +#define HUSB311_PID          0x0311
> > > +#define HUSB311_DID          0x0000
> > >  #define RT1711H_VID          0x29CF
> > >  #define RT1711H_PID          0x1711
> > >  #define RT1711H_DID          0x2171
> > > @@ -55,6 +58,8 @@
> > >
> > >  struct rt1711h_chip_info {
> > >       u32 rxdz_sel;
> > > +     u16 vid;
> > > +     u16 pid;
> > >       u16 did;
> > >       bool enable_pd30_extended_message;
> > >  };
> > > @@ -308,14 +313,14 @@ static int rt1711h_check_revision(struct i2c_cl=
ient *i2c, struct rt1711h_chip *c
> > >       ret =3D i2c_smbus_read_word_data(i2c, TCPC_VENDOR_ID);
> > >       if (ret < 0)
> > >               return ret;
> > > -     if (ret !=3D RT1711H_VID) {
> > > +     if (ret !=3D chip->info->vid) {
> > >               dev_err(&i2c->dev, "vid is not correct, 0x%04x\n", ret);
> >
> > Why are we checking vids and pids here? Rejecting a non-match prevents
> > using fallback compatibles, so I'd like to know why the code exists.
> >
> > Is it just here for the sake of it, or to prevent some actual issues?
> > Not really familiar with USB devices unfortunately.
>=20
> Hi Conor,
>=20
> It looks like a relic of some original vendor provided driver code.
> Rockchip's implementation of a HUSB311 driver [1] contains similar
> checks but I don't think it adds practical value in the world of
> Device Tree (after all, it's just an I2C device - I haven't seen many
> I2C drivers reject a DT match based on hardware IDs found in

There's been a lot of drivers in drivers/iio that do this kind of
although they're gradually being modified over time to support using
fallback compatibles.

> registers). I chose to avoid removing them with my patch though,
> because I don't have any Richtek hardware to test such a change.
>=20
> Maybe the error could be downgraded to a warning though.

To make use of a fallback, it can't produce a warning. If you wanna keep
it, just make them dev_dbg() I think.

Also, the devicetree binding should then be modified to support using
the fallback.

Cheers,
Conor.

--288jPNk02s7OMmIL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabKg2gAKCRB4tDGHoIJi
0kk2AQDyPSMsaOdJAVhjM9GUu81QMjVh+OQxeTyTVc9oxZggkgD+PwjQxS3n6dhI
EGB+VVnwp4ser4OBFZFXWgb3WuPt4AQ=
=6uRW
-----END PGP SIGNATURE-----

--288jPNk02s7OMmIL--


Return-Path: <linux-usb+bounces-34752-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBiSOggttGkEigAAu9opvQ
	(envelope-from <linux-usb+bounces-34752-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 16:28:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B13285F76
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 16:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 292EE30DCADF
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 15:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAA03A6F17;
	Fri, 13 Mar 2026 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="YLjcl9vC"
X-Original-To: linux-usb@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1C41DED42;
	Fri, 13 Mar 2026 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415433; cv=pass; b=YPHMwKkP/P5ag1fEsZjALJy9r3SLkjzV1I8ZY/uOd6VR6mHlqWhh7y3MsgYME8KdgBzHRWuMUpE/gYVBB07zZWwkT0xuvgDMZYcuyAlNUnhxK19qidHMCS3rQPLYfPwAa/XK5k+vt024oMRVySJ0aJ2W5UIsrc5ZewSydkKk2xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415433; c=relaxed/simple;
	bh=6CZEYRn3vcFnKukN37/DSC9KhWDu+I9oYM+A5iecHx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCdD+FB7G0dLNLHQgDoOm8aE6u4/j7i1sSh9DbJouCjQlZgkWsPXhPZsDc1yE4n9ylN5WAwe1xlI8gfhGRSIBbo5fb7/tvDil+n+f+aTZw2Wsq2o9QCcPB7c6lVjAvXDu6eVJiLebK3/VrPrmP1AC1VBMXAa9vKs5L8KxYyA+2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=YLjcl9vC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1773415420; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MsJ0Yfj3S0u8GB7QMv2zBH78mCwQCSyu2tnIjwaBxl4GvtFvBC+XhH60T+M7HUx6++13YNSbfn4ZQ9YtPIZmhf2DyuDjufYCtwirx/XkBC7tVos6H/IMucNIRcmTUFkcu5fqx9oSZdyCPvLU8WeuWMjb4/PnA13xcP4mgirQ6B8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773415420; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eaU1XN4zA/a4Qr//xACHv4yosqVIsczu9sdz0hWtKoM=; 
	b=R/yUOzVSmNEt5UIibbTncQOTHlHief3vCELV6ixRSmh6j9ny45l5v3+087av4GRP9a/K25osrn/sg3GPhh9sOwYWpZ1FB7k8ioBQvoalJo2MEWyLQG/Ub1EHRWlwsdWdAX8O5zUgC9wBb9kPtTq5uMl0rlw4IgBiSIWB7dGsexY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773415420;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=eaU1XN4zA/a4Qr//xACHv4yosqVIsczu9sdz0hWtKoM=;
	b=YLjcl9vCcXfpA9Ds0KoCS2f9yKlc14lgw5tc61Owd2z/MjRgTV/1hUKuffvDG4sv
	/B6qOrgdhiBDP6/KJAuTVak8cChpxZKTUbQTxR05Zq+iNKr8f6y5LuV6xIfMAf8Dngb
	7FIC6500qNH+ULZhUGak4wxSseSNXIaMHTl/CFMk=
Received: by mx.zohomail.com with SMTPS id 1773415419459217.7085779025731;
	Fri, 13 Mar 2026 08:23:39 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 8F3E81808EA; Fri, 13 Mar 2026 16:23:35 +0100 (CET)
Date: Fri, 13 Mar 2026 16:23:35 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Alexey Charkov <alchark@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] usb: typec: fusb302: add DRM DP HPD bridge support
Message-ID: <abQosjYhlkAEcTBI@venus>
References: <20260310-fusb302-drm-dp-hpd-bridge-v1-1-ffd41ef9afe3@collabora.com>
 <CABjd4YxCQw94qg30mC7a9CJWvYje_NrUkzw+gu5wzWx55SidEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xxm7n2e2dbchwgwg"
Content-Disposition: inline
In-Reply-To: <CABjd4YxCQw94qg30mC7a9CJWvYje_NrUkzw+gu5wzWx55SidEA@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/273.394.95
X-ZohoMailClient: External
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34752-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim]
X-Rspamd-Queue-Id: 42B13285F76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--xxm7n2e2dbchwgwg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] usb: typec: fusb302: add DRM DP HPD bridge support
MIME-Version: 1.0

Hi,

On Fri, Mar 13, 2026 at 12:15:08PM +0400, Alexey Charkov wrote:
> [...]
> > +       ret =3D devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
> > +       if (ret)
> > +               return ret;
> > +
> >         return ret;
>=20
> Nit: how about
>=20
> return devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
>=20
> Saves three lines :)

The patch got queued already. I can provide a follow-up patch if
that is something people want to see. Generally this is a style
decision handled differently between subsystems. Your suggestion
saves three lines and is more efficient (but compiler will optimize
to that anyways). Meanwhile the version I provided results in
smaller diff when more code is appended in the probe function or
the order has to be changed for some reason.

FWIW I would like to see this driver be more converted towards
device managed resource and then use drm_dp_hpd_bridge_register()
instead of doing the allocation and add step separetely. But I
would wait with the cleanup until the 7.2 cycle as
devm_alloc_ordered_workqueue() will land in 7.1.

Greetings,

-- Sebastian

--xxm7n2e2dbchwgwg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmm0K/AACgkQ2O7X88g7
+pqk4xAAnbssjkstEG+R5E6NSUBMQFslgAosGtXHOgOP9Ag4+P1KJGuyTYc75ZjG
P6BmlQFyXUqeEk0DTPRHWQbtR5T8MqE55gjeRDFQv2oynMFFeIa2qsV9BVp/4hnU
OKtxbgWuIN4orOOJqBVSVHjkci0stkd8ngaTvf/LU/W3qtuhAMJT6AHwfvrlK7QD
mUANMDrTMFLbSLmwBv7e4rtomZgpZAB+6JlxsqEK63LclVSn4S6KJqK3hKGK3rvZ
vCdiAVfNSfFgw5szzwcT10XQak5+xIn/ymQ2LWAipMzlzcB5GCfuF3Wa0g/f4UPq
aQOyQeip/vcpHw3ecNgzkGDRZuVPWKOV8T6Qt0selfOYu1ErFTVSybak9taX66/H
NSVb1wKMZyEL2SDIu7rCwT+fE6N8YJbvk3BNZbH9UsfSw5WX/on/JeHEmR1LoICJ
KyTjAEIHQsg9JD7JZnQ2nkKsFSNuTs+K7nOvG2SecJq3HdsTkdxKK+ARl/J6vpQW
gMAsDm86j2JCWbA+aWr1nbplZf2IFTuLsFpD+t+akzLPHyIYzS3LzffpSoVK826y
9kh7lTEw0lKgRnklRS5XeSUVPKHo4fp0ONTvOZtREn0NghUVHsoRtdyJ2DOKpIHl
tF+nwYyMZsYxKAIc2InOJ6szpRtqGNr3KY5li+VokAwKKHICzpQ=
=v9L3
-----END PGP SIGNATURE-----

--xxm7n2e2dbchwgwg--


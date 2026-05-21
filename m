Return-Path: <linux-usb+bounces-37821-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDlsJ/m6DmrBBgYAu9opvQ
	(envelope-from <linux-usb+bounces-37821-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 09:57:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A575A0837
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 09:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 87BEC3017454
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 07:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6B239B962;
	Thu, 21 May 2026 07:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQOH2x0O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D0A397AE4
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 07:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350258; cv=none; b=UGBQnblQIhrI9TjgQNODACF+/f6eaVlpfQ+/MosCsbMbDduJrdvXSAvU5RXXBCR900EmZE0sq7YvjV/cqIsDRlOAtAqYwdMKr6740qLxqkKAKJqtSEr57ozxoIEt9ZtNRjGqOC9F9cmO4IP81xg4CkZSPuxixtHI9THeJD7imdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350258; c=relaxed/simple;
	bh=01uWqmyLFzd8H4CBvINTSYaToSHFeAsBFz1Y1xtMczw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGIBFy921w408M3LPPvQ+K//FY53Ts0utEcgoEBttzXh9Vzm9avGlRbexuYXval2t+QYwKUsn8LeQMcQiXyMD+yLRQ0pXCKpZrHkpfH/4Qfj0aYYmvq9Q9hlbJnOgf6OCoeGqR3Z9deNUQngCM6bkrmOPp2eFL48uUgUQU6gb7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQOH2x0O; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d77f6092eso3327291f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 00:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350253; x=1779955053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZORxaPdJSDOgk8ANxzTl375l5CvuQSqBLkQk79bozY=;
        b=OQOH2x0OZmEHxHHry4BcFu9isGLq7beTOFb9yC45lwiqzRwafosbDvCQccvcpI4Hxe
         eNbwvw1744HGpcNiJAsDBkrw0MOq6sGds1NNjqKKdU7XNpyaBOBKjmtpsUX6V4wjZR5k
         Q6cOhRbs/2kg7mNG7JGrw5Mv0KyRQWrK0BBill59rSboOl2hNYGNkFbj5C1VgnaY/O71
         6h9qm+zQaGuSOpXX61yXVpOm24hFxKD7lHIZx8i8qrG4CTHkTNB6DjkIkfahhE9yQYdC
         fT/M6Md7fplyvntgzvkItb2GO0f2QUjGrMGYcskzmZdYFpJSrhLb7NDmnIMIqlEa7t0y
         k+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350253; x=1779955053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZORxaPdJSDOgk8ANxzTl375l5CvuQSqBLkQk79bozY=;
        b=lMFFs2Er9CkMjFAj3yFU73EPd54XCEm/bqi7t9cOgVwWTCQgFHgjm40DHiNKX5x+Sl
         I71sLtYkfwjn7qhKO5W5XMwexmvSb3s6TCjHoTcyEFWXXuQ8RXOYQ3y8MIddE300AJry
         lFdFXb3dB293M4/dg65Co25bvtsCwzq+T1Po51KucNG0eTNGXXIap5fYO3d2tsjbkgEr
         uPPdy/IRXFK/qZjPsbZt8Yram0SbleJx2XOcGBqZED+770PwprTGgLdBX1uq9t4iEutk
         jUMaYuPH4AuZolHbuSl9yJUi0e6yVqMct/TPBbyfg9OfZ9QArjihGQ1iI8dlb0NWZlG2
         bOlg==
X-Forwarded-Encrypted: i=1; AFNElJ9QI5Y6BOUpkFWD5MVbhUVGGHWhMBttD6vqGk5XyCytHcLH6WdVuGsAe5vcIbEH+MjScLHtpT31X+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTzIoDiQUKD+wDfx3HPDEAAnye6F7fxwTZbf1gH74sk0GG6VD6
	0vLRYMkv40UoroUTrOa4ZZgEbmikgPc7i/aXd9BlJwsjIfh5dEjbxyfU
X-Gm-Gg: Acq92OGyMQi3ElypvJjU0cYsL9uZuaZC3bR3r47641GPugCLuX1hYWSmCFiTennmu2h
	zUSM07DCN6gaU27N39mfJXQvdv7DTFwJpzf67FZ9BTculIc4tp/4no14ZJRLNRXs4TU15B8+IzH
	/AfVxrsAvl/pjSxkZtaPgn1zGh/iJNFO9vluIsKcfTyVhREKty3C/1ypvhwdSzZrqChWRoODPt7
	e0iORgZsTnyUkNmhqBij/lgaHtCjcwDd/tu55EzYsRp7ywW8pd6xERdIcR7GFD9oyWT0SGRm8Ui
	IcJOO3/LHnBBfiv8OkGsXcTRw/RRXSl7OyAkR6poInQoOEGHmLUT9gZ6LB18s03FMTiomMrQi2t
	ynLhE1hXn0CNjCn63hsI/wxsl9GzSoBzw/nKI+D2cD0LRJIHLJRP/f9EAkNf3jYk2SIP3J5ENSz
	sYSHQzi126JoEHLUR7kWMF6hmYhlS7XwtXH5uwsySqZf9b89BFKUl8x6DqBUGA5kiEQrz4cxUuJ
	184jwVZcJuQ9g==
X-Received: by 2002:a05:6000:2583:b0:45d:3cb0:5ab1 with SMTP id ffacd0b85a97d-45ea4141e17mr2803411f8f.38.1779350252817;
        Thu, 21 May 2026 00:57:32 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dd50asm821152f8f.15.2026.05.21.00.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:57:30 -0700 (PDT)
Date: Thu, 21 May 2026 09:57:28 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 4/9] media: vde: Explicitly specify PMC instance to use
Message-ID: <ag66qZ6rLOeUTWV7@orome>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-4-a6de5da7216b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ufnilbb7pbo55sdz"
Content-Disposition: inline
In-Reply-To: <20260506-pmc-v1-4-a6de5da7216b@nvidia.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37821-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,google.com,intel.com,linuxfoundation.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierryreding@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 43A575A0837
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ufnilbb7pbo55sdz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/9] media: vde: Explicitly specify PMC instance to use
MIME-Version: 1.0

On Wed, May 06, 2026 at 03:41:55PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/media/platform/nvidia/tegra-vde/vde.c | 15 +++++++++++----
>  drivers/media/platform/nvidia/tegra-vde/vde.h |  1 +
>  2 files changed, 12 insertions(+), 4 deletions(-)

Hi Mauro,

would you mind providing an Acked-by on this so I can take it through
the Tegra tree? That'd make the dependency handling a bit simpler.

Thanks,
Thierry

--ufnilbb7pbo55sdz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOuugACgkQ3SOs138+
s6FbKQ//aRQbgwr4ztzl8XykZ3VwYpBsUA5hzUjDURQkJFNdwnkt6k1kBPuF6tMI
joUObtuboDDZBD6T1W1CWvCKqzBPwDlmD5hdckRGlbau3ug5Z4HYFpTEoO2VPhr8
kW6mO+oE+5Jq2I4kEfCg9WfotOOP15ehuSzn2JRbKZDLC9l8/Fyo/7nglXyjmoJk
qgD47vfx8/zgrE/Fv9M+eGdeJzh0XxvRrqWYxe6wJqlFCETYNH38hb+CBfIWa8HR
Tzoa0rmTS4YRP2+p6yeckAN5IWgSx7ZTbCMLLoJfyjEbCUf9Y3ymi7DNWHey2gi1
SY1ue+l/i2UNavChYqtuBV9YOfSyM0PWRQja4YeSMSIK1M7mLfta20LOo37A112O
BN5tR5zmtwiKW5ZnAReOMcWJFLobWu9+ZlbkiyQ4yiONh1truDHgwBOssPfCK+/Y
ejeJGgdzWnlgonVwEp80tLQsNZN4Nccrmnn5JPaH1maEC+eJBtP1Y6V+io/28QFP
YE+W8gXUwm2BK81TcpIw6qswfWiBu8WdGeCx9j5X+mbo/jNWboIo2l0AQxtbCyGm
LiYJV+w1iEWO3WWQKymgmwRdhT/QfeS4VcUikTrZG/NrcIEpVwuVk4syKobUx9Cx
DuSlIPt97hHCjwAaF6HZwg809a+jTrqXPBq4VlYvkjefZNJAiMA=
=2vYi
-----END PGP SIGNATURE-----

--ufnilbb7pbo55sdz--


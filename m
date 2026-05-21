Return-Path: <linux-usb+bounces-37823-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIIzOZi8DmrLBwYAu9opvQ
	(envelope-from <linux-usb+bounces-37823-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:04:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A15A09DF
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36E3630DE598
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 07:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42FA399D08;
	Thu, 21 May 2026 07:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCpNOv5A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E235523D297
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350356; cv=none; b=L8ILyZDhrJ6h2zEFiewOOlMFLyPvujjTk7KrWSmcAddk87wP3OV1AW+doHvw0NRNXCQi4lGt08TRj8tl0GOymtL1HdbqBmjucWOhyK5oSJ+gmG52F/0AzrD3LNhqZh6rXqY2vORAo0ov4+i2ebzKNHRMd3LKNbYYpAAC2iexuSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350356; c=relaxed/simple;
	bh=/1x4coy+EhRxr4G74Byh3jOJGsE6QncBFV+p/Hi25m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXIXQA3/ZP9cA/oQAYe5gH129q0rw876uudJNrBwB0z5KqCPI3ayaaaP/yJvMTg97+0F3dKFDlMPFcqKnuTa0OwMjOnnwJxgduY3rRa92N+xlw9uObsggUfHBN0sb1nMHmkbs2nDgpGtWRr4BRD30+MyU2d56DeDM1xPvk3TnPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCpNOv5A; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso60496995e9.3
        for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 00:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350352; x=1779955152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RfHyghQkuGkWqA8eUzVzPKJ2kyI5blFU5Z3V4gExrrw=;
        b=tCpNOv5A8HdCnQTC2YO6ZmPUIap2OWuVg6KtEdVlpXcpKiO/YpeIEsNE09QOC0vPcp
         mbkj5o0ucQMdZBIgSSBrhyC/5QY7B47hG7LDVU9TFDXSzpHKknB4pvMZaTz13AtS7g8D
         BDej5suWOmQEY1V2jTm/nLuzsxDmemRcGY3F3BsoCEQm3TZqKL7//xBS/cYch4hNkR+L
         s3pr2Vw+4nE0uzPECzfz3ZBPiU7WNMyEj6Xu711+lGijH909MMqqhvwK7DJhjsS/BZfo
         9CNxpVPVl792FLvzHh6sTfal8LBre/LuucO8+uBxwPHGogDvoGMGQWWey9guSQZqvaI8
         OArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350352; x=1779955152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfHyghQkuGkWqA8eUzVzPKJ2kyI5blFU5Z3V4gExrrw=;
        b=dgxtzMuNulMG7qWCryzzkZsEPEmqC5dH2Ap4PSXbXsfdNMJFoq46hxQc5ehao9dHE3
         OInqUSkX4HC5RstvmC2A63+OOsec/dtn19TDcL7inzneEcKSFfDIwdeWrTDVEP2s+9I5
         9yH1Q3M3XvyLx8qx2ltkCE8YrydSYybJwPaprwHYFspSVEffvdqdTzWsLvTJ2wOPYZsD
         h8PMy2r+5Ii339cMZykcFrZylfz+Al8xUmenP/c1MD/gMRnOv5k8smp2LOXdJXhI0jKR
         MaVtXoxCaF9JFRT08QNaVIvky6hHyhHzWoatio+7+qLJQjgo3hmql1l81la7Kc7GHnGN
         6TVA==
X-Forwarded-Encrypted: i=1; AFNElJ/ilrX35q97yGN+sUTFUCQqL98D/kOghVXfslEDOfvhq4fMwN4RNUt+3uJqrOnU+3SQ817PZFzxbug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwJi2ARB9yNlABIJEAttBzsxdfq1uauXVE2Bhx6MVVRGypOgFJ
	1xqxYV/YmYhxrLgUCwiU6Ji34ws1l1PfIwnf7TxOPT8XziLcc7hL3OQe
X-Gm-Gg: Acq92OFlKWTlXP/qxOmvgkEyXj0bKGMRKbVSRTHI0xsvWojQGuG78mIH1Dyoc0ePc6E
	h1qGpl8T7UDbB/v0Su/cwy3fVAmeM5VGTLcVcOf5A8dctsp4z8msXE1sp4Oq9HdjBLkTpp0j4RA
	9qEbKVqydYdLcmJizPb3YF6/s8mTrIZ+n6nHDBUGRoUpaUGxwsU7Do4hAVraL9H3dVUHz3e4RJX
	bdtUe+abBTG2+kzWUOreVjTXAn8RNuFXX2M0S1D0W1sDMyW01njZLGDzNCyYo27JWu29OyJSIua
	rvwJtXIuoVYu5DXUlANABSmGMnQ4CNXEijgFGGWxEKuNJ+RhpYBl5eBkg9DEml8pBkbvHhM+E9V
	4EW+y0I6q9JPe9GjdezvWtVJ4qVXGdsFYNiJ5qqKuKlll8s1gj/Vsl/eKflXSGKsFoyPTB9rXzu
	o2xZNQtsCJbqwiWVyq51DsQHOwMlBiKfpBAvyY+EnfRqxR303C9BzG6C/pjAiYpb+ZGzZfXhjh+
	AeFF3gOM73xBA==
X-Received: by 2002:a05:600c:30d3:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-4903605d86bmr12514805e9.9.1779350351689;
        Thu, 21 May 2026 00:59:11 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490387d16basm5521255e9.35.2026.05.21.00.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:59:09 -0700 (PDT)
Date: Thu, 21 May 2026 09:59:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 6/9] usb: xhci: tegra: Explicitly specify PMC instance to
 use
Message-ID: <ag67FStKnQcvNOrP@orome>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-6-a6de5da7216b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o4bqtknoba4e2ooc"
Content-Disposition: inline
In-Reply-To: <20260506-pmc-v1-6-a6de5da7216b@nvidia.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,google.com,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-37823-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierryreding@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3F4A15A09DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--o4bqtknoba4e2ooc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 6/9] usb: xhci: tegra: Explicitly specify PMC instance to
 use
MIME-Version: 1.0

On Wed, May 06, 2026 at 03:41:57PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)

Mathias, Greg,

can you ack this so I can pick it up into the Tegra tree for simple
dependency resolution?

Thanks,
Thierry

--o4bqtknoba4e2ooc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOu0oACgkQ3SOs138+
s6HRkRAAqo5/UZ1fUVfF67PnLxU9m4v7JcLF4Ytf/Z7v087AEjfB1FXekO/SfEUl
dvex3+uqG9CIaSIQtQ8rxWgfEyOZeFirJloIENzJtaXACdsld465AHpQKBNbI5xU
/euNFiOwGTIgOHGhhxAIurS7F5Ag0WgWOTDN2uBlYGiDeuZShkW3Ek3M1WHSF2ey
Ai6uDC6tf03sgZla9uXS+eOZHkVaTx9pRDE1oxxHHLMtwgfkkl9BEHKxJ4ZqTYk8
6G5Bdz88LVtn4VWK2v/B+E6LiY5FJWuS2bM0PeRI2KpkB3F1jUy0rnC3OjdcMBjE
zyezSJsdMXkgODfA1zpIjGaAWjJ/wkU3ptsQ2EHq2+uTAji5OBUP/fquL+uOI+xH
WIHngd8r7BaBvygQpvVPl3YAC26qyRDmRqptWTXY/uISmcwmRZ6BaQTBsx1WOPmM
mFdZE0rVwRSfMws0GpPu6Atz++gerVHz/2EAFKPrntor6zUjSTbF3B42XCtIwpyO
T1Wmpfdvpt02fe1SjJvhkFCHzCv2sHvUqshC79KoN0gavq9732DOpJdn8aN8YTfe
GK4ekoKpjRZr5MUhTWGmRL0wrDNysBgOur97daSMrtrJNs+s8wlXA+9CP9nyICzs
2bbPfHWWQ78FiSSH8IOW/xAAFxM7aEh2UcHuajcX9pBLFwOnveo=
=ByYw
-----END PGP SIGNATURE-----

--o4bqtknoba4e2ooc--


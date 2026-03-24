Return-Path: <linux-usb+bounces-35413-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPBWHeT7wmlXngQAu9opvQ
	(envelope-from <linux-usb+bounces-35413-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 22:02:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C8F31CA48
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 22:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DA48316DA9D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 20:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0354135AC3D;
	Tue, 24 Mar 2026 20:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MWWCXBP9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5BE347FEA
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 20:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385773; cv=none; b=b6CT+yxpZc6jcV6ExknE/4iD57Nap5c6qvtigzp1NbLllMARskzdanEVomdvuC+MPDFLPjdl4amHa61Scz6Fr3g5S6ebeuUnbq8MfPSX3U6tQaXteKT0wzQlWU1meSHqL7tr97Ght0roXuHH5DmL9zvUp1CvbJkT6+4Z15CRrsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385773; c=relaxed/simple;
	bh=hdjKvfBWWeq0uSDptTLstowPlforQbXn8RIryJ7jeSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=td8Oouccy/KLRi9vnfzi6+jo6Bqny5VNBfL/dzm+e+vk+sdfoCE5IYynVrCpjw4OlrQPyUr7ZKdXnXoZcFomGRTUDV8Q+nLB0QLMqxbj9pibOB0GLPWsAOvDsa8jnC1C02XW2Td5yXx8xzlq1souWCEgwLfrc/1APY3w71oI7eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MWWCXBP9; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35c06831dd3so895209a91.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 13:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774385771; x=1774990571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FscbW10Q3KKVYse0rj9RSiZh6xJn2dHId/vIM0ejStE=;
        b=MWWCXBP9njA4Ih7o9qnRzL7XJopLZlXYq1CyMEmVuOTrjreDf4Gqu06s59wvYCkcXy
         /GgZNf2rItiY9MvErZYrMb0TeKwFEb5TfAxXoCnrE7T9uVM/VEGEXPEJNF51TopvNsQz
         oOgG6xEaKHJQnYbqKofi+I9jqM16oFjw65rhi/goso19Agntu5Ofy5H3eSkW7uLIS/L+
         j76wlBmYiRC0z7oMaiV0wZsHuJPr6vH0WXGDFICNNqASbaDIkX03fsHZP/HsNgL8kHrL
         gb24mZ2r1CzG8JqylzmDdtcF5q8rC8ZjgpdAzWTheR9d7y0hQ8zvPBPlXXZyNHPpzj8V
         VSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385771; x=1774990571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FscbW10Q3KKVYse0rj9RSiZh6xJn2dHId/vIM0ejStE=;
        b=KyQooADvWNuuv2aIKCnc2BRW2soAXd4E2/OZd2D2F6MNNSU2uvJaOj/I1GyXqebDjP
         YBhHvyyGFyJAhte5gifvUqC/ykJchF9TPqqSusQDVfw5lVYjgTJkEpO3RvvlyVvVJs7x
         IaxHkycctsPXSlyZes5kt+hLQT+VfFdj0wjBPNXo+sC3byTlD0gur7uKfnTlf4DQ6e3m
         uiTk452/tXcK4mIAO+PrX4aonctdbN+xl4CqeapaSYrC/x75i65x/MIuzUE/jf5Tf4iN
         aO/IfUONFs7MRGBvJBjEmWtxpRMas8jbkhjdC57LfBGnMliHc14TaQf5wfq0lAgeFt0x
         lVkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+oZxkNpaUJVMQIzdPVncLGsK+f80X0iA/z4/K8xbaw1sQazAJeIqJG/wyi7bdYHT9vmwZx5plXnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxANdtSQXimSI5iIWsjKVxys99p5scUYhUBg9yjF5Ow/JtgSiJl
	E6FwqlTGmiJZNig4QIXV1xFSDmUoiq3SkXbgGd81LrVfXuSjYMc2yvkuNvEDVdh0Ow==
X-Gm-Gg: ATEYQzzbUBDFW8UP0M8UddcNdVuKUuCHGK1HwqgMzq8M9QQNpw1sWq/F4fHB0WGQppT
	M2qT5+jXXWNr0f8ExPLBMwOgMYdgRjuNzLwahLaNusf1pOItd0QO/THOqntrk9JguKbIKleZzb5
	D09X8jn6MNqzrSsY7ulW7HJU7C6c58ZND+l8+EuKtX/jXoSASUSdy9qQzkofU4Px2DySBW62Aq/
	9jbehgRinoyfMI1uIEl6Rklzvc+OV1WssO+trRdazBY2W/mz5ZuMhDaqEhe9p225NUODUZoAjG5
	/9wc5yhHOQzFiKIrBKOEpC1AdS1SB5Psw73Aw0C7QlPkFyNj4NILNV5fmHnNp9VaqG1az6tlVSp
	Pmd6Z7Eps3HS30llkfPmE8oP8mmGF8ZIdUZLmTVSvkrtqJo5U4C8GURLXowgNTQK/omamIsNd7u
	Kh04NyRlvNryq/5exA873TpmW7p2IpMzuFNZMbL+yEMFDTUkdrFK4HxC/P
X-Received: by 2002:a17:90b:2f0d:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-35c0dd95872mr717194a91.23.1774385770651;
        Tue, 24 Mar 2026 13:56:10 -0700 (PDT)
Received: from google.com (21.59.127.34.bc.googleusercontent.com. [34.127.59.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0312ee89sm4218287a91.1.2026.03.24.13.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:56:08 -0700 (PDT)
Date: Tue, 24 Mar 2026 20:56:04 +0000
From: Benson Leung <bleung@google.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	Madhu M <madhu.m@intel.corp-partner.google.com>
Subject: Re: [PATCH v2] usb: typec: Remove alt->adev.dev.class assignment
Message-ID: <acL6ZNa6ErLHqmwt@google.com>
References: <20260324102903.1416210-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mq7wClqCT9VK9him"
Content-Disposition: inline
In-Reply-To: <20260324102903.1416210-1-akuchynski@chromium.org>
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35413-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bleung@google.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: C7C8F31CA48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--Mq7wClqCT9VK9him
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 10:29:03AM +0000, Andrei Kuchynski wrote:
> The typec plug alternate mode is already registered as part of the bus.
> When both class and bus are set for a device, device_add() attempts to
> create the "subsystem" symlink in the device's sysfs directory twice, once
> for the bus and once for the class.
> This results in a duplicate filename error during registration,
> causing the alternate mode registration to fail with warnings:
>=20
> cannot create duplicate filename '/devices/pci0000:00/0000:00:1f.0/
>   PNP0C09:00/GOOG0004:00/cros-ec-dev.1.auto/cros_ec_ucsi.3.auto/typec/
>   port1/port1-cable/port1-plug0/port1-plug0.0/subsystem'
> typec port0-plug0: failed to register alternate mode (-17)
> cros_ec_ucsi.3.auto: failed to registers svid 0x8087 mode 1
>=20
> Cc: stable@vger.kernel.org
> Fixes: 67ab45426215 ("usb: typec: Set the bus also for the port and plug =
altmodes")
> Tested-by: Madhu M <madhu.m@intel.corp-partner.google.com>
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
> Changes in V2:
> - Marked as a Fix
>=20
>  drivers/usb/typec/class.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 8314309094719..0977581ad1b6e 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -686,10 +686,6 @@ typec_register_altmode(struct device *parent,
> =20
>  	alt->adev.dev.bus =3D &typec_bus;
> =20
> -	/* Plug alt modes need a class to generate udev events. */
> -	if (is_typec_plug(parent))
> -		alt->adev.dev.class =3D &typec_class;
> -
>  	ret =3D device_register(&alt->adev.dev);
>  	if (ret) {
>  		dev_err(parent, "failed to register alternate mode (%d)\n",
> --=20
> 2.53.0.983.g0bb29b3bc5-goog
>=20
>=20

--Mq7wClqCT9VK9him
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCacL6ZAAKCRBzbaomhzOw
wq2sAQCUZJhrv7AaalP85KIJJboMt7KzueWrl87wl1CfC8SCUwD/QYg8KuDsEZC0
WC3rvxaQqHZeB3xJMTS+O65CYaCUzQU=
=TV8y
-----END PGP SIGNATURE-----

--Mq7wClqCT9VK9him--


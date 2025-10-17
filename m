Return-Path: <linux-usb+bounces-29393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA1EBE5DC5
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 02:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67E8B4EC93B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 00:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5556137923;
	Fri, 17 Oct 2025 00:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="35Ul1jOa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24F71C2BD
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 00:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760659894; cv=none; b=HNWp7ke4B1Xf0lnnxfusQV4DWITCD4AeF5qmJsCrLDnpEwfOIuWxQnNyHvV5EqjFjzg8FNfrzOPHxdhtQbbaVwkU085GBhWa4ehzXAA4/pIZvjQZk/kZ4YdPbEjCUJ2SSCpK8ROLQ8fBr3BvG0RMkpB9XHucHjPYXn/B6ECaOSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760659894; c=relaxed/simple;
	bh=9qQ/Kaq1PQi1iQEGpE/Y4pRBJHUu5desBrWzjzYMp1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkDQrkb1OCiFpEtkkrDf+KTeDfj3AImsjoVcDchf+sbaLUISe8wdOZ4soqghXIgJlNS2sF6tYa/4E7f/qwOr5wRpnQ5VsLKec+54VMbPDEmcQwdOmuqKYdcFZl2d4auzzKmxxtiGZ4q85xlx2lyydt0Iuay+bOqgq9HLUu/fw9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=35Ul1jOa; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33ba37b3ff7so1271312a91.1
        for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 17:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760659892; x=1761264692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6rdlnJ4bFVxMl/yRGUabSawyz7mEAHOSqjDImE5CoEM=;
        b=35Ul1jOaA8k6hSHM5pY5yRZMWRSaezWC9IvE2E1zA0yZsrOIeLiCJ9UoouboPAor+Q
         QTj3LFgL+BTtibQRft9CfKT4etURCans9Yw5OoOtzvgVw3oBcl6gtkaE4UFDc8agcdW1
         8V53SOx364gb6q7Wfi2zRka72O4+aRzNd3FM0tX5EkWOKDrekRYZOkzaHt5BitYWlAYi
         RZdsh45/0AhFUUdMXpE/2TnjjlkCsKc7bCEP7W8yjYH3Pi0CKVgxtJOrf4/qx/ExOcWn
         AJZqpfLS16IJ0K2ueYpNTi6xWw96n51egktTVi4N8oe9Gug6K7pPc3C08M+57U/dUfIm
         lEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760659892; x=1761264692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rdlnJ4bFVxMl/yRGUabSawyz7mEAHOSqjDImE5CoEM=;
        b=ZiNAiMKb9oFa9U+wN1v7COqmqrQVTvxaajc3CmTm5oIYh8hE62+zHaR1LBF/pdq2MK
         MFbl7Gacz1RcshT0TjQq0NsHnK2TsJ94CUQyJbFt+YRw1IcceMQ6HpdaeHNhXm8365zI
         pix8qi2xs0cbHK+3UwBfRtL0KXK3WArfvBmLaC5KQHQ0cnaF+PGjkkaNl6fazunAEGsl
         EEaUA6/b5QJOkalM2AgKQDf1n+54kaIQymlWBlDRK7E7uBtPvEwhnd+1CgYQE86R2cZ3
         EFsE+nQZDdrgCJRTSalrXouPqiin6AfdPx1Kv0Xkk6liKRWXfrXdjrn3h480p/GdT96M
         mQRA==
X-Forwarded-Encrypted: i=1; AJvYcCU/GHZE6gyoJM7+/gNeeZuu2jEyOllL/1Ehvd4cB7GtoozFYJlqko9D7LmlxZXlYjqTze0huWbV22Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCeaa8VlDFV5XAtn+/kxpiaI0h41bgV8JwNwNEPR/CwKImMvhP
	K8eUxxAwjHk2H0KvD0SNNZkKw43CBWwLFjCIjz13w5ngBFuRr079tqIF4ppFal1WEA==
X-Gm-Gg: ASbGncuLp6b5C5dNU1VWYr8gM0NIa5jD6EEDz4Xp1c5CxmHCZ3V8o8hRTuwPvWRLhLQ
	v/BP//OsVtj0WUXW6DykM4YuJiY4/tIeiVqtB86ZZJMQ21NoawiBnNX00rA636IrdRKj33T2Ho+
	8ZoS5LPxeXgNd+jwNkh6dEFTstIt7TgVYqASZPjaSWQl6nqGQrhfUgyWpVsblCjYE15CbShUwNN
	E6LOj7qu4pNTmY/bYfaffe5EhUqE6RxTfi8D9Ma5kiCSOCng6yXIPSDvu7ODNe6icunzs+HUsa1
	QIZ+8ZZ8j8eE32B2P7zztNugBapJm8opJF7AjkuFAXJav1DojuKdlKhf2dYDvCSn4wZ+ErL0UFA
	2Oz5kng3oIn0GEeqSui3P7AxBYAPBiGyShI/WBwkutx0Gqk7ry4z6KmtVo6Z8WurjE/7sDwdH2X
	BhkWGh7x2rUZTUA1tNdfZBuvNWCVshSZXluM2ZgLoja/8=
X-Google-Smtp-Source: AGHT+IF/mLPPhwDZ9pM3tExE2bPuXwl/05sO0pJ0F8y1gYSwfK180J5bWJ1YL2l1fjSo1vLni9n+LA==
X-Received: by 2002:a17:90b:5110:b0:32e:4716:d551 with SMTP id 98e67ed59e1d1-33bc9b8f4e7mr2440735a91.6.1760659891842;
        Thu, 16 Oct 2025 17:11:31 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33ba9270049sm1592080a91.0.2025.10.16.17.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 17:11:30 -0700 (PDT)
Date: Fri, 17 Oct 2025 00:11:26 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	bleung@chromium.org, gregkh@linuxfoundation.org,
	akuchynski@chromium.org, abhishekpandit@chromium.org,
	sebastian.reichel@collabora.com, kenny@panix.com,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] usb: typec: ucsi: Report power supply change on
 sink path change
Message-ID: <aPGJrjG6nsRQune_@google.com>
References: <20251016235909.2092917-1-jthies@google.com>
 <20251016235909.2092917-4-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fNlBXg0mnG7NeY4w"
Content-Disposition: inline
In-Reply-To: <20251016235909.2092917-4-jthies@google.com>


--fNlBXg0mnG7NeY4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 11:59:09PM +0000, Jameson Thies wrote:
> Update the UCSI interface driver to report a power supply change when
> the PPM sets the Sink Path Change bit.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/ucsi.c | 2 +-
>  drivers/usb/typec/ucsi/ucsi.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 7b718049d0d1..cad3913bd7f9 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1293,7 +1293,7 @@ static void ucsi_handle_connector_change(struct wor=
k_struct *work)
>  	if (change & UCSI_CONSTAT_CAM_CHANGE)
>  		ucsi_partner_task(con, ucsi_check_altmodes, 1, HZ);
> =20
> -	if (change & UCSI_CONSTAT_BC_CHANGE)
> +	if (change & (UCSI_CONSTAT_BC_CHANGE | UCSI_CONSTAT_SINK_PATH_CHANGE))
>  		ucsi_port_psy_changed(con);
> =20
>  	if (con->ucsi->version >=3D UCSI_VERSION_2_1 &&
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index cce93af7461b..35993bc34d4d 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -382,6 +382,7 @@ struct ucsi_cable_property {
>  #define UCSI_CONSTAT_BC_CHANGE			BIT(9)
>  #define UCSI_CONSTAT_PARTNER_CHANGE		BIT(11)
>  #define UCSI_CONSTAT_POWER_DIR_CHANGE		BIT(12)
> +#define UCSI_CONSTAT_SINK_PATH_CHANGE		BIT(13)
>  #define UCSI_CONSTAT_CONNECT_CHANGE		BIT(14)
>  #define UCSI_CONSTAT_ERROR			BIT(15)
> =20
> --=20
> 2.51.0.858.gf9c4a03a3a-goog
>=20

--fNlBXg0mnG7NeY4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaPGJrgAKCRBzbaomhzOw
wmyRAP4qaYGumR/0N01XkF9UwvhoHVmf95YivCn2pzq/dyTTSwD9E9LvRCPYKeaM
kvdNAAOULTjT4h0VUuKVJ93sTEh0LQM=
=N62/
-----END PGP SIGNATURE-----

--fNlBXg0mnG7NeY4w--


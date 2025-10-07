Return-Path: <linux-usb+bounces-28993-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D4EBC3040
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 01:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B827119E054E
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 23:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8032797B2;
	Tue,  7 Oct 2025 23:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ph5XqRAg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78939241CB6
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 23:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759881394; cv=none; b=JCOORYMnEAyHUaKvJU2Po7EP6m6uo89NFpwgBxNB+sq+eRvTsktouI1avKc3us+N0jjMPNTGJFecYYMMa+AgEAWOn5EgA5rCaNJNk/rgNycTqSrw2r+T5PR79n2uG/u3fZlaw7r5qamNdfyfjUTG4ngcjt10IhDgyUsl/khbvfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759881394; c=relaxed/simple;
	bh=zJKXXBSciI+h6+weMkophpbj4m53g4DgXzbXDfHC1CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVXynepxKd41ygIwbIlgNhz3icA+cLWoVz3OFx1CdB/MimYW5Ldn4XAkxyfIknkviKdVW9S7GUdkeBfJJYgknUvXLUPog5u9MlZTSBkwDKOADQnFrxCwmqb7q1t83pF/GIJCa9ZAqKBnmhC+dw48LTcswNq+ozEOPwYFEU5oq24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ph5XqRAg; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b5565f0488bso4401661a12.2
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 16:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759881393; x=1760486193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=39zXg6tilCKGf5UjV6+AnvBZd7qB5qMcffVx1lnmOy4=;
        b=Ph5XqRAgll+e6M/Lqj3ievlJMylXOlmyWtmRt/G+ST6KCFsOEm9+yvbTqKpxKOIcrp
         SQJzIBP1DwV9JpAgVBxIT14jcfSGy1hFIgINzOG4Nc31UobgVsB2KR7n+YyJ53o3KdLf
         QND01WX+7xCWd5T9ePj4oDrZIM5XwH+kKwZymAkMaMLT/9AEM6xfSoiH1MhV86skx8EV
         d1vd9SkRROux7JlM4kjT8eoasm0YLwBMmZ9L3pzYXDan+zEsjFt+yfITIh1+CsSUkkti
         vMEOu/eWEe7hRiqyEAIEJtIZoXs1fl6ClTW6WmjMM2lZuYOQhP3Dzs9H7VKN2634bCL2
         8Bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759881393; x=1760486193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39zXg6tilCKGf5UjV6+AnvBZd7qB5qMcffVx1lnmOy4=;
        b=Bu/WBRy8y854dR1X/MwaomgSBUkflQAdRodY2xDT4jrsrDF3zriuG9BA6i0krH7d4t
         2b7lY0m7vk7doz3kv3m+EsCCpd3yjz3dY6SdBWR4tfrpogPAKpqRO7kb1c50N9q6E0BC
         pFy17SUV3MIEraPDMLQW+RJFs2dONIUmmlkYoRz1OtNLNxk/RYrunRZ9GMts05QKqN6f
         pypbTKjXTPtnMcp3UTirE3h3iAkxJG6SmrX4NjqEF0PJQ5wWBY3buob572Url1fGlAH4
         DfRfsVUCVgp86RC/x7D1eOIdSm/ggQxJcrDWdt0jmJR6RsQ04oXNc6+aYBdCXbpKx3fd
         NugQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtvcj7F8Q5DDStUNQdWIfNM2FAd4tnlr74e5Ur1W0jSyIEYRQh9C+VLeh/goSIRmr346D23vIJv44=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXJNM8WhHB4R7lDN5TzD5kA+rnw0WUFkaQsnbutkCEg0n28CEh
	vwJxPDg9vH5K9NOHkHl/W6M2MCs0gsrZGpNQSC1TPAVSEBn3f2/dJKLO6sUo2Iu/XQ==
X-Gm-Gg: ASbGnctL8lrB7feM1F4T6/zhkE1yQf5ddWvh2MKAuC4X25X4K2bWnPVD84ELpJj9IXH
	AAiG/A2Su/6qfKS4WZbPuSB/dhZlvBI2ZYrD8OY+cNA3CFKavW9TxJ46LIX1Btc8epEI34WxmZ4
	NEtKtppBVau9aeN4L3v2V+sBSq2FtZ8c+NQEEwCjumsSpdRnI4PEU+4hiab4MZl7XKr12PPMr+j
	x4105dMEX+JmkkN6KZB9leTu6i0yOC6Dzb85ByrzCLj7Zf3aXn82+462vhISrjzNL4bMPWmMRRP
	dvpOAsgjvo+nSdWX9sYLno8SQGM5Txb3CivJcGN8tAPPF+XOK2gXCF4XUNZXmFULDcg/2k4HJOA
	Dbg2nyqm3dtHmVhXCoQl7IHEj/kcGMwBmm4vQTTpIe29GNHbx5d/nAtvzQZ85DzJ314TAwSGodf
	npEUqB3M9Q5yIGPHxDTjwj
X-Google-Smtp-Source: AGHT+IHMC7A37U/WEv3rhyxJXeKzOCdfHy3VqxOSC3aiXgnbwRn0y15wH9ycq+L3ZktBWltzSlIMFQ==
X-Received: by 2002:a17:90b:3843:b0:334:18f9:8008 with SMTP id 98e67ed59e1d1-33b511174e6mr1562113a91.8.1759881392356;
        Tue, 07 Oct 2025 16:56:32 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b51395229sm944821a91.17.2025.10.07.16.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 16:56:30 -0700 (PDT)
Date: Tue, 7 Oct 2025 23:56:27 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	bleung@chromium.org, gregkh@linuxfoundation.org,
	akuchynski@chromium.org, abhishekpandit@chromium.org,
	sebastian.reichel@collabora.com, linux-pm@vger.kernel.org
Subject: Re: [PATCH 6/6] usb: typec: ucsi: pr_swap should check
 connector_status
Message-ID: <aOWoq08H-3F66Ozg@google.com>
References: <20251007000007.3724229-1-jthies@google.com>
 <20251007000007.3724229-7-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3vepBb5P5u0ERoW1"
Content-Disposition: inline
In-Reply-To: <20251007000007.3724229-7-jthies@google.com>


--3vepBb5P5u0ERoW1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2025 at 12:00:07AM +0000, Jameson Thies wrote:
> From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>=20
> Power role swaps initiated by the host system doesn't generate
> connection status change notifications.
>=20
> From UCSIv3.0 spec, section 6.5.10 Set Power Direction Role:
>=20
> The execution of this command might require PPM to initiate a power
> role swap. If the power role swap fails for any reason, the command
> returns, and error and the power direction should remain unchanged.
> Note that if the execution of the command resulted in a successful
> power role swap, it should not result in a connector status change
> notification.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/ucsi.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 1a7d850b11ea..6e3797d7a144 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1526,20 +1526,40 @@ static int ucsi_pr_swap(struct typec_port *port, =
enum typec_role role)
>  	if (ret < 0)
>  		goto out_unlock;
> =20
> -	mutex_unlock(&con->lock);
> +	command =3D UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
> +	ret =3D ucsi_send_command(con->ucsi, command, &con->status, sizeof(con-=
>status));
> +	if (ret < 0)
> +		goto out_unlock;
> =20
> -	if (!wait_for_completion_timeout(&con->complete,
> -					 msecs_to_jiffies(UCSI_SWAP_TIMEOUT_MS)))
> -		return -ETIMEDOUT;
> +	cur_role =3D !!UCSI_CONSTAT(con, PWR_DIR);
> =20
> -	mutex_lock(&con->lock);
> +	/* Execution of SET_PDR should not result in connector status
> +	 * notifications. However, some legacy implementations may still defer
> +	 * the actual role swap and return immediately. Thus, check the
> +	 * connector status in case it immediately succeeded or wait for a later
> +	 * connector status change.
> +	 */
> +	if (cur_role !=3D role) {
> +		mutex_unlock(&con->lock);
> +
> +		if (!wait_for_completion_timeout(
> +			    &con->complete,
> +			    msecs_to_jiffies(UCSI_SWAP_TIMEOUT_MS)))
> +			return -ETIMEDOUT;
> +
> +		mutex_lock(&con->lock);
> +	}
> =20
>  	/* Something has gone wrong while swapping the role */
>  	if (UCSI_CONSTAT(con, PWR_OPMODE) !=3D UCSI_CONSTAT_PWR_OPMODE_PD) {
>  		ucsi_reset_connector(con, true);
>  		ret =3D -EPROTO;
> +		goto out_unlock;
>  	}
> =20
> +	/* Indicate successful power role swap */
> +	typec_set_pwr_role(con->port, role);
> +
>  out_unlock:
>  	mutex_unlock(&con->lock);
> =20
> --=20
> 2.51.0.618.g983fd99d29-goog
>=20

--3vepBb5P5u0ERoW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOWoqwAKCRBzbaomhzOw
ws1vAQCb90DdZAg6y6j6gxeiXtb3EGaDB+3GnPoYDww9vdtaYQD/ayZXFW+x+d+E
M5yCHWN8me1+9sGUjPAZlnVttMLEWAg=
=BpLg
-----END PGP SIGNATURE-----

--3vepBb5P5u0ERoW1--


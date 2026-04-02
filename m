Return-Path: <linux-usb+bounces-35912-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HRcJNnIzmmtqAYAu9opvQ
	(envelope-from <linux-usb+bounces-35912-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 21:51:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5638DCD4
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 21:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB1B130465E7
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 19:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B70F3F65E4;
	Thu,  2 Apr 2026 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N9a+pYrF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAAE3F7AA0
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775159444; cv=none; b=dpy3PfoNWXdWVD4+fbGdG5v3vofpwhezrBvvuGS7zjf5CLvNGeOgYIloFmZGKJh7oCE3Sm9CdIH1V/QK/pUr5hwRtL0lsfmVzvPzEQLxdLzPdh8X6MFHD9O1fF8NntHBD6swrWfLQunL4OfdcbNbh+nV68504pqRigHUqD/hgvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775159444; c=relaxed/simple;
	bh=AzTLb/+DCpcAJ/71Q3/OfR60Ev8xUPFaTIRCfBfnKPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+4kPfwwtQSPZjVbcWbt/AQxz0ZgbQ5dX1CLO2bJSfXG0tXmnZWfj2fsY2txpZXvIFJKupmFDAJCMvS7jf6btdi1YE83FrqCY65EMXLoLBcwhUKh0XDI65VesnrAWIxNWvYUuOeKiaJ8bd2knqTvmY1ogalEaLQm9/eXfp0Rhog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N9a+pYrF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82cd6614a90so578190b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 12:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775159442; x=1775764242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hESu2BsQc8AYFisupFYHTDCpAV3AtYeQMal7dvvaR8w=;
        b=N9a+pYrFup43dRNHje4XKhbkLCRF6sY6g78cI4Pkd2ieNBdNJUED34G/FXK7fKeXPl
         Sc8uiC1Xp9DQdPH1BvJvkgR9U9hwNa2qQow57o95ngFfgARwhbM8yqhySLKGhEcFoiDp
         lmeX0G3II7Y1G7Sau+LJ7HOOmM87XkI7hvA8RYYg9Rn+A7aHs0qptrMgTOYHbhfC5JcF
         QhbRje1qWSCduYncS6v/9eaKuO0toKCUkoPgbLmG6OeOdELmolfrV78r/VGkEAVyfyS7
         wBWgbC1q/5AjU30XyG3kg9WDiEnPYf/1OKq66lW0ofH0L2DQPSu0HtffulckeGCKqcS9
         DJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775159442; x=1775764242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hESu2BsQc8AYFisupFYHTDCpAV3AtYeQMal7dvvaR8w=;
        b=nRpe98PYKlEkc6uss0SoaEyDZarv2IxrvpTjVtx73ZRvjdyMC3lVNKyiCRvC1cBDdK
         Gazkx3vb13vhpCWWmxQWthDEbJ9nq3ZMwafciYTz8p82VCok7FB5b0RFYpmtaYAKnhzm
         XyZjKrTCFTRh/3zphgv7XB1wCwXgEjk8UtiR1IolQRo3C6JbZvYa89torY5lVmtpM6hm
         quWEZu8wTnmPqK2p+/m35KIRGlXifJExNUIlzP4ajWrud0kKku0KxkOHAGouDRNMQ5EI
         ghviJTJoIeLKkgAxQdkO0WmQ0kp6c7fJ/z0crgDOtsiZatWOn11hJb+ctK1S3905pmum
         ZIZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjrPQ44IK5HF/JtCs4Fy+AmtAKv6r1BEoElCfBQynQAo0l5+H6pjQw6ZgKCThctlGAAK46+hPwjyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH2iQgfsqTPlY3qSlDpf4J3qOTh8toTJ7gc3HFVTX9PkSCpYm1
	ZnWKOvLAw0cF9LDSprSejbytagP5lQ/CQg3vG6joidRGsY9T89AZH7KCXPLolLcuVgCqw+82a+a
	pDId4zQ==
X-Gm-Gg: ATEYQzxDnDAMqUS1OLsIr4CGlEBFRt9ydcKwgHxyO8qm8H4cMqHgznEQfvlU4SAuunr
	uuR9QSLHmdTYjJo1QogVvCc42ggUdWNDhS3y7w9Hryd73K3kvnQwKEGXbQEJpyqldu4ErAkE6sN
	uffaHTmu4jUY/3x5o2HksNPXh35VL303abZ0MNGYeP1n2vGfv9W6qg9/KVmSWNYZJ1WeKos4fpS
	FyLt7NfQ8BIigY4X753NFaHNh2k3apA65Oae7D97rTugYR1XLoKofLLzPJEZgH26gieo+vDIac1
	9cvNWgwbtHg79ZyM4R/8/9UIE5OGzf0bc1+RJ0GuqSPMzFoAqznzb7PRF+SqNT9Z8hrnbouXkw+
	bZdogGJvDkETRH60En7NpW9YySZlEEEpmY5GUWiynYbBYduqMlK05dSn0XNul8CIYqDKjGGai51
	ZIx+fs4Bg0nUVylszWQCExkLSPY8FHTKK76vD1WdvN/xn6Un6q2i0pcjQDi5PHlGzUPqg=
X-Received: by 2002:a05:6a00:1ac9:b0:81e:b2ba:5b3a with SMTP id d2e1a72fcca58-82d0da464cemr377965b3a.8.1775159441398;
        Thu, 02 Apr 2026 12:50:41 -0700 (PDT)
Received: from google.com (21.59.127.34.bc.googleusercontent.com. [34.127.59.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca1869sm4053802b3a.56.2026.04.02.12.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 12:50:39 -0700 (PDT)
Date: Thu, 2 Apr 2026 19:50:36 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	bleung@chromium.org, gregkh@linuxfoundation.org,
	akuchynski@chromium.org, abhishekpandit@chromium.org
Subject: Re: [PATCH v1] usb: typec: ucsi: Set usb mode on partner change
Message-ID: <ac7IjGWy0vE2_gYM@google.com>
References: <20260402182438.867396-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="76VoeIkvap3VAeEX"
Content-Disposition: inline
In-Reply-To: <20260402182438.867396-1-jthies@google.com>
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35912-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bleung@google.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DBF5638DCD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--76VoeIkvap3VAeEX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

On Thu, Apr 02, 2026 at 06:24:38PM +0000, Jameson Thies wrote:
> Currently the partner usb_mode is only set in ucsi_register_partner().
> If the partner enters USB4 operation after it is registered, this is not
> reported to the typec class. The UCSI spec states that the Connector
> Partner Changed bit can represent a Connector Partner Flags change. When
> handling a UCSI partner change, check the partner flags for USB4
> operation.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index fe1fb8a68a1d..e6fd2e2eba94 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1182,6 +1182,12 @@ static void ucsi_partner_change(struct ucsi_connec=
tor *con)
>  			if (UCSI_CONSTAT(con, PARTNER_FLAG_USB))
>  				typec_set_mode(con->port, TYPEC_STATE_USB);
>  		}
> +
> +		if (((con->ucsi->version >=3D UCSI_VERSION_3_0 &&
> +		    UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN4)) ||
> +		    (con->ucsi->version >=3D UCSI_VERSION_2_0 &&
> +		    UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN3))) && con->partner)
> +			typec_partner_set_usb_mode(con->partner, USB_MODE_USB4);
>  	}
> =20
>  	if ((!UCSI_CONSTAT(con, PARTNER_FLAG_USB)) &&
>=20
> base-commit: 81ebd43cc0d6d106ce7b6ccbf7b5e40ca7f5503d
> --=20
> 2.53.0.1213.gd9a14994de-goog
>=20

--76VoeIkvap3VAeEX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCac7IjAAKCRBzbaomhzOw
wl7pAQCthX65cQP7vUbMHR1/udw+M9kpUhXG1gQ3UO94jXMKbwD9HRibHaJje5uO
tcxLuFJKC7kBhqqhUMFnrFxLi9Ygjgg=
=Jfgi
-----END PGP SIGNATURE-----

--76VoeIkvap3VAeEX--


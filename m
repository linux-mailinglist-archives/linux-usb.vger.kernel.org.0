Return-Path: <linux-usb+bounces-28992-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E74CCBC303A
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 01:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B8123A42FD
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 23:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F3C277CBC;
	Tue,  7 Oct 2025 23:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tLKpnfz3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA24E21D58B
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 23:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759881319; cv=none; b=aIW7SNR5fTwsSEH8ijn9fHTetqACiXHclCS4DkWUBqnsMx32mFddvBfnLQgVLhSbAnEcmlBlUhvuijLsFBgJsqRp+ZGnzxVpDyDtH+iZUhLSEcvZ2k/bTTRvmhAm3yuTLLrXjw/85ILps8qCcGiPQtWFh5y1mbGKh1udetX6FME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759881319; c=relaxed/simple;
	bh=aueIMlR5mVedWi0fjNVCibzll+DI67XEJP+YBMNLg9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sid5DFV2qmSar6oTmQdwbi4/V9oAU/ONkNV0oekkUhxf6JCvaCwvihKU7Oh9Nq5uNFtBp7aGLAGDGvU9UhmiQLIgPOgy6BrmU4ot81qgKr8oXqj7ouXw20cL1hmF1BiENWhj5OrdsrrY9HUbdJa18xlIeOPzWFc28bX5FWCpqDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tLKpnfz3; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33274fcf5c1so7354760a91.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 16:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759881317; x=1760486117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RoPS4zG7i/w1UUCX0a6YHqijn613l2SV4IiIRvG6TwA=;
        b=tLKpnfz36siqnmt5Uw2nZd3fFoWRm5pBZ5fOxthddgdaAssFNt4V4x608tGwWgXnO6
         CAZJ55OiYVeWeXWH7sl6z9wWVEos5P3elARtTbDdFcCRsqJBe1RWo7u88RirxlpXmQpv
         88vYKDQVIr0WWtJBo1aWffmhpduypSb1TOecRxSW5y4r1Sv33kasv93YzOklncw45cZ5
         1WD5ggtlkf34oQ2DbkTpUY4/3Zdm3LpGbrBiNk8ixRmTBieb8a7XMQjdCGcQ7t/nmImz
         VZHEey/mtPBOSmX7JbzIqFMcjURK7lP4Y7jnUns3kUFADsCOkJBkR3cmumHM9VDD1K+3
         +slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759881317; x=1760486117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoPS4zG7i/w1UUCX0a6YHqijn613l2SV4IiIRvG6TwA=;
        b=uK8ijIrei5+jSpTtMYZKM79fVgSHlIfAwpXiHLkMz+xW3kRR2OmBgOB8ivcWWxJ0Xi
         7pAwaVceE9IooMdb+CVFBEv3kQTwYXvaL7HBG/+CNf1jfLlpWD3x8dW5vYAgu2EOTW//
         qEqhuMFRzqDzYssNYl+AMJpcrUtTEk7q9wlTQsuRGxTrLnqX6FBczb2FngtOIftVUffR
         Q8dCGHNcpcJkQdY5GdTOnbHPc0yJrFU582ijF6K6dJBhThr7AMDQgiF/e4dWultldyc4
         Z+Tf16iJWt8VAqQpsMatGAqP5qdNK3sPsPb1hkUO9ehyNYXxDba1TqNJme5i4ZHSExXi
         Go2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuFkXs/rbytLJZDjGVWnFoYP7Rja6ZkJ9WHbWIQxUEgpG9qtygQgZrUJkIaIQMa+lnZIAROWyINTw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2QjL6NRQABOcFfYQij6HTf760/bADszjcdp+7hJNAgjlL0FfK
	SSjfW7Q8eXPhMud2NWVJixEjd2BpuK1X9Tj6OiHhbwdmPlNidpDq4tEtw9ztTlz1URPHFrxvW6x
	V/hhrnA==
X-Gm-Gg: ASbGncvoDrB3R9ib6CMBpyHvrPcUxv9h95wuepjpRwAf7gK4YmNfyW7aCSvaI3AcJBw
	nkge1NtgWcmLS/Umyw6JcLK1grcS30j3BUmJ+nJltqyjglmEL8HgRALlopgCTIjQmsPc3fAksyg
	tY+jaIitLJPEJgpCP2zSbD+KYAJcWk/zMXuMV3RgiH5bL9jqeqIMhGPDd7BzfA6Y40VjdPUk5hb
	NB9bnQXTfby/D8dN7HOdd9CXeNcGuUZd7gzCJoSisjOBlKdrngabAeKH03pYO/rfkkZj9Zh6cSQ
	kyaHtYuCTuanBzsTDDNDF+7hbYo/QF+fSHGG2Nvgi/sli26UT/YTtqD/XzRw61WxvDV8+NzaBDl
	V6J0q4tY0vRgq6yivPgzs2j0UhcYse8IeaycAf9C6rWNlAlGYjSfB3R6XPIKPGvkl+/ah9YVuS5
	bq3Hve4CYqL950I2VT/UOy
X-Google-Smtp-Source: AGHT+IFyYA4phHap66RvdBt2TrgOq56Z64xSXysMkk6/t4JddY43lUaDViy2aDcxIzhYwOjo1UQo3g==
X-Received: by 2002:a17:90b:3882:b0:32e:7270:94a1 with SMTP id 98e67ed59e1d1-33b51375992mr1682915a91.17.1759881316103;
        Tue, 07 Oct 2025 16:55:16 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099d4d324sm16922776a12.27.2025.10.07.16.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 16:55:14 -0700 (PDT)
Date: Tue, 7 Oct 2025 23:55:11 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	bleung@chromium.org, gregkh@linuxfoundation.org,
	akuchynski@chromium.org, abhishekpandit@chromium.org,
	sebastian.reichel@collabora.com, linux-pm@vger.kernel.org
Subject: Re: [PATCH 5/6] usb: typec: ucsi: psy: Set max current to zero when
 disconnected
Message-ID: <aOWoX4cqg3fN-pN1@google.com>
References: <20251007000007.3724229-1-jthies@google.com>
 <20251007000007.3724229-6-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fUC004gocSAkhC+0"
Content-Disposition: inline
In-Reply-To: <20251007000007.3724229-6-jthies@google.com>


--fUC004gocSAkhC+0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2025 at 12:00:06AM +0000, Jameson Thies wrote:
> The ucsi_psy_get_current_max function defaults to 0.1A when it is not
> clear how much current the partner device can support. But this does
> not check the port is connected, and will report 0.1A max current when
> nothing is connected. Update ucsi_psy_get_current_max to report 0A when
> there is no connection.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/psy.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index 985a90d3f898..3a209de55c14 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -169,6 +169,11 @@ static int ucsi_psy_get_current_max(struct ucsi_conn=
ector *con,
>  {
>  	u32 pdo;
> =20
> +	if (!UCSI_CONSTAT(con, CONNECTED)) {
> +		val->intval =3D 0;
> +		return 0;
> +	}
> +
>  	switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
>  	case UCSI_CONSTAT_PWR_OPMODE_PD:
>  		if (con->num_pdos > 0) {
> --=20
> 2.51.0.618.g983fd99d29-goog
>=20

--fUC004gocSAkhC+0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOWoXwAKCRBzbaomhzOw
wm9jAQDyn4DTkW9BlmrjPEHHrT83cCw7VhufXQoU38YBUFUiXwEAvyLumfxm0ovV
6bf7rx+85yCgcDBJOgUpY3k5KoXtGAY=
=UKip
-----END PGP SIGNATURE-----

--fUC004gocSAkhC+0--


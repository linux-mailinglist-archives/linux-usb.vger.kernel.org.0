Return-Path: <linux-usb+bounces-28989-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A30CBC3005
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 01:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FA523E3346
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 23:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81A32641E7;
	Tue,  7 Oct 2025 23:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SHoTmqPV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB77262FFC
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 23:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759881064; cv=none; b=DIw/GsfIget2nYlsIfUyxP80oLoDSx4hiFp6QhE3j5Ep4k3n1eXsk591ZpzMP94TKvHN9oU88/4BlG+ga7yLCtow2gMM+VrUE1BUw3BL9uBZOsANzrx2H0tHI+9xsoqXf2VKzhp7oQ6Vwl35OTnBT3NfCUZolpkl9DQVBvtH9JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759881064; c=relaxed/simple;
	bh=5snFbqs9sNarJZC39yaVhbzXUsPxHolYK0vW3IIQUdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKfu43RRtJrGlH1Q61i8375WZ92U8WPB09eJtRoxumQdRWoDyDl190+Nxffjnt9afLDodHxBBvIYBFPUOh25EtSfTT/d9st/yyCeLriq6tIUfghEhxG0V8KJ3h2zwHf8FXmgv7rAccnRhsn9kuyCU2M8L6aG5R9v6yxSqmMRQyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SHoTmqPV; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33255011eafso7083216a91.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 16:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759881062; x=1760485862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwxCAWp60Swhqd/BFgzyBjFjBfIzgDWX3D186GvjvJo=;
        b=SHoTmqPVJwOY/MczFusJ9kxQjE9ylTx1BCOtRGLEAbtEuqoERIWPfGme8D1sc1DJb6
         M5dKIrDElg/yHZOcdV1ZRAI3xnGbrFTTFX41yny6r+MJEW6dr2dDmxkHfWtOGJChfU2A
         v8CHge/vE5S51WZ7oweXQ40w29Q3Ydho5PHXXNKICJ5JhSuoyM+7mFKD2KWc43vyrSWC
         5Vba8qGHD1DyoT1lIY7fb4vmyebUSj0wxhkyccDb1uNYPJ0f0P7wZyPp4W0L73J+WWDp
         pDCy+56XNtbeDWwXXGuX0o8WKTT21mQgkoLETWoiZWne4aTHqTE8RhE717aN0dsdGyhs
         AhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759881062; x=1760485862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwxCAWp60Swhqd/BFgzyBjFjBfIzgDWX3D186GvjvJo=;
        b=wGAoMYqxK3MCtDkU5oEt25ozKXGkREtL/7xSHhCS7I4d0KLLL837Rc/3jnSsp+/ETY
         5A/2/QoyNRPm92Qy+ZadF59iLHkKErXnzE3Q9qzG8psyte/+48jzaS9D5MeWJUxO+nk0
         ziZQuAjxqQiZBU4WddUg3eOmVPMIYM6CZFKl8PAfAN6tCvASZGCWliSjX0PO3oxrGJ4Y
         DeeprsPDymzw1ounbuuwzzJ8n3j3Vnfk3jWgPPiYmm58g2tXh1DctFHDPP8tPr912OzZ
         b70MEQj/PA5ftXOpDaWufB3C2nMul1fhSQqKXqwWkMh6I4C6RNOFytlSMSH2ZawQU7XK
         MEGg==
X-Forwarded-Encrypted: i=1; AJvYcCXbGulpT6RH+md5m2O6rEzP3eLyTs7sFL/SuF+PTx6Vu+bnNKmgundXWU7CEzQvo7V+Y5weRytz4+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFUyCVvQWDteLXrMrpWIDQ/lJr9D2bHrsHxsNTlzcYlPtDwlHa
	O5g4ceMrosQSnKoY1Y9WVqPgTyPdEgmX7Q+ohL5W9p/nDUjyGDfzxLuuwq4pyvgjGAyojltt2n+
	COhAInw==
X-Gm-Gg: ASbGncu7equq7cUVYOx5yG2YCbY4YrpbZ89X4kHgQ3dna5dCMvlKhmdJzEw2CC562I8
	g9TP57yUxWdVoET0bC7ntrJ6jXUvFFwrsWcraooQh01FoO0nvwpykt6C7GLfeG5nlVfnTCHQzGi
	GMcuzYgZW5yqX4tnBt93H0jovPTxmqyfzpySjdMslKoAr2imd23axHMp6zxZm19pE8zN3EtBsSB
	HwSWu3xboP0xzefZzuiur0v2EL09pc7fe8moKbPLFp6nkRC0ouFdXSmbDAUkqAiMKB69Nr6TwJB
	WaF9aMxsM8ZylyafmZz9soGfl17HgESrECwomPf2V3As0jqD+XQ0sDrJ7LNM70RUysvgG+1npUT
	pwNEn72DgN/aTWECQnWNRWSw2S563OtgYlOQ1bKs3B5r9dCl/CFQeynmtlFH/az2i5FgBzJSGPN
	9s3oSjAGMUo8a5W65VlNrd
X-Google-Smtp-Source: AGHT+IFODTGIMvljHAxxdJZTomgkuu6gzIcghH6BwbpURjwECae/HdoaIV7/qT1ZAuBXv+MNdG2xrw==
X-Received: by 2002:a17:90b:4d10:b0:32e:ae12:9d32 with SMTP id 98e67ed59e1d1-33b51169e5emr1600933a91.11.1759881061472;
        Tue, 07 Oct 2025 16:51:01 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5288eae7sm152559a91.0.2025.10.07.16.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 16:51:00 -0700 (PDT)
Date: Tue, 7 Oct 2025 23:50:57 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	bleung@chromium.org, gregkh@linuxfoundation.org,
	akuchynski@chromium.org, abhishekpandit@chromium.org,
	sebastian.reichel@collabora.com, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/6] usb: typec: ucsi: psy: Add support for DRP USB type
Message-ID: <aOWnYeke5BM-TlXX@google.com>
References: <20251007000007.3724229-1-jthies@google.com>
 <20251007000007.3724229-3-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3o10Fcvuh6mTIMAL"
Content-Disposition: inline
In-Reply-To: <20251007000007.3724229-3-jthies@google.com>


--3o10Fcvuh6mTIMAL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

Quick nit about looking through and finding the Dual-Role Power bit.

On Tue, Oct 07, 2025 at 12:00:03AM +0000, Jameson Thies wrote:
> The USB Type registered with the power supply class is based on the
> current power operation mode of the port. When the port is using USB
> PD and is connected to a DRP partner, report that the power supply's
> USB type is USB PD DRP.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
>  drivers/usb/typec/ucsi/psy.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index 2b0225821502..985a90d3f898 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -209,8 +209,16 @@ static int ucsi_psy_get_usb_type(struct ucsi_connect=
or *con,
>  {
>  	val->intval =3D POWER_SUPPLY_USB_TYPE_C;
>  	if (UCSI_CONSTAT(con, CONNECTED) &&
> -	    UCSI_CONSTAT(con, PWR_OPMODE) =3D=3D UCSI_CONSTAT_PWR_OPMODE_PD)
> +	    UCSI_CONSTAT(con, PWR_OPMODE) =3D=3D UCSI_CONSTAT_PWR_OPMODE_PD) {
> +		for (int i =3D 0; i < con->num_pdos; i++) {

Do you really need to iterate through the whole list of pdos to find this?

The DRP bit is guaranteed to be always in the 5V PDO, which is guaranteed to
be the 0th one.

See USB PD R3.2 V1.1 Section 6.4.1.3.1 Sink Fixed Supply Power Data Object

"Since all USB Consumers support vSafe5V, the required vSafe5V Fixed Supply
Power Data Object is also used to convey additional information that is
returned in bits 29 through 20. All other Fixed Supply Power Data Objects
Shall set bits 29=E2=80=A620 to zero."

> +			if (pdo_type(con->src_pdos[i]) =3D=3D PDO_TYPE_FIXED &&
> +			    con->src_pdos[i] & PDO_FIXED_DUAL_ROLE) {
> +				val->intval =3D POWER_SUPPLY_USB_TYPE_PD_DRP;
> +				return 0;
> +			}
> +		}
>  		val->intval =3D POWER_SUPPLY_USB_TYPE_PD;
> +	}
> =20
>  	return 0;
>  }
> --=20
> 2.51.0.618.g983fd99d29-goog
>=20

--3o10Fcvuh6mTIMAL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOWnYAAKCRBzbaomhzOw
whS7AQDjspjExNjGT1BgFskiJsp3x4iaIMS84WEPwbCjCcXmJAEA24GamYl7sQ8B
nzBKxqmb3f1V1PuoMkNKd3p2QP1idA8=
=1ksC
-----END PGP SIGNATURE-----

--3o10Fcvuh6mTIMAL--


Return-Path: <linux-usb+bounces-28990-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE66ABC3022
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 01:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBCD93E3DB6
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 23:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F06D26B77A;
	Tue,  7 Oct 2025 23:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s+WOPiJR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A456C26A0DB
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 23:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759881109; cv=none; b=ilwLOMwIhD6Q6n6mDWSQQlD+whNdCV3yz6eYvYzqwzcCp1EC4FZEU461EKM9PKS1hJZ8PjzIQo0972PZ2WX3Tps7XATxIVM1ns21ZqLWvZy93c2UqmZEfJA1kGCFEn89/1ApFQIzQ2FRkaMwK3OrLwF3tN+HHyjjhI7K4cmVjvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759881109; c=relaxed/simple;
	bh=pi53V1uF/tYf7fHEgh+OBnrKV9Fo/NCn3Rjh7pmA9Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWfRzrvt0/JopLU554pr0xz3Yr8xP/nEBvWAB6ntzhOZQ9MPQtEOw4mFX5fXP3jLM58+HJXsZnbE/lRMTo1qi8CAf55RDLsSCPlqi3D2vj3Eh9KazPIMq6jGHGz4lUV8SltAPVYLoN7DMd17xVwgCadWQFHvWa15/6IBw3hv5OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s+WOPiJR; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7833765433cso8432541b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 16:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759881106; x=1760485906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AfyQRT41Mv7RuOOAZnPCvsDsbq+2FeHyfKl7ri6/0g4=;
        b=s+WOPiJRad7h74QFr/MjwfCGVyumX9bxeq0EfAITDIB9q3VYUUtka+mEeX78G0MnBq
         +gYg670SsOopZ6jfprShXLOSlGPbs7jsWj6tYlrPbpByLU2LEbECw1ACRgcqgkgv201C
         /WCfaeFhaWCDAfasiiLw1tjMd/TQaEkSb/XTT+5aOpGqfcUhpB/BpSvm/w4J6yq3PQ8F
         zHu4p4d7AsKv2n5cUVcO7oMPRN9neAwRm5TEvQKCwR93f0B2xLmFqu9Jn3kY2UZCF5EU
         +x0AoNXLI0dMvsRL1dlmjDRwZlh9Mmzmae6Kixx8ohaAb7PDTMWy/NAWsHF1d+BRCm/j
         CHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759881106; x=1760485906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfyQRT41Mv7RuOOAZnPCvsDsbq+2FeHyfKl7ri6/0g4=;
        b=TSZu73UfUACS48/rVWuO48SUXO+AMzSNKMu1HUtAfNhmsk76W8YI/fl5Bk8XpaX4VE
         O8vjlTb1euESC71RSv+OJ5GEUgBATuPH1Hiywcy9Y3nm9vOE1NancMuldU9FpqKslinu
         7HvI1TjAvSbazQyLihzJr67iRZ4STMyaWKxF08biR0cXB9yWyY8Gd1GR6Je6e8vS9L+V
         ph5bv/uAebEhCO3vwMfpvWquDO3X+k5PowjmazwWzolo6BlfdCQno8qRIOFd9vtqrDde
         FHGROQiIxaYXgOQu83yTgJVRneXadyygVYuXPkpuzWgUCBllGtSKj5RAbqy4MOsDbp9N
         gMeg==
X-Forwarded-Encrypted: i=1; AJvYcCXe2v64CchOHZFkZZMhWT6FPDeF4Zvw1j4yn19KbcZ9+kOndJN2iHpFNw1VLd1JgydvATiMtJy8YL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGExooWaZ3sUbQt35+7TBEcwmoB6B5Eaga6C+BiLcNNWWl2K/
	8SaucK0fpCGxx1pwn8NOG4YJW35czRb65Rn+El4QPUHf08sGrv9D57qKTPelytDuHQ==
X-Gm-Gg: ASbGncsSQcLnN1anWP0revH0LQYa8GI66oKr8D31STyGV4fTb4g0vs6/SLzZwkV35Br
	WGiN+wKBx9HThMoekgOLJTnX3uDz6liPGGOp0I4xbaPSBvEx/htukF9u/UNpVKU8QGHiUI3wZMZ
	KvjQChidPPtyZHdA8+tBltd2lchg0MCMUP+ZyTWEKmdpvHpFfQ26nElRkEGGW6xOAKxgk8qavf+
	Ft+AxfvznhFxI6YE8R/+vBKrNvXmqOgl+bb0fDm+qXOip1sTBUQOXH4uz0BVf9jR13BhU9C3LVW
	Z1pKUu1ger6GqYBS+4pDXohvVkFX870XbEEkYkdDeBHq4h+H9fhBzNWawePexpYIDaf9fUEIWNu
	1L8kP21AzOAOOBRffAKIpOZF7/0I6LlrsSKSafAo52/pDOncnrl7+BzN8+85qGxbnuO+e2eggaf
	E/wGacrOU45m83z3oDDzU5
X-Google-Smtp-Source: AGHT+IFtxIjyYd1PKZvljXTufwBzE5tHAEMUoqY4YO2sjkFUBWHg+zaMyKMODS4B2h8OZmKwJMFWKQ==
X-Received: by 2002:a05:6a00:23d5:b0:781:d98e:ebda with SMTP id d2e1a72fcca58-79387a233fdmr1306707b3a.30.1759881105262;
        Tue, 07 Oct 2025 16:51:45 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f99863sm16900862b3a.14.2025.10.07.16.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 16:51:44 -0700 (PDT)
Date: Tue, 7 Oct 2025 23:51:40 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	bleung@chromium.org, gregkh@linuxfoundation.org,
	akuchynski@chromium.org, abhishekpandit@chromium.org,
	sebastian.reichel@collabora.com, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/6] usb: typec: ucsi: Report power supply changes on
 power opmode changes
Message-ID: <aOWnjAgB7rEERd1-@google.com>
References: <20251007000007.3724229-1-jthies@google.com>
 <20251007000007.3724229-4-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gNnsiOG0NePRMiU7"
Content-Disposition: inline
In-Reply-To: <20251007000007.3724229-4-jthies@google.com>


--gNnsiOG0NePRMiU7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2025 at 12:00:04AM +0000, Jameson Thies wrote:
> Report opmode changes from the PPM to the power supply class by calling
> ucsi_port_psy_changed(). If the current opmode is USB PD, do not call
> ucsi_port_psy_changed(). The power supply class will be updated after
> requesting partner source PDOs.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/ucsi.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 3f568f790f39..7b718049d0d1 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1022,14 +1022,17 @@ static void ucsi_pwr_opmode_change(struct ucsi_co=
nnector *con)
>  	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
>  		con->rdo =3D 0;
>  		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_1_5A);
> +		ucsi_port_psy_changed(con);
>  		break;
>  	case UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0:
>  		con->rdo =3D 0;
>  		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_3_0A);
> +		ucsi_port_psy_changed(con);
>  		break;
>  	default:
>  		con->rdo =3D 0;
>  		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_USB);
> +		ucsi_port_psy_changed(con);
>  		break;
>  	}
>  }
> --=20
> 2.51.0.618.g983fd99d29-goog
>=20

--gNnsiOG0NePRMiU7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOWnjAAKCRBzbaomhzOw
wkFtAQDcbLui/sCiiAQpbwPKX+ot/X2L7Vr6dgaazf2MvSJBBgD/edscmgdUFSsX
b3hORrAlZkcfotX4hVo8Xv3K9Puq9QU=
=fKBd
-----END PGP SIGNATURE-----

--gNnsiOG0NePRMiU7--


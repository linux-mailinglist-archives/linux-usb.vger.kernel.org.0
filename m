Return-Path: <linux-usb+bounces-6933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD34860831
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 02:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC8B51C20A29
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 01:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7285BA28;
	Fri, 23 Feb 2024 01:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Whrn/l45"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A6BC8DD
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 01:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708651523; cv=none; b=cFacvmxbHwYfAwHPx4AVFl1Mz6s4rmPc08XuSpUEQQgtbstbMqrEBc+i99ZiG1ALPLusyXDHJit6q0U3DHwoolU/gm5wWjXjCDB/XCUWqYeMpgFNpkhIumKUx0nSMb3ZU/a8nGdEph+phK+tUNeTTcEpkONoc0Xkl2uMciG1RmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708651523; c=relaxed/simple;
	bh=4yhgOSinsbrvgntH/U3//JXULSUOb04/dyXOuirlizs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBieRwrUdwqymKT+gu6sVwmT+B5GGtfS79qNgWrZJDKypdJ2jU1Y+8tLOS60RbA2F24uw7zYTWhyA7hTfCBhl8Ms8a2a5+fznRBgpjHbH9xxzY9tTYsyhGtS/TK5QB2Ukhd5JY+Mc/LBrQGr6zJbzVrl6W85IjIyNCfkGJHxYqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Whrn/l45; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dbcf58b05cso33995ad.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 17:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708651500; x=1709256300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aUsdA2noT/bEezNn+59gniW1e5bKV1Gueis9UiAo1yU=;
        b=Whrn/l45f12MXsv6LQwrFcgERIt1VRV4Tbko/QaGHK19gtcanhWKXltzyh4ijkWo3Y
         7hkZCfNBnxTnFUCCxpRRMgqpuk2fYNQmlT7xAYvEr++jDVI0W48KlCvJSGpZSzvWUYOE
         VDFc4gH55jff0l3Q4fwX3xvkfZZg9b8AWqZuyFLxt43/93CQtc7v4sB0r6rw0p7e46pT
         qPj5IRB24Iqg+Z+wRl2RPDZWaF3bHhvx91gMQ+zpLKZbKuRN8DMco/38Gm/Kslz7mPZe
         sbCTPJJ7iPb/GZwTh0V+2EJUjjMpPDIo8SGQAxs/HZLbcDiMHcgz+h6ybbwLcr3dPatG
         UJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708651500; x=1709256300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUsdA2noT/bEezNn+59gniW1e5bKV1Gueis9UiAo1yU=;
        b=qE5c52v+zVaym+zp1uOAXukyL++hHgylZx3yOI2aN0Djkb2VDapUjKVM+8c2kGR5We
         GW4+fIa9k3VU7jYnJoGEnOwQIiEn3QpYABmNqg75eoJrAp5WiCdLNQoWHl/6sb+u6OLE
         zs3qzC03Yq1cBoDKO3Al//+jSkenmzo1e3uqOC/i+4JxsON9SxPdK+mZ3CUPu4YI2DTM
         v04xJYAEnCP5FPeMpCT+JdB0gNPPGuTN4pPUD0Kt3TlNqCppffN55HS3ynGKW9c3M0Q6
         zYtzBztBZaN2SJQhOLDJ1s0Wi4Thj18jMzE7/lwb3oBDKl0RWvnbn8MaBA6l2PUYyxuG
         XEhw==
X-Forwarded-Encrypted: i=1; AJvYcCW1Qrb5tHdKHQ0cQ7wAkpf1a580Fa1y5PPxjFuUwPRWj+GvC1d/aj5MIA0+Nh8SGM27hGw+jlXjNc2B5SQ9p07dhXh0LPRa22vG
X-Gm-Message-State: AOJu0Yz0c1axd1+sFg3XsJHn3j7rtbOd5l3xrcxm5Cmy9vjK6mltXByD
	GGqOEy6S79XleCbZjQU6BLVdBYdIxk11yyxbHdA8NSoXN4AgnolgsfZbPe2u1Q==
X-Google-Smtp-Source: AGHT+IErLKhHt20j6gRG6R/hxqmlzfrOnKmMJfRaFJw0ERiTSZiTw32RyVE2P23UMVodrdRgrlU0dA==
X-Received: by 2002:a17:902:6b01:b0:1db:9e59:cd7 with SMTP id o1-20020a1709026b0100b001db9e590cd7mr627695plk.29.1708651499599;
        Thu, 22 Feb 2024 17:24:59 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id p21-20020aa78615000000b006e0949b2548sm10918025pfn.209.2024.02.22.17.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 17:24:58 -0800 (PST)
Date: Fri, 23 Feb 2024 01:24:54 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	pmalani@chromium.org, abhishekpandit@chromium.org,
	andersson@kernel.org, dmitry.baryshkov@linaro.org,
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org,
	hdegoede@redhat.com, neil.armstrong@linaro.org,
	rajaram.regupathy@intel.com, saranya.gopal@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
Message-ID: <Zdfz5oWqSB2vtUGZ@google.com>
References: <20240223010328.2826774-1-jthies@google.com>
 <20240223010328.2826774-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PZNWU6f2lFkWH7xm"
Content-Disposition: inline
In-Reply-To: <20240223010328.2826774-2-jthies@google.com>


--PZNWU6f2lFkWH7xm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

On Fri, Feb 23, 2024 at 01:03:25AM +0000, Jameson Thies wrote:
> Clean up UCSI_CABLE_PROP macros by fixing a bitmask shifting error for
> plug type and updating the modal support macro for consistent naming.
>=20
> Fixes: 3cf657f07918 ("usb: typec: ucsi: Remove all bit-fields")
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Tested by building v6.6 kernel.
>=20
>  drivers/usb/typec/ucsi/ucsi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 7e35ffbe0a6f..469a2baf472e 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -259,12 +259,12 @@ struct ucsi_cable_property {
>  #define UCSI_CABLE_PROP_FLAG_VBUS_IN_CABLE	BIT(0)
>  #define UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE	BIT(1)
>  #define UCSI_CABLE_PROP_FLAG_DIRECTIONALITY	BIT(2)
> -#define UCSI_CABLE_PROP_FLAG_PLUG_TYPE(_f_)	((_f_) & GENMASK(3, 0))
> +#define UCSI_CABLE_PROP_FLAG_PLUG_TYPE(_f_)	(((_f_) & GENMASK(4, 3)) >> =
3)
>  #define   UCSI_CABLE_PROPERTY_PLUG_TYPE_A	0
>  #define   UCSI_CABLE_PROPERTY_PLUG_TYPE_B	1
>  #define   UCSI_CABLE_PROPERTY_PLUG_TYPE_C	2
>  #define   UCSI_CABLE_PROPERTY_PLUG_OTHER	3
> -#define UCSI_CABLE_PROP_MODE_SUPPORT		BIT(5)
> +#define UCSI_CABLE_PROP_FLAG_MODE_SUPPORT	BIT(5)
>  	u8 latency;
>  } __packed;
> =20
> --=20
> 2.44.0.rc0.258.g7320e95886-goog
>=20

--PZNWU6f2lFkWH7xm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZdfz5gAKCRBzbaomhzOw
wiNBAQDo3KNQemiA+FBi3/z5bmVaZO3NeofUyOdzGurkGM7T9AD/Tkff/vsteQxn
NWhW10aJTVCRw0fdeSBN6vwgo4UIdgc=
=uVst
-----END PGP SIGNATURE-----

--PZNWU6f2lFkWH7xm--


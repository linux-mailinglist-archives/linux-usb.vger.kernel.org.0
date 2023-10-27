Return-Path: <linux-usb+bounces-2276-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF357D9916
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 14:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC5D528248E
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5987817990;
	Fri, 27 Oct 2023 12:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRLnobeT"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABA013FF4
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 12:56:59 +0000 (UTC)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE3D1AA
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 05:56:57 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5aaebfac4b0so1563330a12.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 05:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698411417; x=1699016217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ll4VVP+M9AyhtQUsgtQPP9u6xxmQlPrVg5JA0cLvBw=;
        b=ZRLnobeTJDkUfeex3vK66F2ER/7lfiAtuDWOqVKGgsszcomrpIORqQa05U+0rulAsE
         FO4ZbAf1XjAc1eZJnQyuY68zUeDj3Ud5i+dBJw1glg60NrPybcFXfScLCznQd4HhIsTD
         Ar2KjydGq6/jUCzBco8fSEdQGtHa0uWeTId8RPAqpR+OCCaqx/pg4Jc0/YMe+mrO11Sp
         93PaWbQZqiZwyC28Xq0Fa1GMlGMd6AAeN3dKUNC0/Etfzr09QLBcS4xM6Ebp7Emw/rhd
         les+l2hcTGugU9Q3NOI7QMaWnDCBABO/zOfevehztYV+2/MnI7xGvlOEryBOvyKK4/7d
         j4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698411417; x=1699016217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ll4VVP+M9AyhtQUsgtQPP9u6xxmQlPrVg5JA0cLvBw=;
        b=xDczxIfl2nPvL53YVyTUET1srCVWCe3wznom6eF6sspDXP/bjY+9ruEt9O5IrYj8EL
         HIAWb0efIlPm75dMg3/rSL4+RYrJsb1Pe4h8+JnbsEg/GqUKbA2lHtfSi9xC1cRhklpI
         4oKmutpUXixlq/8Z/3eUlWKAXzuyYtGSzgccCH7dM9D8EX5ojqjoxh+Kv9JfY+DkNUts
         opK27EPm2Q/S1c1P4HHRh6E5dpsnUav2/tJtOxq+5f36K2FkhhSD87v3WVPRXM55NcuU
         kzPuAOsi5SVNK0dBmuPvfRYbTGuABYEoZuWKlcV704nzbbruBiN2xcxRD/5ssKcnKNu8
         iK4g==
X-Gm-Message-State: AOJu0YwTEwHUNgYcShrJ9g0UT1FO3xvej74abqQ24iVPgrcg/iTohnDl
	+BBz/FCLuzZj5VdJKdwQl8k=
X-Google-Smtp-Source: AGHT+IGr3hvcNQJU0Ye3dyQenfR73770kx5X01tSRfQLd/qNodo0Up2COE0KPIyYgY0tF34swq6IeA==
X-Received: by 2002:a05:6a20:3947:b0:174:7f7:e19f with SMTP id r7-20020a056a20394700b0017407f7e19fmr3055420pzg.47.1698411417012;
        Fri, 27 Oct 2023 05:56:57 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id p15-20020a62ab0f000000b0068fe76cdc62sm1346419pff.93.2023.10.27.05.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 05:56:56 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 1429C819CFF3; Fri, 27 Oct 2023 19:56:53 +0700 (WIB)
Date: Fri, 27 Oct 2023 19:56:53 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: LihaSika <lihasika@gmail.com>, Linux USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] set 1.50 as the lower bcdDevice value for "Super
 Top"-device in drivers/usb/storage/unusual_cypress.h
Message-ID: <ZTuzlUp3x8I_kqoS@debian.me>
References: <ZTsR-RhhjxSpqrsz@debian.me>
 <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>
 <2023102704-stable-lid-c86a@gregkh>
 <7484f7c8-a49c-4111-83f0-bb6db2906fae@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xmnYT+dwnORp7vFr"
Content-Disposition: inline
In-Reply-To: <7484f7c8-a49c-4111-83f0-bb6db2906fae@gmail.com>


--xmnYT+dwnORp7vFr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 03:37:51PM +0300, LihaSika wrote:
> > - Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
> >    and can not be applied.  Please read the file,
> >    Documentation/process/email-clients.rst in order to fix this.
> >=20
>=20
> Oh right, Thunderbird wrapped the first line of the patch file -.-
>=20
> Disabled wrapping, another attempt:
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Liha Sikanen <lihasika@gmail.com>
> ---
>=20
> diff --git a/drivers/usb/storage/unusual_cypress.h b/drivers/usb/storage/=
unusual_cypress.h
> index 0547daf..7b3d5f0 100644
> --- a/drivers/usb/storage/unusual_cypress.h
> +++ b/drivers/usb/storage/unusual_cypress.h
> @@ -19,7 +19,7 @@ UNUSUAL_DEV(  0x04b4, 0x6831, 0x0000, 0x9999,
>          "Cypress ISD-300LP",
>          USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
>=20
> -UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
> +UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0160,
>          "Super Top",
>          "USB 2.0  SATA BRIDGE",
>          USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
>=20
>=20
>=20

Hi,

You have to use git-send-email(1) for the purpose of sending patches
instead. Please see Documentation/process/email-clients.rst in the kernel
sources for more information. And don't forget to address reviews from
Greg's bot.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--xmnYT+dwnORp7vFr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZTuzkAAKCRD2uYlJVVFO
o8izAQDUfH9NnEeLOeCqTkWtLmITE93KhsTDlDIwuzG2vu4GxwD+Mon93TYJ7XjY
mI2+iC/oUFxZN9bE5t7ClfjyMI4Gcg4=
=t7yV
-----END PGP SIGNATURE-----

--xmnYT+dwnORp7vFr--


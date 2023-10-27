Return-Path: <linux-usb+bounces-2241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C8D7D8CC9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 03:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 578D51C20FB9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 01:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778D410E9;
	Fri, 27 Oct 2023 01:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLGX0fLM"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14301C05
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 01:27:26 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA8D1B4
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 18:27:25 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-578b407045bso1287032a12.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 18:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698370045; x=1698974845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uLkE7ycZyZUEFEt2cxJuUP4GH1I9LOzbThOGZvdmrZk=;
        b=JLGX0fLMCAzgsUY1oJW5Aw5CkD3yjOVa5rUTb5Ili71xPhJdrDINQ3fkBS2IuftGMD
         LXDMEflm5I0nHpHmBCb2hpk9ZnWuPOW3IxJAdPn9GASKDAJzhS1gAvLow89WvP4wOi3c
         0xYGLUHIBZXWxGP+5IwNK45tly29KmUhX0Vj9HMHv/p/yWteiSMdy/qsih3uXDmoX/+y
         tB7hkbXO9Bpa08dX2fQ7uf+TWHppV68dslOOiKRawDCZeJy5jhVptmhck/G+IMPJGkrI
         KF52ut5lWf+lR7EK7JmYZ+cOZOHfrfJiNn4MEsLt1CkRMDsnlR4JAxwsmdMGFGr5YmEy
         MDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698370045; x=1698974845;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLkE7ycZyZUEFEt2cxJuUP4GH1I9LOzbThOGZvdmrZk=;
        b=cQGCHq9/C2hW9hDwDBfuFiT/TxusxwVCj2jcxMH2R3kP+pc7Ruh1kFiX6vGlrbO7TX
         fTzZ8+iNPakzWiy7iTrD4u/yLaI2JIgprEtL4pjspR6lXjudISlaQXHWYfUXbvTEp9L9
         VD9Llhqa5XhEIFUwVJIpAuOGTy67fJhNLUz07DUudSMr456tHemPgyZ/HjbN0R8zNKnv
         Q9hm682nNa4l2Eqt09TqTgK/H7eDz9GcEMN5hVBFj9uCslSWYqsaCqUWjbgYHRKMsLly
         0CKLScQWJ2RWXdEPxSvmhxthp1lhZI0TR7ijMDiK6Tw/yTsrRFXjNom/04rdl0tZM2pj
         oJ5g==
X-Gm-Message-State: AOJu0YyeoHbaUSgDpD01m81AF05mdDc1Ow2OuIMSITuoFOo0O8BcEnsw
	6GUSZXU963aIJsZGKrvOrNSoPCQupbw=
X-Google-Smtp-Source: AGHT+IFMMgbQjEiLrL+bKBNVWOTcYhHQnzGJUI9cTWcus29UB2FOTmHV9wZx4YdEKxjU53Fy8Mmmtg==
X-Received: by 2002:a17:90b:3449:b0:27d:3f08:cc21 with SMTP id lj9-20020a17090b344900b0027d3f08cc21mr1247600pjb.5.1698370044674;
        Thu, 26 Oct 2023 18:27:24 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 27-20020a17090a035b00b00268b439a0cbsm220664pjf.23.2023.10.26.18.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 18:27:24 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 6C845819CFF3; Fri, 27 Oct 2023 08:27:21 +0700 (WIB)
Date: Fri, 27 Oct 2023 08:27:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: LihaSika <lihasika@gmail.com>, Linux USB <linux-usb@vger.kernel.org>,
	Linux USB Storage <usb-storage@lists.one-eyed-alien.net>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Linux kernel 6.1 - drivers/usb/storage/unusual_cypress.h "Super
 Top" minimum bcdDevice too high
Message-ID: <ZTsR-RhhjxSpqrsz@debian.me>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Hwj7JMejiX0Jn0x"
Content-Disposition: inline
In-Reply-To: <9aaf9d6a-71d3-45ff-a02b-ce94b32e24eb@gmail.com>


--1Hwj7JMejiX0Jn0x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 10:39:14PM +0300, LihaSika wrote:
> On 26.10.2023 22.14, Greg KH wrote:
> > Please submit a proper patch to the linux-usb@vger.kernel.org mailing
> > list and we will be glad to take it from there.
> >=20
> > thanks,
> >=20
> > greg k-h
>=20
> OK, here it is!
>=20
> Best regards,
> L.
> --
>=20
> $ cat lihasika-unusual_cypress.patch
> diff --git a/drivers/usb/storage/unusual_cypress.h
> b/drivers/usb/storage/unusual_cypress.h
> index 0547daf..7b3d5f0 100644
> --- a/drivers/usb/storage/unusual_cypress.h
> +++ b/drivers/usb/storage/unusual_cypress.h
> @@ -19,7 +19,7 @@ UNUSUAL_DEV(  0x04b4, 0x6831, 0x0000, 0x9999,
>  		"Cypress ISD-300LP",
>  		USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
>=20
> -UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
> +UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0160,
>  		"Super Top",
>  		"USB 2.0  SATA BRIDGE",
>  		USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
>=20

Hi LihaSika,

Please follow proper patch submission process in order to get above patch
accepted. See Documentation/process/submitting-patches.rst in the kernel
sources for how to do that properly. You may also consider adding
`Cc: stable@vger.kernel.org` trailer in your patch to mark it to be
backported to stable kernels (including one you use).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--1Hwj7JMejiX0Jn0x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZTsR9QAKCRD2uYlJVVFO
owsBAP9NQP2AnEVtcjkqd3qLFr7bH55SgKTqkBsbDswwok5T2gD+KJShd7AwHdoR
gXB/Dddja84qJD7+XWNlHwLugk6vHwc=
=rnS+
-----END PGP SIGNATURE-----

--1Hwj7JMejiX0Jn0x--


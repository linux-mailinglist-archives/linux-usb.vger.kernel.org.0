Return-Path: <linux-usb+bounces-223-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC67A2C53
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 02:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C5221C22375
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 00:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D11ED7;
	Sat, 16 Sep 2023 00:34:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A6372
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 00:33:58 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D792715;
	Fri, 15 Sep 2023 17:33:23 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c434c33ec0so9745935ad.3;
        Fri, 15 Sep 2023 17:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694824403; x=1695429203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HQAYDjbCh4IzFxERzQt/ANQTcLtL422XWTCpiqYS1uY=;
        b=RQLNs756cJgMnP4j319phnolOzzqtC0FjxhUUUmz0w3/OYT6S0Wmca/GAj4p2TKL1t
         PE6KKcljLboAokQu3/vU8XjiIpaExxioEMJM36Yi4AJKSbax/oyVaWwKW1OQmTfTbE47
         FDeohJgbfR0xDOd4Qi1NfHs5ZmNEfnLZPKN5oaLhJo1gLb3is5ASyzzIyj9uQ+F44W5t
         9EfAsiumy9dvZn3mlvCsFmSWXHwwz7FPlLfxT4N4le1/IsrMaanKofGQe6Lle2vY7F7o
         wj9asLK0vsH/PnkpwC8neIm+F3o3dh7WLRFjcy4vfoERBYg3U4UtYjivQJqm29582rkL
         d04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824403; x=1695429203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQAYDjbCh4IzFxERzQt/ANQTcLtL422XWTCpiqYS1uY=;
        b=l+BNcJh05COyo5El3CTEruP4bgshlhdw4GAzCgAPW1CZRt3Rms7eqFgLQqvzXzSmkC
         pUOlZgvbHxZG6fej1kIZl5iBcwxJoBDDVx3Kc5Whhj1z0PctSY97k960YOwFSf3nNJIH
         zCYpku8idyWo+QqY7V1si/aCn3KYUnMe/NXSwqRhqimfva6w3+6KQz9Sa4rhCTQDlDzr
         4aFYadnFQFoaTZTMxhf22iqj8rzcnvE3BcpV6XV0PWQV4wLMt41pzzktBN8sjhc910mB
         NFypVCmM+9sj0srcXEJVTKeEgeoiKKZEP2seWW0DlFhajqWanbXxy5cIZkK91n36DT0+
         s32g==
X-Gm-Message-State: AOJu0YwRJaEGcbhz7v1ZThU9f0hq8uepyVX+SaTbnI90DlAgJMu5EDyH
	wFUM+2H4plrUQnQ7KeKIrZ4=
X-Google-Smtp-Source: AGHT+IExIKVYg5D3bNMWdhu2vBMPon9D2cid0IbzhoYv/BH2qzAaD3BFh9wuKA1H+v15P9sOdr4hdQ==
X-Received: by 2002:a17:903:1c5:b0:1bd:ca21:c83 with SMTP id e5-20020a17090301c500b001bdca210c83mr3084530plh.68.1694824402920;
        Fri, 15 Sep 2023 17:33:22 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id g4-20020a170902740400b001bc18e579aesm4047516pll.101.2023.09.15.17.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 17:33:22 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 0145C814B403; Sat, 16 Sep 2023 07:33:18 +0700 (WIB)
Date: Sat, 16 Sep 2023 07:33:18 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Steven Turgetto <Steven.Turgetto@clinicomp.com>,
	Linux USB <linux-usb@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Donny Callego <Donny.Callego@clinicomp.com>,
	Jeremy Simmons <jeremy.simmons@clinicomp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Update needed for pl2303 module (resending in plain text)
Message-ID: <ZQT3zmTSg7hfY-uU@debian.me>
References: <CO6PR11MB55720CC876178BBA0EB970FAEAF6A@CO6PR11MB5572.namprd11.prod.outlook.com>
 <CO6PR11MB5572CB5C140AD3B9C67DEE0CEAF6A@CO6PR11MB5572.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HTrwM0FM6QGFvC5p"
Content-Disposition: inline
In-Reply-To: <CO6PR11MB5572CB5C140AD3B9C67DEE0CEAF6A@CO6PR11MB5572.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--HTrwM0FM6QGFvC5p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 11:47:23PM +0000, Steven Turgetto wrote:
> Hello,
>=20
> CliniComp has a device which reports bcdUSB=3D0x200 and bcdDevice=3D0x400=
=2E This configuration is necessary for our product to support some legacy =
hardware.=20
>=20
> In the pl2303 driver included with the RedHat Enterprise Linux kernel 4.1=
8.0-477.10.1.el8_8.x86_64 , we added the following two lines to pl2303_dete=
ct_type function at line 449.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 case 0x400:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return T=
YPE_HX;
>=20
> Would you please let me know if you are able to support our device in the=
 pl2303 driver?

Can you send above suggestion as formal patch (see
Documentation/process/submitting-patches.rst for how to submit patches)?

And also, shouldn't you contact RedHat support instead since you run
EL kernel?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--HTrwM0FM6QGFvC5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQT3yAAKCRD2uYlJVVFO
o1zvAP9g3zqRUCHqdGkoWl72LqSG7JD0zMEK5bNarpJrMXA5jAEAzAULiYPK5sZU
szwgbVs8yXTPxMakwydCcMDJVv+inw8=
=BYFV
-----END PGP SIGNATURE-----

--HTrwM0FM6QGFvC5p--


Return-Path: <linux-usb+bounces-30874-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE65C819EA
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 17:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A39293AB210
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 16:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669CA111A8;
	Mon, 24 Nov 2025 16:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="LRsbvnJd"
X-Original-To: linux-usb@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D7B29A33E;
	Mon, 24 Nov 2025 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002190; cv=none; b=QMtbngtbmjC9iwkWQiRVDKmkaznAN7rZWDfAwa4ggyQC7Uf1NOIL87n92eDZ6+iVejV7O7gRPScaYvYHuytFc1pffzqvxRiYWehM4eQ9BJY2d+bMQrnS275ka3AgYTG8XzCD/r5z+wxW4zoDvlLWYInrv7aMItP70pa6SVDIJlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002190; c=relaxed/simple;
	bh=+7ParxFtsF5puHMJlyLWKbjEP+7kYtIXal+BmKqvcdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PH6yU/gCQeZ3tOQv9fX/dvpOECQBafY2GpCU7PR4ISFp2QpRf94nW2pJuG1nbK6aZQypQwtbE1i4mF3HrhYKKYVgqf+MsV/3USbhhQ0D1D68ODMilvL4OdoKjsoqVgZXPGfJdRQf8kk5olASiJTMvCp4Farqo9jQvDxYQs6hwU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=LRsbvnJd; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 6C0291C01C1; Mon, 24 Nov 2025 17:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764002184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8kY9lhOsQ27MxiOXKnEX2XoUCKNv53EmHjpO8lJFEU=;
	b=LRsbvnJdjXfgzh0WTmQDL6NNz4O7KYET//7q7SUcM/aU2MNfF7Tb718IttgU1nBTYrr8bX
	O91eglplln0Uakeb9nZE55F9oBzVc0GP5vne4la6PrZlMzGVV9lczfVDr5do/7Qa0Ogs9M
	4ZJcDsLsTOU674Me6zBgF+hdhsVlKJ0=
Date: Mon, 24 Nov 2025 17:36:23 +0100
From: Pavel Machek <pavel@ucw.cz>
To: =?iso-8859-1?Q?Na=FCm?= Jumpertz <n.jumpertz@protonmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: Oppo/Oneplus phones and usb3.0 incompatibility
Message-ID: <aSSJh+jbqZ+E1LP6@duo.ucw.cz>
References: <YhXrCm5ig-YWPY2OVkmdPl48N1Td6K8qJJ5cW7OtIMQt9ENXrexATCgeXCmuG5Mq1wIDxyhaLZhZeuW15lgKhKEKKLfU3GwjMMhKP1Awyj4=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BC39Pg9dC/Jkiurq"
Content-Disposition: inline
In-Reply-To: <YhXrCm5ig-YWPY2OVkmdPl48N1Td6K8qJJ5cW7OtIMQt9ENXrexATCgeXCmuG5Mq1wIDxyhaLZhZeuW15lgKhKEKKLfU3GwjMMhKP1Awyj4=@protonmail.com>


--BC39Pg9dC/Jkiurq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Because of wrong device descriptor, certain oppo/oneplus phones,=20
> like my oppo find x5, can't connect to linux computers using usb3 cables,
> the issue is also on other oppo/oneplus phones such as oneplus 9 pro,=20
> starting from OxygenOs 13 in december 2022=20
> link: https://xdaforums.com/t/connection-problems-to-a-computer-with-linu=
x.4642402/
> The issue is present in kernel 6.17 but also in older versions.
> The connection correctly works using an usb2 cable.
>=20
> The phone is detected as a USB SuperSpeed device but the device descripto=
r flag given is USB 2.0,
> so, according to dmesg, the kernel warm reset the phone and don't manage =
to establishes the connection, which is annoying:
>=20
> [ 3537.701845] usb 2-2: new SuperSpeed USB device number 4 using xhci_hcd
> [ 3537.722594] usb 2-2: got a wrong device descriptor, warm reset device
> [ 3538.105960] usb 2-2: new SuperSpeed USB device number 5 using xhci_hcd
> [ 3538.126933] usb 2-2: got a wrong device descriptor, warm reset device
> [ 3538.313826] usb usb2-port2: attempt power cycle
> [ 3539.241985] usb 2-2: new SuperSpeed USB device number 6 using xhci_hcd
> [ 3539.262410] usb 2-2: got a wrong device descriptor, warm reset device
> [ 3539.646017] usb 2-2: new SuperSpeed USB device number 7 using xhci_hcd
> [ 3539.666993] usb 2-2: got a wrong device descriptor, warm reset device
> [ 3539.853713] usb usb2-port2: unable to enumerate USB device
>=20
> The issue is due to oppo phones not being conformant to usb standard.
> Maybe the kernel should still establish the connection if warm resets fai=
l, by counting fails or something,
> otherwise oppo phones will never manage to connect through usb3.0 cables,=
 until oppo fixes it.
>=20
> I'm not a dev, so my solution was just to disable the feature:

I'm afraid patch will not be acceptable like this, but you could be
able to put this behind some kind of blacklist.

Best regards,
								Pavel

>  drivers/usb/core/hub.c | 14 --------------
>  1 file changed, 14 deletions(-)
>=20
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 256fe8c86828..be28296b39de 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -5186,20 +5186,6 @@ hub_port_init(struct usb_hub *hub, struct usb_devi=
ce *udev, int port1,
>  		*dev_descr =3D *descr;
>  	kfree(descr);
> =20
> -	/*
> -	 * Some superspeed devices have finished the link training process
> -	 * and attached to a superspeed hub port, but the device descriptor
> -	 * got from those devices show they aren't superspeed devices. Warm
> -	 * reset the port attached by the devices can fix them.
> -	 */
> -	if ((udev->speed >=3D USB_SPEED_SUPER) &&
> -			(le16_to_cpu(udev->descriptor.bcdUSB) < 0x0300)) {
> -		dev_err(&udev->dev, "got a wrong device descriptor, warm reset device\=
n");
> -		hub_port_reset(hub, port1, udev, HUB_BH_RESET_TIME, true);
> -		retval =3D -EINVAL;
> -		goto fail;
> -	}
> -
>  	usb_detect_quirks(udev);
> =20
>  	if (le16_to_cpu(udev->descriptor.bcdUSB) >=3D 0x0201) {

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--BC39Pg9dC/Jkiurq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaSSJhwAKCRAw5/Bqldv6
8rx8AJ4mZvnBbEE+eNsfgsXFIhqvYKlZKgCfcwbBIoXDQKE12QDMo1yu/cvWNac=
=4UVO
-----END PGP SIGNATURE-----

--BC39Pg9dC/Jkiurq--


Return-Path: <linux-usb+bounces-6331-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A978530CD
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 13:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00ED81C265E9
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 12:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F283FE58;
	Tue, 13 Feb 2024 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b="NBat4QhS"
X-Original-To: linux-usb@vger.kernel.org
Received: from puleglot.ru (puleglot.ru [195.201.32.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2946355794;
	Tue, 13 Feb 2024 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.32.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828193; cv=none; b=jmDBP/kNBMbC7YmbO0Nq8I6O8ZvtM4Gf4AT48aRRrb4gjNU0La4XfDDqUCbxwMe7v+kpj4aEVcP90k+NNVkRN+IeptOSotzr0SlvI3Elka2YM4/LPZhwjP4U/puso8A4EU6q/Iqw5eGCjblJMh3qiJEa94fhZNxAeh9FV9QKro8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828193; c=relaxed/simple;
	bh=isVT3swz7BX2lSLns3AewMrJcOXQ42RCXPUYDhjUlgM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DS8zJpOSkfr5K5IHKVy874gQzGE/c5Cm4ijfwN4nsTa4kjAMylRc4hQmRX5hu7I/i0jei/EtM5fTG4cyC8yLF3RHSTpAVAPzCuqmYjslw2bu47iWzzj6ZzqKmkjvev6dMzjTM2wG1VzpfyexoU6OZwspFj22Fr/KNf68+Wp3+e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me; spf=pass smtp.mailfrom=puleglot.ru; dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b=NBat4QhS; arc=none smtp.client-ip=195.201.32.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puleglot.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=aapO+1NwCqHDBlHbx8Ce0IIDPV5ZOXBr3A2aFyBpNAQ=; b=NBat4QhSU7CU+g68EzUOH3nH2H
	Nai1+JWcpXa3qQmxJ4utVW5AflijC41zg118pDIHRLAMDm1NJzIBfhB547ThIqEu3tiVS2rk0HwVV
	IGxBwl6wXDbu3FUoKX0HQkMxyurU3ZJmiw4dYVPZFM1iOaW+QK3cA/CYnj0NXOhKmjQ0=;
Received: from [2a00:1370:819a:f1b4:f5a8:7291:14f0:548b]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rZs7s-00000002MQX-2pHo;
	Tue, 13 Feb 2024 15:43:04 +0300
Message-ID: <4cf2602f203dc960a70751c48a22f73b3548f04d.camel@tsoy.me>
Subject: Re: [PATCH] USB: Always select config with the highest supported
 UAC version
From: Alexander Tsoy <alexander@tsoy.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-sound@vger.kernel.org, 
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
	 <perex@perex.cz>, Nikolay Yakimov <root@livid.pp.ru>, Saranya Gopal
	 <saranya.gopal@intel.com>
Date: Tue, 13 Feb 2024 15:42:51 +0300
In-Reply-To: <2024021353-reversing-waltz-7402@gregkh>
References: <20240212152848.44782-1-alexander@tsoy.me>
	 <2024021353-reversing-waltz-7402@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: puleglot@puleglot.ru

=D0=92 =D0=92=D1=82, 13/02/2024 =D0=B2 12:05 +0100, Greg Kroah-Hartman =D0=
=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Mon, Feb 12, 2024 at 06:28:48PM +0300, Alexander Tsoy wrote:
> > Config with the highest supported UAC version is always preferable
> > because
> > it usually provides more features.
> >=20
> > Main motivation for this change is to improve support for several
> > UAC2
> > devices which have UAC1 config as the first one for compatibility
> > reasons.
> > UAC2 mode provides a wider range of supported sampling rates on
> > these
> > devices. Also when UAC4 support is implemented, it will need just
> > one
> > additional case line without changing the logic.
> >=20
> > Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> > ---
> > =C2=A0drivers/usb/core/generic.c | 39 +++++++++++++++++++++++++--------=
-
> > ----
> > =C2=A01 file changed, 26 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/usb/core/generic.c
> > b/drivers/usb/core/generic.c
> > index b134bff5c3fe..8aeb180e1cf9 100644
> > --- a/drivers/usb/core/generic.c
> > +++ b/drivers/usb/core/generic.c
> > @@ -48,9 +48,16 @@ static bool is_audio(struct
> > usb_interface_descriptor *desc)
> > =C2=A0	return desc->bInterfaceClass =3D=3D USB_CLASS_AUDIO;
> > =C2=A0}
> > =C2=A0
> > -static bool is_uac3_config(struct usb_interface_descriptor *desc)
> > +static bool is_supported_uac(struct usb_interface_descriptor
> > *desc)
> > =C2=A0{
> > -	return desc->bInterfaceProtocol =3D=3D UAC_VERSION_3;
> > +	switch(desc->bInterfaceProtocol) {
> > +	case UAC_VERSION_1:
> > +	case UAC_VERSION_2:
> > +	case UAC_VERSION_3:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > =C2=A0}
> > =C2=A0
> > =C2=A0int usb_choose_configuration(struct usb_device *udev)
> > @@ -135,22 +142,28 @@ int usb_choose_configuration(struct
> > usb_device *udev)
> > =C2=A0		}
> > =C2=A0
> > =C2=A0		/*
> > -		 * Select first configuration as default for audio
> > so that
> > -		 * devices that don't comply with UAC3 protocol
> > are supported.
> > -		 * But, still iterate through other configurations
> > and
> > -		 * select UAC3 compliant config if present.
> > +		 * Iterate through audio configurations and select
> > the first of
> > +		 * the highest supported UAC versions. Select the
> > first config
> > +		 * if no supported UAC configs are found.
> > =C2=A0		 */
> > =C2=A0		if (desc && is_audio(desc)) {
> > -			/* Always prefer the first found UAC3
> > config */
> > -			if (is_uac3_config(desc)) {
> > -				best =3D c;
> > -				break;
> > -			}
> > +			struct
> > usb_interface_descriptor	*best_desc =3D NULL;
> > +
> > +			if (best)
> > +				best_desc =3D &best->intf_cache[0]-
> > >altsetting->desc;
>=20
> Are you sure you always have a intf_cache[0] pointer?=C2=A0 What about
> altsetting?=C2=A0 Remember, invalid descriptors happen all the time, and
> are
> a known "attack vector" against the USB stack.
>=20
>=20

Well, similar code exists at the beginning of the loop. But I just
discovered that according to the Backwards Compatibility sections of
UAC 3.0 and UAC 4.0 specs, we need to look at the bFunctionProtocol
field of the Interface Association descriptor. So the current code that
selects UAC3 configuration is also not entirely correct AFAIS.


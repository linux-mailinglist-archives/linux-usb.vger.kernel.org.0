Return-Path: <linux-usb+bounces-6329-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0277B853043
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 13:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9A711F28E62
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 12:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182513A1D9;
	Tue, 13 Feb 2024 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b="mEvckPP5"
X-Original-To: linux-usb@vger.kernel.org
Received: from puleglot.ru (puleglot.ru [195.201.32.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3937F39FE2;
	Tue, 13 Feb 2024 12:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.32.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707826293; cv=none; b=Z4CbQWpYXxPvCF+IKlRSsoLUvhUpBYYmRPZqfzy7AOsRyk6RYF+2GxD2Ix4RuxoUlie9LAU35r1vAQJO1WURXVb4ivKbbNIr330uRLkaZpnOhSBemb/8MQ2xmX+3NjiZ5bCGRrYTDF6eHeEr8vNSDRYt5TLxhtKcFH+skzohbfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707826293; c=relaxed/simple;
	bh=dzeU2uecARJY2Bct18987ZwkHF4w1EEaBu1mOFDkJUA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ATMC9M6J9TlaqIHt0B8g3+uNhSxeExfCN6W1/kIHgMW36XkYSUI4ayyN3duF1CCk6IEl46Qm3Mb1TAScIYph4AiGUmYq9QwwfZHLebuURrwhILGL1D2wbl1D9QyMkHT0QQAyulg6lNGnVau13kQgyMORbgUGDkc2hIcVd6X4jK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me; spf=pass smtp.mailfrom=puleglot.ru; dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b=mEvckPP5; arc=none smtp.client-ip=195.201.32.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puleglot.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=PesdoPT+Kn9ZSk2rQu5s2jwY0m9VD05Cv7LDJN7pDF8=; b=mEvckPP5uGiXMo8BfUXY9l0uyc
	Er5b7TMJumfH+lFcg7aq46syQwE4H6/+5SZvhCazi+GS19dDymeVySIDtE4w2lLv2RkHn7VCfaPPZ
	wnmp2EK33xnzNOpmuRo5BjLMiinTW/rWrEZm3BgD4vZXVQKX4HJ6fNMaIazRFJq6n3z0=;
Received: from [2a00:1370:819a:f1b4:f5a8:7291:14f0:548b]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rZrdB-00000002MK2-0ydR;
	Tue, 13 Feb 2024 15:11:21 +0300
Message-ID: <a31c7f4403a867edd90f7a8e42a22ce16ef4f06f.camel@tsoy.me>
Subject: Re: [PATCH] USB: Always select config with the highest supported
 UAC version
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-sound@vger.kernel.org, 
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
	 <perex@perex.cz>, Nikolay Yakimov <root@livid.pp.ru>, Saranya Gopal
	 <saranya.gopal@intel.com>
Date: Tue, 13 Feb 2024 15:11:07 +0300
In-Reply-To: <87sf1wy3la.wl-tiwai@suse.de>
References: <20240212152848.44782-1-alexander@tsoy.me>
	 <2024021353-reversing-waltz-7402@gregkh> <87sf1wy3la.wl-tiwai@suse.de>
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

=D0=92 =D0=92=D1=82, 13/02/2024 =D0=B2 13:02 +0100, Takashi Iwai =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
> On Tue, 13 Feb 2024 12:05:47 +0100,
> Greg Kroah-Hartman wrote:
> > On Mon, Feb 12, 2024 at 06:28:48PM +0300, Alexander Tsoy wrote:
> > > =C2=A0
> > > -			/* If there is no UAC3 config, prefer
> > > the first config */
> > > -			else if (i =3D=3D 0)
> > > +			if (i =3D=3D 0)
> > > =C2=A0				best =3D c;
> > > =C2=A0
> > > +			/* Assume that bInterfaceProtocol value
> > > is always
> > > +			 * growing when UAC versions are
> > > incremented, so that
> > > +			 * the direct comparison is possible. */
> >=20
> > How do we know this assumption is always true?=C2=A0 What happens when
> > it is not?
>=20
> I believe this assumption is acceptable.=C2=A0 It's all about the protoco=
l
> number from 1 to 3, so far.=C2=A0 If UAC4 is ever supported in future,
> it'll be highly probably the number 4.=C2=A0 (If not and keeping the same
> protocol number 3, we'll need a different check in anyway.)
> And the other numbers are excluded already in is_supported_uac()
> check.
>=20
> > > +			else if (is_supported_uac(desc) &&
> > > best_desc &&
> > > +				 (!is_supported_uac(best_desc)
> > > ||
> > > +				=C2=A0 (desc->bInterfaceProtocol >
> > > +				=C2=A0=C2=A0 best_desc-
> > > >bInterfaceProtocol)))
> > > +					best =3D c;
> >=20
> > I really can't understand this if logic, sorry, can you describe it
> > better so that we can maintain it over time?
>=20
> The condition looks cryptic, though, yes.
>=20
> Maybe the check should be factored out, e.g.
>=20
> /* return true if the new config has a higher priority then the old
> config */
> static bool check_uac_desc_priority(struct usb_host_config *old,
> 				struct usb_host_config *new)
> {
> 	if (!is_supported_uac(new))
> 		return false;
>=20
> 	if (!is_supported_uac(old))
> 		return true;
>=20
> 	/*
> 	 * Assume that bInterfaceProtocol value is always growing;
> 	 * so far, it's true from UAC1 to UAC3 (1..3)
> 	 */
> 	if (new->bInterfaceProtocol > old->bInterfaceProtocol)
> 		return true;
>=20
> 	return false;
> }
>=20

Thank you both for response! I'll try to simplify the logic.

